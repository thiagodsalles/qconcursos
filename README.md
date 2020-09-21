
<h1># Back-End Challenge - Qconcursos</h1> 

<p align="center">
  <img src="http://img.shields.io/static/v1?label=Ruby&message=2.7.1&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=Ruby%20On%20Rails%20&message=6.0.3.3&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=TESTS&message=%3E100&color=GREEN&style=for-the-badge"/>
</p>

## Topics

:small_blue_diamond: [Project descriptions](#project-descriptions)

:small_blue_diamond: [Functionalities](#functionalities)

:small_blue_diamond: [Prerequisites](#prerequisites)

:small_blue_diamond: [How to run the application](#how-to-run-the-application-arrow_forward)

:small_blue_diamond: [How to run the tests](#how-to-run-the-tests)

:small_blue_diamond: [Endpoints](#endpoints)

:small_blue_diamond: [JSON](#json-floppy_disk)

:small_blue_diamond: [Gems added](#gems-added-gem)

## Project descriptions 

<p align="justify">
This service aims to read two JSON files containing informations about questions and access to these questions, so the user can search into database informations about: most accessed questions per year, month or week, and being able to choose the amount of this results, and the most accessed subjects in the last 24h.
</p>
<p align="justify">
The user must first send the question file and then the access file.
</p>

## Functionalities

:heavy_check_mark: Receive question json file via API

:heavy_check_mark: Receive question accesses json file via API

:heavy_check_mark: List the subjects of the questions that were most accessed in the last 24h via API

:heavy_check_mark: List the most frequently asked questions per week / month / year and choose how many results by the quantity parameter

## Prerequisites

:warning: [Docker](https://www.docker.com/get-started)

## How to run the application :arrow_forward:

Clone the project: 
```
$ git clone https://github.com/qcx/desafio-backend.git
```
In the root directory, build the docker-compose
```
$ docker-compose build
```
In the root directory, run docker-compose
```
$ docker-compose up
```  
In the root directory, run the command to create the database, migrations and seeds
```
$ docker-compose run web rails db:create
$ docker-compose run web rails db:migrate
$ docker-compose run web rails db:seed
```

## How to run the tests

In the root directory, run Rspec
```
$ bundle exec rspec 
```

## Endpoints

List the most accessed questions per month number:

    endpoint: /api/v1/questions
    method: GET
    parameter: month:integer, year:integer, quantity:integer (optional)

List the most accessed questions per week number:

    endpoint: /api/v1/questions
    method: GET
    parameter: week:integer, year:integer, quantity:integer (optional)

List the most accessed questions per year:

    endpoint: /api/v1/questions
    method: GET
    parameter: year:integer, quantity:integer (optional)

Send question JSON file:

    endpoint: /api/v1/question_accesses
    method: POST
    body: question_file :file

Change complaint data:

    endpoint: /api/v1/questions
    method: POST
    body: question_accesses_file :file

## JSON :floppy_disk:

### Question: 

    [
    	{
    		"id": 2193,
    		"statement": "Expedita quibusdam sunt vero.",
    		"text": "Quo ad voluptate. Esse expedita ea. Aperiam voluptatem consequatur.",
    		"answer": "D",
    		"daily_access": 47,
    		"discipline": "direito constitucional",
    		"created_at": "2020-01-21T00:29:41.857Z"
    	}
    ]

### Question Access: 

    [
    	"matematica",
    	"geografia"
    ]

## Gems added :gem:

- [Http](https://github.com/httprb/http)
- [Faker](https://github.com/faker-ruby/faker)
- [Shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
- [Rspec-rails](https://github.com/rspec/rspec-rails)
- [Factory_bot_rails](https://github.com/thoughtbot/factory_bot)
- [Rubocop](https://github.com/rubocop-hq/rubocop-rails)

## 
2020 - Back-End Challenge - Qconcursos