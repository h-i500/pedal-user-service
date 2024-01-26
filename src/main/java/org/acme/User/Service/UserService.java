package org.acme.User.Service;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import java.util.List;
import java.util.Optional;

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
