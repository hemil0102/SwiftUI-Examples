//
//  ContentView.swift
//  DataFlow
//
//  Created by YEHROEI HO on 3/10/25.
//

import SwiftUI

// 데이터 모델
class CounterModel: ObservableObject {
    @Published var count: Int = 0
}

struct ParentView: View {
    @State private var showChildView = false
    @StateObject private var counter = CounterModel()
    
    var body: some View {
        VStack {
            Button("Toggle Child View") {
                showChildView.toggle()
            }
            
            if showChildView {
                ChildViewUsingStateObject(counter: counter)
            }
            
            ChildViewUsingObservedObject(counter: CounterModel())
        }
        .padding()
    }
}

struct ChildViewUsingStateObject: View {
    @ObservedObject var counter: CounterModel
    
    var body: some View {
        VStack {
            Text("StateObject Count: \(counter.count)")
            Button("Increment") {
                counter.count += 1
            }
        }
        .padding()
        .border(Color.blue)
    }
}

struct ChildViewUsingObservedObject: View {
    @ObservedObject var counter: CounterModel
    
    var body: some View {
        VStack {
            Text("ObservedObject Count: \(counter.count)")
            Button("Increment") {
                counter.count += 1
            }
        }
        .padding()
        .border(Color.red)
    }
}

#Preview {
    ParentView()
}
