object pepita {
  var energia = 100
  
  method comer(comida) {
    energia += comida.energiaQueAporta()
  }
  
  method validarVuelo(distancia) {
    energia > self.energiaAGastar(distancia)
  }
  
  method volar(distancia) {
    energia -= self.energiaAGastar(distancia)
  }
  
  method energiaAGastar(distancia) = 10 + distancia
  
  method energia() = energia
}

object alpiste {
  method energiaQueAporta() = 20
}

object manzana {
  var madurez = 1
  const base = 5
  
  method madurez() = madurez
  
  method madurez(_madurez) {
    madurez = _madurez
  }
  
  method madurar() {
    self.madurez(madurez + 1)
  }
  
  method energiaQueAporta() = base * madurez
}

object pepon {
  var energia = 30
  
  method energia() = energia
  
  method validarVuelo(distancia) = energia > self.energiaAGastar(distancia)
  
  method comer(comida) {
    energia += energia + (comida.energiaQueAporta() / 2)
  }
  
  method energiaAGastar(distancia) = 20 + (2 * distancia)
  
  method volar(distancia) {
    energia -= self.energiaAGastar(distancia)
  }
}

object roque {
  var ave = pepita
  var cenas = 0
  
  method ave(_ave) {
    ave = _ave
    cenas = 0
  }
  
  method alimentar(alimento) {
    ave.comer(alimento)
    cenas += 1
  }
  
  method energia() = ave.energia()
}

object milena {
  const aves = [pepita, pepon]
  
  method agregarAve(ave) {
    aves.add(ave)
  }
  
  method validarAves(distancia) {
    if (not self.puedenVolar(distancia)) self.error(
        "Una de las aves no pueden volar"
      )
  }
  
  method puedenVolar(distancia) = aves.all(
    { ave => ave.validarVuelo(distancia) }
  )
  
  method movilizarAves(distancia) {
    self.validarAves(distancia)
    aves.forEach({ ave => ave.volar(distancia) })
  }
} // commit // commit 
