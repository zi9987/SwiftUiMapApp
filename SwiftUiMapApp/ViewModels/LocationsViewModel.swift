//
//  LocationsViewModel.swift
//  SwiftUiMapApp
//
//  Created by 羅子淵 on 2024/7/16.
//

import Foundation
import SwiftUI
import MapKit
class LocationsViewModel:ObservableObject{
    //All loaded locations
    @Published var locations:[Location]
    
    
    //current location om map
    @Published var mapLocation:Location{
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    //Current region on map
    @Published var mapRegion:MKCoordinateRegion = MKCoordinateRegion()
    //Show list of locations
    @Published var showLocationsList:Bool = false
    
    //show location via sheet
  @Published var sheetLocation:Location? = nil

    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location:Location){
        mapRegion = MKCoordinateRegion(
            center: location.coordinates, span: mapSpan
        )
    }
     func togglelocationList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    func showNextLocation(location:Location){
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    func nextButtonpressed() {
        // Get the current index
        guard  let currentIndex = locations.firstIndex(where: {$0 == mapLocation})else{
            print("Could not find current index in location array")
            return
        }
            let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex)else{
            //Next index is Not valid
            //Restart from 0
            guard let firstLocation = locations.first else{return}
            showNextLocation(location: firstLocation)
            return
        }
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
            
                
            
        }
      
    }

