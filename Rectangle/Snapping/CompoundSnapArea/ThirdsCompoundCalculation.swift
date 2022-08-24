//
//  ThirdsCompoundCalculation.swift
//  Rectangle
//
//  Created by Ryan Hanson on 8/23/22.
//  Copyright © 2022 Ryan Hanson. All rights reserved.
//

import Foundation

struct ThirdsCompoundCalculation: CompoundSnapAreaCalculation {
    
    func snapArea(cursorLocation loc: NSPoint, screen: NSScreen, priorSnapArea: SnapArea?) -> SnapArea? {
        let frame = screen.frame
        let thirdWidth = floor(frame.width / 3)
        if loc.x >= frame.minX && loc.x <= frame.minX + thirdWidth {
            return SnapArea(screen: screen, action: .firstThird)
        }
        if loc.x >= frame.minX + thirdWidth && loc.x <= frame.maxX - thirdWidth{
            if let priorAction = priorSnapArea?.action {
                let action: WindowAction
                switch priorAction {
                case .firstThird, .firstTwoThirds:
                    action = .firstTwoThirds
                case .lastThird, .lastTwoThirds:
                    action = .lastTwoThirds
                default: action = .centerThird
                }
                return SnapArea(screen: screen, action: action)
            }
            return SnapArea(screen: screen, action: .centerThird)
        }
        if loc.x >= frame.minX + thirdWidth && loc.x <= frame.maxX {
            return SnapArea(screen: screen, action: .lastThird)
        }
        return nil
    }
    
}

struct PortraitSideThirdsCompoundCalculation: CompoundSnapAreaCalculation {
    
    func snapArea(cursorLocation loc: NSPoint, screen: NSScreen, priorSnapArea: SnapArea?) -> SnapArea? {
        let frame = screen.frame
        let thirdHeight = floor(frame.height / 3)
        if loc.y >= frame.minY && loc.y <= frame.minY + thirdHeight {
            return SnapArea(screen: screen, action: .lastThird)
        }
        if loc.y >= frame.minY + thirdHeight && loc.y <= frame.maxY - thirdHeight {
            if let priorAction = priorSnapArea?.action {
                let action: WindowAction
                switch priorAction {
                case .firstThird, .firstTwoThirds:
                    action = .firstTwoThirds
                case .lastThird, .lastTwoThirds:
                    action = .lastTwoThirds
                default: action = .centerThird
                }
                return SnapArea(screen: screen, action: action)
            }
            return SnapArea(screen: screen, action: .centerThird)
        }
        if loc.y >= frame.minY + thirdHeight && loc.y <= frame.maxY {
            return SnapArea(screen: screen, action: .firstThird)
        }
        return nil
    }

}