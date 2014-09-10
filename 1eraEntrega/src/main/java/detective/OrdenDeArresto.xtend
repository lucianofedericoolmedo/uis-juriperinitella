package detective

import pista.PistaHobbie
import pista.PistaSenia
import personajes.Villano
import org.uqbar.commons.utils.Observable
import java.util.List

@Observable
class OrdenDeArresto {
	
	@Property List<PistaHobbie> pistasHobbie
	@Property List<PistaSenia> pistasSenia
	@Property Villano villano

	new(){
	 this.pistasHobbie= newArrayList()  		
	 this.pistasSenia= newArrayList()
	 this.villano= new Villano()
	}
	
	def agregarPistaHobbie(PistaHobbie ph) {
		pistasHobbie.add(ph)
	}
	
	def agregarPistaSenia(PistaSenia ps) {
		pistasSenia.add(ps)
	}
}