Bookmark Manager
=====

User Stories
-----
`As a user
So I can see my saved bookmarks
I would like to be able to view all bookmarks`

|  Objects        |  Messages      |
| ----------      | -------------  | 
| User |                        |
| Bookmarks |      view_all    |

```mermaid
graph TD
    A[User] -->B[Bookmarks]
    B[Bookmarks] -->C[view_all]
```

`As a user
So I can store bookmarks
I would like to be able to input new bookmarks`

|  Objects        |  Messages      |
| ----------      | -------------  | 
| User            |                |
| Bookmarks       |   create       |

```mermaid
graph TD
    A[User] -->B["/bookmarks"]
    B["/bookmarks"] --> C["/new"]
    C["/new"] --> D[Submit form]
    D[Submit form] -->E[Bookmark#create]
    E[Bookmark#create] --> F["INSERT (url) to DB table: bookmark_manager: bookmarks"]
```

`As a user
So I can remove my bookwork from Bookmark Manager
I want to delete a bookmark`

|  Objects        |  Messages      |
| ----------      | -------------  | 
| User |                        |
| Bookmarks |      delete    |

```mermaid
graph TD
    A[User] -->B["/bookmarks"]
    B["/bookmarks"] --> C[Delete button]
    C[Delete button] --> D[Bookmark#delete]
    D[Bookmark#delete] --> E["DELETE (id) from DB table: bookmark_manager: bookmarks"]
```

`As a user
So I can update my bookmark from Bookmark Manager
I want to update a bookmark`


|  Objects        |  Messages      |
| ----------      | -------------  | 
| User            |                |
| Bookmarks       | find, update   |


```mermaid
graph TD
    A[User] -->B["/bookmarks"]
    B["/bookmarks"] --> C[Update button]
    C[Update button] --> D[Bookmark#update]
    D[Bookmark#update] --> E[Bookmark#find]
    E[Bookmark#find] --> F["UPDATE (title, url) from DB table: bookmark_manager: bookmarks"]
```

`As a user
So I can see comments on my bookmarks from Bookmark Manager
I want to comment a bookmark`

|  Objects        |  Messages      |
| ----------      | -------------  | 
| User            |                |
| Bookmarks       | find, update   |
| Comment     | where, create  |

```mermaid
graph TD
    A[User] -->B["/bookmarks"]
    B["/bookmarks"] --> C[Add comment button]
    C[Add comment button] --> D[Comment#create]
    D[Comment#create] --> E["INSERT (text, bookmark_id) to DB table: bookmark_manager: comments"]
    --> F[Bookmark#comments] --> G[Comment#where]
```

Database Setup
-----

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager;`
4. Run the query we have saved in the file from the root directory by running `\i ./db/migrations/01_create_bookmarks_table.sql`
5. Run the query we have saved in the file from the root directory by running `\i ./db/migrations/02_add_title_to_bookmarks.sql`

Database Setup for Testing
-----

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager_test;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager_test;`
4. Run the query we have saved in the file from the root directory by running `\i ./db/migrations/01_create_bookmarks_table.sql`
5. Run the query we have saved in the file from the root directory by running `\i ./db/migrations/02_add_title_to_bookmarks.sql`


