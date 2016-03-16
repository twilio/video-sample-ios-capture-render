//
//  Platform.swift
//  VideoSampleCaptureRender
//
//  Created by Piyush Tank on 3/14/16.
//  Copyright © 2016 Twilio. All rights reserved.
//

import Foundation

struct Platform {
    static let isSimulator: Bool = {
        var isSim = false
        #if arch(i386) || arch(x86_64)
            isSim = true
        #endif
        return isSim
    }()
}