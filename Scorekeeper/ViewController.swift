//
//  ViewController.swift
//  Scorekeeper
//
//  Created by Peter Zupke on 10/18/16.
//  Copyright © 2016 Peter Zupke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var scores = ["Cal" : 1, "Brian" : 5, "Komal" : 2, "Kevin" : 3, "Luke" : 0, "Tim" : 4, "Steve" : 6, "Bill" : 0]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "score", for: indexPath) as! ScoreCell
        
        let row = indexPath.row
        let name = Array(scores.keys)[row]
        cell.decorate(for: name, in: self)
        
        return cell
    }
    
}

class ScoreCell : UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    var name: String!
    var controller: ViewController!
    
    func decorate(for name: String, in controller: ViewController) {
        let score = controller.scores[name] ?? 0
        self.label.text = "\(name): \(score)"
        
        self.name = name
        self.controller = controller
    }
    
    func updateScore(offset: Int) {
        var score = controller.scores[name] ?? 0
        score += offset
        controller.scores[name] = score
        
        self.label.text = "\(name ?? "Unnamed Person"): \(score)"
    }
    
    @IBAction func subtractPressed(_ sender: AnyObject) {
        self.updateScore(offset: -1)
    }
    
    @IBAction func addPressed(_ sender: AnyObject) {
        self.updateScore(offset: 1)
    }
}
