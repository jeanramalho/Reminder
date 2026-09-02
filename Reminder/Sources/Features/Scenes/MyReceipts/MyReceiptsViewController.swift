//
//  MyReceiptsViewController.swift
//  Reminder
//
//  Created by Jean Ramalho on 18/08/26.
//
import Foundation
import UIKit

class MyReceiptsViewController: UIViewController {
    let contentView: MyReceiptsView
    weak var flowDelegate: MyReceiptsFlowDelegate?
    let viewModel = MyReceiptsViewModel()
    
    private var medicines: [Medicine] = []
        
    init(contentView: MyReceiptsView, flowDelegate: MyReceiptsFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
        loadData()
    }
    
    private func setup() {
        view.backgroundColor = Colors.gray600
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        
        view.addSubview(contentView)
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        setupContentViewToBounds(contentView: contentView)
    }
    
    private func setupTableView() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.register(RemedyCell.self, forCellReuseIdentifier: RemedyCell.identifier)
        contentView.tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
    
    private func loadData() {
       medicines = viewModel.fetchData()
    }
}

extension MyReceiptsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return medicines.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RemedyCell.identifier, for: indexPath) as? RemedyCell else {return UITableViewCell()}
        
        let medicamento = medicines[indexPath.section]
        
        cell.configureCell(title: medicamento.remedy,
                           time: medicamento.time,
                           recurrence: medicamento.recurrence)
        
        cell.onDelete = { [weak self] in
            guard let self = self else {return}
            if let actualIndexPath = tableView.indexPath(for: cell) {
                if actualIndexPath.section < self.medicines.count {
                   
                    self.viewModel.deleteReceipt(byId: self.medicines[actualIndexPath.section].id)
                    self.medicines.remove(at: actualIndexPath.row)
                    tableView.deleteSections(IndexSet(integer: actualIndexPath.section), with: .automatic)
                }
            } else {
                print("Erro ao excluir uma sessao invalida")
            }
                                  
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }
}

extension MyReceiptsViewController: MyReceiptsViewDelegate {
    func didTapBackButton() {
        flowDelegate?.popScreen()
    }
    
    func didTapAddButton() {
        flowDelegate?.goToNewReceipts()
    }
    
    
}
