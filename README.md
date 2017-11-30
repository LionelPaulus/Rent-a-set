# Rent a set
HETIC-G1-10

# Start the app
1. Install postgresql. For mac users, do `$ brew install postgresql`. Other OS, [look here](https://stackoverflow.com/questions/6040583/cant-find-the-libpq-fe-h-header-when-trying-to-install-pg-gem).
2. Install the bundler gem with `$ gem install bundler`.
3. If you do not have it, you might need to install sqlite3 with `$ brew install sqlite3`, `$ yum install sqlite-devel` or `$ apt-get install libsqlite3-dev`.
4. Install dependencies `$ bundle install`.
5. Run DB migrations `$ rake db:migrate`.
6. Start the app `$ rails s`.

# Required IDE plugins
- [EditorConfig](http://editorconfig.org)

# Resources
[How to install Ruby](https://gist.github.com/maxime-d/ad27f0f6607a75639ebcd47afc4ad404)
