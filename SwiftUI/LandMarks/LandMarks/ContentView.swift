//
//  ContentView.swift
//  LandMarks
//
//  Created by Krithick Santhosh on 06/07/23.
//

import SwiftUI

// By default SwiftUI view files declare two structs

// 1: View confirming 2: Preview confirming

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hey, this is Krithick")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
