//
//  RootView.swift
//  RootView
//
//  Created by Junnosuke Matsumoto on 2021/09/17.
//

import SwiftUI
import ResizableSheet

struct RootView: View {

    let windowScene: UIWindowScene?

    var resizableSheetCenter: ResizableSheetCenter? {
        windowScene.flatMap(ResizableSheetCenter.resolve(for:))
    }

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Simple Sheet") {
                    SimpleSheet()
                }
                NavigationLink("Complex Sheet") {
                    ComplexSheet()
                }
            }
        }
        .environment(\.resizableSheetCenter, resizableSheetCenter)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(windowScene: nil)
    }
}
