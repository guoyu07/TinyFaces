//
//  SeedController.swift
//  MarvelFaces
//
//  Created by Maxime De Greve on 09/01/2017.
//
//

import Vapor
import Foundation
import HTTP

final class SeedController {
    
    func addRoutes(drop: Droplet) {
        drop.get("seed", handler: seed)
    }
    
    func seed(request: Request) throws -> ResponseRepresentable {

        try background {
            FirstName.seed()
            LastName.seed()
        }
        
        return Response(status: .ok, body: "Seeding started (Check the server logs to double check nothing fails)")
        
    }
}
