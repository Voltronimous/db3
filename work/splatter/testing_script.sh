#!/bin/bash

#create 3 users
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/users -d'{"user": {"email":"klaatu@earth.com", "name":"Klaatu", "password":"abcABC123"} }'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/users -d'{"user": {"email":"barrada@earth.com", "name":"Barrada", "password":"abcABC123"} }'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/users -d'{"user": {"email":"nikto@earth.com", "name":"Nikto", "password":"abcABC123"} }'

#create 5 splatts for each user mixed
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/splatts -d'{"splatt": {"body":"Klaatu Splatt 1", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/splatts -d'{"splatt": {"body":"Barrada Splatt 1", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/splatts -d'{"splatt": {"body":"Nikto Splatt 1", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/splatts -d'{"splatt": {"body":"Klaatu Splatt 2", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/splatts -d'{"splatt": {"body":"Barrada Splatt 2", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/splatts -d'{"splatt": {"body":"Nikto Splatt 2", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/splatts -d'{"splatt": {"body":"Klaatu Splatt 3", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/splatts -d'{"splatt": {"body":"Barrada Splatt 3", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/splatts -d'{"splatt": {"body":"Nikto Splatt 3", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/splatts -d'{"splatt": {"body":"Klaatu Splatt 4", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/splatts -d'{"splatt": {"body":"Barrada Splatt 4", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/splatts -d'{"splatt": {"body":"Nikto Splatt 4", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/splatts -d'{"splatt": {"body":"Klaatu Splatt 5", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/splatts -d'{"splatt": {"body":"Barrada Splatt 5", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/splatts -d'{"splatt": {"body":"Nikto Splatt 5", "user_id":3}}'

#user 1 follows users 2 & 3
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/users/follows -d'{"id":1, "follows_id":2}'
curl -i -H "Content-type: application/json" -X POST http://vanderloo.sqrawler.com:3000/users/follows -d'{"id":1, "follows_id":3}'

#get user 1 splatts
curl -i -H "Content-type: application/json" -X GET http://vanderloo.sqrawler.com:3000/users/splatts/1

#get users followed by user 1
curl -i -H "Content-type: application/json" -X GET http://vanderloo.sqrawler.com:3000/users/follows/1

#get user 1 news feed
curl -i -H "Content-type: application/json" -X GET http://vanderloo.sqrawler.com:3000/users/splatts-feed/1

#user 1 unfollows user 3
curl -i -H "Content-type: application/json" -X DELETE http://vanderloo.sqrawler.com:3000/users/1/3

#get user 1 news feed again
curl -i -H "Content-type: application/json" -X GET http://vanderloo.sqrawler.com:3000/users/splatts-feed/1
