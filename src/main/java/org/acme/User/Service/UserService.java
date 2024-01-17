package org.acme.User.Service;

import java.util.List;
import java.util.Optional;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

@ApplicationScoped
public class UserService {
    @Inject
    UserRepository userRepository;

    public List<User> getAllUsers() {
        return userRepository.getAllUsers();
    }

    public Optional<User> getUserById(Long id) {
        return userRepository.getUserById(id);
    }

    public User createUser(User user) {
        return userRepository.createUser(user);
    }
}
