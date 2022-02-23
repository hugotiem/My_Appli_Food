//
//  MapViewController.swift
//  ESGI-GO
//
//  Created by Benoit Briatte on 13/01/2022.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    class func newInstance(student: Student) -> MapViewController {
        let mvc = MapViewController()
        mvc.student = student
        return mvc
    }
    
    var locationManager: CLLocationManager = CLLocationManager()
    var student: Student!
    @IBOutlet var askUserLocationView: UIView!
    @IBOutlet var askUserLocationButton: UIButton!
    @IBOutlet var descriptionAskUserLocationLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
    var monsters: [MonsterAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.localization()
        self.locationManager.delegate = self
        checkAuthorization()
    }
    
    func localization() {
        self.descriptionAskUserLocationLabel.text = NSLocalizedString("controllers.map.ask_user_location.description", comment: "")
        self.askUserLocationButton.setTitle(NSLocalizedString("controllers.map.ask_user_location.button", comment: ""), for: .normal)
    }
    
    @IBAction func handleAskLocation() {
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func checkAuthorization() {
        if self.locationManager.authorizationStatus == .notDetermined {
            self.askUserLocationView.frame = self.view.bounds
            self.askUserLocationView.autoresizingMask = .init(rawValue: 0b111111)
            self.view.addSubview(self.askUserLocationView)
        } else if self.locationManager.authorizationStatus == .denied {
            self.deniedAuthorization()
        } else {
            self.mapView.delegate = self
        }
    }
    
    func deniedAuthorization() {
        print("denied")
        // Affichage au desssus la map d'une image d'erreur
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .denied {
            self.deniedAuthorization()
        } else if manager.authorizationStatus == .authorizedWhenInUse {
            self.askUserLocationView.removeFromSuperview()
            self.mapView.delegate = self
        }
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        self.mapView.setRegion(MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 2_000, longitudinalMeters: 2_000), animated: true)
        //if monsters.count == 0 {
        let monster = MonsterService.shared.randomMonster(level: self.student.level)
            let annotation = MonsterAnnotation(name: "Luc", level: 1, damage: 10, hp: 150, xp: 10)
        annotation.coordinate = userLocation.coordinate.randomCoordinate(range: -1000 ... 1000)
            self.monsters.append(annotation)
            self.mapView.addAnnotation(annotation)
      //  }
    }

}
