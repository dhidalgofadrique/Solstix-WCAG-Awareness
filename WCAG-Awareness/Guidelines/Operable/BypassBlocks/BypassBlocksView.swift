//
//  BypassBlocksView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct BypassBlocksView: View {
    @State var showButton = false

    var body: some View {
        GuidelineView(content: {
            ScrollViewReader { value in
                ScrollView {
                    VStack {
                        HStack {
                            Text("¿Quien mato al señor Burns?")
                                .font(.largeTitle)
                            Image("burns")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .aspectRatio(contentMode: .fit)
                        }
                        .padding(.bottom, 20)
                        if showButton {
                            Button {
                                withAnimation {
                                    value.scrollTo("culpable")
                                }
                            } label: {
                                Text("¡No puedo esperar!")
                                    .foregroundStyle(.white)
                            }
                            .padding(12)
                            .background(.blue)
                            .clipShape(Capsule())
                            .padding(.bottom, 8)
                        }
                        Text(
        """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum iaculis interdum sagittis. Donec tristique mattis diam, eu imperdiet dolor vehicula ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec faucibus semper convallis. Curabitur eget sapien a metus vulputate dictum at ac purus. Vestibulum vehicula nisl id nibh condimentum consectetur. Quisque imperdiet dui ac efficitur finibus.

        Suspendisse elementum molestie euismod. Fusce eu est ac felis accumsan tempor. Cras egestas maximus turpis, sed elementum dolor. Donec tempus pellentesque ullamcorper. Pellentesque sem nunc, finibus nec ligula non, bibendum tempus sem. Duis congue lacinia augue et malesuada. Sed enim orci, mollis id ante iaculis, iaculis malesuada metus. Cras et ex pharetra, pellentesque justo in, rhoncus sem. Pellentesque urna sem, fringilla hendrerit facilisis ac, rutrum vel massa. Cras congue, odio id facilisis vestibulum, massa lectus efficitur lorem, quis malesuada purus odio et dolor. Phasellus non nisl quam. Aenean sed luctus eros.

        Mauris in auctor nulla, sit amet gravida urna. Nunc tempor ligula vel tempor cursus. Morbi fringilla hendrerit enim, et placerat erat gravida quis. Integer sodales dui vitae ipsum consectetur, volutpat sodales leo blandit. Aliquam eu eros odio. Nam sagittis, massa id placerat scelerisque, leo eros ultricies justo, eu hendrerit risus nulla sit amet lectus. Maecenas mollis lectus tortor, condimentum molestie elit gravida eu. Integer pretium, dui sed ullamcorper semper, neque justo tincidunt justo, vitae hendrerit metus turpis id nunc. Phasellus vehicula leo in elementum faucibus. Integer turpis lacus, vestibulum aliquam velit vel, laoreet aliquet ipsum.

        ...

        ...

        ...

        ...

        ...

        ...

        ...

        ...

        ...

        ...

        ...

        ...

        ...

        ...

        ...

        ...
        """)
                        Image("maggie")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .id("culpable")
                            .padding(.vertical, 20)
                    }
                }
                .padding()
            }
        }, showRealityButton: false,  onAccessibilityStatusChange: { accessibilityStatus in
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
    }
}

#Preview {
    BypassBlocksView()
}
