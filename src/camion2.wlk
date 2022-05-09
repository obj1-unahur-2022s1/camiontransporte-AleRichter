import cosas2.*

object camion {
   const cosas = []
   var property tara = 1000
   
   method cargar(cosa){
   	  cosas.add(cosa)
   	  cosa.estaCargado()
   }    
   
   method cosasCargadas() = cosas

   method descargar(cosa){cosas.remove(cosa)}
   
   method todoPesoPar() = cosas.all({c => c.peso().even()})
   
   method hayAlgunoQuePesa(peso) = cosas.any({c => c.peso() == peso})
   
   method elDeNivel(nivel) = cosas.find({c => c.nivelPeligrosidad() == nivel})
 
   method pesoTotal() = tara + cosas.sum({c => c.peso()})
   
   method excedidoDePeso() = self.pesoTotal() > 2500
   
   method objetosQueSuperanPeligrosidad(nivel) =
      cosas.filter({c => c.nivelPeligrosidad() > nivel})
       
   method objetosMasPeligrososQue(cosa) =
      self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad()) 
   
   method puedeCircularEnRuta(nivelMaximoPeligrosidad) =
      not self.excedidoDePeso() and cosas.all({c => c.nivelPeligrosidad() <= nivelMaximoPeligrosidad})
       
   method tieneAlgoQuePesaEntre(min, max) = cosas.any({ c => c.peso().between(min, max)})
   
   method cosaMasPesada() = cosas.max({c => c.peso()})
   
   method pesos() = cosas.map({c => c.peso()})
   
   method totalBultos() = cosas.sum({c => c.bultos()})
}
