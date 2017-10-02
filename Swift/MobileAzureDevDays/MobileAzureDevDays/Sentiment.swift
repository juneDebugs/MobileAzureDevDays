//
//  Sentiment.swift
//  MobileAzureDevDays
//
//  Created by Colby Williams on 9/22/17.
//  Copyright © 2017 Colby Williams. All rights reserved.
//

import Foundation
import UIKit

enum Sentiment: Double {
	
	case Damn		= 0.1
	case Lowest 	= 0.2
	case Lower		= 0.3
	case Low		= 0.4
	case Neutral	= 0.6
	case High		= 0.7
	case Higher		= 0.8
	case Highest	= 0.9
	case Whoop		= 1.0
	
	
	var color: UIColor {
		switch self {
			case .Damn:		return #colorLiteral(red: 0.4980392157, green: 0.07843137255, blue: 0.2156862745, alpha: 1)
			case .Lowest:	return #colorLiteral(red: 0.6901960784, green: 0.1098039216, blue: 0.2549019608, alpha: 1)
			case .Lower:	return #colorLiteral(red: 0.7960784314, green: 0.2, blue: 0.3490196078, alpha: 1)
			case .Low:		return #colorLiteral(red: 0.8, green: 0.1764705882, blue: 0.4, alpha: 1)
			case .Neutral:	return #colorLiteral(red: 0.2392156863, green: 0.5058823529, blue: 0.8705882353, alpha: 1)
			case .High:		return #colorLiteral(red: 0.1294117647, green: 0.537254902, blue: 0.2745098039, alpha: 1)
			case .Higher:	return #colorLiteral(red: 0.1803921569, green: 0.6117647059, blue: 0.3725490196, alpha: 1)
			case .Highest:	return #colorLiteral(red: 0.1960784314, green: 0.7803921569, blue: 0.4549019608, alpha: 1)
			case .Whoop:	return #colorLiteral(red: 0.1647058824, green: 0.9176470588, blue: 0.5803921569, alpha: 1)
		}
	}
	
	var emoji: String {
		switch self {
			case .Damn, .Lowest, .Lower, .Low:
				return "☹️"
			case .Neutral:
				return "😐"
			case .High, .Higher, .Highest, .Whoop:
				return "😃"
		}
	}
	
	static func getSentiment(_ val: Double?) -> Sentiment? {
		if let val = val {
			switch val {
				case let s where s < 0 || s > 1:					return nil
				case let s where s <= Sentiment.Damn.rawValue:		return .Damn
				case let s where s <= Sentiment.Lowest.rawValue: 	return .Lowest
				case let s where s <= Sentiment.Lower.rawValue:		return .Lower
				case let s where s <= Sentiment.Low.rawValue:		return .Low
				case let s where s <= Sentiment.Neutral.rawValue:	return .Neutral
				case let s where s <= Sentiment.High.rawValue:		return .High
				case let s where s <= Sentiment.Higher.rawValue:	return .Higher
				case let s where s <= Sentiment.Highest.rawValue:	return .Highest
				case let s where s <= Sentiment.Whoop.rawValue:		return .Whoop
				default: return nil
			}
		} else {
			return nil
		}
	}
}
