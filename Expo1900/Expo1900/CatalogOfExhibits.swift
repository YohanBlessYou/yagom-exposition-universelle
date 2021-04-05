//
//  CatalogOfExhibits.swift
//  exposition-universelle
//
//  Created by 강경 on 2021/04/05.
//

import Foundation

class CatalogOfExhibits {
  private let catalogOfExhibits: Catalog
  
  init() throws {
    guard let path = Bundle.main.path(forResource: "Catalog", ofType: "json") else {
      throw CatalogError.canNotFindJSONPath
    }
    guard let jsonData = try? String(contentsOfFile: path).data(using: .utf8) else {
      throw CatalogError.failedToConvertJSONAsDataFormat
    }
    guard let unwrappedCatalog = try? JSONDecoder().decode(Catalog.self, from: jsonData) else {
      throw CatalogError.nilHasOccurredWhileUnwrappingCatalog
    }

    self.catalogOfExhibits = unwrappedCatalog

//    command-line 테스트용 코드
//    let jsonData = Data(jsonString.utf8)
//    self.catalogOfExhibits = try! JSONDecoder().decode(Catalog.self, from: jsonData)
  }
  
  func showSummary() -> [EntryWork] {
    return catalogOfExhibits.catalog
  }
  
  func showDetails(name: String) -> EntryWork? {
    let entryWork: EntryWork
    
    for catalog in catalogOfExhibits.catalog {
      if catalog.name == name {
        entryWork = catalog
        return entryWork
      }
    }
    
    return nil
  }
}
