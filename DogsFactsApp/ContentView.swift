//
//  ContentView.swift
//  DogsFactsApp
//
//  Created by Kaukab Farrukh on 2024-11-25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var networkManager = NetworkManager()
    
    
    var body: some View {
        VStack {
            Text("Random Dog Fact")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text(networkManager.dogFact)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {
                networkManager.fetchDogFact()
            }) {
                Text("Get Another Fact")
                    .font(.title3)
                    .foregroundColor(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .onAppear {
            networkManager.fetchDogFact()
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
