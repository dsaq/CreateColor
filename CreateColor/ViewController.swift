//
//  ViewController.swift
//  CreateColor
//
//  Created by Павел Прохоренко on 13.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var valueRedLabel: UILabel!
    @IBOutlet var valueGreenLabel: UILabel!
    @IBOutlet var valueBlueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        getColor()
        
        setValue(for: valueBlueLabel, valueRedLabel, valueGreenLabel)
        
    }
/*
 В качестве значения для сопоставления поставим sender. Sender - это параметр, который принимает тот элемент интерфейса, с которым на данный момент взаимодействует пользователь
*/
    
    @IBAction func getColor(_ sender: UISlider) {
        getColor()
        
        switch sender {
        case redSlider:
            valueRedLabel.text = string(from: redSlider)
        case greenSlider:
            valueGreenLabel.text = string(from: greenSlider)
        default:
            valueBlueLabel.text = string(from: blueSlider)
        }
    }
    

    private func getColor () {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    // метод, принимающий [вариантивные параметры]. В него закинем все слайдеры. Чтобы обновлять значние лэйбла слайдера по необходимости
    /* При использовании вариантивного параметра все значения, по сути, помещаются в массив. По этому пишем for label[s]. Раз это массив, то его нужно перебрать. Перебираем с помощью функции forEach (заменят for..in.. по сути такая же функция, только пишется в одну строку с помощью блоков замыкания). Берем значение из слайдера и передаем в этот лейбл, в зависимости от того, какой лейбл. Для этого используем switch.
     Switch - передаем аутлеты и смотрим, если у нас этот лэбл является аутлетом redLabel, то передаем в redLabel.text результат функции string
    */
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case valueRedLabel:
                valueRedLabel.text = string(from: redSlider)
            case valueGreenLabel:
                valueGreenLabel.text = string(from: greenSlider)
            default:
                valueBlueLabel.text = string(from: blueSlider)
            }
            
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}
