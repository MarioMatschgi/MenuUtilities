//
//  MenueBarView.swift
//  MenuUtilities
//
//  Created by Mario Elsnig on 29.12.20.
//

import SwiftUI

struct MenuItemView: View {
    var body: some View {
        VStack {
            TitleView()
            
            SectionView("Apps") {
                AppsGridView()
            }
            
            SectionView {
                HStack {
                    Button("Preferences") { Manager.OpenPreferences() }
                    Button("Quit") { exit(0) }
                }
            }
        }.padding().fixedSize()
    }
}

struct AppsGridView: View {
    @State var colNum: Int = 4
    @State var cellSpacing: CGFloat = 25
    @State var cellSize: CGFloat = 150
    @State var cellSizeRadius: CGFloat = 25
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: .init(.fixed(cellSize), spacing: cellSpacing, alignment: .center), count: colNum), alignment: .center, spacing: cellSpacing, content: {
                ForEach(0..<Apps.apps.count, id: \.self) { idx in
                    let app = Apps.apps[idx]
                    let rad = cellSize / 100 * cellSizeRadius
                    
                    Button(action: { }, label: {
                        VStack {
                            VStack {
                                Text("\(app.name)").font(.system(size: cellSize / 10))
                            }
                            Image(app.iconName).resizable().aspectRatio(1, contentMode: .fit)
                        }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    }).buttonStyle(PlainButtonStyle()).padding(rad / 2).frame(width: cellSize, height: cellSize).background(Color.green).cornerRadius(rad)
                }
            })
            
            
            
            
            TimerAppView()
            
            
            
            
            
        }.fixedSize()
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView()
    }
}
