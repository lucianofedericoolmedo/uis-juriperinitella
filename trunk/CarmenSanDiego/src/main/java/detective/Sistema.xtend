package main.java.detective

import java.util.List
import main.java.personajes.Villano
import main.java.detective.Caso
import main.java.pista.PistaHobbie
import main.java.pista.PistaSenia
import org.uqbar.commons.utils.Observable

@Observable
class Sistema {
	
	@Property Caso caso
	@Property List<Pais> paisesSistema= newArrayList()
	@Property List<Villano> villanosSistema = newArrayList()
	@Property Villano villanoSeleccionado
	@Property Pais paisSeleccionado
	@Property PistaSenia seniasVillanoSeleccionado
	@Property PistaHobbie hobbiesVillanoSeleccionado
	@Property Villano villanoEnCreacion = new Villano()
	@Property Pais paisEnCreacion = new Pais()
			  Pais paisActual
			  List<Pais> paisesVisitados
			  Villano villanoArrestar
			  OrdenDeArresto ordenDeArresto
	
	new(Caso caso, List<Pais> paisesSistema, List<Villano> villanosSistema){
		this.caso=caso
		this.paisesSistema=paisesSistema
		this.villanosSistema=villanosSistema
		this.paisActual=caso.paisInicio
		this.ordenDeArresto= new OrdenDeArresto()
	}
	
	new() {
		var Villano a = new Villano()
		a.nombre = "javi"
		var Villano b = new Villano()
		b.nombre = "adri"
		var Villano c = new Villano()
		c.nombre = "oggi junco"
		villanosSistema.add(a)
		villanosSistema.add(b)
		villanosSistema.add(c)
		var Pais ap = new Pais
		ap.nombre = "pais a"
		var Pais bp = new Pais
		bp.nombre = "pais b"
	    paisesSistema.add(ap)
	    paisesSistema.add(bp)
	
	}
	
	def paisesAViajar(){
		paisesSistema.remove(paisActual)
	}
	
	def viajar(Pais pais){
		paisActual=pais
		paisesVisitados.add(pais)
		paisesSistema.remove(pais)
	}
	
	def volverAPaisAnterior(){
		paisActual=paisesVisitados.get(0)
		paisesVisitados.remove(paisesVisitados.get(0))
		paisesSistema.add(paisesVisitados.get(0)) 
	}
	
	def iniciarJuego(){
		caso.inicioCaso
	}
	
	def generarOrdenDeArrestro(){
		for(Villano villano: villanosSistema){
	//		 if(villano.hobbies.contains(ordenDeArresto.pistaHobbie) &&  --MODIFICAR LA CONDICION 
		//	 		villano.seniasPart.contains(ordenDeArresto.pistaSenia))
			 	villanoArrestar= villano
			}
		 if( villanoArrestar== null){
		 	throw new ExceptionNingunVillano("No hay coincidencia con ningu villano")
			}
	}
	
	def completarHobbieOrdenDeArresto(PistaHobbie pista){
		ordenDeArresto.agregarPistaHobbie(pista)
	}
	
	def completarSeniaOrdenDeArresto(PistaSenia pista){
		ordenDeArresto.agregarPistaSenia(pista)
	}
	def arrestar(){
		villanoArrestar== caso.villano
	}
	
	def void agregarVillanoALaLista() {
		villanosSistema.add(villanoEnCreacion)
	}
	
	def getRemoverPais() {
		paisesSistema.remove(paisSeleccionado)
	}
	
}