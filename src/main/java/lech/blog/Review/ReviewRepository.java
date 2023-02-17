package lech.blog.Review;

import org.springframework.data.jpa.repository.JpaRepository;
// repozytory z obiektem generycznym Review czyli maper wie jak przypisać co do czego
public interface ReviewRepository extends JpaRepository<Review, Integer> {

    /*
bez mapera musielibysmy sobie sami robić zapytania typu:
SELECT * FROM blog ORDER BY created_data DESC;
a w maperach możemy zrobić tak że nam zwróci całą listę:
   List<Review> findAllByAuthor - czyli piszemy metodę a maper sobie sam na podstawie metody generuje zapytanie.

     */


}
