//
//  ViewController.swift
//  ForExample
//
//  Created by Руслан Штыбаев on 05.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel: ViewModelProtocol!
    
    var collectionView: UICollectionView!
    
    let headerID = "Header"
    static let categoryHeaderID = "CathegoryHeader"

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        setupCollectionView()
    }

    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        
        collectionView.register(UINib(nibName: "SectionOne", bundle: nil), forCellWithReuseIdentifier: "sectionOne")
        
        collectionView.register(UINib(nibName: "SectionTwoButton", bundle: nil), forCellWithReuseIdentifier: "sectionTwoButton")
        collectionView.register(UINib(nibName: "SectionTwo", bundle: nil), forCellWithReuseIdentifier: "sectionTwo")
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
        
        collectionView.register(HeaderForPeople.self, forSupplementaryViewOfKind: ViewController.categoryHeaderID, withReuseIdentifier: headerID )
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension ViewController {
    
    private func createLayout() -> UICollectionViewLayout {
        // section -> groups -> items -> size
        return UICollectionViewCompositionalLayout{ (sectionNumber, env) -> NSCollectionLayoutSection in
            
            
            if sectionNumber == 0 {
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                item.contentInsets = NSDirectionalEdgeInsets(
                    top: 10,
                    leading: 5,
                    bottom: 5,
                    trailing: 5)
                
                item.contentInsets.trailing = 25
                item.contentInsets.leading = 25
                item.contentInsets.bottom = 28
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(150))
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.orthogonalScrollingBehavior = .paging
                return section
                
            } else if sectionNumber == 1 {
                
                let inset: CGFloat = 5
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(110),
                    heightDimension: .absolute(130))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .estimated(1),
                    heightDimension: .estimated(1))
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [item])
                
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.contentInsets.leading = 10
                section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: ViewController.categoryHeaderID, alignment: .topLeading)]
                section.orthogonalScrollingBehavior = .continuous
                return section
            } else {
                
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.25),
                    heightDimension: .absolute(100))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                item.contentInsets.trailing = 28
                item.contentInsets.bottom = 28
                
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(500))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                group.contentInsets.leading = 25
  
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = .init()
                section.contentInsets.top = 50
                return section
            }
            
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath)
        return header
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return viewModel.contacts.count + 1
        } else {
            return 8
        }
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sectionOne", for: indexPath) as! SectoinOneCell
            cell.moneyCountLabel.text = viewModel.currentBalance
        
            return cell
            
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sectionTwoButton", for: indexPath) as! SectionTwoButtonCell
                return cell
            } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sectionTwo", for: indexPath) as! SectionTwoCell
            
            let contact = viewModel.contacts[indexPath.row - 1]
            
            cell.configuration(contact: contact)
            
            return cell
            }
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .green
            
            
            return cell
        }
        
    }
    
    
}

// MARK: - SwiftUI

import SwiftUI

struct FlowProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let mainView = ViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<FlowProvider.ContainerView>) -> ViewController {return mainView}
        
    func updateUIViewController(_ uiViewController: FlowProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<FlowProvider.ContainerView>) {}
    }
}

