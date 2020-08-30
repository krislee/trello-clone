# Project Overview

## Project Link

- [Link](https://telloapp.netlify.app/)

## Project Schedule
|  Day | Deliverable | Status
|---|---| ---|
|Day 1| Project Description | Complete
|Day 1| Wireframes / Priority Matrix / Timeline `backend` and `frontend`| Complete
|Day 2| Working RestAPI | Complete
|Day 3| Core Application Structure (HTML, CSS, etc.) | Complete
|Day 4| MVP & Bug Fixes | Complete
|Day 5| Final Touches and Present | Incomplete

## Project Description

For our unit03 project, we are creating a clone of the popular productivity app [Trello](https://trello.com/). Users sign up and login with a custom username and password and then are taken to a mobile, tablet, and desktop application where they can add a board. In each board, they can add a card that holds a list of items tied to the specified card. Each user utilizes CRUD (i.e. create, read, update, and delete) functionality to manipulate each card and/or board on a backend server created and maintained by Ruby on Rails and SQL. 

## Google Sheet

- [Sheet](https://docs.google.com/spreadsheets/d/1GKj0dpDS6maIhMR8e5oU5CzS_rvlJuWESEXH36iDz6Q/edit#gid=0)

## Wireframes

- [Wireframe](https://res.cloudinary.com/dhiwn0i0g/image/upload/v1598061926/Screen_Shot_2020-08-21_at_10.04.40_PM_zs3paq.png)

## Time/Priority Matrix 

- [MVP](https://res.cloudinary.com/dpjdvsigb/image/upload/v1598754705/project-3-assets/backend-mvp_ldjr1t.jpg)
- [Post MVP](https://res.cloudinary.com/dpjdvsigb/image/upload/v1598755486/project-3-assets/backend-post-mvp_vvcssp.jpg)

### MVP/PostMVP - 5min

#### MVP

- Proper authentication and authorization for login
- Make model and migration files for user, board, and items
- Create relevant CRUD functionalities for user, board, and items through controllers/routes
- Test all routes for proper functionality
- Deploy to Heroku

#### PostMVP 

- Add model and migration file for activity log
- Create additional table for team

## Functional Components

#### MVP
| Letter | Component | Priority | Estimated Time | Time Invested |
| --- | --- | :---: |  :---: | :---: |
| A | User Login Authentication | H | 1hr | 1hr |
| B | Test Authentication in Postman with Authorization | H | 1hr | .5hr |
| C | User Models/Migration | H | .5hr | .5hr |
| D | Board Models/Migration | H | .5hr | 1hr |
| E | List Models/Migration | H | 1hr | .5hr |
| F | Item Models/Migration | H | 1hr | .5hr |
| G | Board Controllers | H | 2hr| 1hr |
| H | List Controllers | H | 3hr | 2hr |
| I | Item Controllers | H | 5hr | 4hr |
| J | Locally Test and Debug Board Controllers | H | .5hr | .5hr |
| K | Locally Test and Debug List Controllers | H | 1hrs| .5hr |
| L | Locally Test and Debug Item Controllers | H | 2hrs| 3hr |
| M | Deployment | H | .5hr | 2hr |
| N | Remotely Test and Debug Board Controllers | H | .5hrs| .5hr |
| O | Remotely Test and Debug List Controllers | H | 4hrs| 2hr |
| P | Remotely Test and Debug Item Controllers | H | 2hrs| 3hr |
| - | Total | - | 24hrs| 22.5hrs |

#### PostMVP
| Letter | Component | Priority | Estimated Time | Time Invested |
| --- | --- | :---: |  :---: | :---: |
| A | Create Seed Data for Initial Users, Boards, and Items | M | 1hr | 1hr |
| B | Activity Log Models/Migration | L | 1hr | -hr |
| C | Activity Log Controllers | L | 3hr | -hr |
| D | Team Models/Migration | L | 1hr | -hr |
| E | Team Controllers | M | 3hr | -hr |
| F | Locally Test Activity Log Controller | M | 2hr | -hr |
| G | Remotely Test Activity Log Controller | M | 2hr | -hr |
| H | Locally Test Activity Log Controller | M | 2hr | -hr |
| I | Remotely Test Activity Log Controller | M | 2hr | -hr |
| - | Total | - | 16hrs| 1hrs |

## Additional Libraries
- [Ruby](https://www.ruby-lang.org/en/)
- [Rails](https://rubyonrails.org/)
- [PG](https://www.npmjs.com/package/pg)
- [Puma](https://www.npmjs.com/package/puma)
- [BCrypt](https://www.npmjs.com/package/bcrypt)
- [Bootsnap](https://github.com/Shopify/bootsnap)
- [Rack-Cors](https://www.npmjs.com/package/cors)
- [JWT](https://jwt.io/)
- [Dotenv-Rails](https://rubygems.org/gems/dotenv-rails/versions/2.1.1)
- [ByeBug](https://edgeguides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-byebug-gem)
- [Listen](https://github.com/guard/listen)
- [Spring](https://github.com/rails/spring)
- [Spring-Watcher-Listen](https://github.com/jonleighton/spring-watcher-listen)
- [Tzinfo-Data](https://github.com/tzinfo/tzinfo-data)

## Code Snippet

To show all the items from one list of a board, the query began from most outer level which was the board down to the particular item. In order to query for a single list under the board and a single item under that list, the ids of the board_id and list_id were needed. To accomplish that, the ids were taken from the result of the board query and list query. However, since each of the queries returned an array of one object, bracket notation was used to access the object before accessing each of the ids of each the selected board and list objects. By gaining the ids for the queries in a top-down approach, all the items of a list of a board could be displayed. 

```
def index
    @one_board = Board.where(:id => params[:board_id],:user_id => @user.id) #asking for the id that matches the board id
    if @one_board.present?
      @one_list = List.where(:board_id => @one_board[0].id, :id => params[:list_id]) #gets one of the lists from our single board id
      if @one_list.present?
        @all_items = Item.where(:list_id => @one_list[0].id) #All the items from the one list.
        if @all_items.empty?
          render :json => {
              :response => "There are no items in this list"
          }
        else
          render :json =>  @all_items
        end
      else
        render :json => {
            :response => "This list does not exist in this board. Failed to find the items in this list."
        }
      end
    else
      render :json => {
          :response => "This board does not exist"
      }
    end
  end
```

## Issues and Resolutions

**ERROR**: 
There was a continuous error during deployment when Heroku attempted to bundle install: ```/usr/bin/env: 'ruby\r': No such file or directory```    
                     
**RESOLUTION**: Every file of the rails app was searched to find the ruby\r. After exhaustive search of the files, the ruby\r could not be found. This error may have possibly stem from the different operating systems the team used, and so git push and pull across the team could have generated an unknown ruby\r somewhere. To avoid this, a new repo was made by one member, and the code that was produced from the team was extracted into this repo to successfully deploy the backend.