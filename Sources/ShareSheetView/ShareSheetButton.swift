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
    
    private var shareSheetView: () -> ShareSheetView
    private var label: () -> AnyView
    
    public init(shareSheetView: @escaping () -> ShareSheetView, label: @escaping () -> AnyView) {
        self.shareSheetView = shareSheetView
        self.label = label
    }
    
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
