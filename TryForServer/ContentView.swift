//
//  ContentView.swift
//  TryForServer
//
//  Created by Anatolich Mixaill on 06.07.2022.
//

import SwiftUI
import UIKit
import Foundation
struct ContentView: View {
//    @State private var UseJson=WorkWithJSONE()
    @State private var UseServer=WorkWithServer()
    @State private var firstName = "hi my friend"

    var body: some View {
        VStack{
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $firstName)
            Button("Get") {
//                UseServer.GETRequest()
                print("successful get request")
                Text(UseServer.GETRequest())
            }
            Button("Post") {
                UseServer.POSTRequest(StringToSend: firstName)
                print("successful post request")

            }
            Text("dfs")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
