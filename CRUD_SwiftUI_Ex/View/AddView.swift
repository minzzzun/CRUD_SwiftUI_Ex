

import SwiftUI


struct AddView : View {
    @Environment(\.dismiss) private var  dismiss
    
    
    var body: some View {
        
        @State var name: String = ""
        @State var part: String = ""
        @State var age: Int = 0
        @State var ageString: String = ""
        
        
        VStack(spacing: 20){
            Text("추가하기")
                .font(.system(size: 30))
                .fontWeight(.bold)
                
            
            TextField("이름을 입력하세요", text: $name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onSubmit {
                        print("user did tap return , \(name)")
                      }
            TextField("파트를 입력하세요", text: $part)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("나이를 입력하세요", text: $ageString)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: ageString) {
                    if let intValue = Int(ageString) {
                        age = intValue
                    } else {
                        age = 20
                    }
                    
                }
            
            Button(action: {
                print("저장하기 버튼 클릭")
                print("이름 : \(name) 파트 :  \(part) 나이 : \(ageString)")
                dismiss()
            }){
                Text("저장하기")
                    .frame(width: 300, height: 20)
                    .padding()
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        
        
        
        
        
        
        
        
        
    }
}




#Preview {
    AddView()
}
