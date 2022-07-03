//
//  Structs.swift
//  UnitConversion
//
//  Created by Michael Danko on 7/3/22.
//
import Foundation

struct Unit: Identifiable, Hashable {
    var id = UUID()
    var singularName: String = ""
    var pluralName: String? = ""
    var abbreviation: String = ""
    
    var isAlwaysSingular: Bool = false
    
    var dynamicLabel: String {
        if self.isAlwaysSingular {
            return singularName
        } else {
            let unwrappedPluralName = pluralName ?? "Unknown"
            return unwrappedPluralName
        }
    }
    
    init(singularName: String, pluralName: String, abbreviation: String) {
        self.singularName = singularName
        self.pluralName = pluralName
        self.abbreviation = abbreviation
        self.isAlwaysSingular = false
    }
    init(singularName: String, abbreviation: String) {
        self.singularName = singularName
        self.pluralName = nil
        self.abbreviation = abbreviation
        self.isAlwaysSingular = true
    }
    init() {
        self.singularName = ""
        self.pluralName = ""
        self.abbreviation = ""
        self.isAlwaysSingular = true
    }
}
