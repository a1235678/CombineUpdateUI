//
//  ViewController.swift
//  CombineCollectionView
//
//  Created by zeroplus on 2020/5/7.
//  Copyright © 2020 zeroplus. All rights reserved.
//  https://github.com/CombineCommunity/rxswift-to-combine-cheatsheet

import UIKit
import Combine

class ViewController: UIViewController {

    let notificationCenter = NotificationCenter.default
    let notificationName = Notification.Name(rawValue: "TESTING")
    
    @IBOutlet weak var collectionView: UICollectionView!
    var cancellables = Set<AnyCancellable>()
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    let countLabelSubject = CurrentValueSubject<Int, Never>(0)
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func decreaseButtonPressed(_ sender: Any) {
        // send minus 1 event
    }
    
    @IBAction func increaseButtonPressed(_ sender: Any) {
        // send plus 1 event
    }
    
    @IBAction func sendNotificationButtonPressed(_ sender: Any) {
        notificationCenter.post(Notification(name: notificationName))
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if sender.isOn {
            ThemeManager.shared.shouldApplyDarkMode = true
        } else {
            ThemeManager.shared.shouldApplyDarkMode = false
        }
    }
    
    func testAssign() {
        
        // assign countLabelSubject to countLabel
        
    }
    
    func testNotification() {
        
        // 原本的寫法
        notificationCenter.addObserver(forName: notificationName, object: nil, queue: nil) { notification in
            self.performSegue(withIdentifier: "toMoviePage", sender: nil)
         }
        
        // combine 的寫法

    }
    
    func testThemimgSystem() {
        darkModeSwitch.isOn = ThemeManager.shared.shouldApplyDarkMode
        
        ThemeManager.shared.themeSubject.sink(receiveValue: { style in
            switch style {
                case .system:
                    self.overrideUserInterfaceStyle = .unspecified
                case .dark:
                    self.overrideUserInterfaceStyle = .dark
                case .light:
                    self.overrideUserInterfaceStyle = .light
                }
            })
            .store(in: &cancellables)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testAssign();
                
        testNotification();
        
        testThemimgSystem();
    }

}

