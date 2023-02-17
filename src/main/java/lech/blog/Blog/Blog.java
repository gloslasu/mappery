package lech.blog.Blog;

import lech.blog.Review.Review;
import lech.blog.User.User;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
import java.util.stream.Collectors;

@Entity
public class Blog {
    @Id
    //adnotacja  określa sposób generowania wartości kluczy głównych
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    // relacja wielu do wielu. wiele wpisów może miec wielu autorów
    // do jedengo wpisu możemy przypiać róznych autorów
    // jeden autor może być autorem wielu róznych wpisów
    // merge jest po to że jak przesyłamy po rest api wpis blogowy to może od razu nam ustwić autorów
    // czyli w zapytaniu w blogu mozemy podać kilku autorów i nam sie dopisuje samo
    @ManyToMany(cascade = CascadeType.MERGE)
    List<User> Authors;
    Date createdDate;
    Time createdTime;
    String title;
    String content;
    @OneToMany(cascade = CascadeType.ALL) // jeden wpis blogowy może mieć wiele opinii
    List<Review> reviews;
// pusty konstruktor
    public Blog() {
    }
// konstruktor ze wszystkimi elementami
    public Blog(Integer id, List<User> authors, Date createdDate, Time createdTime, String title, String content, List<Review> reviews) {
        this.id = id;
        Authors = authors;
        this.createdDate = createdDate;
        this.createdTime = createdTime;
        this.title = title;
        this.content = content;
        this.reviews = reviews;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<Integer> getAuthors() {
        return Authors.stream().map(elem -> elem.getId())
                .collect(Collectors.toList());
    }

    public void setAuthors(List<User> authors) {
        Authors = authors;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Time getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Time createdTime) {
        this.createdTime = createdTime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<Integer> getReviews() {
        return reviews.stream().map(elem -> elem.getId())
                .collect(Collectors.toList());
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }
}
