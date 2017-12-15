//
//  AdapterClientViewController.swift
//  design-patterns
//
//  Created by Kenny Lin on 2017/12/1.
//  Copyright © 2017年 Kenny Lin. All rights reserved.
//

import UIKit

class AdapterClientViewController: UIViewController, UITableViewDataSource {
    
    private var tableView: UITableView!
    private var newsData: [NewsData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Adapter Pattern"
        loadData()
        initTabliView()
        registDefaultCell()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func loadData() {
        newsData.append(getNewsData(newsService: SportNews()))
        newsData.append(getNewsData(newsService: FashionNews()))
        newsData.append(getNewsData(newsService: VideoNews()))
    }
    
    private func getNewsData(newsService: NewsService) -> NewsData {
        newsService.loadNewsData()
        return newsService.parseNewsData()
    }
    
    private func initTabliView() {
        tableView = UITableView(frame: view.frame)
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    private func registDefaultCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = newsData[indexPath.row].title + " - " + newsData[indexPath.row].content
        return cell
    }
}
