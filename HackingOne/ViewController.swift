//
//  ViewController.swift
//  HackingOne
//
//  Created by Eric Grehan on 31/10/2018.
//  Copyright © 2018 Eric Grehan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()                                   //()=Create One Now
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true //ios11 title size
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!                    //!= implicitly unwrapped optional -variable or constant that might hold the data or might not, but we’re 100% certain it does
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.hasPrefix("nssl"){
            pictures.append(item)
        }
    }
        print(pictures)
}
    
    //How many Rows????
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    //What to put in each row????
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
