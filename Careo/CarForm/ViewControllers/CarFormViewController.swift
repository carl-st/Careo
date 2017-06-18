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

class CarFormViewController: UIViewController, UINavigationControllerDelegate {
    
    var delegate: CarFormDelegate?
    @IBOutlet private var yearTextField: UITextField!
    @IBOutlet private var modelTextField: UITextField!
    @IBOutlet private var brandTextField: UITextField!
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.backgroundColor = Colors.primary
        saveButton.layer.cornerRadius = 4
        saveButton.clipsToBounds = true
    }

    @IBAction func saveAction(_ sender: Any) {
        if nameTextField.text == "" || brandTextField.text == "" || modelTextField.text == "" || yearTextField.text == "" {
            AlertView(title: "Empty fields!", message: "You need to provide data in all fields in order to continue.", cancelButtonTitle: "Okay").show()
        } else {
            guard let name = nameTextField.text, let brand = brandTextField.text, let model = modelTextField.text, let year =  yearTextField.text else { return }
            let car = Car(name: name, model: model, brand: brand, year: year)
            CarsServices.sharedInstance.addCar(car: car, completion: { [weak self] in
                self?.delegate?.formDidSaveEntry()
                self?.navigationController?.popViewController(animated: true)
            })
        }

    }

}
