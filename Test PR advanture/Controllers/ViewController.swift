import UIKit
import Lottie

class ViewController: UIViewController {
    
    let item: [AnimationItem] = [AnimationItem(animationName: "Animation - 1697723344463") ]

    lazy var animationImage: LottieAnimationView = {
        let lottie = LottieAnimationView()
        return lottie
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = SnappyLayout()
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.register(SnappyCell.self, forCellWithReuseIdentifier: SnappyCell.reuseID)
      //  view.isPagingEnabled = true
        return view
    }()
    
    lazy var backgroundView: BlurBackView = {
        let view = BlurBackView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = .image3
        
        return view
    }()
    
    lazy var tableViewController: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(TableCell.self, forCellReuseIdentifier: "tableCell")
        return view
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Туры", "Гиды", "Новости"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
       // segmentedControl.selectedSegmentIndex = 1
        segmentedControl.contentMode = .scaleAspectFill
//        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .touchUpInside)
        segmentedControl.tintColor = .purple
        return segmentedControl
    }()
    
    
    
    var data: [UIImage] = [.ararat, .image3, .patagonia, .africa, .gimalai]
    
    var tableData = Tour.setTour()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableViewController.delegate = self
        tableViewController.dataSource = self
        
        tableViewController.estimatedRowHeight = 100
        tableViewController.rowHeight = UITableView.automaticDimension
        tableViewController.backgroundColor = .clear
        view.backgroundColor = .clear
        
        view.addSubview(backgroundView)
        view.addSubview(collectionView)
        view.addSubview(tableViewController)
        view.addSubview(segmentedControl)
       
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 400),
            
            tableViewController.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewController.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableViewController.topAnchor.constraint(equalTo:  collectionView.bottomAnchor, constant: 10),
            tableViewController.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            //  collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            segmentedControl.topAnchor.constraint(equalTo: collectionView.topAnchor, constant:  10),
            segmentedControl.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor)
        ])
    }
    //    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
    //        let indexPath = IndexPath(item: sender.selectedSegmentIndex, section: 0)
    //        collectionView.scrollToItem(at: indexPath, at: self.TourCollectionViewController, animated: true)
    //    }
//    @objc func segmentedControlValueChanged(sender: UISegmentedControl) {
//        if sender == segmentedControl {
//            let selectedSegmentIndex = segmentedControl.selectedSegmentIndex
//            
//            switch segmentedControl.selectedSegmentIndex {
//            case 0:
//                // Создать и отобразить UIViewController для "Туры"
//                let toursViewController = TourCollectionViewController()
//                    present(toursViewController, animated: true, completion: nil)
//                //navigationController?.pushViewController(toursViewController, animated: true)
//                
//                
//                //        case 1:
//                //            // Создать и отобразить UIViewController для "Даты Мероприятий"
//                //            let eventsViewController = EventsViewController()
//                //            present(eventsViewController, animated: true, completion: nil)
//                //
//                //        case 2:
//                //            // Создать и отобразить UIViewController для "Новости"
//                //            let newsViewController = NewsViewController()
//                //            present(newsViewController, animated: true, completion: nil)
//                //
//            default:
//                break
//            }
//        }
//        
//        
//    }
//    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
//        if sender.selectedSegmentIndex == 1 {
//            let toursViewController = TourCollectionViewController()
//            navigationController?.pushViewController(toursViewController, animated: true)
//        }
//    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SnappyCell.reuseID, for: indexPath) as! SnappyCell
        //   let item =
        cell.superImageView.image = data[indexPath.item]
        // cell.animationSetup(animationName: item.animationName)
        return cell
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableCell
        cell.tour = tableData[indexPath.row]
        
        return cell
    }
    
}

//    func animationSetup(animationName: String) {
//        collectionView.addSubview(lottieView)
//        lottieView.translatesAutoresizingMaskIntoConstraints = false
//        lottieView.animation = LottieAnimation.named(animationName)
//        lottieView.loopMode = .loop
//        lottieView.contentMode = .scaleAspectFit
//
//        // lottieView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//        lottieView.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
//        lottieView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30).isActive = true
//        lottieView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor).isActive = true
//        lottieView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor).isActive = true
//        lottieView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -90).isActive = true
//        lottieView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//
//        lottieView.play()
//    }


