//
//  CoffeeMachine.swift
//  CoffeeMachineConsole
//
//  Created by 3droot on 25.10.2020.
//

import Foundation

class CoffeeMachine {

    enum DrinkType: String {
        case espresso, americano, cappuccino, latte, hotwater
        
        //recipes
        var coffeeBeamsAmout: Double {
            switch self {
            case .espresso: return 40
            case .americano: return 30
            case .cappuccino: return 20
            case .latte: return 20
            case .hotwater: return 0
            }
        }
        var milkAmount: Double {
            switch self {
            case .espresso: return 0
            case .americano: return 0
            case .cappuccino: return 50
            case .latte: return 100
            case .hotwater: return 0
            }
        }
        var waterAmount: Double {
            switch self {
            case .espresso: return 50
            case .americano: return 100
            case .cappuccino: return 100
            case .latte: return 80
            case .hotwater: return 200
            }
        }
    }
    
    enum IngridientsType: Int {
        case water, milk, coffeeBeans
    }
    
    var groundsContainer: Int
    let groundsContainerCapacity = 5
    var ingridientsStock: [IngridientsType: Double]
    
    init() {
        self.groundsContainer = 0
        self.ingridientsStock = [.coffeeBeans: 0, .milk : 0, .water : 0]
    }
    
    func fillIngridients(ingridients: IngridientsType) -> String {
        switch ingridients {
        case .coffeeBeans:
            ingridientsStock[.coffeeBeans] = 100
        case .milk:
            ingridientsStock[.milk] = 300
        case .water:
            ingridientsStock[.water] = 500
        }
        return "\(ingridients) has filled"
    }
    
    func prepare(drink: DrinkType) -> String {
        guard !isGroundsContainerFull() else {return "Can not make \(drink). Please empty grounds container"}
        guard ingridientsStock[.coffeeBeans]! >= drink.coffeeBeamsAmout else { return "Can not make \(drink). Please fill cofffee beams"}
        guard ingridientsStock[.milk]! >= drink.milkAmount else { return "Can not make \(drink). Please fill milk"}
        guard ingridientsStock[.water]! >= drink.waterAmount else { return "Can not make \(drink). Please fill water"}
        
        //take ingridients from stock
        ingridientsStock[.coffeeBeans]! -= drink.coffeeBeamsAmout
        ingridientsStock[.milk]! -= drink.milkAmount
        ingridientsStock[.water]! -= drink.waterAmount
        if drink != .hotwater {
            groundsContainer += 1
        }
        
       
        return "Your \(drink) is ready"
    }
    
    func isGroundsContainerFull() -> Bool {
        var status = false
        if groundsContainer >= groundsContainerCapacity {
            status = true
        }
        return status
    }
    
    func emptyGroundsContainer () -> String {
        groundsContainer = 0
        return "Grounds container is empty"
    }
    
    func stockStatus() -> String {
        return """
            ------------------------------------------------
            Currently in stock:
            Coffee beams: \(ingridientsStock[.coffeeBeans]!) grams \nMilk: \(ingridientsStock[.milk]!) grams \nWater: \(ingridientsStock[.water]!) grams
            ------------------------------------------------
            """
    }
    
}
