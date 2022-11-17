//
//  main.swift
//  MyCreditManager
//
//  Created by Soo on 2022/11/15.
//

import Foundation

let myCreditManager = MyCreditManager()
//myCreditManager.selectMenu()

while true {
    print(Message.selectMessage)
    let input = readLine();
    if let input = input?.uppercased() {
        switch input {
        case "1":
            print(Message.addStudentMessage)
            let input = readLine();
            if let studentName = input?.trimmingCharacters(in: .whitespaces) {
                studentName.isEmpty ? print(Message.inputErrorMessage) : myCreditManager.addStudent(name: studentName)
            }
        case "2":
            print(Message.deleteStudentMessage)
            let input = readLine();
            if let studentName = input?.trimmingCharacters(in: .whitespaces) {
                studentName.isEmpty ? print(Message.inputErrorMessage) : myCreditManager.deleteStudent(name: studentName)
            }
        case "3":
            print(Message.addGradesMessage)
            let input = readLine();
            if let studentGrade = input?.trimmingCharacters(in: .whitespaces).components(separatedBy: " ") {
                studentGrade.count > 2 ? myCreditManager.addGrades(name: studentGrade[0], subject: studentGrade[1], grade: studentGrade[2]) : print(Message.inputErrorMessage)
                }
        case "4":
            print(Message.deleteGradesMessage)
            let input = readLine();
            if let studentGrade = input?.trimmingCharacters(in: .whitespaces).components(separatedBy: " ") {
                studentGrade.count > 1 ? myCreditManager.deleteGrades(name: studentGrade[0], subject: studentGrade[1]) : print(Message.inputErrorMessage)
                }
        case "5":
            print(Message.showAverageMessage)
            let input = readLine();
            if let studentName = input?.trimmingCharacters(in: .whitespaces) {
                studentName.isEmpty ? print(Message.inputErrorMessage) : myCreditManager.showAverage(name: studentName)
            }
        case "X": myCreditManager.exit()
        default: myCreditManager.wrongInput()
        }
    }
}

