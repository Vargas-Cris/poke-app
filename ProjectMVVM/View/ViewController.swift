//
//  ViewController.swift
//  ProjectMVVM
//
//  Created by Linder Anderson Hassinger Solano    on 22/04/22.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let pokeViewModel: PokeViewModel = PokeViewModel()
    
    var filterData: [Result] = []
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
        print(pokeViewModel.pokemons)
        filterData = pokeViewModel.pokemons
        tableView.reloadData()
           }
    
    func setUpView(){
        tableView.delegate=self
        tableView.dataSource=self
        searchBar.delegate=self
    }
    

}
    
//creamos un extens
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Retorna el numero de celdas que tendra la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count

    }
    // Setear los valores en la tabla
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            //La forma en la que podemos saber la posicion actual de nuestra cola es con index Path row
            let pokemon = filterData[indexPath.row]
            cell.textLabel?.text = pokemon.name.capitalized
            cell.imageView?.image = HelperImage.setImage(id: HelperString.getIdFromUrl(url: filterData[indexPath.row].url))
            return cell
        }
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath){
        print(filterData[indexPath.row].name)
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //searchText es el texto que estamos escribineodes como un exchange
        //cada vez que se escribe esta funcion se ejecuta
        filterData = searchText.isEmpty
        ? pokeViewModel.pokemons
        : pokeViewModel.pokemons.filter({(pokemon: Result)-> Bool in
            return pokemon.name.range(of: searchText,options: .caseInsensitive, range: nil, locale: nil) != nil
            
        })
        tableView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
