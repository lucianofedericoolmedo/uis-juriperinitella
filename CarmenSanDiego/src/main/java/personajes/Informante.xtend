package main.java.personajes

import org.uqbar.commons.utils.Observable

@Observable
class Informante extends Personaje {
	
	String intentoDeAsesinato
	
	new(String nombre) {
		super(nombre)
		intentoDeAsesinato = "CUIDADO! Un cuchillo volador pasó muy cerca de tu oreja."
	}
	
	override puedeRevelarPista() {
		true
	}
	
	override getInformacion() {
//		var randomDouble = Math.random() * intentosDeAsesinato.length() - 1;
//		var randomInt = Math.round(randomDouble) as int
		
		print("El informante " + this.nombre + " dice: " +/* intentosDeAsesinato.get(randomInt) */ intentoDeAsesinato + "\n")
	}
	
}