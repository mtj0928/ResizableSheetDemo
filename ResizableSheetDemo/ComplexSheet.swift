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

    var body: some View {
        Button("Show sheet") {
            state = .medium
        }
        .resizableSheet($state) { builder in
            builder.content { context in
                VStack {
                    GrabBar()
                    Text("Text").padding()
                    Spacer().frame(height: 200)
                    Button(action: {
                        state = .hidden
                    }) {
                        HStack {
                            Spacer()
                            Text("OK")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(height: 50)
                        .background(Capsule().foregroundColor(.green))
                    }
                    .padding(.bottom)
                }
                .padding([.bottom, .horizontal])
            }
            .supportedState([.medium])
            .cornerRadius(40)
            .animation(.easeOut.speed(1.4))
        }
    }
}

struct ComplexSheet_Previews: PreviewProvider {
    static var previews: some View {
        ComplexSheet()
    }
}
