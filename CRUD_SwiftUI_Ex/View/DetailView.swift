


import SwiftUI

struct DetailView : View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack{
                Text("상세 정보")
            } //v
            .navigationTitle("상세보기")
            .navigationBarItems(trailing:
                Button("닫기") {
                    dismiss()
                }
            )
        } // nav
    }
}
