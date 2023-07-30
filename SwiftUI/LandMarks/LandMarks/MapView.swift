//
//  MapView.swift
//  LandMarks
//
//  Created by Krithick Santhosh on 31/07/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    // You use the @State attribute to establish a source of truth for data in your app that you can modify from more than one view.
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    // when passing $ we pass a binding(reference), therefore when the value changes in region, the corresponding map coordinate is updated
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
