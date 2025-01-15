

import SwiftUI


struct CellView : View {
    
    @State private var showDetialView: Bool = false
    let user: UserModel
    
    
    
    var body: some View {
        HStack(spacing: 15){
            Text("[\(user.part)]")
            Text("\(user.name)")
        }
        .onTapGesture {
            showDetialView = true
        }
        .sheet(isPresented: $showDetialView) {
            DetailView(name: user.name, part: user.part, ageString: String(user.age))
        }
        
    }
}

//
//#Preview {
//    CellView()
//}
