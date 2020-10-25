//
//  ViewController.swift
//  CoffeeMachineConsole
//
//  Created by 3droot on 25.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    private let coffeeMachine = CoffeeMachine()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        operations()

    }

    func operations(){
        print(coffeeMachine.fillIngridients(ingridients: .coffeeBeans))
       
        print(coffeeMachine.fillIngridients(ingridients: .water))
        print(coffeeMachine.stockStatus())
        
        print(coffeeMachine.prepare(drink: .espresso))
        print(coffeeMachine.prepare(drink: .cappuccino))
        
        print(coffeeMachine.fillIngridients(ingridients: .milk))
        
        print(coffeeMachine.prepare(drink: .americano))
        print(coffeeMachine.prepare(drink: .hotwater))
        print(coffeeMachine.prepare(drink: .latte))
        print(coffeeMachine.prepare(drink: .espresso))
        
        print(coffeeMachine.fillIngridients(ingridients: .coffeeBeans))
        
        print(coffeeMachine.prepare(drink: .espresso))
        print(coffeeMachine.prepare(drink: .americano))
        
        print(coffeeMachine.fillIngridients(ingridients: .water))
        print(coffeeMachine.prepare(drink: .americano))
        print(coffeeMachine.prepare(drink: .americano))
        
        print(coffeeMachine.emptyGroundsContainer())
        
        print(coffeeMachine.prepare(drink: .latte))
        
        print(coffeeMachine.stockStatus())
    }

}

