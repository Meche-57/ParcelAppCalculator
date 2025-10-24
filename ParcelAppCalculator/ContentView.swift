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
    @State private var cost: String = ""
    
    var isDisabled: Bool {
        weight.isEmpty || width.isEmpty || height.isEmpty || depth.isEmpty
    }
    
    private func calculateCost(){
        
        print("parcel Data: \(weight), \(height), \(width), \(depth)")
        
        if let weightValue = Double(weight),
           let heightValue = Double(height),
           let widthValue = Double(width),
           let depthValue = Double(depth),
           weightValue > 0, heightValue > 0, depthValue > 0, widthValue > 0{
            
            let volume = depthValue * heightValue * widthValue
            var totalCost = 3.00 //base cost
            
            // weight charge
            
            totalCost += weightValue * 0.50
            
            //volume charge
            
            totalCost += (volume / 1000) * 0.10
            
            // secure the minimal
            
            totalCost = max(totalCost, 4.00)
            cost = String(format: "%.2f", totalCost)
            
            print("£"+cost)
            
        }else{
            cost = "Error: Please enter valid numeric amount"
        }
           
        
    }
    
    
    var body: some View {
        
        VStack(spacing: 20){
            Text("Parcel App Calculator 📦")
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
                Label("Width (cm):", systemImage: "")
                    .labelStyle(.titleOnly)
                    .frame(width:120, alignment: .trailing)
                
                TextField("Enter Width", text: $width)
                    .border(Color.black, width:2)
                    .keyboardType(.decimalPad)
            }
            
            HStack(alignment: .center, spacing:10){
                Label("Depth (cm):", systemImage: "")
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
            .foregroundColor(.white)
            .cornerRadius(8)
            .frame(maxWidth: .infinity, alignment:.trailing)
            
            
            
            if !cost.isEmpty{
                if let costValue = Double(cost), costValue > 0.00 {
                    Text("Total cost is £\(cost)")
                    .foregroundColor(.green)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    
                    
                } else {
                    Text(cost)
                        .foregroundColor(.red)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
           
            
    }
        .padding()
        
        
      
        
        
        
        
        
        
        
        
}
        
    
           
    }


#Preview {
    ContentView()
}
