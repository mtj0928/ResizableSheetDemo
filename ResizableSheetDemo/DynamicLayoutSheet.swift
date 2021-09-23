import SwiftUI
import ResizableSheet

struct DynamicLayoutSheet: View {
    @State var state: ResizableSheetState = .hidden

    var body: some View {
        Button("Show sheet") {
            state = .medium
        }
        .resizableSheet($state) { builder in
            builder.content { context in
                VStack(spacing: 0) {
                    GrabBar()
                    Text("Top")
                    Color.gray
                        .opacity(
                            context.state == .medium ? max(context.progress, 0) :
                                context.state == .large ? 1 + context.progress : 0
                        )
                        .allowsHitTesting(false)
                    Text("Buttom")
                }
                .padding([.horizontal, .bottom])
            }
        }
    }
}

struct DynamicLayoutSheet_Preview: PreviewProvider {

    static var previews: some View {
        ResizableSheetPreview {
            DynamicLayoutSheet()
        }
    }
}
