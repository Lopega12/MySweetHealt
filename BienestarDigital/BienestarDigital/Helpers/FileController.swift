//
//  FileController.swift
//  BienestarDigital
//
//  Created by Loren on 11/02/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import Foundation
class FileController{
    var path : URL?
    public func loadDataFromFile()->String{
        var file :String = ""
        do {
            file = try String(contentsOf: path!, encoding: .utf8)
            //print("tamaño del fichero\(file.count)")
        } catch {
            print("Error al leer desde fichero")
        }
        return file
    }
   public func setLocalDirectoryCSV()->String{
        let name = "usage.csv"
        let folder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        path = folder.first?.appendingPathComponent(name)
        print(path!)
        return loadDataFromFile()
    }
}
