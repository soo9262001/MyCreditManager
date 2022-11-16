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
    
    /// 메뉴 고르기
    func selectMenu() {
        print(Message.selectMessage)
        let input = readLine();
        if let input = input {
            switch input {
            case "1": addStudent()
            case "2": deleteStudent()
            case "3": addGrades()
            case "4": deleteGrades()
            case "5": showAverage()
            case "X": exit()
            default: wrongInput()
            }
        }
    }

    /// 학생 명단 추가
    func addStudent() {
        print(Message.addStudentMessage)
        let input = readLine();
        if let studentName = input?.trimmingCharacters(in: .whitespaces).uppercased() {
            if studentName.isEmpty {
                print(Message.inputErrorMessage)
            } else {
                if studentNameList.contains(studentName) {
                    print("\(studentName)은 이미 존재하는 학생입니다. 추가하지 않습니다")
                } else {
                    print("\(studentName) 학생을 추가했습니다.")
                    studentNameList.append(studentName)
                }
            }
            selectMenu()
        }
    }

    /// 학생 명단 삭제
    func deleteStudent() {
        print(Message.deleteStudentMessage)
        let input = readLine();
        if let studentName = input?.trimmingCharacters(in: .whitespaces) {
            if studentName.isEmpty {
                print(Message.inputErrorMessage)
            } else {
                if studentNameList.contains(studentName) {
                    print("\(studentName) 학생을 삭제하였습니다.")
                    // 포스 언래핑
                    studentNameList.remove(at: studentNameList.firstIndex(of: studentName)!)
                } else {
                    print("\(studentName) 학생을 찾지 못했습니다.")
                }
            }
            selectMenu()
        }
    }

    /// 학생 성적 추가
    func addGrades() {
        print(Message.addGradesMessage)
        let input = readLine();
        if let studentGrade = input?.trimmingCharacters(in: .whitespaces).components(separatedBy: " ") {
            if studentGrade.count > 2 {
                print("\(studentGrade[0]) 학생의 \(studentGrade[1]) 과목이 \(studentGrade[2])로 추가(변경)되었습니다.")
                let info = Student(name: studentGrade[0], subject: studentGrade[1], score: studentGrade[2].uppercased())
                studentGradeList.removeAll { $0.name == studentGrade[0] && $0.subject == studentGrade[1] }
                studentGradeList.append(info)
            } else {
                print(Message.inputErrorMessage)
            }
            selectMenu()
        }
    }

    /// 학생 성적 삭제
    func deleteGrades() {
        print(Message.deleteStudentMessage)
        let input = readLine();
        if let studentGrade = input?.trimmingCharacters(in: .whitespaces).components(separatedBy: " ") {
            if studentGrade.count > 1 {
                if studentGradeList.contains(where: { $0.name == studentGrade[0] && $0.subject == studentGrade[1] }) {
                    print("\(studentGrade[0]) 학생의 \(studentGrade[1]) 과목의 성적이 삭제되었습니다.")
                    studentGradeList.removeAll { $0.name == studentGrade[0] && $0.subject == studentGrade[1] }
                } else {
                    print("\(studentGrade[0]) 학생을 찾지 못했습니다.")
                }
            } else {
                print(Message.inputErrorMessage)
            }
            selectMenu()
        }
    }

    /// 학생 성적 평균 보기
    func showAverage() {
        print(Message.showAverageMessage)
        let input = readLine();
        if let studentName = input?.trimmingCharacters(in: .whitespaces), !studentName.isEmpty {
            if studentGradeList.contains(where: { $0.name == studentName }) {
                let data = studentGradeList.filter { $0.name == studentName }
                var average: Double = 0
                for i in data {
                    print("\(i.subject): \(i.doubleGrade)")
                    average += i.doubleGrade
                }
                average = round(average / Double(data.count) * 100) / 100
                print("평점: \(average)")
            } else {
                print("\(studentName) 학생을 찾지 못했습니다.")
            }
        } else {
            print(Message.inputErrorMessage)
        }
        selectMenu()
    }

    /// 종료
    func exit() {
        print(Message.exitMessage)
        Darwin.exit(0)
    }

    /// 입력오류
    func wrongInput() {
        print(Message.selectErrorMessage)
        selectMenu()
    }
}
