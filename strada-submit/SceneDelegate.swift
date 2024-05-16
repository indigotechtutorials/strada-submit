import UIKit
import Turbo
import WebKit
import Strada

class SceneDelegate: UIResponder, UIWindowSceneDelegate, BridgeDestination {
    var window: UIWindow?
    private lazy var navigationController = UINavigationController()
    let viewController = WebViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        window!.rootViewController = navigationController
        navigationController.pushViewController(viewController, animated: true)
        visit(url: URL(string: "http://localhost:3000")!)
    }
    
    private func visit(url: URL) {
        viewController.visitableURL = url
        session.visit(viewController)
    }
    
    private lazy var session: Session = {
        let webView = WKWebView(frame: .zero,
                                configuration: .appConfiguration)
        Bridge.initialize(webView)
        
        let session = Session(webView: webView)
        session.delegate = self
        return session
    }()
}

extension SceneDelegate: SessionDelegate {
    func session(_ session: Session, didProposeVisit proposal: VisitProposal) {
        visit(url: proposal.url)
    }
    
    func session(_ session: Session, didFailRequestForVisitable visitable: Visitable, error: Error) {
        print("didFailRequestForVisitable: \(error)")
    }
    
    func sessionWebViewProcessDidTerminate(_ session: Session) {
        session.reload()
    }
}
