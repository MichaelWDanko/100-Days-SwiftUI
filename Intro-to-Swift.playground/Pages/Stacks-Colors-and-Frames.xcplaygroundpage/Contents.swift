//: ## Stacks, Colors, and Frames
//: [Previous](@previous) - [Next](@next) - [Introduction](Introduction)
import SwiftUI

/*:
 VStack
 - Multiple views placed where one is above another view
 */

/*:
 HStack
 - Multiple views placed beside each other
 */

/*:
 ZStack
 - Multiple views placed on top of each other.
 
 - Unlike HStack or VStack, ZStack enables depth.
 */


/*:
 General Stack Info
 - By default stacks automatically space & align but this can be overridden
 - - ZStack doesn't space but does have alignment
 
 - Vertical and horizontal stacks automatically fit their content, and prefer to align themselves to the center of the available space.
 
 -
 */

VStack(alignment: .leading, spacing: 10) {
    Text("Hello, world!")
    Text("This is inside a stack")
}


/*:
 Colors & Frames
 - Colors are views that can be combined with ZStacks to provide backgrounds
 */
ZStack {
    Color.red
    Text("Your content")
}


ZStack {
    VStack(spacing: 0) {
        Color.red
        Color.blue
    }

    Text("Your content")
        .foregroundColor(.secondary)
        .padding(50)
        .background(.ultraThinMaterial)
}
.ignoresSafeArea()
