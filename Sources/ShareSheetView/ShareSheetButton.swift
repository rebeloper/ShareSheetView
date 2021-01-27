//
//  ShareSheetButton.swift
//  
//
//  Created by Alex Nagy on 27.01.2021.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ShareSheetButton: View {
    
    @State private var isPresented = false
    
    public var shareSheetView: () -> ShareSheetView
    public var label: () -> AnyView
    
    public var body: some View {
        Button {
            isPresented = true
        } label: {
            label()
        }
        .sheet(isPresented: $isPresented) {
            shareSheetView()
        }
    }
}
