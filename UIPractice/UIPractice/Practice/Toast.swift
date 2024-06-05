import SwiftUI

struct ToastView: View {
    @State private var showToast = false
    @State private var toastMessage = ""
    
    var body: some View {
        VStack {
            Button("Show Toast") {
                showToast.toggle()
                toastMessage = "Hello, Toast!"
            }
            .padding()
            
            Spacer()
        }
        .toast(isShowing: $showToast, message: toastMessage)
    }
}

extension View {
    func toast(isShowing: Binding<Bool>, message: String) -> some View {
        self.modifier(ToastViewModifier(isShowing: isShowing, message: message))
    }
}

struct ToastViewModifier: ViewModifier {
    @Binding var isShowing: Bool
    var message: String
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isShowing {
                VStack {
                    Spacer()
                    
                    Text(message)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 40)
                }
                .transition(.slide)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isShowing = false
                        }
                    }
                }
            }
        }
    }
}

// Example usage
struct ContentView1: View {
    var body: some View {
        ToastView()
    }
}
