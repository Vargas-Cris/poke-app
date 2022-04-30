//
//  PokeDetailViewController.swift
//  ProjectMVVM
//
//  Created by MAC12 on 30/04/22.
//

import UIKit

class PokeDetailViewController: UIViewController {
    // vamos a declarar que variable necesito
        var url: String = ""
    var pokemon : PokeDetail? =  nil
       
    @IBOutlet weak var lblNamePokemon: UILabel!
    
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var imagePokemon: UIImageView!
    
        
        let pokeViewModel: PokeViewModel = PokeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        Task{
            await setUpView()
        }

        
    }
    func setUpView()async{
        await pokeViewModel.getPokeDetail(url: url)
        pokemon = pokeViewModel.pokemon
        setUpPokeData()
    }
    func setUpPokeData()
    {
        view.backgroundColor = PokeTypes.types[(pokemon?.types[0].type.name)!]
        lblType.text = pokemon?.types[0].type.name ?? ""
        lblNamePokemon.text=pokemon?.name.capitalized
        imagePokemon.image = HelperImage.setImageFromURL(url: (pokemon?.sprites.other.officialArtwork.front_default)!)
    }
    

}
