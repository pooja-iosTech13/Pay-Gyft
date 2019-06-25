//
//  ViewController.swift
//  Paygyft_simulation_test
//
//  Created by Singh, Pooja (US - Bengaluru) on 6/23/19.
//  Copyright © 2019 Singh, Pooja (US - Bengaluru). All rights reserved.
//

import UIKit
import ScrollableSegmentedControl

class ViewController: UIViewController {
    //IBOutlet
    @IBOutlet weak var segmentedControl: ScrollableSegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //variables
    var categories = [Categories]()
    var stores = [Store]()

    //MARK: View life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSegments()
    }
    
    func configSegmentedControlWith(categories: [Categories]) {
        
        segmentedControl.segmentStyle = .textOnly
        
        var i = 0
        for category in categories {
            let title = category.bcategory_name
            segmentedControl.insertSegment(withTitle: title, at: i)
            i += 1
        }
        
        segmentedControl.underlineSelected = true
        segmentedControl.addTarget(self, action: #selector(segmentSelected(sender:)), for: .valueChanged)
        segmentedControl.selectedSegmentContentColor = UIColor.darkText
        segmentedControl.fixedSegmentWidth = false
    }
    
    @objc func segmentSelected(sender:ScrollableSegmentedControl) {
        getCategoryData(selectedIndex: sender.selectedSegmentIndex)
    }
}

//MARK: Collection view data source methods
extension ViewController: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StoreCollectionViewCell
        let store = stores[indexPath.row]
        
        cell.imageView.downloaded(from: store.logo)
        cell.storeNameLabel.text = store.store_name
        cell.offerLabel.text = store.offer
    
        cell.containerView.layer.borderWidth = 2
        cell.containerView.layer.borderColor = UIColor.green.cgColor
        cell.containerView.layer.masksToBounds = true

        return cell
    }
}

//MARK: Collection view delegate source method
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.size.width - 10)/2, height: 220)
    }
}

    


