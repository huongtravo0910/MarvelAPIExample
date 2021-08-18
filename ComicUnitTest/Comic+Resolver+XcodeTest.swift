//
//  Resolver+XcodeTest.swift
//  ComicUnitTests
//
//  Created by Tra Vo on 08/08/2021.
//

import Resolver
@testable import Marvel_API_Ex_App
extension Resolver {
    // MARK: - Mock Container
    static var mock = Resolver(parent: .main)
    
    // MARK: - Register Mock Services
    static func registerMockServices() {
        root = Resolver.mock
        defaultScope = .application
        
        Resolver.mock.register{MockComicURLComponentsService()}.implements(ComicURLComponentsServiceProtocol.self)
        Resolver.mock.register{NetworkServiceMock()}.implements(NetworkServiceProtocol.self)
        
        Resolver.mock.register{ComicsService()}.implements(ComicsServiceProtocol.self)
        Resolver.mock.register{ComicServiceMock()}.implements(ComicsServiceProtocol.self)
        Resolver.mock.register{ComicViewModel()}
    }
}
