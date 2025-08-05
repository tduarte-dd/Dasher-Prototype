//
//  ContentView.swift
//  Prototype Boilerplate
//
//  Created by Thiago Duarte on 7/17/25.
//

import SwiftUI
import MapboxMaps

struct ContentView: View {
    @StateObject private var locationManager = LocationPermissionManager()
    @State private var showBottomSheet = true
    
    var body: some View {
        ZStack {
            MapConfiguration.createMapView()
        }
        .onAppear {
            print("View loaded")
            locationManager.requestLocationPermission()
        }
        .sheet(isPresented: $showBottomSheet) {
            DashBottomSheet()
                .presentationDetents([.height(200)])
                .presentationDragIndicator(.visible)
                .presentationBackgroundInteraction(.enabled)
                .interactiveDismissDisabled(true)
        }
    }
}

struct DashBottomSheet: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Happy Prototyping!")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            Button(action: {
                // Button action will go here
                print("Button tapped")
            }) {
                Text("Button")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
            }
            .padding(.horizontal, 20)
            .buttonStyle(.glassProminent)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContentView()
}
