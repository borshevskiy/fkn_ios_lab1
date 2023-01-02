//
//  ViewController.swift
//  fkn_ios_lab1
//
//  Created by Серж Банковский on 03.01.2023.
//  Copyright © 2023 Серж Банковский. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPage = 0
    var cells = [MarvelHero]()
    
    @IBOutlet weak var chooseHeroLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    private let layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawTriangle(color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
        setupViews()
        setHeroes(cells: MarvelHero.fetchHeroes())
    }
}

extension ViewController {
    
    private func setupViews() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.decelerationRate = .fast
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseId)
        collectionView.dataSource = self
        collectionView.delegate = self
        containerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height * 0.5, width: 200, height: 200)
        view.addSubview(containerView)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.collectionViewLayout = layout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20.0
        layout.minimumInteritemSpacing = 20.0
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: chooseHeroLabel.bottomAnchor, constant: 10),
            collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.7)
        ])
    }
    
    private func drawTriangle(color : CGColor) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: UIScreen.main.bounds.height * 0.5))
        path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
        path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height * 0.5))
        path.addLine(to: CGPoint(x: 0, y: UIScreen.main.bounds.height * 0.5))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = color
        shapeLayer.lineWidth = 3
        containerView.layer.addSublayer(shapeLayer)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func setHeroes(cells: [MarvelHero]) {
        self.cells = cells
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId, for: indexPath) as! CollectionViewCell
        cell.mainImageView.image = cells[indexPath.row].image
        cell.nameLabel.text = cells[indexPath.row].heroName
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 80, height: collectionView.frame.height * 0.8)
    }
}

extension ViewController {
    
    private func changeBackgroundColor() {
        if currentPage == 0 { drawTriangle(color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)) }
        if currentPage == 1 { drawTriangle(color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)) }
        if currentPage == 2 { drawTriangle(color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)) }
        if currentPage == 3 { drawTriangle(color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)) }
        if currentPage == 4 { drawTriangle(color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)) }
        if currentPage == 5 { drawTriangle(color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)) }
        if currentPage == 6 { drawTriangle(color: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)) }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let pageWidth = scrollView.frame.size.width
        currentPage = Int((scrollView.contentOffset.x + pageWidth) / pageWidth)
        if decelerate { changeBackgroundColor() }
    }
}

