//
//  MapView.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/05.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject private var viewModel: MapViewModel
    @State private var showFabAnimation = false
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion,
                showsUserLocation: true, annotationItems: viewModel.places,
                annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    PinView(category: location.category)
                        .scaleEffect(viewModel.selectedPlace == location ? 1 : 0.75)
                        .onTapGesture {
                            viewModel.updateSelectedPlace(place: location)
                        }
                }
            })
            .ignoresSafeArea()
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
            }
            
            fabButton
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(MapViewModel())
    }
}

extension MapView {
    private var fabButton: some View {
        VStack {
            Spacer()
            ZStack {
                HStack {
                    Spacer()
                    Image("ic-cafe-circle", label: Text("Cafe Pins"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 52, height: 52)
                        .offset(x: showFabAnimation ? -(49.5+26) : 0,
                                y: showFabAnimation ? (17+26) : 0)
                        .rotationEffect(.degrees(showFabAnimation ? 0 : 90))
                        .animation(.easeInOut(duration: 0.5), value: showFabAnimation)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Image("ic-drink-circle", label: Text("Drink Pins"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 52, height: 52)
                        .offset(x: showFabAnimation ? -(65.5+26) : 0,
                                y: showFabAnimation ? -(1+26) : 0)
                        .rotationEffect(.degrees(showFabAnimation ? 0 : 90))
                        .animation(.easeInOut(duration: 0.5), value: showFabAnimation)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Image("ic-food-circle", label: Text("Food Pins"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 52, height: 52)
                        .offset(x: showFabAnimation ? -(15.5+26) : 0,
                                y: showFabAnimation ? -(61+26) : 0)
                        .rotationEffect(.degrees(showFabAnimation ? 0 : 90))
                        .animation(.easeInOut(duration: 0.5), value: showFabAnimation)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Image("ic-culture-circle", label: Text("Culture Pins"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 52, height: 52)
                        .offset(x: showFabAnimation ? (15.5+26) : 0,
                                y: showFabAnimation ? -(61+26) : 0)
                        .rotationEffect(.degrees(showFabAnimation ? 0 : 90))
                        .animation(.easeInOut(duration: 0.5), value: showFabAnimation)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Image("ic-etc-circle", label: Text("ETC Pins"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 52, height: 52)
                        .offset(x: showFabAnimation ? (65.5+26) : 0,
                                y: showFabAnimation ? -(1+26) : 0)
                        .rotationEffect(.degrees(showFabAnimation ? 0 : 90))
                        .animation(.easeInOut(duration: 0.5), value: showFabAnimation)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Image("ic-cancel-circle", label: Text("Cancel"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 52, height: 52)
                        .offset(x: showFabAnimation ? (49.5+26) : 0,
                                y: showFabAnimation ? (17+26) : 0)
                        .rotationEffect(.degrees(showFabAnimation ? 0 : 90))
                        .animation(.easeInOut(duration: 0.5), value: showFabAnimation)
                        .onTapGesture {
                            self.showFabAnimation.toggle()
                            HapticManager.shared.notification(type: .success)
                        }
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        self.showFabAnimation.toggle()
                        HapticManager.shared.notification(type: .success)
                    } label: {
                        HeartView()
                            .frame(width: 92, height: 92)
                    }
                    .buttonStyle(ScalableButtonStyle())
                    Spacer()
                }
            }
            .padding(.bottom, 31)
        }
    }
}
