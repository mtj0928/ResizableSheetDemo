import SwiftUI
import ResizableSheet

struct FullCustomizedSheet: View {

    struct Entity: Identifiable {
        let value: Int
        var id: String { value.description }
    }

    @State var counter = 0
    @State var state: ResizableSheetState = .hidden

    struct ChildView: View {
        @Binding var counter: Int

        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    if counter == 0 {
                        Text("There are no items")
                            .foregroundColor(.secondary)
                    }
                    ForEach((0..<counter).map(Entity.init(value:))) { _ in
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.gray)
                            .aspectRatio(1.0, contentMode: .fill)
                    }
                }.padding(.horizontal)
            }
        }
    }

    var body: some View {
        VStack {
            Spacer().layoutPriority(1)
            Text("\(counter)")
                .font(.largeTitle)
                .fontWeight(.black)
                .italic()
            Text("items")
                .fontWeight(.heavy)
                .italic()

            Button(
                action: { counter += 1 },
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.green)
                        Text("Add")
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                    }
                }
            ).frame(width: 200)

            Spacer().layoutPriority(1)

            Button(action: {
                state = .medium
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.blue)
                    Text("Show sheet")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .padding()
        }
        .resizableSheet($state) { builder in
            builder.content { context in
                ResizableScrollView(
                    additionalViewHeightForMedium: 18,
                    context: context,
                    main: { main(in: context) },
                    additional: { additional(in: context) }
                )
                .overlay(
                    VStack {
                        GrabBar()
                        Spacer()
                    }
                )
            }
            .cornerRadius(20)
            .animation(.easeOut.speed(1.8))
            .background { context in
                Color.black.opacity(
                    context.state == .medium ? context.progress * 0.8:
                        context.state == .large ? (1 + context.progress) * 0.8 :
                        0.0
                ).ignoresSafeArea()
            }
        }
    }

    @ViewBuilder
    func main(in context: ResizableSheetContext) -> some View {
        GrabBar().opacity(0.0)
        HStack {
            Text("Items")
                .font(.title2)
                .bold()
                .padding([.horizontal, .bottom])
            Spacer(minLength: 0)
        }

        ChildView(counter: $counter)
            .frame(width: context.fullViewSize.width, height: 100)

        Button(action: {
            counter = 0
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.green)
                Text("Reset")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .padding()
    }

    @ViewBuilder
    func additional(in context: ResizableSheetContext) -> some View {
        ForEach(1..<100) { index in
            HStack {
                Text("\(index)")
                Spacer()
            }
            .padding()
            Divider()
        }
        .opacity(context.state == .large ? 1.0 + context.progress : max(context.progress, 0))
    }
}

struct FullCustomizedSheet_Preview: PreviewProvider {

    static var previews: some View {
        ResizableSheetPreview {
            FullCustomizedSheet()
        }
    }
}
