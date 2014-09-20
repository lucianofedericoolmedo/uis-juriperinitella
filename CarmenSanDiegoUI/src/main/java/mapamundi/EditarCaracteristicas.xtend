package mapamundi

import detective.Sistema
import java.awt.Color
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import detective.Pais

class EditarCaracteristicas extends SimpleWindow<MapamundiAppModel> {
	
	new(WindowOwner owner, MapamundiAppModel model) {
		super(owner, model)
	}
//	new(WindowOwner owner, Sistema sis, Pais pais) {
//		super(owner, new MapamundiAppModel(sis))
//		modelObject.paisSeleccionado = pais
//	}
	
	override createContents(Panel mainPanel) {
		this.setTitle("Editar Caracteristicas")
		
		var p = new Panel(mainPanel)
		p.setLayout(new VerticalLayout)
		new Label(p) => [
			setWidth(220)
			setBackground(Color::LIGHT_GRAY)
			setText("Caracteristicas")
		]
		new List(p) => [
			height = 60
			bindItemsToProperty("paisSeleccionado.caracteristicas")
			bindValueToProperty("caracteristicaAEliminar")	
		]
		
		var col = new Panel(mainPanel).setLayout(new ColumnLayout(2))
		new Button(col) => [
			setBackground(Color::LIGHT_GRAY)	
			caption = "Eliminar"
					onClick [ | modelObject.quitarCaracteristica()]
		]
		var col2 = new Panel(mainPanel).setLayout(new ColumnLayout(2))
		new TextBox(col2) => [
			setWidth(100)
			bindValueToProperty("caracteristicaParaAgregar")
		]
		new Button(col2) => [
			setWidth(100)
			setBackground(Color::LIGHT_GRAY)
			caption = "Agregar"
					onClick [ | modelObject.agregarCaracteristica()]
		]
		var ver = new Panel(mainPanel)
		new Button(ver) => [
			setWidth(220)
			setBackground(Color::LIGHT_GRAY)
			caption = "Aceptar"
					onClick [ | close ]
		]
	}
	
	override protected addActions(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}