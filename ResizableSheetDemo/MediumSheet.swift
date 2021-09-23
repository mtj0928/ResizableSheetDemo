import SwiftUI
import ResizableSheet

struct MediumSheet: View {

    @State var state: ResizableSheetState = .hidden

    var body: some View {
        Button("Show sheet") {
            state = .medium
        }
        .resizableSheet($state) { builder in
            builder.content { context in
                VStack {
                    HStack {
                        Spacer(minLength: 0)
                        CloseButton(action: { state = .hidden })
                            .frame(width: 40, height: 40)
                    }
                    .padding()
                    Spacer(minLength: 0).frame(height: 300)
                }
            }
            .background { context in
                Color.black
                    .opacity(context.state == .medium ? 0.5 : 0)
                    .ignoresSafeArea()
            }
            .supportedState([.medium])
        }
    }


    struct CloseButton: View {
        let action: () -> Void

        var body: some View {
            Button(
                action: action,
                label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                }
            )
        }
    }
}

struct MediumSheet_Previews: PreviewProvider {
    static var previews: some View {
        ResizableSheetPreview {
            MediumSheet()
        }
    }
}
