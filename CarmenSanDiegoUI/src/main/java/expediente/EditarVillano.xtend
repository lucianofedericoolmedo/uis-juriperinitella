package expediente

import org.uqbar.arena.windows.SimpleWindow
import personajes.Villano
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import java.awt.Color
import pista.PistaSenia
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import pista.PistaHobbie

class EditarVillano extends SimpleWindow<Villano>{
	
new(WindowOwner owner, Villano villano) {
		super(owner, villano)
		
	}

	override createContents(Panel mainPanel) {
		this.setTitle("Expedientes - Editar Villano")
		val colPanel = new Panel(mainPanel)
		colPanel.setLayout(new ColumnLayout(2))

		new Label(colPanel).setText("Nombre: ")
		new TextBox(colPanel).bindValueToProperty("nombre")
		new Label(colPanel).setText("Sexo: ")
		new TextBox(colPanel).bindValueToProperty("sexo")
		

		var Table<PistaSenia> tablaDeSenias = new Table<PistaSenia>(mainPanel, PistaSenia)
		tablaDeSenias.bindItemsToProperty("seniasPart")
		tablaDeSenias.bindValueToProperty("seniaSel")
		tablaDeSenias.width = 200
		new Column<PistaSenia>(tablaDeSenias) => [
			title = "Señas particulares" 
			bindContentsToProperty("pista")
		]
		
		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	
			caption = "Editar Señas Particulares"
					onClick [ | new EditarSeniasParticulares(owner, modelObject).open ]
		]
		
		var Table<PistaHobbie> tablaDeHobbies = new Table<PistaHobbie>(mainPanel, PistaHobbie)
		tablaDeHobbies.bindItemsToProperty("hobbies")
		tablaDeHobbies.bindValueToProperty("hobbieSel")
		tablaDeHobbies.width = 200
		new Column<PistaHobbie>(tablaDeHobbies) => [
			title = "Hobbies" 
			bindContentsToProperty("pista")
		]
		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	
			caption = "Editar hobbies"
					onClick [ | new EditarHobbies(owner, modelObject).open ]
		]
		
		new Button(mainPanel) => [
			caption = "Aceptar"
					onClick [ | close ]
		]
	}
	
	override protected addActions(Panel arg0) {
		//
	}
	
	override protected createFormPanel(Panel arg0) {
		//
	}

}