import SwiftUI

struct TodoItem: Identifiable {
    var id = UUID()
    var title: String
}

class TodoListViewModel: ObservableObject {
    @Published var items: [TodoItem] = []
    
    // Function to add a new item to the list
    func addItem(title: String) {
        let newItem = TodoItem(title: title)
        items.append(newItem)
    }
    
    // Function to delete an item from the list
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    // Function to update an item in the list
    func updateItem(index: Int, newTitle: String) {
        items[index].title = newTitle
    }
}

struct ContentView: View {
    @StateObject var viewModel = TodoListViewModel()
    @State private var newItemTitle = ""
    @State private var isShowingAddItemSheet = false
    @State private var selectedItem: TodoItem? = nil
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items) { item in
                    Text(item.title)
                        .onTapGesture {
                            selectedItem = item
                            isEditing = true
                        }
                }
                .onDelete(perform: deleteItem)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("To-Do List ")
            .navigationBarItems(trailing:
                Button(action: {
                    isShowingAddItemSheet.toggle()
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $isShowingAddItemSheet) {
                AddItemView(viewModel: viewModel, isPresented: $isShowingAddItemSheet)
            }
        }
        .sheet(isPresented: $isEditing) {
            EditItemView(viewModel: viewModel, item: $selectedItem, isPresented: $isEditing)
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        viewModel.deleteItem(indexSet: indexSet)
    }
}

struct AddItemView: View {
    @ObservedObject var viewModel: TodoListViewModel
    @Binding var isPresented: Bool
    @State private var newItemTitle = "ss"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Item")) {
                    TextField("Enter a new item", text: $newItemTitle)
                }
            }
            .navigationTitle("Add Item")
            .navigationBarItems(trailing:
                Button("Save") {
                    viewModel.addItem(title: newItemTitle)
                    isPresented = false
                }
            )
        }
    }
}

struct EditItemView: View {
    @ObservedObject var viewModel: TodoListViewModel
    @Binding var item: TodoItem?
    @Binding var isPresented: Bool
    @State private var updatedTitle = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit Item")) {
                    TextField("Edit item", text: $updatedTitle)
                }
            }
            .navigationTitle("Edit Item")
            .navigationBarItems(trailing:
                Button("Save") {
                    guard let item = item, let index = viewModel.items.firstIndex(where: { $0.id == item.id }) else {
                        isPresented = false
                        return
                    }
                    viewModel.updateItem(index: index, newTitle: updatedTitle)
                    isPresented = false
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}


struct ContentView2 : View {
    var body: some View {
        Text("Hello world")
    }
}
