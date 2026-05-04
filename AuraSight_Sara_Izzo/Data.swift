//
//  Data.swift
//  AuraSight_Sara_Izzo
//
//  Created by AFP LOR 035 on 04/05/2026.
//

import SwiftUI

@Observable
class SharedData {
    
    var sites: [Site] = [
        Site(name: "Avella's Castle", description: "Medieval fortress", image: "noimage"),
        
        Site(name: "Frigento's civic and archaeological museum", description: "Archeological treasures", image: "noimage"),
    
        Site(name: "Santa Maria delle Grazie's church", description: "Sacred baroque art", image: "noimage"),
        
        Site(name: "Gesualdo's castle", description: "Reinassance court", image: "noimage")
        
    ]
    
    
}
var sharedData = SharedData()
