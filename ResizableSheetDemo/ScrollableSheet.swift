import SwiftUI
import ResizableSheet

struct ScrollableSheet: View {
    @State var state: ResizableSheetState = .hidden

    var body: some View {
        Button("Show sheet") {
            state = .medium
        }
        .resizableSheet($state) { builder in
            builder.content { context in
                ResizableScrollView(
                    context: context,
                    main: {
                        GrabBar().opacity(0)
                        ForEach(0..<4) { index in
                            Text("line: \(index)")
                                .padding()
                        }
                    },
                    additional: {
                        ForEach(4..<25) { index in
                            Text("line: \(index)")
                                .padding()
                        }
                    }
                )
                    .overlay(
                        VStack {
                            GrabBar()
                            Spacer()
                        }
                    )
            }
        }
    }
}

struct ScrollableSheet_Previews: PreviewProvider {
    static var previews: some View {
        ResizableSheetPreview {
            ScrollableSheet()
        }
    }
}
