//
//  ContentView.swift
//  LDSDirectory
//
//  Created by Carlos Bastida on 7/5/23.
//

import SwiftUI
import CoreData
import SDWebImageSwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State private var selectedIndividual: Individual?
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.individuals.indices, id: \.self) { index in
                    let individual = viewModel.individuals[index]
                    NavigationLink(value: individual) {
                        HStack {
                            /*
                            ProifleImage(urlString: individual.profilePicture ?? "")
                             */
                            WebImage(url: URL(string: individual.profilePicture ?? ""))
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100)
                            Text("\(individual.firstName ?? "") \(individual.lastName ?? "")")
                                .bold()
                                .accessibilityIdentifier("individualLink\(index)")
                            Spacer()
                            Image(individual.affiliation.rawValue)
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        .padding(3)
                    }
                    .listRowSeparatorTint(.black)
                    .listRowBackground(getColor(affiliation: individual.affiliation )).opacity(1)
                    
                }
            }
            
            .navigationTitle("Directory")
            .navigationDestination(for: Individual.self) { individual in
                DetailView(individual: individual)
            }
            .onAppear{
                viewModel.fetchDirectory(context: context)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

