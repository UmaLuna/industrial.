import Foundation

protocol LoginViewControllerDelegate: AnyObject {
    /// проверяет данные пользователя и возвращает результат
    func check(login: String, password: String) -> Bool
}
