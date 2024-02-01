package lk.neva.movies_database.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @RequestMapping("/home")
    public String home() {
        return "home";
    }

    @RequestMapping("/rating")
    public String rating() {
        return "rating";
    }
}