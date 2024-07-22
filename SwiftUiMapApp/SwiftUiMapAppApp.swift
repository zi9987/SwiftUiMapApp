//
//  SwiftUiMapAppApp.swift
//  SwiftUiMapApp
//
//  Created by 羅子淵 on 2024/7/16.
//

import SwiftUI

@main
struct SwiftUiMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()

    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
