//
//  MovieListView.swift
//  Wrist Movies WatchKit Extension
//
//  Created by Narcis Zait on 09/03/2020.
//  Copyright © 2020 Narcis Zait. All rights reserved.
//

import SwiftUI
import Combine
import KingfisherSwiftUI

struct MovieListView: View {
    @ObservedObject var ​movieListVM = MovieListViewModel()
    @State var scrollAmount = 0.5
    
    init() {
        self.​movieListVM.fetchAllNewMovies()
    }
    
    var body: some View {
        List(​movieListVM.movies, id:\.title) { movie in
            HStack {
                KFImage(URL(string: movie.poster)!)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(width: 80, height: 80)
                
                Spacer()
                
                VStack {
                    Text(movie.title)
                        .minimumScaleFactor(0.5)
                }
                
                Spacer()
            }.frame(height: 100)
        }.listStyle(CarouselListStyle())
        .focusable(true)
        .digitalCrownRotation($scrollAmount, from: 0, through: 5, by: 0.1, sensitivity: .low, isContinuous: true, isHapticFeedbackEnabled: true)
        .onAppear {
            print(self.​movieListVM.movies.count)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
