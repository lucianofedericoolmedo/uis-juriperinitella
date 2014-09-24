package mapamundi

import detective.Pais
import java.awt.Color
import lugares.Lugar
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class EdicionPais extends SimpleWindow<MapamundiAppModel>{
	
	new(WindowOwner parent, MapamundiAppModel model) {
		super(parent, model)
	}
//	new(WindowOwner parent, Sistema sis, Pais pais) {
//		super(parent, new MapamundiAppModel(sis))
//		modelObject.paisSeleccionado = pais
//	}
	
	override createContents(Panel mainPanel) {

		new Label(mainPanel).setText("Nombre: ")
		new TextBox(mainPanel).bindValueToProperty("paisSeleccionado.nombre")

		var Table<String> tablaDeCaracteristicas = new Table<String>(mainPanel, String)
		tablaDeCaracteristicas.height = 60
		tablaDeCaracteristicas.bindItemsToProperty("paisSeleccionado.caracteristicas")
		tablaDeCaracteristicas.width = 200
		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	
			caption = "Editar Características"
			onClick [ | new EditarCaracteristicas(owner, modelObject).open ]
//					onClick [ | new EditarCaracteristicas(owner, modelObject.sistema, modelObject.paisSeleccionado).open ]
		]
		
		var Table<Pais> tablaDeConexiones = new Table<Pais>(mainPanel, Pais)
		tablaDeConexiones.height = 60
		tablaDeConexiones.bindItemsToProperty("paisSeleccionado.conexiones")
		tablaDeConexiones.width = 200
		new Column<Pais>(tablaDeConexiones) => [
			title = "Conexiones"
			bindContentsToProperty("nombre")
		]
		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	
			caption = "Editar Conexiones"
			onClick [ | 
						modelObject.quitarPaisSeleccionado()
						new EditarConexiones(owner, modelObject).open
			]
//					onClick [ | new EditarConexiones(owner, modelObject.sistema, modelObject.paisSeleccionado).open ]
		]
		
		var Table<Lugar> tablaLugares = new Table<Lugar>(mainPanel, Lugar)
		tablaLugares.height = 60
		tablaLugares.bindItemsToProperty("paisSeleccionado.lugares")
		tablaLugares.width = 200
		new Column<Lugar>(tablaLugares) => [
			title = "Lugares de interés"
			bindContentsToProperty("nombre")
		]
		new Button(mainPanel) => [
			setBackground(Color::LIGHT_GRAY)	
			caption = "Editar Lugares"
			onClick [ | new EditarLugaresInteres(owner, modelObject).open ]
//					onClick [ | new EditarLugaresInteres(owner, modelObject.sistema, modelObject.paisSeleccionado).open ]
		]
		
		botonAceptar(mainPanel)
	}
	
	def botonAceptar(Panel mainPanel){}
	
	override protected addActions(Panel actionsPanel) { }
	override protected createFormPanel(Panel mainPanel) { }
}