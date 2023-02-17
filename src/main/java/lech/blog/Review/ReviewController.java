package lech.blog.Review;

import lech.blog.User.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController // kontroler po rest api rozszerzający naszą klasę
// ustawiamy * żeby każde zapytanie było wpuszczane
@CrossOrigin("*") // odpowiedzialny za zapytania httpp między forntem a backend
@RequestMapping("review") // adres serwera localhost/review
public class ReviewController {
    // wpinamy do kontrolera repozytorium (interfejs ReviewRepository) żeby maper wiedział skąd ma
    // ściągać dane
    @Autowired // umożliwia wstrzykiwanie do pola nawet wtedy, gdy jest ono prywatne
    //obiekt interfejsu
    ReviewRepository repository; // obiekt repository odpowiada za połaczenie z bazą

    // ściąganie wszystkich komentarzy które są do wpisów
    @RequestMapping(value = "", method = RequestMethod.GET) // RequestMapping czyli na konkretny adres bijamy
    List<Review> getAllReviews(){
        return repository.findAll();
    }
    @RequestMapping(value = "", method = RequestMethod.POST)
    public Review addReview(@RequestBody Review review){ //jak w body prześlemy jakąś opninię to maper ją zapisze
        return repository.save(review);
    }
    @RequestMapping(value = "{id}", method = RequestMethod.GET)
    public Review getReviewById(@PathVariable Integer id){
        return repository.findById(id)
                .orElseThrow(RuntimeException::new);
    }
    @RequestMapping(value = "{id}", method = RequestMethod.PATCH)
    public Review updateReviewById(@PathVariable Integer id, @RequestBody Review review){
        if (review.getId() != id){
            return null;
        }
        if (this.getReviewById(id) != null){
            return repository.save(review);
        }
        return null;
    }
    @RequestMapping(value = "{id}", method = RequestMethod.DELETE)
    public void deleteReviewById(@PathVariable Integer id){
        repository.deleteById(id);
    }
}
