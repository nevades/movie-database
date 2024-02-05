package lk.neva.movies_database.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lk.neva.movies_database.Model.Movie;
import lk.neva.movies_database.Repository.MovieRepo;

@Service
public class MovieService {

    @Autowired
    private MovieRepo repository;

    public List<Movie> findAllMovies() {
        return repository.findAll();
    }

    public List<Movie> findFeaturedMovies() {
        return repository.findBymovieFeatured("true");
    }

    public Optional<Movie> findBymovieImdb(String imdbId) {
        return repository.findBymovieImdb(imdbId);
    }
}