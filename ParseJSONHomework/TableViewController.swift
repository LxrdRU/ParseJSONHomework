//
//  TableViewController.swift
//  ParseJSONHomework
//
//  Created by Andrey Markov on 2020-10-12.
//

import UIKit

class TableViewController: UITableViewController {
    private var valutes:[Valute] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchValutes()
        

    }
//    override func viewWillLayoutSubviews() {
//        fetchValutes()
//        self.tableView.reloadData()
//    }


    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        valutes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath) as! ValuteCell

     let valute = valutes[indexPath.row]
     print(valutes)
     cell.configure(with: valute)

     return cell
    }

}
extension TableViewController {
func fetchValutes() {
    guard let url = URL(string: "https://www.cbr-xml-daily.ru/daily_json.js") else { return }

    URLSession.shared.dataTask(with: url) { (data, _, _) in
        guard let data = data else { return }
        let jsonDecoder = JSONDecoder()

        do {
            let initial = try? jsonDecoder.decode(Welcome.self, from: data)
            let v = initial?.Valute
            let d = v?.map{ $0.value }
            DispatchQueue.global().async {
                DispatchQueue.main.async { self.valutes = d!; self.tableView.reloadData()}
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }.resume()
    }
}

