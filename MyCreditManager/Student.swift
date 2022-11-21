//
//  Student.swift
//  MyCreditManager
//
//  Created by Soo on 2022/11/16.
//

import Foundation

struct Student: Equatable {
    /// 이름
    var name: String
    /// 과목
    var subject: String?
    /// 등급
    var grade: String?
    /// 등급별 점수
    var doubleGrade: Double {
        switch grade {
        case "A+": return 4.5
        case "A": return 4.0
        case "B+": return 3.5
        case "B": return 3.0
        case "C+": return 2.5
        case "C": return 2.0
        case "D+": return 1.5
        case "D": return 1
        default: return 0
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, subject: String, grade: String) {
        self.name = name
        self.subject = subject
        self.grade = grade
    }
}

extension Student {
    static func ==(lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name
    }
}
