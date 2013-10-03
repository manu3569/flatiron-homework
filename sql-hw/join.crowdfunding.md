## Objectives

Create the database, model the data, and use `JOIN`s to answer the questions.

## Resources

[3 Ring Binder](http://blog.seldomatt.com/blog/2012/10/17/about-sql-joins-the-3-ring-binder-model/)

[Joins Explanation](http://www.codinghorror.com/blog/2007/10/a-visual-explanation-of-sql-joins.html)

[Joins Tutorial](http://geekyisawesome.blogspot.com/2011/03/sql-joins-tutorial.html)

## Create the database

You are going to make a database to store data for your crowd-funding platform. The platform needs to have projects, users, and pledges. 

**Create a schema based on the following information:**

- A project has a title, a category, a funding goal, a start date, and an end date. Valid categories are: music, books, charity.

- A user has a name and an age

- A pledge has an amount. It belongs to a user, and it also belongs to a project.

**Insert some records into the datbase**

Create 10 projects, 20 users, and 30 pledges.

## Questions

Answer the following questions with SQL. You'll use different kinds of SQL joins to arrive at the answers for most.

- Select the titles of all projects and their pledge amounts.

- Select the user name, age, and pledge amount for all pledges.

- Select the titles of all projects that have met their funding goal.

- Select user names and amounts of all pledges. Order them by the amount.

- Select the category names, and pledge amounts of all pledges in the music category.

- Select the category names and the **sum total** of the pledge amounts of all the pledges in the book category.

