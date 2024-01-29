package lk.neva.movies_database.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import lk.neva.movies_database.Service.MovieService;

@RestController
public class ReviewController {
    
    @Autowired
    private MovieService service;
}
