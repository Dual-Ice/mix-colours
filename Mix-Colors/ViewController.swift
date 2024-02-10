//
//  ViewController.swift
//  Mix-Colors
//
//  Created by Валентина Ким on 10.02.2024.
//

import UIKit

class ViewController: UIViewController, UIColorPickerViewControllerDelegate {

    @IBOutlet weak var first: UIButton!
    @IBOutlet weak var second: UIButton!
    @IBOutlet weak var result: UIView!
    
    var firstColor = UIColor.red
    var secondColor = UIColor.blue
    var resultColor = UIColor.purple
    
    let picker = UIColorPickerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        first.backgroundColor = firstColor
        second.backgroundColor = secondColor
        result.backgroundColor = resultColor
        
    }
    
    @IBAction func firstAction(_ sender: UIButton) {
        handleTap(sender: sender)
    }
    
    @IBAction func secondAction(_ sender: UIButton) {
        
        handleTap(sender: sender)
    }
    
    func handleTap(sender: UIButton) {
        picker.selectedColor = sender.backgroundColor!
        
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        
//        let c = picker.publisher(for: \.selectedColor)
//                .sink { color in
//                    
//                    //  Changing view color on main thread.
//                    DispatchQueue.main.async {
//                        sender.backgroundColor = color
//                        self.mixColors()
//                        print(color.accessibilityName.localizedLowercase)
//                    }
//                }
//            
//            self.present(picker, animated: true, completion: nil)
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
            dismiss(animated: true, completion: nil)
        print("dismiss")
    }
    func colorPickerViewController(
       _ viewController: UIColorPickerViewController,
       didSelect color: UIColor,
       continuously: Bool) {
            let color = viewController.selectedColor
           print("select")
    }
    
    func mixColors() {
        let firstColorComponents = first.backgroundColor?.cgColor.components
        let secondColorComponents = second.backgroundColor?.cgColor.components
        result.backgroundColor = UIColor(
            red: ((firstColorComponents?[0] ?? 0) + (secondColorComponents?[0] ?? 0))/2,
            green: ((firstColorComponents?[1] ?? 0) + (secondColorComponents?[1] ?? 0))/2,
            blue: ((firstColorComponents?[2] ?? 0) + (secondColorComponents?[2] ?? 0))/2,
            alpha: ((firstColorComponents?[3] ?? 0) + (secondColorComponents?[3] ?? 0))/2)
    }
    
    


}
