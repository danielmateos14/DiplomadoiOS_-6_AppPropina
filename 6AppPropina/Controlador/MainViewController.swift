//
//  ViewController.swift
//  6AppPropina
//
//  Created by djdenielb on 15/04/22.
//

import UIKit

//Agregamos los protocolos para el picker view

class MainViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate{
    
//    Instancia objeto cerebro propina
    var cerebroPropina = CerebroPropina()
    

//    Variables necesarias
    var CuentaTotal: Float = 0.0
    var porcentajePropina: Float = 0
    var porcentajePropinaInt: Int = 0
    var numeroPersonas: Int = 1
    var resultado: Float = 0.0
    
//    Variables graficas
    @IBOutlet weak var txtTotalCuenta: UITextField!
    @IBOutlet weak var labelPorcentaje: UILabel!
    @IBOutlet weak var pickerViewTotalPersonas: UIPickerView!
    @IBOutlet weak var botonCalcular: UIButton!
    @IBOutlet weak var sliderPorcentaje: UISlider!
    
//    Metodo que se carga el incio de la app
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Tenemos que poner la variable pickerview usando la propiedad delegate y datasource al inicio del viewDid para que aparezcan los elementos
        pickerViewTotalPersonas.dataSource = self
        pickerViewTotalPersonas.delegate = self
        
//        Para que el label del slider aparezca en 0
        labelPorcentaje.text = "0 %"
    }

//     Slider porcentaje
    @IBAction func SilderPorcentajePropina(_ sender: UISlider) {
//        Agregada funcion rounded para que evite los decimales y haga bien la operacion para sacar la propina
        porcentajePropina = sender.value.rounded()
        print(porcentajePropina)
        porcentajePropinaInt = Int(porcentajePropina)
        labelPorcentaje.text = "\(String(format: "%.0f",porcentajePropina)) %"
    }
    
//    PickerView, aplicamos todas estas funciones, 2 son obligatorias del protocolo
    
//    La primera es el numero de componentes que tendra o sea el numero de columnas
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
//    Esta tendra el numero de elementos que apareceran o sea el numero de filas dentro de la columna, aqui se le pone el numero de los elementos que tiene el array
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cerebroPropina.arrayTotalPersonas.count
    }
    
//    Este es para aparezcan los elementos del array uno por uno con el row que hace la funcion de contador
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cerebroPropina.arrayTotalPersonas[row]
        
    }
    
//    Este es para que se seleccione un elemento cuando se ponga encima de el, y segun nuestra app esto que selecciona lo transforma en int y lo guarda en la variable numero de personas
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numeroPersonas = Int(cerebroPropina.arrayTotalPersonas[row]) ?? 1
        
    }
    
    
//    Boton calcular
    @IBAction func botonCalcular(_ sender: UIButton) {

//        Extraer lo que tiene total cuenta
        CuentaTotal = Float(txtTotalCuenta.text!) ?? 0.0

//        Segue para enviar el resultado a la siguiente pantalla
        performSegue(withIdentifier: "seguePropina", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguePropina"{
            let variableEnviaDatosSegundaPantalla = segue.destination as! PantallaResultadoViewController
            
            //        Llamada a la funcion de calcular propina instanciando al cerebroPropina
            variableEnviaDatosSegundaPantalla.recibeDatos = cerebroPropina.calcularPropina(recibeTotalCuenta: CuentaTotal, recibePorcentaje: porcentajePropinaInt, recibeCantidadPersonas: numeroPersonas)
        }
    }
    
    
    //    Funcion para cerrar el teclado al tocar fuera
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    //    Boton limpiar, pone en 0 todo y falta agregarle que el pickerView lo regrese a su valor inicial
        @IBAction func botonLimpiar(_ sender: UIButton) {
            txtTotalCuenta.text = ""
            labelPorcentaje.text = "0 %"
            sliderPorcentaje.value = 0
            
            //            Con este if ponemos el pickerView en su primer valor si el numPersonas es diferente de 1 quiere decir que el picker no esta en el uno y entonces con el metodo selectRow le indicamos en que lugar y en que componente debe de ponerse al presionar el boton
            if numeroPersonas != 1{
                numeroPersonas = 1
                pickerViewTotalPersonas.selectRow(0, inComponent: 0, animated: true)
            }
            
        }
}
