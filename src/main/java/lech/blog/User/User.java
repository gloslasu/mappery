package lech.blog.User;

import javax.persistence.*;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    String email;
    String username;
    String password;

    // szczegóły do konkretnego uzytkownika relacja one 2 one
    @OneToOne
    UserDetails details; // jeden user może mieć jeden wpis ze swoimi szczegółami

    public User() {
    }

    public User(Integer id, String email, String username, String password, UserDetails details) {
        this.id = id;
        this.email = email;
        this.username = username;
        this.password = password;
        this.details = details;
    }

    public UserDetails getDetails() {
        return details;
    }

    public void setDetails(UserDetails details) {
        this.details = details;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
