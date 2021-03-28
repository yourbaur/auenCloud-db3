//
//  DateFormatConfiguration.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation

class DateFormatConfiguration {
    static var shared = DateFormatConfiguration()
    
    
    func dateStringSplit(date: String) -> [String] {
        var dateList: [String] = []
        var dateString = ""
        print(date)
        
        for character in date {
            if character == "-"{
                dateList.append(dateString)
                dateString = ""
            } else {
                dateString += String(character)
            }
        }
        dateList.append(dateString)
        
        return dateList
    }
    
    func getMonthIndex(index: String) -> Int {
        let monthIndex = ((Int(index.prefix(1)) ?? 1) * 10) + (Int(index.suffix(1)) ?? 1)
        
        return monthIndex
    }
    
    func getMonthInShortString(index: Int) -> String {
        let monthList = ["янв.", "фев.", "мар.", "апр.", "май.", "июнь", "июль", "авг.", "сен.", "окт.", "нояб.", "дек."]
        
        let month = monthList[index - 1]
        
        return month

    }
    
    func getMonthInString(index: Int) -> String {
        let monthList = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]
        
        let month = monthList[index - 1]
        
        return month
    }
    
    func getStringMonthIndex(month: String) -> String {
        var monthIndex = String()
        let monthList = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]
        
        for index in 0 ..< monthList.count {
            if month == monthList[index] {
                if String(index).count == 1 {
                    monthIndex = "0\(String(index + 1))"
                } else {
                    monthIndex = "\(index + 1)"
                }
            }
        }
        
        return monthIndex
    }
}

class AgeConfiguration {
    static var shared = AgeConfiguration()
    
    func getAgeFrom(birthdate: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        let date = formatter.date(from: birthdate)!
        let now = Date()
        let birthday: Date = date
        let calendar = Calendar.current
        
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        let age = ageComponents.year!

        return "\(age)"
    }

    func getValidateBirthday(date: Date) -> Bool {

        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let currentDate = Date()
        if currentDate >= date {
            return true
        } else {
            return false
        }
    }

    func getValidateEventDay(date: Date) -> Bool {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let currentDate = Date()
        if currentDate <= date {
            return true
        } else {
            return false
        }
        
    }

}
