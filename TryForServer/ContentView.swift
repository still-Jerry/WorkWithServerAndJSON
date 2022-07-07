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
    @State private var LableText = WorkWithServer.req
    @State var textToUpdate = "Update me!"
    var body: some View {
        var net = ""
        VStack{
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $firstName)
            
            Button("Get") {
               
                net = UseServer.GETRequest()
                self.LableText=net
                print("successful get request")
                print(net)
            }
            Button("Post") {
                UseServer.POSTRequest(StringToSend: firstName)
                print("successful post request")

            }
            Text(LableText)
           
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
