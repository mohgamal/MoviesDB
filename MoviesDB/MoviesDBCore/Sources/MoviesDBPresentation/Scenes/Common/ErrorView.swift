//
//  File.swift
//  
//
//  Created by Mohammed Abdelaty on 12/05/2023.
//

import SwiftUI
import SDWebImageSwiftUI
import MoviesDBDomain

struct ErrorView: View {
    let error: String
    var reloadData : () -> ()

    init (reloadData: @escaping () -> (), error: String) {
        self.error = error
        self.reloadData = reloadData
    }

    var body: some View {
        AnimatedImage(name: "retry.gif", bundle: .module) // Animation control binding
            .maxBufferSize(.max)
            .padding()
        Text(error)
            .multilineTextAlignment(.center)
            .font(.system(size: 20, weight: .bold, design: .default))
            .padding()
        Text("An alien is probably blocking your signal")
            .multilineTextAlignment(.center)
            .font(.system(size: 14, weight: .light, design: .default))
            .padding()
        Button(action: { self.reloadData() })  {
            Text("Rery")
                .fontWeight(.semibold)
                .font(.headline)
                .foregroundColor(.green)
                .padding()
                .frame(maxWidth: .infinity)
                .border(Color.green)
                .cornerRadius(5)
                .padding()
        }
    }

}
