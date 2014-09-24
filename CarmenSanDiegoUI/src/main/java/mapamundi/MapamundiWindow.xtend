package mapamundi

import detective.Pais
import detective.Sistema
import lugares.Lugar
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

class MapamundiWindow extends Dialog<MapamundiAppModel> {
		
	new(WindowOwner owner, Sistema sistema) {
		super(owner, new MapamundiAppModel(sistema))
		title = "Mapamundi"
	}
	
	override createContents(Panel mainPanel) {
		val colPanel = new Panel(mainPanel)
		colPanel.setLayout(new ColumnLayout(2))
		
		var Table<Pais> paises = new Table<Pais>(colPanel, Pais)
		paises.height = 200
		paises.bindItemsToProperty("sistema.paisesSistema")
		paises.bindValueToProperty("paisSeleccionado")
		new Column<Pais>(paises) => [
			title = "Paises" 
			bindContentsToProperty("nombre")
		]
		
		new Panel(colPanel) => [
			new Panel(it) => [
				layout = new HorizontalLayout
				new Label(it).setText("Nombre: ")
				new Label(it).setWidth(100).bindValueToProperty("paisSeleccionado.nombre")
			]
			var Table<String> caracteristicas = new Table<String>(it, String)
			caracteristicas.height = 100
			caracteristicas.bindItemsToProperty("paisSeleccionado.caracteristicas")

			var Table<Pais> conexiones = new Table<Pais>(it, Pais)
			conexiones.height = 100
			conexiones.bindItemsToProperty("paisSeleccionado.conexiones")
			new Column<Pais>(conexiones) => [
				title = "Conexiones" 
				bindContentsToProperty("nombre")
			]
			var Table<Lugar> lugares = new Table<Lugar>(it, Lugar)
			lugares.height = 100
			lugares.bindItemsToProperty("paisSeleccionado.lugares")
			new Column<Lugar>(lugares) => [
				title = "Lugares de Interés" 
				bindContentsToProperty("nombre")
			]	
		]
		
		new Button(colPanel) => [ 
				caption = "Eliminar"
				width = 60
				onClick [ | modelObject.removerPais ]
		]
		
		new Button(colPanel) => [
				caption = "Editar"
				width = 60
				onClick [ | new EditarPais(owner,  modelObject).open ]
		]
		
		new Button(colPanel) => [
				caption = "Nuevo"
				width = 60
				onClick [ | new NuevoPais(owner, modelObject).open ]
		]
		new Button(colPanel) => [
				caption = "Aceptar"
				width = 100
				onClick [ | close ]
		]
	}
	
	override protected addActions(Panel arg0) { }
	override protected createFormPanel(Panel arg0) { }
}