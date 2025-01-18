import SwiftUI
import Combine



struct AddView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: UserViewModel
    
    @State private var name: String = ""
    @State private var part: String = ""
    @State private var ageString: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("추가하기")
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
                
                viewModel.addUser(name: name, part: part, age: age) { success in
                    if success {
                        dismiss()
                    } else {
                        alertMessage = "저장에 실패했습니다"
                        showAlert = true
                    }
                }
            }) {
                Text("저장하기")
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

#Preview {
    AddView(viewModel: UserViewModel())
}
