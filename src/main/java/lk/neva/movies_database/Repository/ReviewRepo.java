package lk.neva.movies_database.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import lk.neva.movies_database.Model.Review;

@Repository
public interface ReviewRepo extends JpaRepository<Review, Integer> {

}