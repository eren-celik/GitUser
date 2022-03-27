//
//  MainViewModel+Tests.swift
//  guTests
//
//  Created by Eren  Çelik on 22.03.2022.
//

import XCTest
import Moya
@testable import gu

final class MainViewModelTest: XCTestCase {
    
    private var view: MockView!
    private var sut: MainViewViewModel!
    private var manager: NetworkManager!
    private var provider: MoyaProvider<GuAPI>!
    
    override func setUp() {
        super.setUp()
        manager = NetworkManager()
        sut = MainViewViewModel(network: manager)
        view = MockView()
        sut.delegate = view
    }

    override func tearDown() {
        super.tearDown()
        provider = nil
    }
    
    func test_getUsers_shouldBe_Completed() {
        //Given
        provider = StubProvider.succes.provider
        manager.provider = provider
        
        //When
        sut.getUsers()
        
        //Then
        _ = XCTWaiter.wait(for: [expectation(description: "Wait async Operation queue")], timeout: 5.0)
        XCTAssertEqual(view.invokedHandleOutputsParameters?.0, MainViewOutputs.onFetchCompleted)
        
    }
    
    func test_getUsers_shouldBe_ShowError() {
        //Given
        provider = StubProvider.empty.provider
        manager.provider = provider
        
        //When
        sut.getUsers()
        
        //Then
        XCTAssertEqual(view.invokedHandleOutputsParameters?.0, MainViewOutputs.showAlert("Decode Error"))
        
    }
    
    func test_loadMoreUsers_shouldBe_GetMoreUsers() {
        //Given
        provider = StubProvider.succes.provider
        manager.provider = provider
        
        //When
        sut.loadMoreUsers()
        
        //Then
        XCTAssertEqual(view.invokedHandleOutputsParameters?.0, MainViewOutputs.addIndicator(true))
        
    }
    
}

private class MockView: MainViewDelegate {

    var invokedHandleOutputs = false
    var invokedHandleOutputsCount = 0
    var invokedHandleOutputsParameters: (output: MainViewOutputs, Void)?
    var invokedHandleOutputsParametersList = [(output: MainViewOutputs, Void)]()

    func handleOutputs(_ output: MainViewOutputs) {
        invokedHandleOutputs = true
        invokedHandleOutputsCount += 1
        invokedHandleOutputsParameters = (output, ())
        invokedHandleOutputsParametersList.append((output, ()))
    }
}
