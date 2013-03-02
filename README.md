[![Build Status](https://travis-ci.org/bigbam505/tag-cloud.png?branch=master)](https://travis-ci.org/bigbam505/tagcloud)
[![Code Climate](https://codeclimate.com/github/bigbam505/tag-cloud.png)](https://codeclimate.com/github/bigbam505/tag-cloud)
[![Coverage Status](https://coveralls.io/repos/bigbam505/tag-cloud/badge.png?branch=master)](https://coveralls.io/r/bigbam505/tag-cloud)
Tag Cloud
=========

This application is meant to help keep track of Hubot content so that scripts can be well, scripts

Project Setup
-------------

Get the code

    git clone git@github.com:bigbam505/tag-cloud.git

Set up the projects dependencies

    cd tag-cloud
    bundle --binstubs
    rake dev:setup

This application is designed to be hosted on heroku to deploy the application to heroku follow the steps below

    heroku create {app-name} --remote heroku
    git push heroku master

Development
-----------

User [Foreman](https://github.com/ddollar/foreman) to run the app locally

    foreman start

It uses your '.env' field and 'Procfile' to run processes just like Heroku's
Ceder Stack.

