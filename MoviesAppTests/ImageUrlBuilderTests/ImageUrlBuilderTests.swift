//
//  ImageUrlBuilderTests.swift
//  MoviesAppTests
//
//  Created by AhmedFitoh on 7/29/21.
//

import XCTest
@testable import MoviesApp

class ImageUrlBuilderTests: XCTestCase {
    
    func testEmptyImagePath() throws {
        let imageUrl = ImageUrlBuilder.getUrl(stringUrl: "", size: .original)
        
        XCTAssertNil(imageUrl, "Url should be nil")
    }
    
    func testInvalidImagePath() throws {
        let imageUrl = ImageUrlBuilder.getUrl(stringUrl: nil, size: .original)
        
        XCTAssertNil(imageUrl, "Url should be nil")
    }
    
    func testImageSize() throws {
        let imagesToTest = ImageModel.getImageList()
        for imageModel in imagesToTest{
            let generatedUrl = ImageUrlBuilder.getUrl(stringUrl: imageModel.imageName, size: imageModel.imageSize)
            XCTAssertEqual(generatedUrl,
                           imageModel.expectedUrl,
                           "Url should match")
        }
    }
    
}
