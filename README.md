# 📤 ShareSheetView

![swift v5.3](https://img.shields.io/badge/swift-v5.3-orange.svg)
![platform iOS](https://img.shields.io/badge/platform-iOS-blue.svg)
![deployment target iOS 13](https://img.shields.io/badge/deployment%20target-iOS%2013-blueviolet)

**ShareSheetView** is a lightweight library that creates a `UIActivityViewController` in `SwiftUI`.

## 💻 Installation
### 📦 Swift Package Manager
Using <a href="https://swift.org/package-manager/" rel="nofollow">Swift Package Manager</a>, add it as a Swift Package in Xcode 11.0 or later, `select File > Swift Packages > Add Package Dependency...` and add the repository URL:
```
https://github.com/rebeloper/ShareSheetView.git
```
### ✊ Manual Installation
Download and include the `ShareSheetView` folder and files in your codebase.

### 📲 Requirements
- iOS 14+
- Swift 5.3+

## 👉 Import

Import `ShareSheetView` into your `View`

```
import ShareSheetView
```

## 🧳 Features

Here's the list of the awesome features `ShareSheetView` has:
- [X] `UIActivityViewController` in `SwiftUI`
- [X] `ShareSheetButton`

## 💻 How to Use

Here are the ways that you can create a new `ShareSheetView`:

1. Create a `@State` variable to hold the `ShareSheetView` presentation
2. Create a `Button` that triggers a `sheet` view-modifier that has a `ShareSheetView` as its `content`

```
import SwiftUI
import ShareSheetView

struct ContentView: View {
    
    // 1.
    @State private var isShareSheetViewPresented = false
    
    var body: some View {
        VStack(spacing: 12) {
            
            // 2.
            Button(action: {
                isShareSheetViewPresented = true
            }, label: {
                Text("Share")
            })
            .sheet(isPresented: $isShareSheetViewPresented, content: {
                ShareSheetView(activityItems: getActivityItems(), applicationActivities: getApplicationActivities(), excludedActivityTypes: getExcludedActivityTypes()) { (activityType, finished, activityItems, error) in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    
                    if let activityType = activityType {
                        print(activityType)
                    }
                    
                    print(finished)
                    
                    if let activityItems = activityItems {
                        print(activityItems)
                    }
                }
            })
            
            Spacer()
        }
        .padding()
    }
    
    func getActivityItems() -> [Any] {
        return ["Hello ShareSheetView"]
    }
    
    func getApplicationActivities() -> [UIActivity]? {
        return nil
    }
    
    func getExcludedActivityTypes() -> [UIActivity.ActivityType]? {
        return [.postToFacebook]
    }
}
```

Or use the more convinient `ShareSheetButton`:

```
import SwiftUI
import ShareSheetView

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 12) {
            
            ShareSheetButton { () -> ShareSheetView in
                ShareSheetView(activityItems: getActivityItems())
            } label: { () -> AnyView in
                AnyView(
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                )
            }
            
            Spacer()
        }
        .padding()
    }
    
    func getActivityItems() -> [Any] {
        return ["Hello ShareSheetView"]
    }
    
}
```

## 🪁 Demo project

For a comprehensive Demo project check out: 
<a href="https://github.com/rebeloper/ShareSheetViewDemo">ShareSheetViewDemo</a>

## ✍️ Contact

<a href="https://rebeloper.com/">rebeloper.com</a> / 
<a href="https://www.youtube.com/rebeloper/">YouTube</a> / 
<a href="https://store.rebeloper.com/">Shop</a> / 
<a href="https://rebeloper.com/mentoring">Mentoring</a>

## 📃 License

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
