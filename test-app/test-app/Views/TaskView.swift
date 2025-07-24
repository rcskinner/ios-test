import SwiftUI

struct TaskView: View {
    @State private var tasks: [String] = []
    @State private var newTask: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                TextField("Enter new task", text: $newTask)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: addTask) {
                    Image(systemName: "plus")
                        .padding(8)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                .disabled(newTask.trimmingCharacters(in: .whitespaces).isEmpty)
            }
            .padding(.horizontal)
            List {
                ForEach(tasks, id: \.self) { task in
                    Text(task)
                }
                .onDelete(perform: deleteTask)
            }
        }
        .navigationTitle("Tasks")
    }
    
    private func addTask() {
        let trimmed = newTask.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        tasks.append(trimmed)
        newTask = ""
    }
    
    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    TaskView()
} 