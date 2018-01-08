<h1 align="center"> ShoutOuts </h1> <br>
<p align="center">
  <a href="https://shoutouts-pconde705.herokuapp.com">
    <img alt="ShoutOuts" title="ShoutOuts" src="https://res.cloudinary.com/lopopoa2/image/upload/v1515379238/Screen_Shot_2018-01-07_at_6.40.22_PM_ofbzub.png" >
  </a>
</p>

<p align="center">
  Welcome to ShoutOuts, a web application with jQuery/Bootstrap frontend and Ruby on Rails backend.
</p>

## Table of Contents

- [Introduction](#introduction)
- [ShoutOut Feed](#shoutout-feed)
- [Search](#search)
- [Categories](#categories)


## Introduction

In [ShoutOuts](https://shoutouts-pconde705.herokuapp.com) users can sign up for an account with their school email, which allows them to navigate their school specific ShoutOut page. There, they can write or read posts written by other students. Students can like each others posts, and see which posts currently rank as the most popular. Each post is in the form of a shoutout to someone or something, so you can navigate between the more positive SO posts, and more negative ASO posts.

Features:

* View ShoutOut feed
* Navigate feed based on different categories
* Flag a ShoutOut for being inappropriate
* Like a ShoutOut
* Write a SO or Anti-ShoutOut (ASO)
* Search for any existing SO by id or content

## ShoutOut Feed

<p align="center">
  <img src="https://res.cloudinary.com/lopopoa2/image/upload/v1515374267/Screen_Shot_2018-01-07_at_5.04.29_PM_mgphai.png">
</p>

Once logged in, you can scroll to see all the posts made by your fellow students. Each post carries a specific id, and date and time when it was created, a like counter (heart), a flag button which can be removed if an administrator deems it non-offensive, and social media links for sharing across platforms.

## Search

<p align="center">
  <img src="https://res.cloudinary.com/lopopoa2/image/upload/v1515378976/Screen_Shot_2018-01-07_at_6.34.45_PM_vvm2eh.png" >
</p>

A simple search feature on the navbar provides ease of access and simplicity in use. It queries the backend searching for ShoutOut id's or its content.

## Categories

<p align="center">
  <img src="https://res.cloudinary.com/lopopoa2/image/upload/v1515378452/Screen_Shot_2018-01-07_at_6.27.19_PM_eedkv2.png" >
</p>

The category bar provides immediate filtering functionality that sends a request to the server and fetches from the database all the projects that matches the category being clicked on.

```javascript
$("#post_content").keyup(function() {
  var counter = $("#counter");
  var charsRemaining = 150 - $(this).val().length;
  counter.text(charsRemaining);
  counter.css('color', (charsRemaining < 0) ? 'red' : 'black');
});
```
