package lech.blog.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserRepository repository;

    @RequestMapping(value = "",method = RequestMethod.GET)
    public List<User> getAllUsers(){
        return repository.findAll();
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public User addUser(@RequestBody User user){
        return repository.save(user);
    }

    @RequestMapping(value = "{id}", method = RequestMethod.GET)
    public User getUserById(@PathVariable Integer id){
        return repository.findById(id)
                .orElseThrow(RuntimeException::new);
    }
    @RequestMapping(value = "{id}", method = RequestMethod.PATCH)
    public User updateUserById(@PathVariable Integer id, @RequestBody User user){
        if (user.getId() != id){
            return null;
        }
        if (this.getUserById(id) != null){
            return repository.save(user);
        }
        return null;
    }
    @RequestMapping(value = "{id}", method = RequestMethod.DELETE)
    public void deleteUserById(@PathVariable Integer id){
        repository.deleteById(id);
    }
}
