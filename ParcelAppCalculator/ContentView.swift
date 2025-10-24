//
//  ContentView.swift
//  ParcelAppCalculator
//
//  Created by Mechelle De Los Angeles on 22/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var width: String = ""
    @State private var depth: String = ""
    @State private var length: String = ""
    @State private var cost: String = ""
    
    var isDisabled:Bool {
        weight.isEmpty || width.isEmpty || length.isEmpty || height.isEmpty
    }
    
    private func calculateCost(){}
    
    
    var body: some View {
        
        VStack(spacing: 20){
            Text("Parcel App Calculator")
                .font(.title)
                .padding(10)
            
            HStack(alignment: .center , spacing: 10) {
                Label("Weight (kg):", systemImage: "")
                    .labelStyle(.titleOnly)
                    .frame(width:120, alignment: .trailing)
                
                TextField("Enter Weight", text:$weight)
                    .border(Color.black,width:2)
                    .keyboardType(.decimalPad)
                
                
            }
            
            
            HStack(alignment: .center, spacing: 10){
                Label("Height(cm):", systemImage: "")
                    .labelStyle(.titleOnly)
                    .frame(width:120, alignment: .trailing)
                
                TextField("Enter Height", text: $height)
                    .border(Color.black, width:2)
                    .keyboardType(.decimalPad)
            }
            
            
            HStack(alignment: .center, spacing: 10){
                Label("Width(cm):", systemImage: "")
                    .labelStyle(.titleOnly)
                    .frame(width:120, alignment: .trailing)
                
                TextField("Enter Width", text: $width)
                    .border(Color.black, width:2)
                    .keyboardType(.decimalPad)
            }
            
            HStack(alignment: .center, spacing:10){
                Label("Depth(cm):", systemImage: "")
                    .labelStyle(.titleOnly)
                    .frame(width:120, alignment: .trailing)
                
                TextField("Enter Depth", text: $depth)
                    .border(Color.black, width:2)
                    .keyboardType(.decimalPad)
                
                
                
            }
            
        
        Button("Calculate Cost") {
            calculateCost()
        }
        .disabled(isDisabled)
            .padding()
            .background(isDisabled ? Color.gray : Color.blue)
            .buttonStyle(.borderedProminent)
           
            .frame(maxWidth: .infinity, alignment:.trailing)
            
    }
        .padding()
        
        
      
        
        
        
        
        
        
        
        
}
        
    
           
    }


#Preview {
    ContentView()
}
