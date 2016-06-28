//
//  NSLayoutConstraint+Additions.swift
//
//  Created by Marco Marchesin on 28/06/16.
//  Copyright © 2016 Marco Marchesin. All rights reserved.
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    
    //MARK:- description maps
    
    static func layoutRelationDescriptionsByValue() -> [NSLayoutRelation: String] {
        
        var once: dispatch_once_t!
        var descriptionMap = [NSLayoutRelation: String]()
        
        dispatch_once(&once!) {
            descriptionMap = [
                .Equal : "==",
                .GreaterThanOrEqual : ">=",
                .LessThanOrEqual : "<="
            ]
        }
        
        return descriptionMap
    }
    
    
    static func layoutAttributeDescriptionsByValue() -> [NSLayoutAttribute: String] {
        var once: dispatch_once_t!
        var descriptionMap = [NSLayoutAttribute: String]()
        
        dispatch_once(&once!) {
            descriptionMap = [
                .Top : "top",
                .Left : "left",
                .Bottom : "bottom",
                .Right : "right",
                .Leading : "leading",
                .Trailing : "trailing",
                .Width : "width",
                .Height : "height",
                .CenterX : "centerX",
                .CenterY : "centerY",
                .Baseline : "baseline"
                //            #if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
                //                ,.FirstBaseLine : "firstBaseLine",
                //                .LastBaseLine : "lastBaseLine"
                //            #endif
                //
                //            #if TARGET_OS_IPHONE || TARGET_OS_TV
                //                ,.LeftMargin : "leftMargin",
                //                .RightMargin : "rightMargin",
                //                .TopMargin : "topMargin",
                //                .BottomMargin : "bottomMargin",
                //                .LeadingMargin : "leadingMargin",
                //                .TrailingMargin : "trailingMargin",
                //                .CenterXWithinMargins : "centerXWithinMargins",
                //                .CenterYWithinMargins : "centerYWithinMargins"
                //            #endif
            ]
        }
        
        return descriptionMap
    }
    
    static func layoutPriorityDescriptionsByValue() -> [UILayoutPriority : String] {
        var once: dispatch_once_t!
        var descriptionMap = [UILayoutPriority: String]()
        
        dispatch_once(&once!) {
            descriptionMap = [
                UILayoutPriorityDefaultHigh : "high",
                UILayoutPriorityDefaultLow : "low",
                500 : "medium",
                UILayoutPriorityRequired : "required",
                UILayoutPriorityFittingSizeLevel : "fitting size"
            ]
        }
        
        return descriptionMap
    }
    
    // MARK:- description override
    
    // can't get the pointers..
    
    //    static func descriptionForObject(obj: AnyClass) -> String {
    //        if obj.respondsToSelector(Selector("accessibilityIdentifier")) {
    //            if let accessibilityIdentifier = (obj as? UIAccessibilityIdentification)?.accessibilityIdentifier {
    //                return "\(NSStringFromClass(obj)):\(accessibilityIdentifier)[\(PointerBridge(obj).getCountPtr())]"
    //            }
    //        }
    //        if obj.respondsToSelector(Selector("identifier")) {
    ////            if let identifier = (obj as? )
    //        }
    //        
    //        return "\(NSStringFromClass(obj)):\(&obj)"
    //    }
    
}
