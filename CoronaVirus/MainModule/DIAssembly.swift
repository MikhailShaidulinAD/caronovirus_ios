//
//  DIAssembly.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 17.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation
import EasyDi

class DIAssembly: Assembly {
    
    
    var api: APIService {
        return define(scope: .lazySingleton, init: APIService()) {
            return $0
        }
    }
    
    var dataStoresList:AppDataStories {
        return define(scope: .lazySingleton, init: AppDataStories()) {
            return $0
        }
    }
}
