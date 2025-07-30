import Foundation

protocol UserService {
    func getUser(login: String) -> User?
}
