package org.acme.User.Service;

import jakarta.inject.Inject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.NotFoundException;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/api/users")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class UserResource {

	@Inject
	UserService userService;

	@GET
	public List<User> getAllUsers() {
    		return userService.getAllUsers();
	}

	@GET
	@Path("/{id}")
	public User getUserById(@PathParam("id") Long id) {
    	java.util.Optional<User> user = userService.getUserById(id);
    	if (user.isPresent()) {
        	return user.get();
    	} else {
        	throw new NotFoundException("User with ID " + id + " not found");
    	}
	}

	@POST
	public User createUser(User user) {
    		return userService.createUser(user);
	}
}
