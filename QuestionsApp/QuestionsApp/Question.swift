//
//  Question.swift
//  QuestionsApp
//
//  Created by Long Sun on 25/03/2015.
//  Copyright (c) 2015 Sunlong. All rights reserved.
//

import UIKit

class Question {
    var floor: Int
    var ceiling: Int
    
    init(floor: Int, ceiling: Int) {
        self.floor = floor
        self.ceiling = ceiling
    }
    
    func answerCount() -> Int {
        return ceiling - floor + 1
    }
}
