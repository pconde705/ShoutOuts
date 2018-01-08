<h1 align="center"> ShoutOuts </h1> <br>
<p align="center">
  <a href="https://shoutouts-pconde705.herokuapp.com">
    <img alt="ShoutOuts" title="ShoutOuts" src="https://res.cloudinary.com/lopopoa2/image/upload/v1515374273/Screen_Shot_2018-01-07_at_5.03.04_PM_pzsbqj.png" >
  </a>
</p>

<p align="center">
  Welcome to ShoutOuts, a web application with jQuery/Bootstrap frontend and Ruby on Rails backend.
</p>

## Table of Contents

- [Introduction](#introduction)
- [ShoutOut Feed](#shoutout-feed)
- [Project Rewards](#project-rewards)
- [Project Show](#project-show)
- [Search](#search)
- [Categories](#categories)
- [Stats](#stats)


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

## Project Rewards

<p align="center">
  <img src="https://res.cloudinary.com/lopopoa2/image/upload/v1512168276/Screen_Shot_2017-12-01_at_2.44.04_PM_ijossg.png">
</p>

Rewards are not necessary to create a project. They are meant to gift a community of passionate followers that would love to see your idea come to fruition. The design was similar to how you create a project so as to not confuse users. A slightly different color scheme and background is used for minimal differentiation between it and the project form.

## Project Show

<p align="center">
  <img src="https://res.cloudinary.com/lopopoa2/image/upload/v1512166342/Screen_Shot_2017-12-01_at_2.11.32_PM_mzhjnm.png" >
</p>

In the display page you can read a detailed description the project creator has written about the project, and what kind of rewards he/she has provided for that specific pledge amount. Here you will also discover live stats that chronicles the number of backers this project has, the number of backers each reward has, and how close the project is to reach its goal.

## Search

<p align="center">
  <img src="https://res.cloudinary.com/lopopoa2/image/upload/v1512168345/Screen_Shot_2017-12-01_at_2.45.15_PM_nxaj06.png" >
</p>

A simple search feature on the navbar provides ease of access and simplicity in use. It queries the backend searching for project titles, limiting the responses to five. This way it avoids clutter and encourages the user to be specific. Since search exists on the navbar it can be used anywhere in the app.

## Categories

<p align="center">
  <img src="http://res.cloudinary.com/lopopoa2/image/upload/v1512168440/Screen_Shot_2017-12-01_at_2.46.59_PM_zrjixj.png" >
</p>

The category bar provides immediate filtering functionality that sends a request to the server and fetches from the database all the projects that matches the category being clicked on.

## Stats

<p align="center">
  <img src="https://res.cloudinary.com/lopopoa2/image/upload/v1512168500/Screen_Shot_2017-12-01_at_2.47.50_PM_cc1qr5.png" >
</p>

Live statistics showcase the current date, how many ongoing projects currently exist, how many backers WellSpring has, and how many projects have been successfully funded.

The stats page was the final thing added to the app that took the most time and effort. Not all aspects were challenging, but when it came to calculating the projects that had been funded, using the columns created in my table, required ruby methods performing calculations on the backend and a triple Full Outer Join written as a SQL query in Active Record.

```ruby
  def total_amount_raised
    first_value = project_backers.where('cash_only != 0').sum(:cash_only)
    second_value = reward_backers.sum(:amount)
    first_value + second_value
  end

  def total_number_of_backers
    user_backers.uniq.count
  end

  def self.all_projects
    Project.all.count
  end

  def self.all_funded_projects
    result = ActiveRecord::Base.connection.execute(<<-SQL)
      SELECT
        projects.id
      FROM
        projects
      FULL OUTER JOIN project_backers AS reward_backers ON reward_backers.project_id = projects.id
      FULL OUTER JOIN rewards ON reward_backers.reward_id = rewards.id
      FULL OUTER JOIN project_backers AS cash_backers ON cash_backers.project_id = projects.id
      GROUP BY
        projects.id
      HAVING
        sum(cash_backers.cash_only + rewards.amount) > projects.goal
    SQL
    result.count
  end
```

In order to correctly calculate whether the total amount had exceeded the initial goal the user had stated for that project, required a table keeping track of three things.

The data from the rewards table that kept track of the amounts each specific reward offered, the data from the project_backers table that kept track of any freely inputed cash amount to be donated, and the total_amount_raised (see method above) that calculates how much each specific project had already raised based on the two previous data inputs.

The total_amount_raised was thus a necessary creation that overwrote the initial money_raised column that existed in the projects table.
