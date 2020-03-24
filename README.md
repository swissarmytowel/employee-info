# EMPLOYEE-INFO
This is a sample app to  keep track of your employees projects.

It's basic, simple and, frankly, quite buggy. But we shan't mind that, shall we.

* Ruby version: 2.7.0
* Rails: 6
* Dev database: SQlite 1.4
* Puma server: 4.1
* rbenv 1.1.2-28-gc2cfbd1


To set it up and running on your local machine `cd` to a directory of choice and do the following:
```
>> git clone https://github.com/swissarmytowel/employee-info
>> cd employee-info
>> rbenv init
>> bundle install --without production
>> rails db:migrate
>> rails db:seed #(optional)
>> rails test
>> rails s
```