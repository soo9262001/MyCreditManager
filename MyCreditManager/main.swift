//
//  main.swift
//  MyCreditManager
//
//  Created by Soo on 2022/11/15.
//

import Foundation

let myCreditManager = MyCreditManager()

while true {
    print(Message.selectMessage)
    let input = readLine();
    if let input = input?.uppercased() {
        switch input {
        case "1":
            print(Message.addStudentMessage)
            let input = readLine();
            if let studentName = input?.trimmingCharacters(in: .whitespaces) {
                if studentName.isEmpty {
                    print(Message.inputErrorMessage)
                    break
                }
                let result = myCreditManager.addStudent(name: studentName)
                switch result {
                case .success(_): print("\(studentName) 학생을 추가했습니다.")
                case .failure(.isStudent): print("\(studentName)은 이미 존재하는 학생입니다. 추가하지 않습니다")
                default: break
                }
            }
        case "2":
            print(Message.deleteStudentMessage)
            let input = readLine();
            if let studentName = input?.trimmingCharacters(in: .whitespaces) {
                if studentName.isEmpty {
                    print(Message.inputErrorMessage)
                    break
                }
                let result = myCreditManager.deleteStudent(name: studentName)
                switch result {
                case .success(_): print("\(studentName) 학생을 삭제하였습니다.")
                case .failure(.noFoundStudent): print("\(studentName) 학생을 찾지 못했습니다.")
                default: break
                }
            }
        case "3":
            print(Message.addGradesMessage)
            let input = readLine();
            if let studentGrade = input?.trimmingCharacters(in: .whitespaces).components(separatedBy: " ") {
                if studentGrade.count < 3 {
                    print(Message.inputErrorMessage)
                    break
                } else {
                    let result = myCreditManager.addGrades(name: studentGrade[0], subject: studentGrade[1], grade: studentGrade[2])
                    switch result {
                    case .success(_): print("\(studentGrade[0]) 학생의 \(studentGrade[1]) 과목이 \(studentGrade[2].uppercased())로 추가(변경)되었습니다.")
                    case .failure(.noFoundStudent): print("\(studentGrade[0]) 학생을 찾지 못했습니다.")
                    default: break
                    }
                }
            }
        case "4":
            print(Message.deleteGradesMessage)
            let input = readLine();
            if let studentGrade = input?.trimmingCharacters(in: .whitespaces).components(separatedBy: " ") {
                if studentGrade.count < 2 {
                    print(Message.inputErrorMessage)
                    break
                }
                let result = myCreditManager.deleteStudent(name: studentGrade[0])
                switch result {
                case .success(_): print("\(studentGrade[0]) 학생의 \(studentGrade[1]) 과목의 성적이 삭제되었습니다.")
                case .failure(.noFoundStudent): print("\(studentGrade[0]) 학생을 찾지 못했습니다.")
                default: break
                }
            }
        case "5":
            print(Message.showAverageMessage)
            let input = readLine();
            if let studentName = input?.trimmingCharacters(in: .whitespaces) {
                if studentName.isEmpty {
                    print(Message.inputErrorMessage)
                    break
                }
                let result = myCreditManager.showAverage(name: studentName)
                switch result {
                case .success(let data):
                    var average: Double = 0
                    for i in data {
                        guard let subject = i.subject else { break }
                        print("\(subject): \(i.doubleGrade)")
                        average += i.doubleGrade
                    }
                    average = round(average / Double(data.count) * 100) / 100
                    print("평점: \(average)")
                case .failure(.noFoundStudent): print("\(studentName) 학생을 찾지 못했습니다.")
                default: break
                }
            }
        case "X": myCreditManager.exit()
        default: myCreditManager.wrongInput()
        }
    }
}
