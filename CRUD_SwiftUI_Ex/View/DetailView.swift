


import SwiftUI

struct DetailView : View {
    
    
    //MARK: property
    let viewModel: UserViewModel
    let id: String


    @State private var showingDeleteAlert: Bool = false
    
    //MARK: UI
    var body: some View {

        NavigationView {
            if let user = viewModel.users.first(where: { $0.id == id }) {
                       UserDetailView(viewModel: viewModel, user: user)
                   } else {
                       Text("사용자 정보를 찾을 수 없습니다.")
                           .navigationTitle("오류")
                   }
            
            
        } // nav
    }
}
