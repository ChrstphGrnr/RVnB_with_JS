# RVBnB

This was created as a part of the Flatiron School online webdeveloper program. 
This is an extension of the already existing RVBnB app created as part of the rails section in the curriculum. 
(RVBnB can be found <a href="http://rv-bnb.herokuapp.com/">here</a>)

Additional to the rails app already existing, this version added certain JS functionality. 
Mainly, instead of rerouting you to the individual RV's show page, the  information about a specific RV will be rendered dynamically on the index page
without a refresh or redirect. Integrated into the newly rendered html are two links that give 2 options. See the trips already booked with this RV or book an new
trip with it. The result of clicking on either link will also result in a dynamic render of either the booked trips or the new trip form. 

## Installing 

2 options:

- go to rv-bnb.herokuapp.com and create a new user account by clicking SignUp. Then browse to your heart's content. 

- go to the master branch in the authors Github, https://github.com/ChrstphGrnr/RVnB_with_JS
and fork the repo. 
<br>Use your favorite local environment to clone the repo, then, while in the repo's directory in your console, run the following commands
```bundle install``` followed by ```rake db:dcms``` and then ```rails s```
<br>After the server is up and running, go to your browser, open <a href="localhost:3000">localhost:3000</a> and enjoy the app.
You can find the JS functionality by clicking on the little green button by an RV...


## Authors 

https://github.com/ChrstphGrnr


## License 

This project is licensed under the MIT license. 

https://opensource.org/licenses/MIT

## Contributors

A big thanks goes to Alex Aguilar, our cohort lead @ Flatiron School. Also, Vinh, you ROCK man. And of course the rest of the gang in !Slackers.

