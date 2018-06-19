//
//  VideoPlayerProtocols.swift
//  fschool_ios
//
//  Created Ilya Glazunov on 14/06/2018.
//  Copyright © 2018 Altarix. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation
import AVFoundation

//MARK: Wireframe -
protocol VideoPlayerWireframeProtocol: class {

}
//MARK: Presenter -
protocol VideoPlayerPresenterProtocol: class {

    var interactor: VideoPlayerInteractorInputProtocol? { get set }
    func getTimeString(from time: CMTime) -> String
    func onSettingButtonClick()
    func viewDidLoadWith(url: URL?)
}

//MARK: Interactor -
protocol VideoPlayerInteractorOutputProtocol: class {
    func onParseUrlSuccess(preferredResolutionUrl: URL)
    func onParseUrlError(_ error: Error)
    /* Interactor -> Presenter */
}

protocol VideoPlayerInteractorInputProtocol: class {

    var presenter: VideoPlayerInteractorOutputProtocol?  { get set }
    var urls: [VideoPlayerInteractor.Resolution: URL] { get set }
    
    func chooseResolution(_ resolution: VideoPlayerInteractor.Resolution)
    func parsePlaylistWithUrl(_ url: URL)
    func getPreferredResolutionUrl() -> URL 
    /* Presenter -> Interactor */
}

//MARK: View -
protocol VideoPlayerViewProtocol: class {
    
    var presenter: VideoPlayerPresenterProtocol?  { get set }
    //var playlistUrl: URL? { get set }
    
    func showVariants(title: String, cancelText: String, variants: [(text: String, action: ((CustomAlertAction) ->Void)?)])
    func playVideoWithUrl(_ url: URL)
    
    func showError(_ error: Error)
    /* Presenter -> ViewController */
}
