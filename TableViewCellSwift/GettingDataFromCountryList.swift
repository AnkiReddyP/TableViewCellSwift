//
//  GettingDataFromCountryList.swift
//  TableViewCellSwift
//
//  Created by anki on 4/16/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class GettingDataFromCountryList: UIViewController, UITableViewDataSource, UISearchBarDelegate, UITableViewDelegate {
    
    var dataArray = [JsonData]()
     var data = [JsonData]()
    
    @IBOutlet weak var countyTableView: UITableView!
    var fetchedCountry = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // calling methods
        parseData()
        searchBar()
        fetchData()
        
        // calling delegate and dataSource
        countyTableView.dataSource = self
        countyTableView.delegate = self
        
        // automaticallyAdjustsScrollViewInsets
        self.automaticallyAdjustsScrollViewInsets = false
        
        countyTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    func searchBar() {
    
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        searchBar.delegate = self
        searchBar.showsScopeBar = true
        searchBar.tintColor = UIColor.lightGray
        searchBar.scopeButtonTitles = ["Country", "Capital"]
        self.countyTableView.tableHeaderView = searchBar
    
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            parseData()
        }
        else {
            if searchBar.selectedScopeButtonIndex == 0 {
                fetchedCountry = fetchedCountry.filter({ (country) -> Bool in
                    return country.country.lowercased().contains(searchText.lowercased())
                })
            }
            else {
                fetchedCountry = fetchedCountry.filter({ (country) -> Bool in
                    return country.capital.lowercased().contains(searchText.lowercased())
                })
            }
        }
        self.countyTableView.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return fetchedCountry.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = countyTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fetchedCountry[indexPath.row].country
        cell.detailTextLabel?.text = fetchedCountry[indexPath.row].capital
        
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parseData() {
        
        fetchedCountry = []
        
        let url = "http://restcountries.eu/rest/v1/all"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if (error != nil) {
                print("Error")
            }
            else{
                do {
                    let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                    print("fetch request data is :\(fetchedData)")
                    for eachFetchedCountry in fetchedData {
                        let eachCountry = eachFetchedCountry as![String: Any]
                        let country = eachCountry["name"] as! String
                        let capital = eachCountry["capital"] as! String
                        
                        self.fetchedCountry.append(Country(country: country, capital: capital))
                        
                    }
                    
                    self.countyTableView.reloadData()
                    
                    print(self.fetchedCountry)
                }
                catch {
                    print("Error 2")
                }
            }
        }
        task.resume()
    }
    
    class Country{
        var country = String()
        var capital = String()
        
        init(country: String, capital: String) {
            self.country = country
            self.capital = capital
        }
    }
    
    func insertData()
    {
        
        let jsonObjs = JsonData(context: context)
        print("json data is : \(jsonObjs)")
        
        appDelegate.saveContext()
        
    }
    
    func fetchData()
    {
        
        do{
            data = try context.fetch(JsonData.fetchRequest())
            
            for json: JsonData in data
            {
                dataArray.append(json)
            }
        }
        catch
        {
            print("Handle error")
        }
        countyTableView.reloadData()
    }

    
    
}





