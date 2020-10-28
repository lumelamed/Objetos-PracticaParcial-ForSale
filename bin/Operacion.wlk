object alquiler {
	var property cantidadDeMeses
	
	method calcularComision(precioInmueble){
		return (cantidadDeMeses * precioInmueble) / 50000
	}
}


object venta {
	var property porcentajeComision // hacer property o solo set?
	
	method calcularComision(precioInmueble){
		return (porcentajeComision / 100) * precioInmueble
	}
}
