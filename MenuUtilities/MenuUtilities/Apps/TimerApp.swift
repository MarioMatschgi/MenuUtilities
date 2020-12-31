//
//  TimerApp.swift
//  MenuUtilities
//
//  Created by Mario Elsnig on 30.12.20.
//

import Foundation
import SwiftUI

enum Apps_TimerUnit: String, CaseIterable {
    case None
    case Seconds
    case Minutes
    case Hours
}

struct Apps_Timer: Hashable {
    var unit: Apps_TimerUnit
    var duration: Int
}

struct TimerAppView: View {
    @State var timerList: [Apps_Timer] = [Apps_Timer(unit: .Minutes, duration: 1)]
    @State var timerCellSize = CGFloat(150)
    @State var timerCellSpacing: CGFloat = 25
    @State var timerCellSizeRadius = CGFloat(25)
    
    @State var newTime = 10
    @State var newTimerUnit = 1
    
    var body: some View {
        VStack {
            SectionView("Timer") {
                HStack {
                    ScrollView(.horizontal, showsIndicators: true) {
                        LazyHStack(spacing: timerCellSpacing) { // ToDo: HGRID
                            ForEach(timerList, id: \.self) { timer in
                                VStack {
                                    Text("\(timer.duration)").font(.system(size: 20)).foregroundColor(.white)
                                }.frame(width: timerCellSize, height: timerCellSize).background(Color.orange).cornerRadius(timerCellSize / 100 * timerCellSizeRadius)
                            }
                            VStack {
                                Spacer()
                                
                                Stepper("\(newTime)", value: $newTime, in: 0...60).frame(width: 40)
                                Picker(selection: $newTimerUnit, label: EmptyView(), content: {
                                    ForEach(1..<Apps_TimerUnit.allCases.count, id: \.self) { idx in
                                        Text(Apps_TimerUnit.allCases[idx].rawValue).tag(idx)
                                    }
                                })
                                Spacer()
                                Button(action: { }, label: {
                                    Text("Set timer")
                                })
                            }.padding().frame(width: timerCellSize, height: timerCellSize).background(Color.orange).cornerRadius(timerCellSize / 100 * timerCellSizeRadius)
                        }.padding(.bottom, 5)
                    }.frame(width: (timerCellSize + CGFloat(20)) * 4, alignment: .leading)
                }
            }
            SectionView("Alarm") {
                
            }
            SectionView("Stopwatch") {
                
            }
        }.padding().fixedSize()
    }
}

struct TimerAppView_Previews: PreviewProvider {
    static var previews: some View {
        TimerAppView()
    }
}
