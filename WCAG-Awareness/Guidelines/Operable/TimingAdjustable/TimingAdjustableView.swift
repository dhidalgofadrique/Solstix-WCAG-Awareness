//
//  TimingAdjustableView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct TimingAdjustableView: View {
    @StateObject var timingAdjustableViewModel = TimingAdjustableViewModel()
    @State var showButton = false

    var body: some View {
        ZStack {
            TabView(selection: $timingAdjustableViewModel.currentPage) {
                ForEach(Array(timingAdjustableViewModel.imageNames.enumerated()), id: \.element) { index, imageName in
                    Image(imageName)
                        .tag(index)
                }
            }
            .ignoresSafeArea()
            .tabViewStyle(PageTabViewStyle())
            .onAppear {
                timingAdjustableViewModel.createTimer(interval: 2)
            }
            GuidelineView {
                if showButton {
                    HStack {
                        Spacer()
                        Button {
                            timingAdjustableViewModel.pauseStartTimer()
                        } label: {
                            Image(systemName: timingAdjustableViewModel.isPaused ? "play" : "pause")
                                .font(.title)
                                .foregroundStyle(.black)
                        }
                        .frame(width: 60, height: 60)
                        .background(.white)
                        .clipShape(Circle())
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 40)
                }
            } onAccessibilityStatusChange: { accessibilityStatus in
                switch accessibilityStatus {
                case .default:
                    withAnimation {
                        timingAdjustableViewModel.currentPage = 0
                        timingAdjustableViewModel.createTimer(interval: 2)
                        showButton = false
                    }
                case .reality:
                    withAnimation {
                        timingAdjustableViewModel.currentPage = 0
                        timingAdjustableViewModel.createTimer(interval: 0.2)
                        showButton = false
                    }
                case .accessible:
                    withAnimation {
                        timingAdjustableViewModel.currentPage = 0
                        timingAdjustableViewModel.createTimer(interval: 4)
                        showButton = true
                    }
                }
            }
        }
    }
}

#Preview {
    TimingAdjustableView()
}
