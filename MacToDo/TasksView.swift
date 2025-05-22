//
//  TasksView.swift
//  ToDoList
//
//

import SwiftUI

struct TasksView: View {
    
    @State var tasks: [Task] = []
    @State var addTasks = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach($tasks) { $task in
                        HStack {
                            Button(
                                action: {
                                    task.isComplete.toggle()
                                },
                                label: {
                                    HStack {
                                        Image(systemName: task.isComplete ? "checkmark.circle" : "circle")
                                            .font(.system(size: 16))
                                            .foregroundStyle(.black)

                                        Text(task.title)
                                            .font(.system(size: 16))
                                            .foregroundStyle(.black)
                                    }
                                }
                            )
                            .buttonStyle(.plain)
                            .padding(10)
                            
                            Spacer()
                            
                            Text(task.priority.title)
                                .font(.system(size: 15, weight: .bold))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 5)
                                .foregroundStyle(task.priority.color)
                                .background(Capsule().fill(task.priority.color.opacity(0.4)))
                            
                            Button(action: {
                                delete(at: task.id)
                            }, label: {
                                Image(systemName: "trash")
                            })
                        }
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .navigationTitle("Tasks")
            .sheet(isPresented: $addTasks, content: {
                AddTaskView(tasks: $tasks)
            })
            .toolbar {
                ToolbarItem {
                    Button(
                        action: {
                            addTasks = true
                        },
                        label: {
                            Image(systemName: "plus")
                                .foregroundStyle(Color.black)
                        }
                    )
                }
            }
        }
    }
    
    private func delete(at id: UUID) {
        tasks.removeAll(where: { $0.id == id })
    }
    
}

//#Preview {
//    TasksView()
//        .preferredColorScheme(.light)
//}
