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

Database Setup
-----

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager;`
4. Run the query we have saved in the file from the root directory by running `\i ./db/migrations/01_create_bookmarks_table.sql`

Database Setup for Testing
-----

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager_test;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager_test;`
4. Run the query we have saved in the file from the root directory by running `\i ./db/migrations/01_create_bookmarks_table.sql`


