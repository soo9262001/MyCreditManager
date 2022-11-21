//
//  MyCreditManager.swift
//  MyCreditManager
//
//  Created by Soo on 2022/11/16.
//

import Foundation

enum StudentError: Error {
    case isStudent
    case noFoundStudent
}

class MyCreditManager {
    /// 학생 리스트
    var studentList: [Student] = []
 
    /// 학생 이름 추가
    func addStudent(name: String) -> Result<Student, StudentError>{
        if studentList.filter({ $0.name == name}).count > 0 {
            return .failure(.isStudent)
        }
        studentList.append(Student(name: name))
        return .success(Student(name: name))
    }

    /// 학생 이름 삭제
    func deleteStudent(name: String) -> Result<Student, StudentError>{
        if studentList.filter({ $0.name == name }).count > 0 {
            studentList.removeAll(where: { $0.name == name })
            return .success(Student(name: name))
        }
        return .failure(.noFoundStudent)
    }
    
    /// 이름, 과목, 성적 추가
    func addGrades(name: String, subject: String, grade: String) -> Result<Student, StudentError> {
        if grade != "" {
            let info = Student(name: name, subject: subject, grade: grade.uppercased())
            studentList.removeAll { $0.name == name && ($0.subject == subject || $0.subject == nil) }
            studentList.append(info)
            return .success(info)
        }
        return .failure(.noFoundStudent)

    }
    
    /// 이름, 과목, 성적 삭제
    func deleteGrades(name: String, subject: String) -> Result<Student, StudentError>{
        if studentList.contains(where: { $0.name == name && $0.subject == subject }) {
            studentList.removeAll { $0.name == name && $0.subject == subject }
            return .success(Student(name: name))
        }
        return .failure(.noFoundStudent)
    }
    
    /// 성적 평균 보기
    func showAverage(name: String) -> Result<[Student], StudentError> {
        if studentList.contains(where: { $0.name == name && $0.subject != nil }) {
            let data = studentList.filter { $0.name == name }
            return .success(data)
        }
        return .failure(.noFoundStudent)
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
