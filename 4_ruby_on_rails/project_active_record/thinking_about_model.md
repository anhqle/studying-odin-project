### 1. You are building an online learning platform (much like this!). You've got many different courses, each with a title and description, and each course has multiple lessons. Lesson content consists of a title and body text.

** courses **
```
title: string [unique, present]
description: string []

has_many lessons
```

** lessons **
```
title: string [unique, present]
body: string []
course_id: integer [present]

belongs_to course
```

### 2. You are building the profile tab for a new user on your site. You are already storing your user's username and email, but now you want to collect demographic information like city, state, country, age and gender. Think -- how many profiles should a user have? How would you relate this to the User model?

** users **
```
username: string [unique, present]
email: string [unique, present]
age: integer
gender: string
city_id: integer [unique]

belongs_to cities
```

** cities **
```
name: string [present]
state: string
country string

has_many users
```
### 3. You want to build a virtual pinboard, so you'll have users on your platform who can create "pins". Each pin will contain the URL to an image on the web. Users can comment on pins (but can't comment on comments).

** users **
```
username: string [unique, present]
password: string [present]

has_many pins
has_many comments
```

** pins **
```
name: string
link: string [present]
user_id: integer [present]

belongs_to users
has_many comments
```

** comments **
```
title: string
body: string
user_id: integer [present]
pin_id: [present]

belongs_to users
belongs_to pins
```

### 4. You want to build a message board like Hacker News. Users can post links. Other users can comment on these submissions or comment on the comments. How would you make sure a comment knows where in the heirarchy it lives?

** users **
```

```

** posts **

** comments **

[Turn out this nested comment thing is quite complicated](http://mikehillyer.com/articles/managing-hierarchical-data-in-mysql/)