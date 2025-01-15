


import SwiftUI

struct DetailView : View {
    
    
    //MARK: property
    @Environment(\.dismiss) var dismiss
    @State var name : String
    @State var part : String
    @State var ageString : String
    
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
                dismiss()
            }) {
                Text("삭제")
                    .foregroundColor(Color.red)
                    .fontWeight(.bold)
                }
            )
        } // nav
    }
}



#Preview {
    DetailView(name: "민준", part: "iOS", ageString: "25")
}
