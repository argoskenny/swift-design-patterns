//
//  DesignPatternsTableViewController.swift
//  design-patterns
//
//  Created by Kenny Lin on 2017/12/1.
//  Copyright © 2017年 Kenny Lin. All rights reserved.
//

import UIKit

class DesignPatternsTableViewController: UITableViewController {
    
    private struct Patterns {
        var name: String
        var controller: UIViewController
    }
    
    private let patternData: [Patterns] = [Patterns(name: "Adapter", controller: AdapterClientViewController()),
                                           Patterns(name: "Composite", controller: CompositeClientViewController()),
                                           Patterns(name: "Decorator", controller: DecoratorClientViewController()),
                                           Patterns(name: "Factory", controller: FactoryClientViewController()),
                                           Patterns(name: "Strategy", controller: StrategyClientViewController()),
                                           Patterns(name: "Template", controller: TemplateClientViewController())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBackground()
        registDefaultCell()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func initBackground() {
        view.backgroundColor = UIColor.white
    }
    
    private func registDefaultCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patternData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = patternData[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(patternData[indexPath.row].controller, animated: true)
    }

}
