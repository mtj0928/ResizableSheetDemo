import SwiftUI
import ResizableSheet

struct ParentControllabelSheet: View {

    @State var counter = 0
    @State var state: ResizableSheetState = .hidden

    var body: some View {
        Parent(counter: $counter, state: $state)
            .resizableSheet($state) { builder in
                builder.content { context in
                    SheetContent(counter: $counter)
                        .frame(height: 300)
                }
                .background { context in
                    EmptyView()
                }
            }
    }

    struct SheetContent: View {
        @Binding var counter: Int

        var body: some View {
            VStack {
                GrabBar()
                Text("\(counter)").padding()
                Button("Reset") {
                    counter = 0
                }
                Spacer(minLength: 0)
            }
            .padding([.bottom, .horizontal])
        }
    }

    struct Parent: View {
        @Binding var counter: Int
        @Binding var state: ResizableSheetState

        var body: some View {
            VStack {
                Text("\(counter)").padding()
                Button("add") {
                    counter += 1
                }.padding()
                Button("Show sheet") {
                    state = .medium
                }
            }
        }
    }
}

struct ParentControllabelSheet__Previews: PreviewProvider {
    static var previews: some View {
        ResizableSheetPreview {
            ParentControllabelSheet()
        }
    }
}
