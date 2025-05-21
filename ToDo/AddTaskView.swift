//
//  AddTaskView.swift
//  ToDoList
//
//

import SwiftUI

struct AddTaskView: View {
    
    @State var title = ""
    @State var priority: Priority = .normal
    @State var showInvalidTitleError = false
    @Binding var tasks: [Task]
    @Environment(\.dismiss) var dismiss
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Task Title")
                    .font(.system(size: 15, weight: .semibold))

                Spacer()
                
                if horizontalSizeClass == .regular &&
                    verticalSizeClass == .compact ||
                    horizontalSizeClass == .compact &&
                    verticalSizeClass == .compact {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.black)
                    }
                }
            }
            .padding(.top, 30)

            TextField("Task Title", text: $title)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            
            Text("Priority")
                .font(.system(size: 15, weight: .semibold))

            Picker("Priority", selection: $priority) {
                ForEach(Priority.allCases) { priorityType in
                    Text(priorityType.title)
                        .tag(priorityType)
                }
            }
            .padding(.bottom)
                
            Button(
                action: {
                    guard title.count > 2 else {
                        showInvalidTitleError = true
                        return
                    }
                    let newTask = Task(title: title, priority: priority, isComplete: false)
                    tasks.append(newTask)
                    dismiss()
                },
                label: {
                    Text("Add Task")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(Color.white)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }
            )
            Spacer()
        }
        .padding(.horizontal)
        .alert(
            "Invalid Title",
            isPresented: $showInvalidTitleError,
            actions: {
                Button(action: {}, label: {
                    Text("OK")
                })
            },
            message: {
                Text("Title must be greater than 2 characters")
            }
        )
    }
}

//#Preview {
//    AddTaskView(tasks: .constant([]))
//}
