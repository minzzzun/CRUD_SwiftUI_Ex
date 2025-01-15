


import SwiftUI

struct DetailView : View {
    
    
    //MARK: property
    @Environment(\.dismiss) var dismiss
    let viewModel: UserViewModel
    @State var id : String
    @State var name : String
    @State var part : String
    @State var ageString : String


    @State private var showingDeleteAlert: Bool = false
    
    //MARK: UI
    var body: some View {
        NavigationView {
            VStack(spacing: 200){
                Text("\(name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
              
                
                VStack(alignment: .leading, spacing: 20 ){
                    HStack{
                        Text("파트 : \(part)")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    HStack{
                        Text("나이 : \(ageString)")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    
                }//v
            
            } //v
            .navigationTitle("상세보기")
            
            .navigationBarItems(leading:
            Button(action: {
                print("수정 버튼 클릭")
                dismiss()
            }) {
                Text("수정")
                    .foregroundColor(Color.blue)
                    .fontWeight(.bold)
                }
            )
            
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
                    viewModel.deleteUsers(id: id) { success in
                        if success {
                            dismiss()
                        }
                    }
                    
                }
            } message: {
                Text("정말 삭제하시겠습니까")
            }
            
            
        } // nav
    }
}



//#Preview {
//    DetailView(name: "민준", part: "iOS", ageString: "25")
//}
