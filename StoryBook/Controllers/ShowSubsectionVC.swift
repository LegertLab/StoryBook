import UIKit
import Firebase


class ShowSubsectionVC: UITableViewController {

    let db = Firestore.firestore()
    var pathToPreviousItem = ""
    var pathToDataBase = ""
    var itemOfList = Section(title: "", documentID: "")
    var currentList: [Memory] = []
    var listener: ListenerRegistration?
    var query: Query?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = itemOfList.title
        
        pathToDataBase = getPathToDataBase()
        query = baseQuery()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        observeQuery()
    }
    
    func getPathToDataBase() -> String {
        return "\(pathToPreviousItem)/\(itemOfList.documentID)/memories"
       
    }
    
    func baseQuery() -> Query {
        return db.collection(pathToDataBase)
     }

    func observeQuery() {
      guard let query = query else { return }
      listener = query.addSnapshotListener { (snapshot, error) in
        guard let snapshot = snapshot else { return }
        let models = snapshot.documents.map { (document) -> Memory in
            if let model = Memory(dictionary: document.data(), documentID: document.documentID) {
            return model
          } else {
            //Don't use fatalError here in a real app.
        fatalError("Unable to initialize type \(Memory.self) with dictionary \(document.data())")
        }
        }
        self.currentList = models
        self.tableView.reloadData()
      }

    }
    

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MemoryTableViewCell

        let itemOfList = currentList[indexPath.row]
        cell.memoryImage.image = UIImage(named: "memory")
        cell.titleLabel.text = itemOfList.title
        cell.memoryImage.layer.cornerRadius = cell.memoryImage.frame.size.height / 2
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    
        override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let itemOfList = currentList[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view, boolValue) in
        let deletedDocID = itemOfList.documentID
           
        self.db.document("\(self.pathToDataBase)/\(deletedDocID)").delete()
        self.currentList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        }
           
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])

        return swipeActions
    }
    
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMore" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let showMoreVC = segue.destination as! ShowMemoryVC
                showMoreVC.itemOfList = currentList[indexPath.row]
                showMoreVC.pathToPreviousItem = pathToDataBase
            }
        }
    }
}
