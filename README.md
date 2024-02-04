# web-images-scraper-api

## Built With
- Ruby version 3.1.4
- Rails version 6
- Redis Cache
- Selenium Chrome Driver
- SideKiq

## Description
- Backend for the [ waller-photo-slideshow](https://github.com/Bluette1/waller-photo-slideshow) app.

## Live Demo
[Live Demo](https://web-images-scraper-api-447ae0d211ff.herokuapp.com/)

### Run instructions 
- Make sure Redis is running, if not by type the following commands in the terminal to start the Redis server

`
    redis-server --daemonize yes
`
-  You can clone the GitHub repo and run the app locally 
    ```
    bundle install
    rails server
    ```

### How to use the site
Make sure the server is running
- Go to http://localhost:3000/ in your web browser


- Follow the links on the [web-images-scraper-api](https://waller-photo-slideshow.netlify.app) to access the available features.


### Setting up env variables
 - Set access keys/credentials locally according to the `.env_example` file.

## Deployment
- You can deploy on [Heroku](https://devcenter.heroku.com/categories/ruby-support).
   - Make sure you run the following in the terminal for the build:
        ```
        heroku buildpacks:set heroku/ruby
        heroku buildpacks:add heroku/chromedriver
        heroku buildpacks:add heroku/google-chrome
        ```
    to add the required buildpacks.

## Authors

👤 **Marylene Sawyer**
- Github: [@Bluette1](https://github.com/Bluette1)
- Twitter: [@MaryleneSawyer](https://twitter.com/MaryleneSawyer)
- Linkedin: [Marylene Sawyer](https://www.linkedin.com/in/marylene-sawyer)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Bluette1/web-images-scraper-api/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.


