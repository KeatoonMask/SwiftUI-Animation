import SwiftUI

struct Recording: View {
    
    let maraschino = Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1))
    @State private var recording = false
    
    var body: some View {
        ZStack {
            
            // Middle
            Circle()
                .frame(width: 160, height: 160)
                .scaleEffect(recording ? 1 : 0.5)
                .opacity(recording ? 0.6 : 0)
        }
        // .spring(response = 0.55, dampingFraction = 0.825, blendDuration = 0)
        .onAppear {
            withAnimation(.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 0).repeatForever(autoreverses: true)) {
                    recording.toggle()
            }
        }
    }
}

struct Recording_Previews: PreviewProvider {
    static var previews: some View {
        Recording()
            .preferredColorScheme(.dark)
    }
}
