
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
    
    
    var body: some View {
    
        ZStack{
            Color(.white)
            
            VStack{
                NavigationView {
                    List{
                        ForEach(viewModel.users){ user in
                            CellView(user: user)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .navigationTitle("Title")
                    .navigationBarItems(
                            trailing: NavigationLink(destination:
                                    AddView(),
                                        label:{
                                             Text("추가하기")
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.5921568627, blue: 0.1019607843, alpha: 1)))
                                         }
                          )
                        )
                }//nav
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        

        
    }
}

//#Preview {
//    ContentView()
//}
