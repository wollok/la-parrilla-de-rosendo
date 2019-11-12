import comidas.*
object cocina {
	var comidasPreparadas = []
	method agregarComida(unaComida){
			comidasPreparadas.add(unaComida)
	}
	method tieneBuenaOfertaVegetariana() {
		return (self.totalComidasVegetarianas() - self.totalComidasNoVegetarianas() ) >2
	}
	method totalComidasVegetarianas() = comidasPreparadas.count {c=> c.esAptoVegetariano()}
	method totalComidasNoVegetarianas() = comidasPreparadas.count { c => not c.esAptoVegetariano()}
	
	method platoFuerteCarnivoro() = self.comidasNoVegetarianas().max { c => c.valoracion()}
	method comidasNoVegetarianas() = comidasPreparadas.filter { c => not c.esAptoVegetariano()}
	
	method comidasQueLeAgradan(unComensal) {
		return 	comidasPreparadas.filter {c=> unComensal.leAgrada(c)}
	}
	
	method elegirPlatoPara(unComensal){
		const plato = self.comidasQueLeAgradan(unComensal).anyOne()
		comidasPreparadas.remove(plato)
		unComensal.comer(plato)
	}
	
	method elegirPlatoParaConCriterio(unComensal){
		const comidas = self.comidasQueLeAgradan(unComensal)
		const plato = unComensal.seleccionarConCriterio(comidas)
		comidasPreparadas.remove(plato)
		unComensal.comer(plato)
	}
	
}
