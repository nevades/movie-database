package lk.neva.movies_database.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lk.neva.movies_database.Model.Review;
import lk.neva.movies_database.Repository.ReviewRepo;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepo repository;

    public Review createReview(String reviewBody, String imdbId) {
        Review review = new Review();
        review.setReviewImdb(imdbId);
        review.setReviewBody(reviewBody);
        review = repository.save(review);
        return review;
    }
}