//
//  ChallengeThree.swift
//  ViewsAndModifiers
//
//  Created by Niyazi on 21.09.2025.
//

import SwiftUI

struct ProminentText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension Text {
    func prominent() -> some View {
        self.modifier(ProminentText())
    }
}

struct ChallengeThree: View {
    var body: some View {
        Text("Challenge Three")
            .prominent()
    }
}

#Preview {
    ChallengeThree()
}
