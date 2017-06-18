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
import RxCocoa

class CarListViewController: UIViewController, CarFormDelegate {

    @IBOutlet var tableView: UITableView!
    private var viewModel = CarListViewModel()
    private var selectedCar = Car()
    private let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .black
        CarsServices.sharedInstance.getCars()
        let dataSource = RxTableViewRealmDataSource<Car>(cellIdentifier: TableViewCellReuseIdentifier.CarListTableViewCell.rawValue, cellType: CarListTableViewCell.self) { cell, ip, car in
            cell.config(withCar: car)
        }

        viewModel.carsCollection
                .bind(to: tableView.rx.realmChanges(dataSource))
                .addDisposableTo(bag)

        tableView.rx.itemSelected
                .subscribe(onNext: { [weak self] indexPath in
                    self?.tableView.deselectRow(at: indexPath, animated: true)
                    guard let cars = self?.viewModel.cars else {
                        return
                    }
                    self?.selectedCar = cars[indexPath.row]
                    self?.performSegue(withIdentifier: SegueIdentifier.carDetailsSegue.rawValue, sender: self)
                }).addDisposableTo(bag)

    }

    func formDidSaveEntry() {
        AlertView(title: "Success!", message: "A new car has been added to your list.", cancelButtonTitle: "Okay").show()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.carFormSegue.rawValue {
            let vc = segue.destination as? CarFormViewController
            vc?.delegate = self
        } else if segue.identifier == SegueIdentifier.carDetailsSegue.rawValue {
            let vc = segue.destination as? CarDetailsViewController
            let viewModel = CarDetailsViewModel(car: selectedCar)
            vc?.viewModel = viewModel
        }
    }


}

