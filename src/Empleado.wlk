import Operacion.*
import Cliente.*
import Inmueble.*

class Empleado {
	var comisionesAcumuladas = 0
	var property inmueblesReservados = #{}
	var property inmueblesVendidos = #{}
	
	method comisionesAcumuladas(){
		return comisionesAcumuladas
	}
	
	method calcularComisionDe(unInmueble){
		return unInmueble.operacion().calcularComision()
	}
	
	method reservarOperacionDe(unInmueble, unCliente){
		const sePuedeReservar = unInmueble.validarSiSePuedeReservarOperacion(unCliente)
		
		if(sePuedeReservar){
			unInmueble.reservar(unCliente)
			self.agregarAInmueblesReservados(unInmueble)
		}
	}
	
	method concretarOperacionDe(unInmueble, unCliente){
		const sePuedeConcretar = unInmueble.validarSiSePuedeConcretarOperacion(unCliente)
		
		if(sePuedeConcretar){
			comisionesAcumuladas += self.calcularComisionDe(unInmueble)
			unInmueble.concretar(unCliente)
			self.quitarDeInmueblesReservados(unInmueble)
			self.agregarAInmueblesVendidos(unInmueble)
		}
	}
	
	method agregarAInmueblesReservados(unInmueble){
		inmueblesReservados.add(unInmueble)
	}
	
	method agregarAInmueblesVendidos(unInmueble){
		inmueblesVendidos.add(unInmueble)
	}
	
	method quitarDeInmueblesReservados(unInmueble) {
		inmueblesReservados.remove(unInmueble)
	}
	
	method vaATenerProblemasCon(otroEmpleado){
		const zonasDondeVendi = self.inmueblesVendidos().map({inmueble => inmueble.zona()})
		const zonasDondeVendioOtro = otroEmpleado.inmueblesVendidos().map({inmueble => inmueble.zona()})
		
		const algunoConcretoDondeOtroReservo = inmueblesReservados.any({inmueble => otroEmpleado.inmueblesVendidos().contains(inmueble)}) ||
											   inmueblesVendidos.any({inmueble => otroEmpleado.inmueblesReservados().contains(inmueble)})
		
		return zonasDondeVendi.any({zona => zonasDondeVendioOtro.contains(zona)}) && algunoConcretoDondeOtroReservo
	}
}