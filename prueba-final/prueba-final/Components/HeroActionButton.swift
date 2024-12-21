import SwiftUI

struct HeroActionButton: View {
    let systemName: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .foregroundColor(color)
                .padding(8)
        }
    }
} 