//
//  CerebroPropina.swift
//  6AppPropina
//
//  Created by djdenielb on 15/04/22.
//

import Foundation

//El struct de cerebro sera el encargado de crear todas las operaciones de la calculadora de propinas
struct CerebroPropina{
    
//    Variable resultado que se retornara para mostrarla
    var resultadoPropina: Float = 0.0
    var personasInt: Int = 0
    
//    Array para el numero total de personas para el picker view
    let arrayTotalPersonas = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    
    
//    Funcion para calcular la propina
    
    mutating func calcularPropina(recibeTotalCuenta: Float, recibePorcentaje: Int, recibeCantidadPersonas: Int) -> Float{
        
        resultadoPropina = (recibeTotalCuenta * Float(recibePorcentaje)/100)/Float(recibeCantidadPersonas)
        
        return resultadoPropina
    }
    
    
}
