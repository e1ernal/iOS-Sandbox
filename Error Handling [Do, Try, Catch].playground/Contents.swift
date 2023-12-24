import UIKit

// MARK: - Создание ошибки
enum AuthError: Error {
    case wrongPassword
    case wrongLogin
    case serverLost
}

// MARK: - Проброс ошибки
func auth(login: String, password: String) throws -> String {
    let correctLogin = "Login"
    let correctPassword = "Password"
    
    guard login == correctLogin else {
        throw AuthError.wrongLogin
    }
    
    guard password == correctPassword else {
        throw AuthError.wrongPassword
    }
    
    return "Auth: OK"
}

// MARK: - Do Try Catch
do {
    let responce = try auth(login: "Login", password: "Password")
    print(responce)
} catch AuthError.wrongLogin {
    print("Wrong Login")
} catch AuthError.wrongPassword {
    print("Wrong Password")
} catch {
    print("Some Error")
}

// MARK: - Конвертация в опционал
if let responce = try? auth(login: "Login", password: "Password") {
    print(responce)
} else {
    print("Nil")
}
