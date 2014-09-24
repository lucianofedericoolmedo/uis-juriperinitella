package expediente

import detective.Sistema
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import personajes.Villano
import pista.PistaHobbie
import pista.PistaSenia

class ExpedientesWindow extends Dialog<ExpedientesAppModel> {
	
	new(WindowOwner owner, Sistema sistema) {
		super(owner, new ExpedientesAppModel(sistema))
		title = "Expedientes"
	}
	
	override createContents(Panel mainPanel) {
		val colPanel = new Panel(mainPanel)
		colPanel.setLayout(new ColumnLayout(2))
		
		var Table<Villano> villanos = new Table<Villano>(colPanel, Villano)
		villanos.bindItemsToProperty("sistema.villanosSistema")
		villanos.bindValueToProperty("villanoSeleccionado")
		new Column<Villano>(villanos) => [
			title = "Villano" 
			bindContentsToProperty("nombre")
		]
		
		new Panel(colPanel) => [
			new Panel(it) => [
				layout = new HorizontalLayout
				new Label(it).setText("Nombre: ")
				new Label(it).setWidth(100).bindValueToProperty("villanoSeleccionado.nombre")
			]
			
			new Panel(it) => [
				layout = new HorizontalLayout
				new Label(it).setText("Sexo: ")
				new Label(it).setWidth(100).bindValueToProperty("villanoSeleccionado.sexo")
			]
			
			var Table<PistaSenia> seniasVillano = new Table<PistaSenia>(it, PistaSenia)
			seniasVillano.height = 100
			seniasVillano.bindItemsToProperty("villanoSeleccionado.seniasParticulares")
			new Column<PistaSenia>(seniasVillano) => [
				title = "Señas" 
				bindContentsToProperty("pista")
			]
			
			var Table<PistaHobbie> hobbiesVillano = new Table<PistaHobbie>(it, PistaHobbie)
			hobbiesVillano.height = 100
			hobbiesVillano.bindItemsToProperty("villanoSeleccionado.hobbies")
			new Column<PistaHobbie>(hobbiesVillano) => [
				title = "Hobbies" 
				bindContentsToProperty("pista")
			]	
		]
		
		mostrarBotones(colPanel)
	}
	
	def mostrarBotones(Panel mainPanel) {
		new Button(mainPanel) => [
				caption = "Nuevo"
				width = 70
				onClick [ | new NuevoVillano(owner, modelObject).open ]
		]
		new Button(mainPanel) => [
				caption = "Editar"
				width = 70
				onClick [ | new EditarVillano(owner, modelObject).open ]
		]
		new Button(mainPanel) => [
				caption = "Aceptar"
				width = 100
				onClick [ | close ]
		]		
	}
	
	override protected addActions(Panel arg0) { }
	override protected createFormPanel(Panel arg0) { }
}