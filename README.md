
# README

* Ruby version
    * 2.3.0

* System dependencies
    * RVM
    * Postgres 9.5.0
    * Rails 5.0.0.1
    
* Configuration
    * Clone the repository with
    `git clone https://github.com/matheusfreire/htmlcrawler`
    Then you enter in folder you have clone the code and run
    `bundle install`
    
* Database creation
    `rails db:create`
   Verify if you have postgres installed in your machine. To change the host of database, alter the following file:
   [Database.yml](https://github.com/matheusfreire/htmlcrawler/blob/master/config/database.yml)
   

* Database initialization
    After you configure the database, run the following command:
       `rails db:migrate`

* How to run the test suite

* Deployment instructions
    Run: `rake server` 

