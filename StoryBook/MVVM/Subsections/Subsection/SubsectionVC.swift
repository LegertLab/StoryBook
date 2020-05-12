import UIKit
import Firebase


class SubsectionVC: UITableViewController {
    
    var viewModel: SubsectionViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel?.subsection.title
        
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.observeQuery { [weak self] (memories) in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        return viewModel.memories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MemoryCell
        
        let memory = viewModel.memories[indexPath.row]
        let configurator = MemoryCellConfigurator(cell: cell, memory: memory)
        return configurator.cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let viewModel = viewModel else {
            fatalError()
        }
        let memoryIndex = indexPath.row
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view, boolValue) in
        viewModel.deleteMemory(by: memoryIndex)
        tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        let editAction = UIContextualAction(style: .normal, title: "Изменить", handler: {
            (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            viewModel.routeToEditMemory(by: memoryIndex)
            success(true)
        })
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        return swipeActions
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else {
            fatalError()
        }
        let memoryIndex = indexPath.row
        viewModel.routeToDetailMemory(by: memoryIndex)
    }
    
    @IBAction func AddTappedButton(_ sender: UIBarButtonItem) {
        viewModel?.routeToAddNewMemory()
    }
    
}
