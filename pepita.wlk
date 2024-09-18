object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method validarVuelo(distancia){
		if(energia < self.energiaAGastar(distancia)) self.error("pepita no puede volar: " + distancia)
	}

	method volar(distancia) {
		self.validarVuelo(distancia)
		energia = energia - self.energiaAGastar(distancia)
	}

	method energiaAGastar(distancia){
		return 10 + distancia
	}
		
	method energia() {
		return energia
	}
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	
	method energia() {
		return energia
	}

	method validarVuelo(distancia) {
	  if (energia<self.energiaAGastar(distancia)) self.error("pepon no puede volar: " + distancia)
	}
		
	method comer(comida) {
		energia += energia +( comida.energiaQueAporta() / 2)
	}
		
	method energiaAGastar(distancia){
		return 20 + 2*distancia
	}

	method volar(distancia) {
		self.validarVuelo(distancia)
		energia = energia - self.energiaAGastar(distancia)
	}
	
}

object roque {
	var ave = pepita
	var cenas = 0;
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}

	method energia(){
		return ave.energia()
	}
}

object milena {
  	const aves = [pepita, pepon]

  	method agregarAve(ave){
		aves.add(ave)
  	}

	method validarAves(distancia){
		aves.forEach({ave => ave.validarVuelo(distancia)})
	}

	method movilizarAves(distancia) {
		self.validarAves(distancia)
		aves.forEach({ave => ave.volar(distancia)})
	}
}

// commit 