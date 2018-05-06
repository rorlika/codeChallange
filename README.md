# README

Installation
-----------------

### Install postgres
```
 brew install postgres 
 brew services start postgresql
 psql postgres 
 # login to the db…
 postgres=# CREATE ROLE codechallange WITH LOGIN PASSWORD 'p4ssw0rd';
 postgres=# CREATE DATABASE challange_development;
 postgres=# CREATE DATABASE challange_test;
 postgres=# GRANT ALL PRIVILEGES ON DATABASE challange_development TO codechallange;
 postgres=# GRANT ALL PRIVILEGES ON DATABASE challange_test TO codechallange;
```
#### Install dependencies
```
bundle install
```
#### Run migrations
```
rails db:create
rails db:migrate
```
## Test it out

Launch the app

```
rails server
```

Store source of page
```
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"pages", "attributes":{ "url": "www.facebook.com" }}}' http://localhost:3000/api/v1/pages
```

Get all pages with source
```
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X GET http://localhost:3000/api/v1/pages
```

## Requirements 
* rails version >= 5.1.6
* ruby version >=  2.4.1
* postgresql 

