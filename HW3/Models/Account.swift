//
//  Account.swift
//  HW3
//
//  Created by Nikita Zharinov on 06/02/2021.
//

struct Account {
    var loginName: String
    let password: String
    let person: Person
}

struct Person {
    let personName: String
    let personSurname: String
    let work: Company
    let hobby: [Hobby]
}

struct Company {
    let companyName: String
    let jobTitle: String
    let contactDetail: String
}

struct Hobby {
    let hobbyDescription: String
    let hobbyImage: String
}

func getAccount() -> Account{
    Account(loginName: "User",
            password: "Password",
            person: Person(personName: "Nikita",
                   personSurname: "Zharinov",
                   work: Company(companyName: "IBM",
                                 jobTitle: "Employee",
                                 contactDetail: "info@ibm.ru"),
                   hobby: [
                    Hobby(hobbyDescription: "Лучше гор могут быть только горы", hobbyImage: "1.png"),
                    Hobby(hobbyDescription: "Гитара - это для души", hobbyImage: "2.png")
                   ])
    )
}
