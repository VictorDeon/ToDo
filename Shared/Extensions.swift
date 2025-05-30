
import Foundation
import SwiftUI

#if os(iOS)
extension UIDevice {
    static var isIPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isIPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
}
#endif

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
