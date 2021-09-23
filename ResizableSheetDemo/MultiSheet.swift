import SwiftUI
import ResizableSheet

struct MultiSheet: View {
    @State var stateA: ResizableSheetState = .hidden
    @State var stateB: ResizableSheetState = .hidden

    var body: some View {
        Button("Show sheet A") {
            stateA = .medium
        }
        .resizableSheet($stateA, id: "A") { builder in
            builder.content { context in
                Button("Show sheet B") {
                    stateB = .medium
                }.frame(height: 500)
            }
        }
        .resizableSheet($stateB, id: "B") { builder in
            builder.content { context in
                VStack {
                    Button("Hide sheet B") {
                        stateB = .hidden
                    }
                    Button("Hide all sheets") {
                        stateA = .hidden
                        stateB = .hidden
                    }.padding()
                }.frame(height: 300)
            }
        }
    }
}

struct MultiSheet_Previews: PreviewProvider {
    static var previews: some View {
        ResizableSheetPreview {
            MultiSheet()
        }
    }
}
