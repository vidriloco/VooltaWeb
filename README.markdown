# Voolta Web

On this repository lives what it used to power the backend and web landing page of Voolta. Voolta was an app that displayed different route activities nearby for people to get to know a city in a fun way, discovering unexpected places along the way. 

### How to deploy

For getting the web application running, follow the steps below:

1. Install the right _Ruby_ version: `rvm install ruby-1.9.3-p551` (RVM is a tool for managing different versions of `Ruby`)
2. Fetch the required dependencies `bundle install`. Make sure you are running this command under the ruby version installed above. Check command `rvm use` for more information.
3. Run `pg_restore` command to restore the `voolta.dump` file into the database. Check the details of the database configuration located in `database.yml`
4. Run `rails start` to run the application on development environment.

### The admin panel

You will find access to the admin page at the endpoint `/admin` for atomically managed the backend data records. For reviewing and managing the information related to a specific trip please refer to the `/trips-admin` endpoint.

### Showcase of the landing page


#### Landing page with app's first view
 ![](src/images/landing.png)

#### Landing page with app's list of routes
 ![](src/images/list-routes.png)

#### Landing page with one of the app's trips route on map
 ![](src/images/route.png)
