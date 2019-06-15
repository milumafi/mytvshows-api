# README - mytvshows-api (RESTful JSON API with Rails 5) 

This repo is the source code of RESTfull JSON API developed with Rails.

* **Ruby on Rails version**

Ruby 2.6.1
Rails 5.2.3

* **Prerequisits**

Postgresql installed
Ruby on Rails installed

* **Setup**

1. Clone or Download the repo.

`$ git clone https://github.com/milumafi/mytvshows-api.git`

2. Create user into postgresql database, provide CreateDB rights to the user

```
  database: mytvshows_api_development
  username: mytvshows_user
  password: 12345678
  
  $ psql -U postgres 
  postgres=# CREATE USER mytvshows_user PASSWORD '12345678';
  postgres=# ALTER ROLE mytvshows_user WITH CREATEDB;
  postgres=# \du
  postgres=# \quit
```

3. Initialize gem's and database

```
$ bundle install
$ rails db:setup
```

4. Run the app

`$ rails s`

5. Check the app:

`http://localhost:3000`

6. Insert data to database using POST end-points, here you have some examples:

```
http POST :3000/movies title='el veredicto' plot='descripción del veredicto'
http POST :3000/movies title='walk,ride,rodeo' plot='descripción de walk,ride,rodeo'
http POST :3000/seasons title='suits' plot='descripción de suits'
http POST :3000/seasons title='homeland' plot='descripción de homeland'
http POST :3000/seasons/:season_id/episodes title='episode 1 suits' plot='descripción episode 1 suits' episode_num=1
http POST :3000/seasons/:season_id/episodes title='episode 2 suits' plot='descripción episode 2 suits' episode_num=2
http POST :3000/seasons/:season_id/episodes title='episode 3 suits' plot='descripción episode 3 suits' episode_num=3
http POST :3000/users email='example@gmail.com'
http POST :3000/user/:user_id/contents title='suits' video_quality='HD' price='2.99'
```

7. Get data using GET end-points, here you have some examples:

```
http :3000/movies
http :3000/seasons
http :3000/contents
http :3000/users
http :3000/user/:user_id/contents
```



