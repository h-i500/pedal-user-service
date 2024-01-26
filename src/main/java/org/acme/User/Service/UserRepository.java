package org.acme.User.Service;

import io.quarkus.hibernate.orm.panache.PanacheRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.transaction.Transactional;

import java.util.Optional;
import java.util.List;

@ApplicationScoped
public class UserRepository implements PanacheRepository<User> {

	public Optional<User> findUserByUsername(String username) {
    	  	return find("username", username).singleResultOptional();
	}

	public List<User> getAllUsers() {
    	  	return listAll();
	}

	public Optional<User> getUserById(Long id) {
    	  	return findByIdOptional(id);
	}

	@Transactional
	public User createUser(User user) {
    	persist(user);
    	return user;
	}
}
