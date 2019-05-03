//
//  LoginInteractor.swift
//  TesteSantander
//
//  Created by Rodrigo Martins on 29/04/19.
//  Copyright (c) 2019 Rodrigo Martins. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginBusinessLogic{
    func login(parameter: Dictionary<String, String>)
    func validateFields(user: String?, password: String?)
}

protocol LoginDataStore{
  var userAccount: LoginResponse.AccountData? { get }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore{
    
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    var userAccount: LoginResponse.AccountData?
    var json: Dictionary<String, String> = [:]
    
    // MARK: Do something
    
    private func montaDicionarioDeParametros(user: String?, password: String?) -> Dictionary<String, String>{
        guard let user = user else { return [:] }
        guard let password = password  else { return [:] }
        
        let dicionario: Dictionary<String, String> = [
            "user": user,
            "password": password
        ]
        return dicionario
    }
    
    private func saveDefaultUser(user: String?) {
        if let user = user {
            UserDefaults.standard.set(user, forKey: "user")
        }
    }
    
   func login(parameter: Dictionary<String, String>){
        worker = LoginWorker()
        if let worker = worker {
            worker.validateLogin(parameters: parameter, responseRequest: { response in
                self.userAccount = response.userAccount
                self.saveDefaultUser(user: self.json["user"])
                if let presenter = self.presenter {
                    presenter.login(loginResponse: response)
                }
            })
        }
    }
    
    private func showAlertPresenterDesencapsuled(title: String, message: String){
        if let presenter = presenter {
            presenter.showAlert(title: title, message: message)
        }
    }

    func validateFields(user: String?, password: String?){
        json = montaDicionarioDeParametros(user: user, password: password)
        let userCaptured = json["user"] ?? ""
        let passwordCaptured = json["password"] ?? ""
        
        if valuesNotEmpty(user: userCaptured, password: passwordCaptured ) && isValidateUser(user: userCaptured) && isValidatePassword(password: passwordCaptured) {
            self.login(parameter: json)
            return
        }
        
       showAlertPresenterDesencapsuled(title: "Usuário não localizado", message: "Não foi possível localizar o usuário prenchido.")
    }
    
    private func valuesNotEmpty(user: String, password: String) -> Bool {
        if user.isEmpty && password.isEmpty {
            if let presenter = presenter {
                presenter.showAlert(title: "Dados inválidos", message: "Favor preencher os campos")
                return false
            }
        }
        
        return true
    }
    
    private func isValidateUser(user: String) -> Bool {
        if user.isValidCPF() || user.isValidEmail() {
            return true
        }
        
       showAlertPresenterDesencapsuled(title: "CPF ou e-mail inválidos", message: "Os dados de usuário estão incorretos.")
        
        return false
    }
    
    private func isValidatePassword(password: String) -> Bool {
        if password.isValidPassword() {
            return true
        }
        
        showAlertPresenterDesencapsuled(title: "Senha inválida", message: "A senha deve conter um caracter maiúsculo, um especial e um número.")
        
        return false
    }
}