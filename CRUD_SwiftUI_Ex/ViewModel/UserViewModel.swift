

import SwiftUI
import Combine

final class UserViewModel : ObservableObject {
    @ObservedObject var viewModel : UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    
    
    
}
