import Operacion.*

class Inmueble {
	const property tamanio // metros cuadrados
	const property cantidadAmbientes
	const operacion
	const zona
	var valorInmueble
	var estado = "disponible" // reservada, concretada, disponible
	var cliente
	
	method operacion(){
		return operacion
	}
	
	method valorInmueble()
	
	method estado(){
		return estado
	}
	
	method cliente(){
		return cliente
	}
	
	method reservar(unCliente){
		estado = "reservada"
		cliente = unCliente
	}
	
	method concretar(unCliente){
		estado = "concretada"
		cliente = unCliente
	}
	
	method validarSiSePuedeConcretarOperacion(unCliente){
		return estado == "disponible" || (estado == "reservada" && cliente == unCliente)
	}
	
	method validarSiSePuedeReservarOperacion(unCliente){
		return estado == "disponible"
	}
}

class Casa inherits Inmueble {
	override method valorInmueble(){
		return valorInmueble + zona.plusPorZona()
	}
}

class PH inherits Inmueble {
	override method valorInmueble(){
		return (14000 * tamanio).min(500000) + zona.plusPorZona()
	}
}

class Departamento inherits Inmueble {
	override method valorInmueble(){
		return (350000 * cantidadAmbientes) + zona.plusPorZona()
	}
}

class Local inherits Casa {
	var property tipoDeLocal
	
	override method operacion(){
		return alquiler
	}
	
	override method valorInmueble(){
		return tipoDeLocal.valorInmueble(super())
	}
}

object galpon {
	method valorInmueble(valorInmueble){
		return valorInmueble /2 
	}
}

object localALaCalle {
	var montoFijo
	
	method valorInmueble(valorInmueble){
		return valorInmueble + montoFijo 
	}
}

