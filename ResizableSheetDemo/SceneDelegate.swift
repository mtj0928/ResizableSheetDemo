//
//  SceneDelegate.swift
//  ResizableSheetDemo
//
//  Created by Junnosuke Matsumoto on 2021/09/17.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: RootView(windowScene: windowScene))
        self.window = window
        window.makeKeyAndVisible()
    }
}
