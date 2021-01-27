//
//  ShareSheetView.swift
//  
//
//  Created by Alex Nagy on 27.01.2021.
//

import SwiftUI

public struct ShareSheetView: UIViewControllerRepresentable {
    public typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
    
    public let activityItems: [Any]
    public let applicationActivities: [UIActivity]? = nil
    public let excludedActivityTypes: [UIActivity.ActivityType]? = nil
    public let callback: Callback? = nil
    
    public func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities)
        controller.modalPresentationStyle = .pageSheet
        controller.excludedActivityTypes = excludedActivityTypes
        controller.completionWithItemsHandler = callback
        return controller
    }
    
    public func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) { }
}
