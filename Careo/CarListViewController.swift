//
//  CarListViewController.swift
//  Careo
//
//  Created by Karol Stępień on 14.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import UIKit
import RxRealmDataSources
import RxSwift

class CarListViewController: UIViewController, CarFormDelegate {
    
    @IBOutlet var tableView: UITableView!
    var viewModel = CarListViewModel()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CarsServices.sharedInstance.getCars()
        let dataSource = RxTableViewRealmDataSource<Car>(cellIdentifier: TableViewCellReuseIdentifier.CarListTableViewCell.rawValue, cellType: CarListTableViewCell.self) {cell, ip, car in
            cell.config(withCar: car)
        }
        
        viewModel.carsCollection
            .bind(to: tableView.rx.realmChanges(dataSource))
            .addDisposableTo(bag)
        
    }
    
    func formDidSaveEntry() {
        print("did save entry")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.carFormSegue.rawValue {
            let vc = segue.destination as? CarFormViewController
            vc?.delegate = self
        }
    }
    

}

