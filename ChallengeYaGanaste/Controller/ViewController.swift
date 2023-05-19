//
//  ViewController.swift
//  ChallengeYaGanaste
//
//  Created by Fernando Maximiliano on 18/05/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var apiClient = ApiClient()
    var dataList = [BankObject]()
    var dataListEntity = [BankEntity]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        tableView.dataSource = self
        tableView.register(BankTableViewCell.self, forCellReuseIdentifier: "BankTableViewCell")
    
        tableView.rowHeight = 120
        tableView.allowsSelection = false

        loadBanks()
    }
    
    func saveBanks(){
        do{
            print("guardamos el contexto")
            try context.save()
        }catch{
            print("Error al guardar el contexto \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadBanks(){
        let request : NSFetchRequest<BankEntity> = BankEntity.fetchRequest()
        do{
            dataListEntity = try context.fetch(request)
            if dataListEntity.isEmpty{
                print("Consultamos la API")
                Task {
                    dataList = await apiClient.getListOfBanks()
                    print(dataList)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    //AppDelegate
                    for data in dataList {
                        let bank = BankEntity(context: self.context)
                        bank.name = "Desde CoreData"//"data.bankName"
                        bank.age = Int16(data.age)
                        bank.desc = data.description
                        bank.link = data.url
                        dataListEntity.append(bank)
                    }
                    saveBanks()
                }
            }else{
                print("Obtenemos la informacion de CoreData")
                for data in dataListEntity {
                    let bank = BankObject(bankName: data.name ?? "", description: data.desc ?? "", age: Int(data.age), url: data.link ?? "")
                    dataList.append(bank)
                }
                self.tableView.reloadData()
                
            }
        }catch{
            print("Error al cargar el la informacion  \(error)")
        }
     
    }
    

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BankTableViewCell", for: indexPath) as! BankTableViewCell
        let bank = dataList[indexPath.row]
        cell.configure(bank)
        return cell
    }
}

