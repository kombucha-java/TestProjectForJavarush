package usermanager.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.sql.Timestamp;
import java.util.Date;

@Entity
@Table(name = "user")
public class User {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    @Size(min=5, max = 25)
    @NotNull
    @NotEmpty
    private String name;

    @Column(name = "age")
    @Min(value = 18, message = "User must be over 18")
    @NotNull
    private int age;

    @Column(name = "isAdmin")
    private boolean admin;


    @Column(name = "createdDate")
    private Timestamp createdDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate() {
        Date date = new Date();
        this.createdDate = new Timestamp(date.getTime());
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", isAdmin=" + admin +
                ", createdDate=" + createdDate +
                '}';
    }
}
