//
//  ContentView.swift
//  SwiftUI_Task_7
//
//  Created by pavel mishanin on 19/3/24.
//

import SwiftUI

struct ContentView: View {
    
    private let id = "matchedGeometryEffect"
    
    @Namespace private var namespace
    
    @State private var isExpanded = false
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 10)
            .fill(.blue)
            .frame(maxWidth: isExpanded ? 300 : 100, maxHeight: isExpanded ? 450 : 50)
            .overlay {
                if isExpanded {
                    Button {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    } label: {
                        Label("Back", systemImage: "arrowshape.backward.fill")
                            .font(.system(size: 19, weight: .bold))
                    }
                    .frame(maxWidth: 100)
                    .foregroundColor(.white)
                    .padding()
                    .matchedGeometryEffect(id: id, in: namespace)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                } else {
                    Text("Open")
                        .font(.system(size: 19, weight: .bold))
                        .foregroundColor(.white)
                        .matchedGeometryEffect(id: id, in: namespace)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: isExpanded ? .center : .bottomTrailing)
            .onTapGesture {
                if !isExpanded {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }
            }
        
    }
}
