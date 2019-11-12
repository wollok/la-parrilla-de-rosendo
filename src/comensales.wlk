import comidas.*
class Comensal {
	var comidas = []
	var property peso = 0
	method leAgrada(unaComida)
	method comer(unaComida){ comidas.add(unaComida)}
	method satisfecho() = self.pesosComida() > peso * 0.01
	method pesosComida() = comidas.sum { c => c.peso()}
	method seleccionarConCriterio(comidasQueLeGustan)
}

class Vegetariano inherits Comensal {
	override method leAgrada(unaComida) =  unaComida.esAptoVegetariano() and unaComida.valoracion() > 85 
	override method satisfecho() = super() and self.ningunaEsAbundante()
	method ningunaEsAbundante() = comidas.all { c => not c.esAbundante()}
	override method seleccionarConCriterio(comidasQueLeGustan) {
		return comidasQueLeGustan.find ({ c => not c.esAbundante() })
	}
}

class HambrePopular inherits Comensal {
	override method leAgrada(unaComida) =  unaComida.esAbundante()
	override method seleccionarConCriterio(comidasQueLeGustan) = comidasQueLeGustan.max { c => c.peso() }
}

class Exquisitos inherits Comensal {
	override method leAgrada(unaComida) {
		return unaComida.peso().between(150,300) and unaComida.valoracion() > 100
	 }
	override method satisfecho() = super() && self.cantidadDeComidasPar()
	method cantidadDeComidasPar () = comidas.size().even()
	override method seleccionarConCriterio(comidasQueLeGustan) {
		if (not comidas.isEmpty()) {
			return comidasQueLeGustan.find { c=> c == comidas.last() }
		} else {
			return comidasQueLeGustan.first()
		}
	}
	
}