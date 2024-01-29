package lk.neva.movies_database.Model;

import java.sql.Date;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "movie")
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Movie {

    @Id
    private Integer id;
    private String movieName;
    private String movieImdb;
    private String movieTrailer;
    private String movieGenre;
    private String movieReviewId;
    @CreatedBy
    private Integer entBy;
    @CreatedDate
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
    private Date entOn;
    @LastModifiedBy
    private Integer modBy;
    @LastModifiedDate
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
    private Date modOn;

}
