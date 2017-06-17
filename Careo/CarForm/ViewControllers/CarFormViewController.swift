//
//  CarFormViewController.swift
//  Careo
//
//  Created by Karol Stępień on 16.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import UIKit
import SIAlertView
import RxAlamofire

protocol CarFormDelegate {
    func formDidSaveEntry()
}

class CarFormViewController: UIViewController {
    
    var delegate: CarFormDelegate?
    @IBOutlet var yearTextField: UITextField!
    @IBOutlet var modelTextField: UITextField!
    @IBOutlet var brandTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func saveAction(_ sender: Any) {
        if nameTextField.text == "" || brandTextField.text == "" || modelTextField.text == "" || yearTextField.text == "" {
            print("alert")
        } else {
            guard let name = nameTextField.text, let brand = brandTextField.text, let model = modelTextField.text, let year =  yearTextField.text else {
                    return
                }
            let car = Car(name: name, model: model, brand: brand, year: year)
            CarsServices.sharedInstance.addCar(car: car, completion: { [weak self] in
                self?.delegate?.formDidSaveEntry()
                self?.navigationController?.popViewController(animated: true)
            })
        }

    }

}
