![Philopedia](http://www.joeltennant.me/philo-header.png)

# Philopedia

Philopedia is a wiki for philosophy.  Articles for philosophers and philosophies can be created or edited by users who enjoy the study of Philosophy. Free users can create and edit public articles.  However, premium users can create private articles.  Other users can be added to these private articles and edit them as collaborators.

## Why

There are not enough pools of information for arm-chair philosophers.  Philopedia aims to provide a useful reference in a organized way.

## How (Tech)

Built on Ruby 4.2.5 using PostgresSQL and deployed on Heroku.

#### Key Gems

* Devise
* Pundit
* Faker (for RSpec)
* Figaro
* pg (PostgresSQL)
* Stripe
* Bootstrap 4

## Getting Started

### Prerequisites

* Rails 4.2.5 ([Install](http://installrails.com/steps/choose_os))
* PostgresSQL ([Install](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04))

### Run locally

1) Clone this repository and navigate to it within the terminal
2) Install gems: bundle install
3) Create local database: rake db:create
4) Run Migrations: rake db:migrate
5) Open the db/seeds.rb and edit the admin user to your own details
6) Seed the database: rake db:seed
7) Run the server: rails s
8) View the project at localhost:3000
9) Ctrl + C to shutdown the server

## Who

Created and maintained by [Joel Tennant](http://www.github.com/joelt11753)