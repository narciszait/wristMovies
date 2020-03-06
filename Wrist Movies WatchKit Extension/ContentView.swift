//
//  ContentView.swift
//  Wrist Movies WatchKit Extension
//
//  Created by Narcis Zait on 04/03/2020.
//  Copyright © 2020 Narcis Zait. All rights reserved.
//

import SwiftUI

var array: [Int] = [1, 2, 3, 4, 5, 6, 7]

struct ContentView: View {
    @State var scrollAmount = 0.5
    
    var body: some View {
        List {
            ForEach(array, id: \.self) {number in
                Text(String(number))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .padding(.all, 40.0)
            }
        }
        .listStyle(CarouselListStyle())
        .focusable(true)
        .digitalCrownRotation($scrollAmount, from: 0, through: 5, by: 0.1, sensitivity: .low, isContinuous: true, isHapticFeedbackEnabled: true)
        .onAppear {
//            let movieModel = MovieListViewModel()
//            movieModel.fetchAllNewMovies()
//            print(movieModel.movies)
//            print("---- \( movieModel.fetchAllNewMovies())")
//            NetworkManager().getNewestMoviews { (result) in
//                       DispatchQueue.main.async {
//                           switch result {
//                           case .success(let movies):
//                               print(movies)
//                           case .failure(let error):
//                            print(error.localizedDescription)
//                           }
//                       }
//            }
            print("hello")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
