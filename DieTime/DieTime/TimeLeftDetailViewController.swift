//
//  TimeLeftDetailViewController.swift
//  DieTime
//
//  Created by Charles Kang on 8/10/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import UIKit

class TimeLeftDetailViewController: UIViewController
{
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var yearsLeftLabel: UILabel!
    @IBOutlet weak var monthsLeftLabel: UILabel!
    @IBOutlet weak var daysLeftLabel: UILabel!
    @IBOutlet weak var lifeCompleteLabel: UILabel!
    
    let lifeExpectancyService = LifeExpectancyService()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        lifeExpectancyService.delegate = self
    }
    
    @IBAction func calcuateLifeExpectancyButton(sender: AnyObject)
    {
        lifeExpectancyService.getLifeInfo()
    }
}

extension TimeLeftDetailViewController: LifeExpectancyServiceDelegate
{
    func setLifeExpectancy(lifeExpectancy: LifeExpectancy)
    {
        ageLabel.text = String(lifeExpectancy.currentAge)
        print(ageLabel.text)
        yearsLeftLabel.text = String(lifeExpectancy.yearsLeft)
        monthsLeftLabel.text = String(lifeExpectancy.monthsLeft)
        daysLeftLabel.text = String(lifeExpectancy.daysLeft)
        lifeCompleteLabel.text = String(lifeExpectancy.lifeComplete)
    }
}