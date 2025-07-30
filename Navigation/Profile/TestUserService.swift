import UIKit

final class TestUserService: UserService {

    private let testUser: User = User(
        login: "testLogin",
        fullName: "Test User",
        avatar: UIImage(named: "teo") ?? UIImage(),
        status: "This is a test status"
    )

    func getUser(login: String) -> User? {
        return testUser
    }
}
