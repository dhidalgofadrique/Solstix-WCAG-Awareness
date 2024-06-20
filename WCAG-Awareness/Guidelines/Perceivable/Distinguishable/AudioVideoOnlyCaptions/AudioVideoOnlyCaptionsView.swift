//
//  AudioVideoOnlyCaptionsView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 21/6/24.
//

import SwiftUI
import AVKit

struct AudioVideoOnlyCaptionsView: View {
    @State var showSubtitles = false
    var player = AVPlayer(url: Bundle.main.url(forResource: "subtitledSimpsons", withExtension: "mp4")!)

    var body: some View {
        GuidelineView {
            ZStack(alignment: .bottom) {
                VideoPlayer(player: player)
                    .frame(height: 200)
                if !showSubtitles {
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 30)
                }
            }
        } onAccessibilityStatusChange: { accessibilityStatus in
            switch accessibilityStatus {
            case .default:
                showSubtitles = false
                player.isMuted = false
            case .reality:
                showSubtitles = false
                player.isMuted = true
            case .accessible:
                showSubtitles = true
                player.isMuted = true
            }
        }
    }
}

#Preview {
    AudioVideoOnlyCaptionsView()
}
