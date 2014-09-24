package detective

import java.util.List
import personajes.Villano
import org.uqbar.commons.utils.Observable

@Observable
class Caso {

	@Property Pais paisInicio
	@Property List<Pais> reocorridoVillano
	@Property Villano villano
	@Property String inicioCaso
	@Property String nombreCaso

	/**
	 * @param paisInicio el pais donde comienza la partida
	 * @param recorridoVillano el recorrido que hace el villano
	 * @param villano el sospecho del caso
	 * @param inicioCaso el informe inicial del robo
	 */
	new(Pais paisInicio, List<Pais> recorridoVillano, Villano villano, String inicioCaso, String nombreCaso) {
		this.paisInicio = paisInicio
		this.reocorridoVillano = recorridoVillano
		this.villano = villano
		this.inicioCaso = inicioCaso
		this.nombreCaso = nombreCaso
	}

	def getDescripcion() '''
		 «inicioCaso».
		 A las 9 horas del dia miercoles en «paisInicio.nombre»
		Identificado como un tesoro muy antiguo.
		 La persona sospechosa vista en la escena del crimen es: «villano.sexo».
		 
		 Su mision: 
		 Como detective , realizar el seguimiento de la persona sospechosa de «paisInicio.nombre» a su
		  escondite y arrestarla.
	'''

	def nombrePaisInicio() {
		paisInicio.nombre
	}

}
