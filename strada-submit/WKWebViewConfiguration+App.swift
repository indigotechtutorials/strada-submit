//
//  WKWebViewConfiguration+App.swift
//  strada-submit
//
//  Created by Indigo Youtube on 5/16/24.
//

import Foundation
import Strada
import WebKit

extension WKWebViewConfiguration {
    static var appConfiguration: WKWebViewConfiguration {
        let stradaSubstring = Strada.userAgentSubstring(for: BridgeComponent.allTypes)
        let userAgent = "Turbo Native iOS \(stradaSubstring)"

        let configuration = WKWebViewConfiguration()
        configuration.applicationNameForUserAgent = userAgent

        return configuration
    }
}
