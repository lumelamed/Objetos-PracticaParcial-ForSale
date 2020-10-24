import Operacion.*

class Inmueble {
	const property tamanio // metros cuadrados
	const property cantidadAmbientes
	const property operacion
	const zona
	var valorInmueble
	var estado = "disponible" // reservada, concretada, disponible
	var cliente
	
	method valorInmueble(){
		return valorInmueble
	}
	
	method calcularValor()
	
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
	override method calcularValor(){
		return valorInmueble + zona.plusPorZona()
	}
}

class PH inherits Inmueble {
	override method calcularValor(){
		return (14000 * tamanio).min(500000) + zona.plusPorZona()
	}
}

class Departamento inherits Inmueble {
	override method calcularValor(){
		return (350000 * cantidadAmbientes) + zona.plusPorZona()
	}
}

class Local inherits Casa{
	const property operacion = alquiler // arreglar 
}