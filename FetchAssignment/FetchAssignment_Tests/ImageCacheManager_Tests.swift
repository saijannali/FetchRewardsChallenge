//
//  ImageCacheManager_Tests.swift
//  FetchAssignment_Tests
//
//  Created by Sai Jannali on 1/23/23.
//

import XCTest
@testable import FetchAssignment

final class ImageCacheManager_Tests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
        let testKey = "testKey"
        if let _ = ImageCacheManager.instance.get(key: testKey){
            ImageCacheManager.instance.imageCache.removeObject(forKey: testKey as NSString)
        }
    }
    
    func test_ImageCacheManager_imageCache_countIsLessThan200() {
        //Then
        XCTAssertLessThanOrEqual(ImageCacheManager.instance.imageCache.countLimit, 100)
    }
    
    func test_ImageCacheManager_imageCache_totalCostLimitIsLessThan200mb() {
        //Given
        let mbLimit = 1024 * 1024 * 200
        
        //Then
        XCTAssertLessThanOrEqual(ImageCacheManager.instance.imageCache.totalCostLimit, mbLimit)
    }
    
    func test_ImageCacheManager_add_shouldAddImageToCache() {
        //Given
        let value = UIImage(systemName: "pencil")
        let key = "testKey"
        
        //When
        if let value = value{
            ImageCacheManager.instance.add(key: key, value: value)
        } else{
            XCTFail()
        }
        
        //Then
        let res = ImageCacheManager.instance.get(key: key)
        XCTAssertNotNil(res)
        XCTAssertEqual(value, res)
    }
    
    func test_ImageCacheManager_get_shouldGetImageToCache() {
        //Given
        let value = UIImage(systemName: "pencil")
        let key = "testKey"
        
        //When
        if let value = value{
            ImageCacheManager.instance.add(key: key, value: value)
        } else{
            XCTFail()
        }
        
        //Then
        guard let res = ImageCacheManager.instance.get(key: key) else {
            XCTFail()
            return
        }
        XCTAssertEqual(value, res)
    }
}
