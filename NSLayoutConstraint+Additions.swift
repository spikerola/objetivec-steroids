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
    
    static func descriptionForObject(obj: AnyObject) -> String {
        if obj.respondsToSelector(Selector("accessibilityIdentifier")) {
            if let accessibilityIdentifier = obj.accessibilityIdentifier {
                return "\(obj.dynamicType):\(accessibilityIdentifier)[\(unsafeAddressOf(obj))]"
            }
        }
        
        if obj.respondsToSelector(Selector("identifier")) {
            if let obj = obj as? UILayoutGuide {
                return "\(obj.dynamicType):\(obj.identifier)[\(unsafeAddressOf(obj))]"
            }
        }
        
        return "\(obj.dynamicType):\(unsafeAddressOf(obj))"
    }
    
    
    public override var description: String {
        get {
            var des = "<"
            
            des += NSLayoutConstraint.descriptionForObject(self)
            
            des += " " + NSLayoutConstraint.descriptionForObject(self.firstItem)
            if self.firstAttribute != .NotAnAttribute {
                des += "." + NSLayoutConstraint.layoutAttributeDescriptionsByValue()[self.firstAttribute]!
            }
            
            des += " " + NSLayoutConstraint.layoutRelationDescriptionsByValue()[self.relation]!
            
            if let secondItem = self.secondItem {
                des += " " + NSLayoutConstraint.descriptionForObject(secondItem)
            }
            if self.secondAttribute != .NotAnAttribute {
                des += "." + NSLayoutConstraint.layoutAttributeDescriptionsByValue()[self.secondAttribute]!
            }
            
            if self.multiplier != 1 {
                des += " * \(self.multiplier)"
            }
            
            if self.secondAttribute == .NotAnAttribute {
                des += " \(self.constant)"
            }
            else if self.constant != 0 {
                des += " \(self.constant < 0 ? "-" : "+") \(abs(self.constant))"
            }
            
            if self.priority != 1000 { // It was UILayoutPriorityRequired but I can't find it
                des += " ^"
                if NSLayoutConstraint.layoutPriorityDescriptionsByValue()[self.priority] == nil {
                    des += "\(self.priority)"
                }
            }
            
            des += ">"
            
            return des
        }
    }
}
