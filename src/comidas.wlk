class Comida {
	method peso()
	method valoracion()
	method esAptoVegetariano()	
	method esAbundante() {
		return self.peso() > 250
	}
}

class Provoleta inherits Comida {
	var property peso = 0
	var property tieneEspecias = false
	var property esCompleta = false
		
	override method esAptoVegetariano() = not esCompleta
	override method valoracion() { return if(self.esEspecial()) {120} else {80} }
	
	method esEspecial(){
		return (self.esAbundante() && tieneEspecias) || esCompleta 
	}	
}

class HamburguesaDeCarne  inherits Comida {
	const pan
	override method peso() = 250
	override method esAptoVegetariano() = false
	override method valoracion()  = 60 + pan.valoracion()
}


class HamburguesaVegetariana inherits HamburguesaDeCarne {
	var property legumbre 
	override method esAptoVegetariano() = true
	override method valoracion()  = super() + 2 * legumbre.size()
}

class Parrillada inherits Comida {
	var cortes = []
	method agregarCorte(unCorte) { cortes.add(unCorte) }
	method sacarUnCorte(unCorte) { cortes.remove(unCorte)}
	override method peso () =  cortes.sum { c => c.peso() }
	override method esAptoVegetariano() = false
	override method valoracion()  = 15 * cortes.max({c => c.calidad()}).calidad() - cortes.size()
}

object panIndustrial {
	method valoracion() =0
}
object panCasero {
	method valoracion() = 20
}
object panDeMasaMadre {
	method valoracion() = 45
}

class Corte {
	var property calidad = 0
	var property peso = 0
}
