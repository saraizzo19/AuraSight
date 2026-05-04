//
//  ContainerView.swift
//  AuraSight_Sara_Izzo
//
//  Created by AFP LOR 035 on 04/05/2026.
//

import SwiftUI

struct ContainerView: View {
    var body: some View {
        
        TabView {
            Tab("Sites", systemImage: "person.fill") {
                SiteListView()
                
            }
           
        }
}

#Preview {
    ContainerView()
}
