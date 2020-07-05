//
//  ViewController.swift
//  TIMHackaton
//
//  Created by Giovanni Erpete on 04/07/2020.
//  Copyright © 2020 Giovanni Erpete. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var managerPisition : CLLocationManager!
    var userPosition : CLLocationCoordinate2D!
    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.myMapView.delegate = self
        self.managerPisition = CLLocationManager()
        self.managerPisition.delegate = self
        self.managerPisition.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.managerPisition.requestWhenInUseAuthorization()
        self.managerPisition.startUpdatingLocation()
        
        let request = MKLocalSearch.Request()
        request.pointOfInterestFilter = MKPointOfInterestFilter(including: .init(arrayLiteral: .cafe))
        request.region = MKCoordinateRegion(center: managerPisition.location!.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        let search = MKLocalSearch(request: request)
        search.start { (results, error) in
            
            let mapItems = results?.mapItems
            
            for elem in mapItems! {
                print("[ELEM] name: \(elem)")
//                devi aggiungere i poi alla mappa
    
                
            }
            
        }
        
        
        
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        self.userPosition = userLocation.coordinate
        print("[MapView - didUpdate]: posizione aggiornata: lat: \(self.userPosition.latitude) long: \(self.userPosition.longitude)")
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        let region = MKCoordinateRegion (center: self.userPosition, span: span)
        
        mapView.setRegion(region, animated: true)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) ->MKAnnotationView? {
        
        guard annotation is MKPointAnnotation else {return nil}
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if(annotationView == nil) {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
            
        } else {
            
            annotationView!.annotation = annotation
            
        }
        
        return annotationView
        
    }
    
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        print("[MapView - regionDidChane] lat: \(mapView.centerCoordinate.latitude) long: \(mapView.centerCoordinate.longitude)")
        
    }


}

