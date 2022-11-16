//
//  Message.swift
//  MyCreditManager
//
//  Created by Soo on 2022/11/16.
//

import Foundation

struct Message {
    static let inputErrorMessage = "입력이 잘못되었습니다. 다시 확인해주세요."
    static let selectErrorMessage = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
    static let selectMessage = "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
    static let addStudentMessage = "추가할 학생의 이름을 입력해주세요"
    static let deleteStudentMessage = "삭제할 학생의 이름을 입력해주세요"
    static let addGradesMessage = "성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Micky Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다."
    static let deleteGradesMessage = "성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mockey Swift"
    static let showAverageMessage = "평점을 알고싶은 학생의 이름을 입력해주세요"
    static let exitMessage = "프로그램을 종료합니다..."
}
