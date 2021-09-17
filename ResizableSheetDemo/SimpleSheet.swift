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
    @Environment(\.resizableSheetCenter) var resizableSheetCenter

    var body: some View {
        Button("Show sheet") {
            state = .midium
        }
        .onAppear {
            resizableSheetCenter?.prepare(for: ResizableSheet(
                id: "id",
                state: $state,
                config: DefaultResizableSheetConfiguration(),
                content: { context in
                    Text("text").padding()
                }))
        }
        .onDisappear {
            resizableSheetCenter?.remove(id: "id")
        }
    }
}

struct SimpleSheet_Previews: PreviewProvider {
    static var previews: some View {
        SimpleSheet()
    }
}
