//
//  DownloadingImageViewModel_Tests.swift
//  FetchAssignment_Tests
//
//  Created by Sai Jannali on 1/24/23.
//

import XCTest
@testable import FetchAssignment

final class DownloadingImageViewModel_Tests: XCTestCase {
    var vm: DownloadingImageViewModel?
    let testURL: String = "https://themealdb.com/api/json/v1/1/lookup.php?i=53049"
    let testKey: String = "testKey"
    let testImg: UIImage? = UIImage(systemName: "pencil")

    override func setUpWithError() throws {
        guard let testImg = testImg else {return}
        ImageCacheManager.instance.add(key: testKey, value: testImg)
        vm = DownloadingImageViewModel(url: testURL, key: testKey)
        
    }

    override func tearDownWithError() throws {
        ImageCacheManager.instance.imageCache.removeObject(forKey: testKey as NSString)
    }
    
    func test_DownloadingImageViewModel_image_isNotNil(){
        //Given
        guard let vm = vm else {
            XCTFail()
            return
        }
        
        //Then
        XCTAssertNotNil(vm.image)
    }
    
    func test_DownloadingImageViewModel_isLoading_startsAsFalse(){
        //Given
        guard let vm = vm else {
            XCTFail()
            return
        }
        
        //Then
        XCTAssertFalse(vm.isLoading)
    }
    
    func test_DownloadingImageViewModel_cancellables_isEmpty(){
        //Given
        guard let vm = vm else {
            XCTFail()
            return
        }
        
        //Then
        XCTAssertEqual(vm.cancellables.count, 0)
    }
}
