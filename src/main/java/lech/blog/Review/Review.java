package lech.blog.Review;

import lech.blog.User.User;

import javax.persistence.*;

@Entity
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    String content;
    // użycie relacji między tabelami czyli mamy one 2 one
    //
    @OneToOne(cascade = CascadeType.MERGE)
    User author;

    public Review() {
    }

    public Review(Integer id, String content, User author) {
        this.id = id;
        this.content = content;
        this.author = author;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getAuthor() {
        return author.getId();
    }

    public void setAuthor(User author) {
        this.author = author;
    }
}
