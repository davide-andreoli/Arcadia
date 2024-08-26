//
//  EmbeddingDictionary.swift
//  Arcadia
//
//  Created by Davide Andreoli on 26/08/24.
//

import Foundation
import CreateML
import SQLite3
import NaturalLanguage

func openDatabase() -> OpaquePointer? {
    guard let fileURL = URL(string: "../ArcadiaApp/Arcadia/openvgdb.sqlite") else {
        print("Database file not found.")
        return nil
    }
    print("Database file path: \(fileURL.path)")
    
    var db: OpaquePointer? = nil
    if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
        debugPrint("Cannot open DB. Error: \(String(cString: sqlite3_errmsg(db)))")
        return nil
    } else {
        print("DB successfully opened.")
        return db
    }
}

func queryAllStrings() -> [String]? {
    guard let db = openDatabase() else { return nil }
    defer { sqlite3_close(db) }
    
    let genresStatementString = """
        SELECT DISTINCT
            UPPER(releaseGenre) AS releaseGenre
        FROM releases
    """
    
    var genresStatement: OpaquePointer? = nil
    var releaseGenres = [String]()
    
    if sqlite3_prepare_v2(db, genresStatementString, -1, &genresStatement, nil) == SQLITE_OK {
        while sqlite3_step(genresStatement) == SQLITE_ROW {
            let releaseGenre = sqlite3_column_text(genresStatement, 0) != nil ? String(cString: sqlite3_column_text(genresStatement, 0)) : ""
            releaseGenres.append(releaseGenre)
        }
        sqlite3_finalize(genresStatement)
        
    } else {
        let errmsg = String(cString: sqlite3_errmsg(db))
        print("Error preparing SELECT statement: \(errmsg)")
    }

    let descriptionsStatementString = """
        SELECT DISTINCT
            releaseDescription
        FROM releases
    """
    
    var descriptionsStatement: OpaquePointer? = nil
    var releaseDescriptions = [String]()
    
    if sqlite3_prepare_v2(db, descriptionsStatementString, -1, &descriptionsStatement, nil) == SQLITE_OK {
        while sqlite3_step(descriptionsStatement) == SQLITE_ROW {
            let releaseDescription = sqlite3_column_text(descriptionsStatement, 0) != nil ? String(cString: sqlite3_column_text(descriptionsStatement, 0)) : ""
            releaseDescriptions.append(releaseDescription)
        }
        sqlite3_finalize(descriptionsStatement)
        
    } else {
        let errmsg = String(cString: sqlite3_errmsg(db))
        print("Error preparing SELECT statement: \(errmsg)")
    }
    
    releaseGenres.append(contentsOf: releaseDescriptions)

    return releaseGenres
}

let strings = queryAllStrings()
var dictionary: [String : [Double]] = [:]

if let embedding = NLEmbedding.sentenceEmbedding(for: .english) {
   for string in strings! {
        if let vector = embedding.vector(for: string) {
            dictionary[string] = vector
        }
   }
   
}

let wordEmbedding = try! MLWordEmbedding(dictionary: dictionary)
try wordEmbedding.write(toFile: "../ArcadiaApp/Arcadia/MLModels/WordEmbedding.mlmodel")