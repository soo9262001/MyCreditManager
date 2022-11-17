//
//  MyCreditManager.swift
//  MyCreditManager
//
//  Created by Soo on 2022/11/16.
//

import Foundation

class MyCreditManager {
    /// 학생명단 리스트
    var studentNameList: [String] = []
    /// 학생 성적 리스트
    var studentGradeList: [Student] = []
 
    /// 학생명단 추가
    func addStudent(name: String) {
        if studentNameList.contains(name) {
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다")
        } else {
            print("\(name) 학생을 추가했습니다.")
            studentNameList.append(name)
        }
    }

    /// 학생명단 삭제
    func deleteStudent(name: String) {
        if studentNameList.contains(name) {
            print("\(name) 학생을 삭제하였습니다.")
            studentNameList.removeAll(where: { $0 == name })
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }
    
    /// 이름, 과목, 성적 추가
    func addGrades(name: String, subject: String, grade: String) {
        let info = Student(name: name, subject: subject, grade: grade.uppercased())
        studentGradeList.removeAll { $0.name == name && $0.subject == subject }
        studentGradeList.append(info)
        print("\(name) 학생의 \(subject) 과목이 \(grade)로 추가(변경)되었습니다.")

    }
    
    /// 이름, 과목, 성적 삭제
    func deleteGrades(name: String, subject: String) {
        if studentGradeList.contains(where: { $0.name == name && $0.subject == subject }) {
            print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
            studentGradeList.removeAll { $0.name == name && $0.subject == subject }
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }
    
    /// 성적 평균 보기
    func showAverage(name: String) {
        if studentGradeList.contains(where: { $0.name == name }) {
            let data = studentGradeList.filter { $0.name == name }
            var average: Double = 0
            for i in data {
                print("\(i.subject): \(i.doubleGrade)")
                average += i.doubleGrade
            }
            average = round(average / Double(data.count) * 100) / 100
            print("평점: \(average)")
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }

    /// 종료
    func exit() {
        print(Message.exitMessage)
        Darwin.exit(0)
    }

    /// 입력오류
    func wrongInput() {
        print(Message.selectErrorMessage)
    }
}
