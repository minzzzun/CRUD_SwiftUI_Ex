

import SwiftUI


struct CellView : View {
    
    @State private var showDetialView: Bool = false
    
    var body: some View {
        HStack(spacing: 15){
            Text("[iOS]")
            Text("김민준")
        }
        .onTapGesture {
            showDetialView = true
        }
        .sheet(isPresented: $showDetialView) {
            DetailView()
        }
        
    }
}

#Preview {
    CellView()
}
