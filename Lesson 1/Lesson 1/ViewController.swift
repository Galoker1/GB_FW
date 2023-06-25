//
//  ViewController.swift
//  Lesson1
//
//  Created by Егор  Хлямов on 18.06.2023.
//

import UIKit
import GoogleMaps
class ViewController: UIViewController{
    

    @IBOutlet weak var mapView: GMSMapView!
    var locationManager: CLLocationManager?
    let coordinates = CLLocationCoordinate2D(latitude: 37.34033264, longitude: -122.068926321)
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap()
        configureLocationManager()
    }
    
    private func configureLocationManager(){
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.allowsBackgroundLocationUpdates = true
        locationManager?.startUpdatingLocation()

    }
    private func configureMap(){
        let camera = GMSCameraPosition(target: coordinates, zoom: 15)
        mapView.camera = camera
        
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        
    }
    private func addMarker(location: CLLocation){
        let marker  = GMSMarker(position: location.coordinate)
        let markerImage = UIImage(systemName: "circle.fill")?.withRenderingMode(.alwaysTemplate)
        let markerView = UIImageView(image: markerImage )
        markerView.tintColor = .purple
        marker.iconView = markerView
        marker.map = mapView
    }
    
}
extension ViewController: GMSMapViewDelegate{
    
}
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let position = GMSCameraPosition(target: location.coordinate, zoom: 15)
        mapView.animate(to: position)
        addMarker(location:location)
    }
    
}


