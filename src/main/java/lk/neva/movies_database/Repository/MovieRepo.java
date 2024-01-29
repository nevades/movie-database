package lk.neva.movies_database.Repository;

import org.springframework.stereotype.Repository;
import lk.neva.movies_database.Model.Movie;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface MovieRepo extends JpaRepository<Movie, Integer> {
    Optional<Movie> findBymovieImdb(String imdbId);
}
