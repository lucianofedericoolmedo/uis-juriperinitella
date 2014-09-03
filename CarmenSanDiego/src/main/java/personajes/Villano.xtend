package main.java.personajes

import main.java.pista.PistaHobbie
import main.java.pista.PistaSenia
import org.uqbar.commons.utils.Observable

@Observable
class Villano extends Personaje {
	@Property String sexo
	PistaHobbie hobbie
	PistaSenia seniasPart
	
//	new(String nombre, String sexo, PistaHobbie hobbie, PistaSenia seniasPart) {
//		super(nombre)
//		this.sexo=sexo
//		this.hobbie=hobbie
//		this.seniasPart=seniasPart
//	}
	
	override getInformacion() {
		print("Me atrapaste!!")
	}
	
	def String getSeniasPart() {
		seniasPart.pista
	}
	
	def setSeniasPart(PistaSenia ps) {
		seniasPart = ps
	}
	
	def String getHobbie() {
		hobbie.pista
	}
	
	def setHobbie(PistaHobbie ph){
		hobbie = ph
	}
	
	override puedeRevelarPista() {
		false
	}
	
}