# Project Overview
This project is on Ruby on Rails.
It accesses the OSU courses API to process the course information for students, instructors, and admin users to manage their classes. 

# Before executing: Instructions on Preparation

__Version__

ruby 3.0.0

Rails 7.0.2

__Installation__

Install Ruby
```
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev  sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
rbenv install 3.0.2
rbenv global 3.0.2
ruby -v
```

Install Rails
```
sudo apt-get install nodejs
sudo npm install -g n
sudo n stable
```

Install Rails gem
```
gem install --no-document rails -v 6.1.4
```

Install and set up yarn
```
npm install --global yarn
rails webpacker:install
yarn install --check-files
```

__Deployment__

After downloading the file from the github, change the path to the folder student_graders
In terminal, do
```
bundle install
rails s
```
Then open the website at your browser [http://localhost:3000/](http://localhost:3000/)
# Through the website

__Start Page__

This is the home page, which provides login and sign up functions.

After logging in, users can see their portals. The pages from students, instructors, and admins are different.

__Course Page__

This page shows the course catalog from CSE department, which is imported from the osu course API.

Only admins can add courses and reload the whole catalog. 

__Each Course Page__

Each course has a single page.

Only admins can delete and edit its information.


# Reference
external API: [OSU course catalog](https://content.osu.edu/v2/classes/search?q=cse&campus=col&p=1&term=1222)
