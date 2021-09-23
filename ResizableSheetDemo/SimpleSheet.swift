//
//  SimpleSheet.swift
//  SimpleSheet
//
//  Created by Junnosuke Matsumoto on 2021/09/17.
//

import SwiftUI
import ResizableSheet

struct SimpleSheet: View {

    @State var state: ResizableSheetState = .hidden

    var body: some View {
        Button("Show sheet") {
            state = .medium
        }
        .resizableSheet($state) { builder in
            builder.content { context in
                Text("text").padding()
            }
        }
    }
}

struct SimpleSheet_Previews: PreviewProvider {

    static var previews: some View {
        ResizableSheetPreview {
            SimpleSheet()
        }
    }
}
