//
//  EnliteSensorDisplayable.swift
//  Loop
//
//  Created by Timothy Mecklem on 12/28/16.
//  Copyright © 2016 LoopKit Authors. All rights reserved.
//

import Foundation
import LoopKit
import LoopAlgorithm

struct EnliteSensorDisplayable: Equatable, GlucoseDisplayable {
    public let isStateValid: Bool
    public let trendType: LoopKit.GlucoseTrend?
    public let trendRate: LoopQuantity?
    public let isLocal: Bool
    
    // TODO Placeholder. This functionality will come with LOOP-1311
    var glucoseRangeCategory: GlucoseRangeCategory? {
        return nil
    }

    var glucoseCondition: GlucoseCondition? {
        return nil
    }

    public init(_ event: MinimedKit.RelativeTimestampedGlucoseEvent) {
        isStateValid = event.isStateValid
        trendType = event.trendType
        trendRate = event.trendRate
        isLocal = event.isLocal
    }

    public init(_ status: MySentryPumpStatusMessageBody) {
        isStateValid = status.isStateValid
        trendType = status.trendType
        trendRate = nil
        isLocal = status.isLocal
    }
}

extension MinimedKit.RelativeTimestampedGlucoseEvent {
    var isStateValid: Bool {
        return self is SensorValueGlucoseEvent
    }

    var trendType: LoopKit.GlucoseTrend? {
        return nil
    }

    var trendRate: LoopQuantity? {
        return nil
    }

    var isLocal: Bool {
        return true
    }
}
