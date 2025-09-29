import Foundation

final class Checker {
    static let shared = Checker()       // синглтон
    private init() {}                   // запрет на создание извне

    // эталонные значения
    private let login = "admin"
    private let password = "1234"

    /// Возвращает true, если логин и пароль совпадают
    func check(login: String, password: String) -> Bool {
        login == self.login && password == self.password
    }
}
