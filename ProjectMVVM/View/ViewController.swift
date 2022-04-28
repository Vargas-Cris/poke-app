//
//  ViewController.swift
//  ProjectMVVM
//
//  Created by Linder Anderson Hassinger Solano    on 22/04/22.
//

import UIKit

class ViewController: UIViewController{
    
      
    @IBOutlet weak var tableView: UITableViewCell!
    
    let pokeViewModel: PokeViewModel = PokeViewModel()
    
    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await setUpData()
        }
        setUpView()
    }
    
    func setUpData() async {
        await pokeViewModel.getDataFromAPI()
        tableView.reloadData()
           }
    
    func setUpView(){
        tableView.delegate = self
        tableView.dataSource = self
         }
         
     }

//creamos un extens
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Retorna el numero de celdas que tendra la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokeViewModel.pokemons.count

    }
    // Setear los valores en la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        //La forma en la que podemos saber la posicion actual de nuestra cola es con index Path row
        cell.textLabel?.text = pokeViewModel.pokemons[indexPath.row].name
        return cell
    }
    
}

