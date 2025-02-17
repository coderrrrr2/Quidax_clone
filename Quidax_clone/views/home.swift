import SwiftUI

struct home: View {
    var body: some View {
        NavigationStack {
            // Using AppBody to wrap the content
            AppBody {
                VStack {
                    HStack {
                    }

                    
                    HStack {
                        VStack(alignment: .leading) {
                            AppText(text: "PORTFOLIO BALANCE")
                         
                        
                            Ybox(height: 20)
                            AppText(text: "PORTFOLIO BALANCE")
                            
                        
                        }
                        Spacer()
                        VStack{
                           
                            
                            
                        
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 10))
                    Spacer() // This pushes the content to the top

                }
            }
        }
    }
}

#Preview {
    home()
}
