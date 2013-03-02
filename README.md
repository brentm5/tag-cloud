[![Build Status](https://travis-ci.org/bigbam505/tag-cloud.png?branch=master)](https://travis-ci.org/bigbam505/tagcloud)

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

Add a remote heroku branch using

    git remote add heroku git@heroku.com:{app-name}.git

User [Foreman](https://github.com/ddollar/foreman) to run the app locally

    foreman start

It uses your '.env' field and 'Procfile' to run processes just like Heroku's
Ceder Stack.

