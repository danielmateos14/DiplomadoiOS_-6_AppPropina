//
//  PantallaResultadoViewController.swift
//  6AppPropina
//
//  Created by djdenielb on 15/04/22.
//

import UIKit

class PantallaResultadoViewController: UIViewController {
    
//    Variable grafica
    @IBOutlet weak var labelResultado: UILabel!
    
//    Variable que recibe los datos de la otra pantalla, recibe el resultado
    var recibeDatos: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        Al carcar la pantalla muestra ese resultado ya formateado
        labelResultado.text = "\(String(format: "%.2f",recibeDatos))"
    }
    
//    El boton cerrar solo cierra ese view para poder regresar al anterior
    @IBAction func botonCerrar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
