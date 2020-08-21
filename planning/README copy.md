# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Unit 3 (Group Project)
## Build a full CRUD website + RUBY RAILS REST API with JWT

## Overview
Your last project taught you how to build an API application with Express and
Mongoose. This project will have you build a full stack application with a
similar API backend as well as a frontend.

Your instructors have organized you and your classmates into groups to design
and build an app with two major components:

1. An API of your own design (built using Ruby on Rails, PostgreSQL, and JWT) that
   serves JSON.
2. A front-end application that updates the UI and makes requests to the
   API.

**This is meant to push you both technically and collaboratively.** You will be
joining a development team during your career. Working collaboratively is a
learned skill, just like programming. It's important to learn how to work
together.

---

## Requirements
It is important to keep in mind the goal of this program and these projects,
they are to utilize the skills you have been taught and the skills that
employers care about. You should strive to build projects that will catch an
employers eye and get you hired.

### Technical Requirements
Two separate repo's are requied for this project, one for the `Back-End` and one for the `Front-End`. They must not reside on the same repo. 

**Back-End Requirements:**

- Your back-end must be consist of Ruby on Rails Restful API at least 2
  models, more if needed, with associations and security (JWT).
- Must have Create, Read, Update, and Destroy functionality built throughout the
  app (i.e. You don't need full CRUD on every model, just full CRUD throughout
  your models where it makes sense).

**Front-End Requirements:**
- Your front-end must use JQuery and leverage the backend API.
- You must communicate with the back-end API RESTfully to Create, Read, Update, and Destroy resources.
- Your frontend must be responsive and work on mobile phones, tablets, and desktops.
- Your front-end must allow users to login via the RestAPI call.
- A mobile nav that expands and collapses when a user clicks on the hamburger icon.

Review the [Rubric](https://git.generalassemb.ly/SEIR-629/PROJECT-3/blob/master/evaluation-rubric.md) for the specifics of how your project will
be graded.

### Necessary Deliverables
Your submission must include **all** of the following:

#### Project Idea and Initial Planning
By the end of Day 1 you need to submit:

1. Your project idea (a brief 2-3 sentence description of your app)
2. A list of your models and their properties
3. Link to the `frontend` repository with project worksheet
4. Link to the `backend` repository with project worksheet

These and any other planning assets (wireframes, user stories, etc) should go
inside a `planning/` directory inside your `backend` and `frontend` project repository accordingly.

### Suggested Ways to Start

- **Don’t hesitate to write throwaway code** to solve short-term problems.
- **Read the docs for whatever technologies, frameworks, or APIs you use**.
- **Write your code DRY** and **build your APIs RESTful**.
- **Commit early, commit often**. Don’t be afraid to break something because you can always go back in time to a previous version.
- **Keep user stories small and well-defined**. Remember – user stories focus on what a user needs, not what development tasks need accomplishing.
- **Write code another developer wouldn't have to ask you about**. Do your naming conventions make sense? Would another developer be able to look at your app and understand what everything is?
- **Make it all well-formatted**. Are you indenting, consistently? Can we find the start and end of every div, curly brace, etc.?
- **Comment your code**. Will someone understand what is going on in each block or function? Even if it's obvious, explaining the what & why means someone else can pick it up and get it.
- **Write pseudocode before you write actual code**. Thinking through the logic of something helps.

### Final Application

Your project is due on the last day of Project Week. Create an issue on this repo containing:

- A link to your deployed application
- A link to your Project 2 Github repositories

The repository for your backend API should include:

- A working JSON API built using Express and Mongoose that meets the technical requirements above.
- Frequent commits dating back to the very beginning of the project.
- A `planning/` directory in the root of your `backend` and `frontend` repo that contains a `readme` with all: 
    - A couple of paragraphs about the **general approach you took**.
    - Link to your **user stories** – who are your users, what do they want, and why?
    - Link to your **wireframes** – sketches of  views and interfaces in your application.
    - Link to your **Time/Priority** matrix 
    - Table including functionality and estimated/actual time for completion
    - Descriptions of any **unsolved problems** or **hurdles** you had to overcome.

The repository for the frontend of your application should include:

- A working frontend application built with HTML, CSS, Bootstrap, JQuery ect.
- CRUD functionality
- Frequent commits dating back to the very beginning of the project.
- Mobile first, responsive web application (Mobile, Tablet and Desktop).

#### Deployment

- Your API Backend must be deployed to Heroku and your front-end must be deployed to
  Netlify. Applications that are not deployed will be considered incomplete.
 
---
