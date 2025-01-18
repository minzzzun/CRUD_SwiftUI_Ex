

import SwiftUI

struct UserDetailView : View {
    
    //MARK: - property
    @Environment(\.dismiss) var dismiss
    let viewModel: UserViewModel
    let user: UserModel
    @State private var showingDeleteAlert: Bool = false
    @State private var showEditView: Bool = false
    
    //MARK: - UI
    var body: some View {
        VStack(spacing: 200){
            Text("\(user.name)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            
            VStack(alignment: .leading, spacing: 20 ){
                HStack{
                    Text("파트 : \(user.part)")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                HStack{
                    Text("나이 : \(user.age)")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                
            }//v
            
        } //v
        .navigationTitle("상세보기")
        //MARK: 수정
        .navigationBarItems(leading:
                                Button(action: {
            print("수정 버튼 클릭")
            showEditView = true
        }) {
            Text("수정")
                .foregroundColor(Color.blue)
                .fontWeight(.bold)
        }
        )
        .sheet(isPresented: $showEditView ){
            EditView(viewModel: viewModel, user: user, parentDismiss: dismiss)
        }
        
        //MARK: 삭제
        .navigationBarItems(trailing:
                                Button(action: {
            print("삭제 버튼 클릭")
            showingDeleteAlert = true
            
        }) {
            Text("삭제")
                .foregroundColor(Color.red)
                .fontWeight(.bold)
        }
        )
        .alert("삭제 확인", isPresented: $showingDeleteAlert){
            Button("취소", role: .cancel){}
            Button("삭제", role: .destructive){
                viewModel.deleteUsers(id: user.id) { success in
                    if success {
                        dismiss()
                    }
                }
                
            }
        } message: {
            Text("정말 삭제하시겠습니까")
        }
    }
}
