package main.java.detective

import java.util.List
import main.java.lugares.Lugar


class Pais {
	@Property String nombre
	@Property String caracteristica
	@Property List<Lugar> lugares
	@Property List<Pais> paisesLimitrofes
	@Property Lugar  lugarActual
	/**
	 * INV. REP.: Un pais representa un lugar fisico en el juego
	 * - Un pais no puede tener mas de 3 lugares para visitar.
	 * - Los lugares a visitar no pueden ser iguales
	 */
//	new(String nombre, String caracteristica, List<Lugar>lugares){
//		this.nombre=nombre
//		this.caracteristica=caracteristica
//		this.lugares=lugares
//	}

	new() {}
	/**
	 * i no puede ser <  a 0 ni > a 3
	 */
	def irALugar(int i){
		
		lugarActual= lugares.get(i-1);
	}
	
	def hablarConElPersonaje(){
		if(lugarActual != null){
		lugarActual.imprimirPistas	
		}else{
			//throw new exeptionNoEstaEnNingunLugar()
		}
	}
	
	
}