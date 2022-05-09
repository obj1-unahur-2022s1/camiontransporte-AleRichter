import camion2.*

object knightRider {
   const peso = 500	
   var cargado  = false
	
   method peso() = peso
   method nivelPeligrosidad() = 10
   method bultos() = 1
   method estaCargado(){cargado = (camion.cosasCargadas()).contains(self)}
   method cargado() = cargado
}

object bumblebee {
   const peso = 800
   var tranformadoEnAuto = true
   var cargado  = false
   
   method peso() = peso
   method tranformarseEnRobot(){tranformadoEnAuto = false}
   method tranformarseEnAuto(){tranformadoEnAuto = true}
   method tranformadoEnAuto() = tranformadoEnAuto
   method nivelPeligrosidad() {
      if(self.tranformadoEnAuto()){
   	  return 15
   	 } else {
   		 return 30
   	 }
   } 
   method bultos() = 2 
   method estaCargado(){
   	  cargado = (camion.cosasCargadas()).contains(self)
   	  self.tranformarseEnRobot()
   }
   method cargado() = cargado
   
}

object paqueteLadrillos {
   var cantLadrillos = 0
   var cargado = false

   method peso() = 2 * self.cantLadrillos()   
   method nivelPeligrosidad() = 2
   method cantLadrillos(cantidad) {cantLadrillos = cantidad}
   method cantLadrillos() = cantLadrillos
   method bultos() {
     if (self.cantLadrillos().between(1, 100)){
   	  return 1
   	 }
   	 else if (self.cantLadrillos().between(101, 300)){
   	  return 2	
   	 } 
   	 else if (self.cantLadrillos() > 301){
   	  return 3   	 	 
   	 } 
   	 else {
   	 	return 0
   	 }
   }
   method estaCargado(){
   	  cargado = (camion.cosasCargadas()).contains(self)
   	  self.cantLadrillos(12)
   }
   method cargado() = cargado
   
}

object arenaAGranel {
   var peso = 0
   var cargado = false
   
   method peso(unPeso) {peso = unPeso}
   method peso() = peso
   method nivelPeligrosidad() = 1
   method bultos() = 1
   method estaCargado(){
   	  cargado = (camion.cosasCargadas()).contains(self)
   	  self.peso(20)
   }
   method cargado() = cargado
}

object bateriaAntiarea {
  var tieneMisiles = false
  var cargado = false

  method tieneMisiles(booleano){tieneMisiles = booleano}
  method tieneMisiles() = tieneMisiles   
  method peso(){
   	if(self.tieneMisiles()){
   	 return 300
   	} else {
   	    return 200
   	}
  }

  method nivelPeligrosidad(){
   	if(self.tieneMisiles()){
   	 return 100
   	} else {
   		return 0
   	}
  } 
  
  method bultos(){
   	if(self.tieneMisiles()){
   	 return 2
   	} else {
   		return 1
   	}  	
  }
  
  method estaCargado(){
   	  cargado = (camion.cosasCargadas()).contains(self)
   	  self.tieneMisiles(true)
  }
  
  method cargado() = cargado
}

object contenedorPortuario {
   const cosas = []
   var property peso = 100 
   var cargado = false
  
   method agregarCosa(cosa){cosas.add(cosa)}
   method quitarCosa(cosa){cosas.remove(cosa)}   
   method peso() = peso + cosas.sum({c => c.peso()})
   method nivelPeligrosidad() =
      cosas.map({c => c.nivelPeligrosidad()}).max()
   method bultos() = 1 + cosas.sum({c => c.bultos()})
   method estaCargado(){
   	  cargado = (camion.cosasCargadas()).contains(self)
   	  cosas.forEach({c => c.estaCargado()})
   }
   method cargado() = cargado
}

object residuosRadioactivos {
  var peso = 0
  var cargado = false
  
  method peso(unPeso){peso = unPeso}
  method peso() = peso
  method nivelPeligrosidad() = 200
  method bultos() = 1
  method estaCargado(){
   	 cargado = (camion.cosasCargadas()).contains(self)
   	 self.peso(15)
  }
  method cargado() = cargado
}

object embalajeSeguridad {
  var cosaEmbalada
  var cargado = false

  method embalarCosa(cosa){cosaEmbalada = cosa}
  method peso() = cosaEmbalada.peso()
  method nivelPeligrosidad() = 0.max(cosaEmbalada.nivelPeligrosidad() / 2)
  method bultos() = 2
  method estaCargado(){
   	 cargado = (camion.cosasCargadas()).contains(self)
  }
  method cargado() = cargado
}