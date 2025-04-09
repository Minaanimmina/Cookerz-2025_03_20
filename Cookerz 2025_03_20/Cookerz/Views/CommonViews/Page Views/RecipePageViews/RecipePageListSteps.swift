import SwiftUI

struct RecipePageListSteps: View {
    var listSteps: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(listSteps.indices, id: \.self) { index in
                HStack(alignment: .top) {
                    // Step Number (1, 2, 3, ...)
                    Text("\(index + 1)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .background(Color.red50)
                        .cornerRadius(100)
                        .padding(.trailing, 8)
                    
                    // Step Description
                    Text("\(listSteps[index])")
                        .font(.PoppinsSubhead())
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true) 
                    
                    Spacer()
                }
                .padding(.vertical, 6)
            }
        }
    }
}

#Preview {
    RecipePageListSteps(listSteps: ["Preheat the oven.", "Mix the ingredients.", "Bake for 30 minutes.", "Let it cool before serving."])
}
