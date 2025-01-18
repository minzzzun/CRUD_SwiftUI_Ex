import SwiftUI


struct EditView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: UserViewModel
    let user: UserModel
    let parentDismiss: DismissAction  // 부모 뷰의 dismiss 추가

    @State private var name: String
    @State private var part: String
    @State private var ageString: String
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    init(viewModel: UserViewModel, user: UserModel, parentDismiss: DismissAction) {
        self.viewModel = viewModel
        self.user = user
        self.parentDismiss = parentDismiss
        // 초기값 설정
        _name = State(initialValue: user.name)
        _part = State(initialValue: user.part)
        _ageString = State(initialValue: String(user.age))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("수정하기")
                .font(.system(size: 30))
                .fontWeight(.bold)
            
            TextField("이름을 입력하세요", text: $name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("파트를 입력하세요", text: $part)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("나이를 입력하세요", text: $ageString)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            Button(action: {
                guard !name.isEmpty else {
                    alertMessage = "이름을 입력해주세요"
                    showAlert = true
                    return
                }
                guard !part.isEmpty else {
                    alertMessage = "파트를 입력해주세요"
                    showAlert = true
                    return
                }
                guard let age = Int(ageString) else {
                    alertMessage = "올바른 나이를 입력해주세요"
                    showAlert = true
                    return
                }
                
                viewModel.updateUser(id: user.id, name: name, part: part, age: age) { success in
                    if success {
                        dismiss()
                        parentDismiss()
                    } else {
                        alertMessage = "수정에 실패했습니다"
                        showAlert = true
                    }
                }
            }) {
                Text("수정하기")
                    .frame(width: 300, height: 20)
                    .padding()
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .alert("알림", isPresented: $showAlert) {
            Button("확인", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }
}
