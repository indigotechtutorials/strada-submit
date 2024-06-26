//
//  WebViewController.swift
//  strada-submit
//
//  Created by Indigo Youtube on 5/16/24.
//

import Turbo
import Strada
import WebKit

class WebViewController: VisitableViewController, BridgeDestination {
    private lazy var bridgeDelegate: BridgeDelegate = {
            BridgeDelegate(location: visitableURL.absoluteString,
                           destination: self,
                           componentTypes: BridgeComponent.allTypes)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bridgeDelegate.onViewDidLoad()
    }
    
    
    override func visitableDidRender() {
        title = "Strada Submit"
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       bridgeDelegate.onViewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
       bridgeDelegate.onViewDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       bridgeDelegate.onViewWillDisappear()
    }

    override func viewDidDisappear(_ animated: Bool) {
       super.viewDidDisappear(animated)
       bridgeDelegate.onViewDidDisappear()
    }

    // MARK: Visitable

    override func visitableDidActivateWebView(_ webView: WKWebView) {
       bridgeDelegate.webViewDidBecomeActive(webView)
    }

    override func visitableDidDeactivateWebView() {
       bridgeDelegate.webViewDidBecomeDeactivated()
    }
}
