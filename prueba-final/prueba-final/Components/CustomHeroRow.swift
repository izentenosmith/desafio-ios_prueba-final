import SwiftUI

struct CustomHeroRow: View {
    let hero: CustomHero
    let onView: () -> Void
    let onEdit: () -> Void
    let onDelete: () -> Void
    
    var body: some View {
        HStack {
            // Contenido principal
            VStack(alignment: .leading) {
                Text(hero.heroName)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(hero.realName)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
            }
            
            Spacer()
            
            // Botones de acción
            HStack(spacing: 20) {
                // Botón Ver
                Button(action: onView) {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "eye.fill")
                                .foregroundColor(.white)
                        )
                }
                .buttonStyle(PlainButtonStyle())
                
                // Botón Editar
                Button(action: onEdit) {
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                        )
                }
                .buttonStyle(PlainButtonStyle())
                
                // Botón Eliminar
                Button(action: onDelete) {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: "trash.fill")
                                .foregroundColor(.white)
                        )
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
    }
}
