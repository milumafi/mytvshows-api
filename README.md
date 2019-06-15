# mytvshows-api (RESTful JSON API with Rails 5) - README

This repo is the source code of RESTfull JSON API developed with Rails.


* Ruby on Rails version
Ruby 2.6.1
Rails 5.2.3

* Prerequisits
Postgresql installed
Ruby on Rails installed

* Setup

1. Clone or Download the repo.

`$ git clone https://github.com/milumafi/mytvshows-api.git`

2. Initialize database, create user, provide CreateDB rights to the user

`$ rails db:setup`

3. Run the app

`$ rails s`

4. Check the app:

````
http://localhost:3000
```

4. Insert data to database using POST end-points, here you have some examples:

```
POST 	--> 	http POST :3000/movies title='el veredicto' plot='descripción del veredicto'
POST 	--> 	http POST :3000/movies title='walk,ride,rodeo' plot='descripción de walk,ride,rodeo'
POST 	--> 	http POST :3000/seasons title='suits' plot='descripción de suits'
POST 	--> 	http POST :3000/seasons title='homeland' plot='descripción de homeland'
POST	-->		http POST :3000/seasons/:season_id/episodes title='episode 1 suits' plot='descripción episode 1 suits' episode_num=1
POST	-->		http POST :3000/seasons/:season_id/episodes title='episode 2 suits' plot='descripción episode 2 suits' episode_num=2
POST	-->		http POST :3000/seasons/:season_id/episodes title='episode 3 suits' plot='descripción episode 3 suits' episode_num=3
POST 	-->		http POST :3000/users email='example@gmail.com'
POST	-->		http POST :3000/user/:user_id/contents title='suits' video_quality='HD' price='2.99'
```

5. Get data using GET end-points, here you have some examples:

````
GET 	--> 	http :3000/movies
GET 	-->		http :3000/seasons
GET 	-->		http :3000/contents
GET		-->		http :3000/users
GET		-->		http :3000/user/:user_id/contents
```



