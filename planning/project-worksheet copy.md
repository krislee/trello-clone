# Project Overview

## Project Link

- TBD

## Project Schedule
|  Day | Deliverable | Status
|---|---| ---|
|Day 1| Project Description | Complete
|Day 1| Wireframes / Priority Matrix / Timeline `backend` and `frontend`| Complete
|Day 2| Working RestAPI | Complete
|Day 3| Core Application Structure (HTML, CSS, etc.) | Incomplete
|Day 4| MVP & Bug Fixes | Incomplete
|Day 5| Final Touches and Present | Incomplete

## Project Description

For our unit03 project, we are creating a clone of the popular productivity app [Trello](https://trello.com/). Users sign up and login with a custom username and password and then are taken to a mobile, tablet, and desktop application where they can add a board. In each board, they can add a card that holds a list of items tied to the specified card. Each user utilizes CRUD (i.e. create, read, update, and delete) functionality to manipulate each card and/or board on a backend server created and maintained by Ruby on Rails and SQL. 

## Google Sheet

- [Sheet](https://docs.google.com/spreadsheets/d/1GKj0dpDS6maIhMR8e5oU5CzS_rvlJuWESEXH36iDz6Q/edit#gid=0)

## Wireframes

- [Wireframe](https://res.cloudinary.com/dhiwn0i0g/image/upload/v1598061926/Screen_Shot_2020-08-21_at_10.04.40_PM_zs3paq.png)

## Time/Priority Matrix 

- [Link](https://res.cloudinary.com/dpjdvsigb/image/upload/v1598196017/backend-time-priority-matrix_a0nwyu.jpg)

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
| A | Authentication | H | 2hr | 2hr |
| B | Test Authentication in Postman with Authorization | H | 2hr | 1hr |
| C | User Models/Migration | H | 1hr | 1hr |
| D | Board Models/Migration | H | 1hr | 1hr |
| E | Item Models/Migration | H | 1hr | 1hr |
| F | Deployment | H | 2hr | -hr | -hr|
| G | Create Seed Data for Initial Users, Boards, and Items | M | 1hr | -hr |
| H | Board Controllers | H | 3hr| 1hr |
| I | Item Controllers | H | 3hr | 1.5hr |
| J | Locally Test Controller Merge/Pull Requests | H | 4hrs| 5hr |
| K | Remotely Test Controller Merge/Pull Requests | H | 4hrs| -hr |
| - | Total | - | 24hrs| -hrs |

#### PostMVP
| Letter | Component | Priority | Estimated Time | Time Invested |
| --- | --- | :---: |  :---: | :---: |
| L | Activity Log Models/Migration | L | 1hr | -hr |
| M | Activity Log Controllers | L | 3hr | -hr |
| N | Team Models/Migration | L | 1hr | -hr |
| O | Team Controllers | M | 3hr | -hr |
| P | Locally Test Controller Merge/Pull Requests | M | 4hr | -hr |
| Q | Remotely Test Controller Merge/Pull Requests | M | 4hr | -hr |
| - | Total | - | 16hrs| -hrs |

## Additional Libraries
- ruby
- rails
- pg
- puma
- bcrypt
- bootsnap
- rack-cors
- jwt
- dotenv-rails
- byebug
- listen
- spring
- spring-watcher-listen
- tzinfo-data

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

**ERROR**: JWT uninitialized constant                               
**RESOLUTION**: 'gem dwt' in gem file and not 'gem pwt'