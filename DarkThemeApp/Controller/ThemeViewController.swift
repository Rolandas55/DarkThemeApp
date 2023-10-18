//
//  ViewController.swift
//  DarkThemeApp
//
//  Created by kraujalis.rolandas on 18/10/2023.
//

import UIKit

class ThemeViewController: UIViewController {
    
    @IBOutlet weak var darkButton: UIButton!
    @IBOutlet weak var folderButton: UIBarButtonItem!
#warning("need to have IBOutlet for Item button and put on leading side")
    @IBOutlet weak var recycleButton: UIBarButtonItem!
    
    var isDarkTheme = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ThemeViewController func viewDidLoad")
        darkButton.layer.cornerRadius = 10
    }
    @IBAction func darkButtonTapped(_ sender: Any) {
        print("darkButton tapped")
        if isDarkTheme {
            view.backgroundColor = UIColor.white
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            darkButton.setTitle("Dark theme on", for: .normal)
            darkButton.setTitleColor(UIColor.white, for: .normal)
            darkButton.tintColor = UIColor.systemBlue
            folderButton.tintColor = UIColor.systemBlue
            recycleButton.tintColor = UIColor.systemBlue
            isDarkTheme = false
        } else {
            view.backgroundColor = UIColor.black
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            darkButton.setTitle("Dark theme off", for: .normal)
            darkButton.setTitleColor(UIColor.black, for: .normal)
            darkButton.tintColor = UIColor.white
            folderButton.tintColor = UIColor.white
            recycleButton.tintColor = UIColor.white
            isDarkTheme = true
        }
#warning("Dark Theme off : Dark Theme on")
    }
    
    @IBAction func folderTapped(_ sender: Any) {
        basicAlert(title: "My Folder", message: "This is my item button!")
    }
#warning("need to have IBAction for Item button and logic to present actionSheet")
    @IBAction func recycleTapped(_ sender: Any) {
        basicActionSheet(title: "Recycle Bin", message: "Recycle Bin is empty!")
    }
    
    func basicActionSheet(title: String?, message: String?) {
        DispatchQueue.main.async {
            let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            actionSheet.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(actionSheet, animated: true)
        }
    }
}

extension UIViewController {
    func basicAlert(title: String?, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}

