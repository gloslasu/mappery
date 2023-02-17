package lech.blog.Blog;

import lech.blog.User.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("blog")
public class BlogController {
    @Autowired
    BlogRepository repository;

    @RequestMapping(value = "", method = RequestMethod.GET)
    List<Blog> getAllBlogPosts(){
        return repository.findAll();
    }
    @RequestMapping(value = "", method = RequestMethod.POST)
    Blog addBlogPost(@RequestBody Blog blog){
        blog.setCreatedDate(new Date(System.currentTimeMillis()));
        blog.setCreatedTime(new Time(System.currentTimeMillis()));
        return repository.save(blog);
    }

    @RequestMapping(value = "{id}", method = RequestMethod.GET)
    public Blog getBlogById(@PathVariable Integer id){
        return repository.findById(id)
                .orElseThrow(RuntimeException::new);
    }
    @RequestMapping(value = "{id}", method = RequestMethod.PATCH)
    public Blog updateBlogById(@PathVariable Integer id, @RequestBody Blog blog){
        if (blog.getId() != id){
            return null;
        }
        if (this.getBlogById(id) != null){
            return repository.save(blog);
        }
        return null;
    }
    @RequestMapping(value = "{id}", method = RequestMethod.DELETE)
    public void deleteBlogById(@PathVariable Integer id){
        repository.deleteById(id);
    }
}
