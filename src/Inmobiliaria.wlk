import Empleado.*

object inmobiliaria {
	var property empleados = #{}
	
	method mejorEmpleadoSegun(criterio){
		return criterio.mejorEmpleado(empleados)
	}
}

object criterioMasComisionesAcumuladas {
	method mejorEmpleado(empleados){
		empleados.max({empleado => empleado.comisionesAcumuladas()})
	}
}

object criterioMasOperacionesCerradas {
	method mejorEmpleado(empleados){
		empleados.max({empleado => empleado.inmueblesVendidos().size()})
	}
}

object criterioMasCantidadDeReservas {
	method mejorEmpleado(empleados){
		empleados.max({empleado => empleado.inmueblesReservados().size()})
	}
}