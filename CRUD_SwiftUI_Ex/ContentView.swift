
import SwiftUI

struct ContentView: View {
    var body: some View {
    
            NavigationView {
                List{
                    ForEach(1...10,id: \.self){_ in
                        CellView()
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
                                            .foregroundColor(Color.init(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                     }
                      )
                    )
            }//nav
            .background(Color.yellow)
            .edgesIgnoringSafeArea(.all)
        
        
        
        
        
        
        
    }
}

#Preview {
    ContentView()
}
