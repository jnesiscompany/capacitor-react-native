//
//  NavPlugin.swift
//  App
//
//  Created by Léopold Trouillet on 03/07/2024.
//

import Foundation
import Capacitor
import React
import os

@objc(RnPlugin)
public class RnPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "RnPlugin"
    public let jsName = "RnPlugin"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "openView", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "setDevBundleUrl", returnType: CAPPluginReturnPromise)
    ]

    private var devBundleUrl: URL?
    
    @objc func setDevBundleUrl(_ call: CAPPluginCall) {
        guard let urlString = call.getString("url") else {
            call.reject("URL string is required")
            return
        }

        guard let url = URL(string: urlString) else {
            call.reject("Invalid URL string")
            return
        }

        self.devBundleUrl = url
        call.resolve()
    }

    @objc func openView(_ call: CAPPluginCall) {

        DispatchQueue.main.async { [weak self] in
            let jsCodeLocation: URL
            
            #if DEBUG
            if let devUrl = self?.devBundleUrl {
                jsCodeLocation = devUrl
            } else {
                call.reject("Development bundle URL not set. Call setDevBundleUrl first.")
                return
            }
            #else
            guard let bundleUrl = Bundle.main.url(forResource: "main", withExtension: "jsbundle") else {
                call.reject("Could not find main.jsbundle")
                return
            }
            jsCodeLocation = bundleUrl
            #endif
     
            let rootView = RCTRootView(
                bundleURL: jsCodeLocation,
                moduleName: "RnHelloWorldApp",
                initialProperties: [:],
                launchOptions: nil
            )
            let vc = UIViewController()
            vc.view = rootView
            
            self?.bridge?.viewController?.present(vc, animated: true, completion: nil)
            
            call.resolve()
        }
    }
}
