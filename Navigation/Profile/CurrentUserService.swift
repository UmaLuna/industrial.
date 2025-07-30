import UIKit

class CurrentUserService: UserService {
    private let currentUser: User

    init(currentUser: User) {
        self.currentUser = currentUser
    }

    func getUser(login: String) -> User? {
        return login == currentUser.login ? currentUser : nil
    }
}
