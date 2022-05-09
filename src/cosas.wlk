object knightRider {
   const peso = 500	
	
   method peso() = peso
   method nivelPeligrosidad() = 10
}

object bumblebee {
   const peso = 800
   var tranformadoEnAuto = true
   
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
}

object paqueteLadrillos {
   var cantLadrillos = 0

   method peso() = 2 * self.cantLadrillos()   
   method nivelPeligrosidad() = 2
   method cantLadrillos(cantidad) {cantLadrillos = cantidad}
   method cantLadrillos() = cantLadrillos
}

object arenaAGranel {
   var peso = 0
   
   method peso(unPeso) {peso = unPeso}
   method peso() = peso
   method nivelPeligrosidad() = 1
}

object bateriaAntiarea {
  var tieneMisiles = true

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
 
}

object contenedorPortuario {
   const cosas = []
   var property peso = 100 
   
   method agregarCosa(cosa){cosas.add(cosa)}
   method quitarCosa(cosa){cosas.remove(cosa)}   
   method peso() = peso + cosas.sum({c => c.peso()})
   method nivelPeligrosidad() =
      cosas.map({c => c.nivelPeligrosidad()}).max()
}

object residuosRadioactivos {
  var peso = 0
  
  method peso(unPeso){peso = unPeso}
  method peso() = peso
  method nivelPeligrosidad() = 200
}

object embalajeSeguridad {
  var cosaEmbalada

  method embalarCosa(cosa){cosaEmbalada = cosa}
  method peso() = cosaEmbalada.peso()
  method nivelPeligrosidad() = 0.max(cosaEmbalada.nivelPeligrosidad() / 2)
}




