//
//  LibraryView.swift
//  MenuUtilities
//
//  Created by Mario Elsnig on 29.12.20.
//

import SwiftUI

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}

struct SectionView<Content: View>: View {
    let content: Content
    var title: String
    
    init(_ title: String = "", @ViewBuilder content: () -> Content) {
        self.content = content()
        self.title = title
    }
    
    var body: some View {
        VStack {
            Text(title).font(.title).frame(maxWidth: .infinity, alignment: .leading)
            content
        }
    }
}

struct TitleView: View {
    var body: some View {
        Text("MenuUtilities").font(.largeTitle)
        Spacer(minLength: 10)
    }
}
