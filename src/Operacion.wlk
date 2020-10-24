class Operacion {
	var valorInmueble
	
	method valorInmueble(){
		return valorInmueble
	}
	
	method calcularComision()
}

class Alquiler inherits Operacion {
	var property cantidadDeMeses
	
	override method calcularComision(){
		return (cantidadDeMeses * valorInmueble) / 50000
	}
}


class Venta inherits Operacion {
	var property porcentajeComision // hacer property o solo set?
	
	override method calcularComision(){
		return (porcentajeComision / 100) * valorInmueble
	}
}
