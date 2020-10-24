import Operacion.*
import Cliente.*
import Inmueble.*

class Empleado {
	var comisionesAcumuladas = 0
	var cantidadOperacionesCerradas = 0
	var cantidadReservas = 0
	
	method comisionesAcumuladas(){
		return comisionesAcumuladas
	}
	
	method cantidadOperacionesCerradas(){
		return cantidadOperacionesCerradas
	}
	
	method cantidadReservas(){
		return cantidadReservas
	}
	
	method calcularComisionDe(unInmueble){
		return unInmueble.operacion().calcularComision()
	}
	
	method reservarOperacionDe(unInmueble, unCliente){
		const sePuedeReservar = unInmueble.validarSiSePuedeReservarOperacion(unCliente)
		
		if(sePuedeReservar){
			cantidadReservas ++
			unInmueble.reservar(unCliente)
		}
	}
	
	method concretarOperacionDe(unInmueble, unCliente){
		const sePuedeConcretar = unInmueble.validarSiSePuedeConcretarOperacion(unCliente)
		
		if(sePuedeConcretar){
			comisionesAcumuladas += self.calcularComisionDe(unInmueble)
			cantidadOperacionesCerradas ++
			unInmueble.concretar(unCliente)
		}
	}
}