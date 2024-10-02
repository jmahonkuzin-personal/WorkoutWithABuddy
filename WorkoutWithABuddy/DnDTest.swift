import SwiftUI

struct MyItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
}

struct DragAndDropView: View {
    @State private var items = [
        MyItem(name: "Item 1"),
        MyItem(name: "Item 2"),
        MyItem(name: "Item 3"),
        MyItem(name: "Item 4")
    ]
    
    var body: some View {
        VStack {
            Text("Rearrange the items:")
                .font(.headline)
                .padding()

            List {
                ForEach(items) { item in
                    Text(item.name)
                }
                .onMove(perform: move)
            }
            .toolbar {
                EditButton() // Adds an edit button to enable moving items
            }
        }
    }

    // Function to handle moving items in the list
    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}

struct DragAndDropView_Previews: PreviewProvider {
    static var previews: some View {
        DragAndDropView()
    }
}
