//
//  Models.swift
//  AuraSight_Sara_Izzo
//
//  Created by AFP LOR 035 on 04/05/2026.
//

import SwiftUI

struct Site: Identifiable{
    
    var id: UUID = UUID();
    var name: String;
    var description: String = "No description available";
    var image: String = "noimage";
    
}
