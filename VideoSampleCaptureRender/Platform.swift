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
    
    static let lowPerformanceDevices : Array<String> =
        [ "iPod1,1", "iPod2,1", "iPod3,1", "iPod4,1", "iPod5,1",
          "iPhone1,1", "iPhone1,2", "iPhone2,1", "iPhone3,1", "iPhone4,1",
          "iPad1,1", "iPad2,1", "iPad2,4", "iPad2,5", "iPad2,6", "iPad2,7",
          "iPad3,1", "iPad3,4", "iPhone5,1", "iPhone5,2"]
    
    static let isLowPerformanceDevice: Bool = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 where value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return lowPerformanceDevices.contains(identifier)
    }()
}