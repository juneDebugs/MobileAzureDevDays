//
//  SentimentDoc.swift
//  MobileAzureDevDays
//
//  Created by Colby Williams on 9/23/17.
//  Copyright © 2017 Colby Williams. All rights reserved.
//

import Foundation

class SentimentResponse {
	
	let errorsKey = "errors"
	let documentsKey = "documents"
	let errorMessageKey = "message"
	let errorStatusCodeKey = "statusCode"
	
	var errors = [SentimentError]()
	var documents = [SentimentDocument]()
	
	var errorMessage:String?
	var errorStatusCode:Int?
	
	var hasErrors: Bool { return !errors.isEmpty }
	var hasDocuments: Bool { return !documents.isEmpty }

	init(fromJson dict: [String:Any]) {
		if let errorsDict = dict[errorsKey] as? [[String:Any]] {
			for errorDict in errorsDict {
				if let error = SentimentError(fromJson: errorDict) {
					self.errors.append(error)
				}
			}
		}
		if let documentsDict = dict[documentsKey] as? [[String:Any]] {
			for documentDict in documentsDict {
				if let document = SentimentDocument(fromJson: documentDict) {
					self.documents.append(document)
				}
			}
		}
		if let errorMessage = dict[errorMessageKey] as? String, let errorStatusCode = dict[errorStatusCodeKey] as? Int {
			self.errorMessage = errorMessage
			self.errorStatusCode = errorStatusCode
		}
	}
}

class SentimentError {
	let idKey = "id"
	let messageKey = "message"
	
	var id:String!
	var message:String!
	
	init?(fromJson dict: [String:Any]) {
		if let id = dict[idKey] as? String, let message = dict[messageKey] as? String {
			self.id = id
			self.message = message
		} else {
			return nil
		}
	}
}

class SentimentDocument {
	let idKey = "id"
	let scoreKey = "score"
	
	var id:String!
	var score:Double!
	
	init?(fromJson dict: [String:Any]) {
		if let id = dict[idKey] as? String, let score = dict[scoreKey] as? Double {
			self.id = id
			self.score = score
		} else {
			return nil
		}
	}
}

