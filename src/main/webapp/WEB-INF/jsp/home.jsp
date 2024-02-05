<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Movie Database</title>
    <jsp:include page="components/header.jsp" />
</head>

<body>
    <jsp:include page="components/navbar.jsp" />
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap");

        .hero-container {
            margin: auto;
            display: flex;
        }

        .main-container {
            width: 270px;
            height: 540px;
            position: relative;
            margin: 0 20px;
        }

        .poster-container {
            width: 230px;
            position: absolute;
            top: 0;
            left: 20px;
            z-index: 1;
        }

        .poster {
            width: 100%;
            box-shadow: 0 5px 20px 3px rgba(0, 0, 0, 0.6);
        }

        .ticket-container {
            background: #fff;
            width: 270px;
            height: 520px;
            display: flex;
            flex-direction: column;
            align-items: center;
            border-radius: 5px;
            position: absolute;
            top: 20px;
            box-shadow: 0 5px 20px 3px rgba(0, 0, 0, 0.6);
            opacity: 0;
        }

        .main-container:hover .ticket-container {
            opacity: 1;
            animation: bounceIn 0.6s linear;
        }

        @keyframes bounceIn {

            0%,
            20%,
            40%,
            60%,
            80%,
            to {
                -webkit-animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
                animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
            }

            0% {
                opacity: 0;
                -webkit-transform: scale3d(0.3, 0.3, 0.3);
                transform: scale3d(0.3, 0.3, 0.3);
            }

            20% {
                -webkit-transform: scale3d(1.03, 1.03, 1.03);
                transform: scale3d(1.03, 1.03, 1.03);
            }

            40% {
                -webkit-transform: scale3d(0.9, 0.9, 0.9);
                transform: scale3d(0.9, 0.9, 0.9);
            }

            60% {
                opacity: 1;
                -webkit-transform: scale3d(1.01, 1.01, 1.01);
                transform: scale3d(1.01, 1.01, 1.01);
            }

            80% {
                -webkit-transform: scale3d(0.97, 0.97, 0.97);
                transform: scale3d(0.97, 0.97, 0.97);
            }

            to {
                opacity: 1;
                -webkit-transform: scaleX(1);
                transform: scaleX(1);
            }
        }

        @keyframes bounce {
            50% {
                opacity: 1;
                transform: scale(1.1);
            }

            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        .ticket__content {
            width: 100%;
            position: absolute;
            bottom: 0;
            text-align: center;
        }

        .ticket__movie-title {
            text-transform: uppercase;
            margin-bottom: 5px;
        }

        .ticket__movie-slogan {
            color: #999;
            font-size: 0.9rem;
            margin-bottom: 20px;
        }

        .ticket__current-price {
            color: #69c982;
            font-size: 1.4rem;
            font-weight: bold;
        }

        .ticket__old-price {
            color: #999;
            text-decoration: line-through;
            margin-bottom: 10px;
        }

        .ticket__buy-btn {
            cursor: pointer;
            width: 100%;
            background: #2f2f2f;
            color: white;
            padding: 15px 0;
            font-size: 1rem;
            font-weight: bold;
            text-transform: uppercase;
            border: 0;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
        }

        #center {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .movies-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            width: 100%;
        }

        .fullscreen-swal {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
    <div class="hero-container" id="center">
    </div>

    <div class="modal fade" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="videoModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="videoModalLabel">Movie Trailer</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#videoModal">
        Open Modal
    </button>
    <script>
        fetch('/movies/featured', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
            },
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error(response.statusText);
                }
                return response.json();
            })
            .then(data => {
                for (var i = 0; i < data.length; i++) {
                    const name = data[i].movieName;
                    const imdb = data[i].movieImdb;
                    const year = data[i].movieYear;
                    var temp = '<div class="main-container" style="margin-top: 1%;" id="' + imdb + '">'
                        + '<div class="poster-container">'
                        + '<a href="https://www.imdb.com/title/' + imdb + '/"><img src="https://i.ibb.co/ThPNnzM/blade-runner.jpg" class="poster" /></a>'
                        + '</div>'
                        + '<div class="ticket-container">'
                        + '<div class="ticket__content">'
                        + '<h4 class="ticket__movie-title">' + name + '</h4>'
                        + '<p class="ticket__movie-slogan">'
                        + 'Release Year : ' + year + ''
                        + '</p>'
                        + '<p class="ticket__current-price">Average Rating</p>'
                        + '<button class="ticket__buy-btn">Watch Trailer</button>'
                        + '</div>'
                        + '</div>'
                        + '</div>';

                    $('#center').append(temp);
                }
                console.log('All Movies:', data);
            })
            .catch(error => {
                console.error('Error fetching all movies:', error);
                Swal.fire('Error!', 'Failed to fetch movies', 'error');
            });


        function handleSearch(event) {
            event.preventDefault();
            var searchInput = document.getElementById('searchInput');
            var searchTerm = searchInput.value;

            fetch('/movies/' + searchTerm, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                },
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error(response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                    Swal.fire({
                        title: data.movieName,
                        text: data.movieYear,
                        showCancelButton: false,
                        confirmButtonText: 'OK',
                        customClass: {
                            popup: 'fullscreen-swal'
                        },
                    })
                    console.log('Single Movie:', data);
                    if (data == null) {
                        console.error('Error fetching single movie:', error);
                        Swal.fire('Error!', 'Failed to fetch movie', 'error');
                    }
                })
                .catch(error => {
                    console.error('Error fetching single movie:', error);
                    Swal.fire('Error!', 'Failed to fetch movie', 'error');
                });
        }
    </script>
</body>

</html>