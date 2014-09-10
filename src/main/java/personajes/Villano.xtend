package personajes

import java.util.List
import pista.PistaHobbie
import pista.PistaSenia
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Observable
class Villano extends Personaje {
	@Property String sexo
	@Property List<PistaHobbie> hobbies =  newArrayList()
	@Property List<PistaSenia> seniasPart = newArrayList()
	@Property PistaSenia seniaSel
	@Property PistaHobbie hobbieSel
	@Property PistaHobbie hobbieAEliminar
	@Property PistaHobbie hobbieParaAgregar
	@Property PistaSenia seniaPartAEliminar
	@Property PistaSenia seniaParaAgregar
	
	
			  
	
	new(String nombre, String sexo, List<PistaHobbie> hobbies, List<PistaSenia> seniasPart) {
		super(nombre)
		this.sexo = sexo
		this.hobbies = hobbies
		this.seniasPart = seniasPart
	}
	
	new(){
		
	}
	override getInformacion() {
		print("Me atrapaste!!")
	}
	
	override puedeRevelarPista() {
		false
	}
	def setHobbie(PistaHobbie h){
		hobbies.add(h)
	}
	def	 setSeniasPart(PistaSenia p){
		seniasPart.add(p)
	}
	
	def quitarSeniaPart() {
		seniasPart.remove(seniaPartAEliminar)
		ObservableUtils.firePropertyChanged(this, "seniasPart", seniasPart)
	}
	
	def agregarSeniasPart() {
		seniasPart.add(seniaParaAgregar)
		ObservableUtils.firePropertyChanged(this, "seniasPart", seniasPart)
	}
	
	def agregarHobbies() {
		hobbies.add(hobbieParaAgregar)
		ObservableUtils.firePropertyChanged(this, "hobbies", hobbies)
	}
	
	def quitarHobbies() {
		hobbies.remove(hobbieAEliminar)
		ObservableUtils.firePropertyChanged(this, "hobbies", hobbies)
	}
	
}
	
