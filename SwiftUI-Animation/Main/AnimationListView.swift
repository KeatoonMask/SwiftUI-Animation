//
//  AnimationList.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 14/9/22.
//

import SwiftUI

struct AnimationListView: View {

    var animationList: AnimationList

    var body: some View {
        NavigationView {
            List(animationList.animations) { animation in
                NavigationLink(destination: AnimationView(view: animation.view)) {
                    AnimationCell(animation: animation)
                }
            }
            .navigationBarTitle("Animations")
        }
    }
}

struct AnimationView: View {

    var view: AnimationViewType
    
    var body: some View {
        switch view {
        case .spinner:
            return AnyView(Spinner())
        case .download:
            return AnyView(DownloadButton())
        case .order:
            return AnyView(OrderButton())
        case .checkmark:
            return AnyView(Checkmark())
        case .password:
            return AnyView(PasswordField())
        case .rec:
            return AnyView(RecButton())
        case .like:
            return AnyView(LikeButton())
        case .audio:
            return AnyView(AudioButton())
        case .stopwatch:
            return AnyView(Stopwatch())
        case .page:
            return AnyView(PageControlPreview())
        case .phone:
            return AnyView(PhoneCallButton(size: 44))
        case .typing:
            return AnyView(TypingIcon().frame(width: 150, height: 150))
        case .reaction:
            return AnyView(ReactionViewContainer())
        case .battery:
            return AnyView(BatteryViewContainer())
        }
    }
}

struct AnimationListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationListView(animationList: MockAnimationService().animationList())
    }
}

