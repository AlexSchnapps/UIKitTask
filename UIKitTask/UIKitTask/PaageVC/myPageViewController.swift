//
//  myPageViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 12.03.2023.
//

import UIKit

class myPageViewController: UIPageViewController {
    
    //MARK: - varibale, used #imageLiteral
    var cars = [CarsHelper]()
    let landRover = #imageLiteral(resourceName: "LandRoverDefender")
    let rangeRover = #imageLiteral(resourceName: "RangeRover")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cars"
        
        let firstCar = CarsHelper(name: "Car - Land Rover Defender", image: landRover)
        let secondCar = CarsHelper(name: "Car - Range Rover", image: rangeRover)
        
        cars.append(firstCar)
        cars.append(secondCar)
        
    }
    
    //MARK: - create VC
    lazy var arrayCarVC: [CarViewController] = {
        var carsVC = [CarViewController]()
        for car in cars {
            carsVC.append(CarViewController(carWith: car))
        }
        return carsVC
    }()
    
    //MARK: - init UIPageViewController
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        //transitionStyle: .scroll - прокрутка, pageCurl - перелистование
        super.init(transitionStyle: .pageCurl, navigationOrientation: navigationOrientation)
        self.view.backgroundColor = .green
        self.dataSource = self
        self.delegate = self
        setViewControllers([arrayCarVC[0]], direction: .forward, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extention myPageViewController
extension myPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else {return nil}
        if let index = arrayCarVC.firstIndex(of: viewController){
            if index > 0 {
                return arrayCarVC[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard viewController is CarViewController
        else {return nil}
        if let index = arrayCarVC.firstIndex(of: viewController as! CarViewController){
            if index < cars.count - 1 {
               return arrayCarVC[index + 1]
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return cars.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
