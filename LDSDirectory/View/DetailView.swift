//
//  DetailView.swift
//  LDSDirectory
//
//  Created by Carlos Bastida on 7/5/23.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    let individual: Individual
    @State private var gradientColor : Color = .white
    @State private var forceSide : String = ""
    @State private var animateTheForce: Bool = false
    @State private var animateTheForceColor: Bool = false
    @State private var forceText: String = "A long time ago in a galaxy far, far away..."
    @State private var shouldDisplayTheForce : Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                .accessibilityIdentifier("backButton")
                .font(.system(size: 40, weight: .medium, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                .padding(.vertical, 76)
                .foregroundColor(.white)
                Spacer()
                VStack(alignment: .leading, spacing: 11) {
                    Text("\(individual.firstName ?? "") \(individual.lastName ?? "")")
                        .font(.system(size: 34, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                    if let formattedDate = formatDate(dateString: individual.birthdate ?? "") {
                        Text("Birth Date: \(formattedDate)")
                            .font(.system(.headline, weight: .medium))
                            .foregroundColor(.white)
                    }
                    
                    Text("Affiliation: \(individual.affiliation.rawValue)")
                        .font(.system(.headline, design: .serif))
                        .padding(.vertical, 12)
                        .padding(.horizontal, 15)
                        .background(.white)
                        .foregroundColor(.black)
                        .mask { RoundedRectangle(cornerRadius: 12, style: .continuous) }
                        .padding(.top, 8)
                }
                .padding(.horizontal, 24)
                Spacer()
                    .frame(height: 100)
                    .clipped()
            }
            .background {
                WebImage(url: URL(string: individual.profilePicture ?? ""))
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                LinearGradient(
                    colors: [.black, gradientColor],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                .opacity(0.5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
            .navigationBarHidden(true)
            .ignoresSafeArea()
        if shouldDisplayTheForce {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(forceText)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .foregroundColor(animateTheForceColor ? .yellow : .cyan)
                        .offset(y: animateTheForce ? -600 : 0)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 5.0)) {
                                animateTheForceColor = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                withAnimation(.easeInOut(duration: 1.0)){
                                    forceText = "The \(forceSide) of the force was strong with \("\(individual.firstName ?? "") \(individual.lastName ?? "")")"
                                }
                                withAnimation(.easeInOut(duration: 8.0)) {
                                    animateTheForce = true
                                }
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                                shouldDisplayTheForce = false
                            }
                        }
                    Spacer()
                }
                Spacer()
            }
            .background(Color(.black))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
        }
        .onAppear {
            shouldDisplayTheForce = individual.isForceSensitive
            forceSide = getForceType(affiliation: individual.affiliation)
            gradientColor = getColor(affiliation: individual.affiliation)
        }
    }
}
