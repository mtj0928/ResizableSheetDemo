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

    // 1. ResizableSheetCenter の作成
    var resizableSheetCenter: ResizableSheetCenter? {
        guard let windowScene = windowScene else {
            return nil
        }
        return ResizableSheetCenter.resolve(for: windowScene)
    }

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Simple Sheet") {
                    SimpleSheet()
                }
                .padding(.vertical)

                NavigationLink("Dynamic Layout Sheet") {
                    DynamicLayoutSheet()
                }.padding(.vertical)

                NavigationLink("Medium Sheet") {
                    MediumSheet()
                }
                .padding(.vertical)

                NavigationLink("Parent Controllable Sheet") {
                    ParentControllabelSheet()
                }
                .padding(.vertical)

                NavigationLink("Scrollable Sheet") {
                    ScrollableSheet()
                }
                .padding(.vertical)

                NavigationLink("Customized Sheet") {
                    FullCustomizedSheet()
                        .ignoresSafeArea()
                }
                .padding(.vertical)
            }
        }
        // 2. ResizableSheetCenterを埋め込む
        .environment(\.resizableSheetCenter, resizableSheetCenter ?? PreviewResizableSheetCenter.shared)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        ResizableSheetPreview {
            RootView(windowScene: nil)
        }
    }
}
