//
//  ComplexSheet.swift
//  ComplexSheet
//
//  Created by Junnosuke Matsumoto on 2021/09/17.
//

import SwiftUI
import ResizableSheet

struct ComplexSheet: View {

    @State var state: ResizableSheetState = .hidden
    @Environment(\.resizableSheetCenter) var resizableSheetCenter

    var body: some View {
        Button("Show sheet") {
            state = .midium
        }
        .onAppear {
            resizableSheetCenter?.prepare(for: ResizableSheet(
                state: $state,
                content: { context in
                    VStack {
                        Text(context.state == .hidden ? "hidden" :
                                context.state == .midium ? "midium" : "large"
                        )
                        Color.gray
                            .frame(height:
                                    context.state == .midium ? max(0, context.diffY) :
                                    context.state == .hidden ? 0 : nil
                            )
                            .opacity(context.state == .midium ? context.percent : 1.0 - abs(context.percent))
                            .allowsHitTesting(false)
                        Text("Buttom")
                    }
                    .padding()
                }))
        }
        .onDisappear {
            resizableSheetCenter?.remove(id: "id")
        }
    }
}

struct ComplexSheet_Previews: PreviewProvider {
    static var previews: some View {
        ComplexSheet()
    }
}
