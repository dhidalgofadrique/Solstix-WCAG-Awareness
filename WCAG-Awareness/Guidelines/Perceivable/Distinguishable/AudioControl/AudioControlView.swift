//
//  AudioControlView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import AVFoundation
import SwiftUI

struct AudioControlView: View {
    @StateObject var audioPlayerViewModel = AudioPlayerViewModel()
    @State var showButton = false

    var body: some View {
        ZStack {
            Image("simpsonsWallpaper")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            GuidelineView(content: {
                Spacer()
                HStack {
                    Button {
                        audioPlayerViewModel.playOrPause()
                    } label: {
                        Image(systemName: audioPlayerViewModel.isPlaying ? "speaker.slash" : "speaker")
                            .font(.title)
                            .foregroundStyle(.black)
                    }
                    .frame(width: 40, height: 40)
                    .background(.white)
                    .clipShape(Circle())
                    .padding(.horizontal, 40)
                    .opacity(showButton ? 1 : 0)
                }
                .onAppear() {
                    audioPlayerViewModel.playOrPause()
                }
            }, showRealityButton: false, onAccessibilityStatusChange: { accessibilityStatus in
                switch accessibilityStatus {
                case .default:
                    withAnimation {
                        showButton = false
                    }
                case .reality:
                    withAnimation {
                        showButton = false
                    }
                case .accessible:
                    withAnimation {
                        showButton = true
                    }
                }
            }
            )
            .padding(.bottom, 30)
        }
    }
}

#Preview {
    AudioControlView()
}
