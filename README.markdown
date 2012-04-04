Heroku plugin to enable the usage of the [Adminium Heroku addon](http://addons.heroku.com/adminium).

In order to provide you with an administration interface for your data, this plugin will look for your DATABASE_URL Heroku config var and store an encrypted version. Removing the addon will delete that info from the Adminium database.

