# ImprovedAttributesExample

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Mix generators logs

This log will be updated commit by commit, according to mix generators run during related commit changes.

### Html generators

#### Commit 1

<details>

<summary>

```bash
$ mix phx.gen.html Catalog Product products name description:text price:decimal:precision,10:scale,5:default,21.98 rate:float:default,5.0 code:integer:default,1234
```

</summary>

```bash
$ mix phx.gen.html Catalog Product products name description:text price:decimal:precision,10:scale,5:default,21.98 rate:float:default,5.0 code:integer:default,1234
At least one attribute has to be specified as required.
Use option `required` or its alias `*`.

Examples:

    title:string:required
    name:string:*:unique

None of the given attributes are set to be required,
Hence first attribute `name` is going to be required.

Proceed with chosen required attribute? [Yn] Y
* creating lib/improved_attributes_example/catalog/product.ex
* creating priv/repo/migrations/20241127184053_create_products.exs
* creating lib/improved_attributes_example/catalog.ex
* injecting lib/improved_attributes_example/catalog.ex
* creating test/improved_attributes_example/catalog_test.exs
* injecting test/improved_attributes_example/catalog_test.exs
* creating test/support/fixtures/catalog_fixtures.ex
* injecting test/support/fixtures/catalog_fixtures.ex
* creating lib/improved_attributes_example_web/controllers/product_controller.ex
* creating lib/improved_attributes_example_web/controllers/product_html/edit.html.heex
* creating lib/improved_attributes_example_web/controllers/product_html/index.html.heex
* creating lib/improved_attributes_example_web/controllers/product_html/new.html.heex
* creating lib/improved_attributes_example_web/controllers/product_html/show.html.heex
* creating lib/improved_attributes_example_web/controllers/product_html/product_form.html.heex
* creating lib/improved_attributes_example_web/controllers/product_html.ex
* creating test/improved_attributes_example_web/controllers/product_controller_test.exs

Add the resource to your browser scope in lib/improved_attributes_example_web/router.ex:

    resources "/products", ProductController


Remember to update your repository by running migrations:

    $ mix ecto.migrate

$ mix ecto.migrate
Compiling 5 files (.ex)
Generated improved_attributes_example app

20:41:55.138 [info] == Running 20241127184053 ImprovedAttributesExample.Repo.Migrations.CreateProducts.change/0 forward

20:41:55.142 [info] create table products

20:41:55.153 [info] == Migrated 20241127184053 in 0.0s

$ mix test
Compiling 6 files (.ex)
Generated improved_attributes_example app
Running ExUnit with seed: 268482, max_cases: 24

.....................
Finished in 0.3 seconds (0.1s async, 0.2s sync)
21 tests, 0 failures
```

</details>

#### Commit 2

<details>

<summary>

```bash
$ mix phx.gen.html Blog Post blog_posts title content:text:* public:boolean:default,true topics:integer:default,1 reviewed:datetime tags:array --binary-id
```

</summary>

```bash
$ mix phx.gen.html Blog Post blog_posts title content:text:* public:boolean:default,true topics:integer:default,1 reviewed:datetime tags:array --binary-id
* creating lib/improved_attributes_example/blog/post.ex
* creating priv/repo/migrations/20241127192509_create_blog_posts.exs
* creating lib/improved_attributes_example/blog.ex
* injecting lib/improved_attributes_example/blog.ex
* creating test/improved_attributes_example/blog_test.exs
* injecting test/improved_attributes_example/blog_test.exs
* creating test/support/fixtures/blog_fixtures.ex
* injecting test/support/fixtures/blog_fixtures.ex
* creating lib/improved_attributes_example_web/controllers/post_controller.ex
* creating lib/improved_attributes_example_web/controllers/post_html/edit.html.heex
* creating lib/improved_attributes_example_web/controllers/post_html/index.html.heex
* creating lib/improved_attributes_example_web/controllers/post_html/new.html.heex
* creating lib/improved_attributes_example_web/controllers/post_html/show.html.heex
* creating lib/improved_attributes_example_web/controllers/post_html/post_form.html.heex
* creating lib/improved_attributes_example_web/controllers/post_html.ex
* creating test/improved_attributes_example_web/controllers/post_controller_test.exs

Add the resource to your browser scope in lib/improved_attributes_example_web/router.ex:

    resources "/blog_posts", PostController


Remember to update your repository by running migrations:

    $ mix ecto.migrate

$ mix ecto.migrate
Compiling 5 files (.ex)
Generated improved_attributes_example app

21:25:52.879 [info] == Running 20241127192509 ImprovedAttributesExample.Repo.Migrations.CreateBlogPosts.change/0 forward

21:25:52.883 [info] create table blog_posts

21:25:52.892 [info] == Migrated 20241127192509 in 0.0s

$ mix test
Compiling 2 files (.ex)
Compiling 2 files (.ex)
Generated improved_attributes_example app
Running ExUnit with seed: 776002, max_cases: 24

.....................................
Finished in 0.7 seconds (0.2s async, 0.5s sync)
37 tests, 0 failures
```

</details>

#### Commit 3

<details>

<summary>

```bash
$ mix phx.gen.html General.Library Book books name:string:*:index isbn:string:required:unique index_page:integer:default,1:* print_size:decimal:default,13.45:* rate:float:default,5.0:* free:boolean author_real_name:string:redact
```

</summary>

```bash
$ mix phx.gen.html General.Library Book books name:string:*:index isbn:string:required:unique index_page:integer:default,1:* print_size:decimal:default,13.45:* rate:float:default,5.0:* free:boolean author_real_name:string:redact
* creating lib/improved_attributes_example/general/library/book.ex
* creating priv/repo/migrations/20241127221602_create_books.exs
* creating lib/improved_attributes_example/general/library.ex
* injecting lib/improved_attributes_example/general/library.ex
* creating test/improved_attributes_example/general/library_test.exs
* injecting test/improved_attributes_example/general/library_test.exs
* creating test/support/fixtures/general/library_fixtures.ex
* injecting test/support/fixtures/general/library_fixtures.ex
* creating lib/improved_attributes_example_web/controllers/book_controller.ex
* creating lib/improved_attributes_example_web/controllers/book_html/edit.html.heex
* creating lib/improved_attributes_example_web/controllers/book_html/index.html.heex
* creating lib/improved_attributes_example_web/controllers/book_html/new.html.heex
* creating lib/improved_attributes_example_web/controllers/book_html/show.html.heex
* creating lib/improved_attributes_example_web/controllers/book_html/book_form.html.heex
* creating lib/improved_attributes_example_web/controllers/book_html.ex
* creating test/improved_attributes_example_web/controllers/book_controller_test.exs

Add the resource to your browser scope in lib/improved_attributes_example_web/router.ex:

    resources "/books", BookController


Remember to update your repository by running migrations:

    $ mix ecto.migrate

$ mix ecto.migrate
Compiling 5 files (.ex)
Generated improved_attributes_example app

00:17:13.227 [info] == Running 20241127221602 ImprovedAttributesExample.Repo.Migrations.CreateBooks.change/0 forward

00:17:13.230 [info] create table books

00:17:13.243 [info] create index books_isbn_index

00:17:13.245 [info] create index books_name_index

00:17:13.248 [info] == Migrated 20241127221602 in 0.0s

$ mix test
Compiling 6 files (.ex)
Generated improved_attributes_example app
Running ExUnit with seed: 807892, max_cases: 24

.....................................................
Finished in 0.5 seconds (0.1s async, 0.3s sync)
53 tests, 0 failures
```

</details>

#### Commit 4

<details>

<summary>

```bash
$ mix phx.gen.html Catalog Comment comments body:string:size,303:* product_id:references:*:on_delete,delete_all post_id:references:Blog.Post --binary-id
```

</summary>

```bash
$ mix phx.gen.html Catalog Comment comments body:string:size,303:* product_id:references:*:on_delete,delete_all post_id:references:Blog.Post --binary-id
You are generating into an existing context.

The ImprovedAttributesExample.Catalog context currently has 6 functions and 1 file in its directory.

  * It's OK to have multiple resources in the same context as long as they are closely related. But if a context grows too large, consider breaking it apart

  * If they are not closely related, another context probably works better

The fact that two entities are related in the database does not mean they belong to the same context.

If you are not sure, prefer creating a new context over adding to the existing one.

Would you like to proceed? [Yn] Y
* creating lib/improved_attributes_example/catalog/comment.ex
* creating priv/repo/migrations/20241127221910_create_comments.exs
* injecting lib/improved_attributes_example/catalog.ex
* injecting test/improved_attributes_example/catalog_test.exs
* injecting test/support/fixtures/catalog_fixtures.ex
* creating lib/improved_attributes_example_web/controllers/comment_controller.ex
* creating lib/improved_attributes_example_web/controllers/comment_html/edit.html.heex
* creating lib/improved_attributes_example_web/controllers/comment_html/index.html.heex
* creating lib/improved_attributes_example_web/controllers/comment_html/new.html.heex
* creating lib/improved_attributes_example_web/controllers/comment_html/show.html.heex
* creating lib/improved_attributes_example_web/controllers/comment_html/comment_form.html.heex
* creating lib/improved_attributes_example_web/controllers/comment_html.ex
* creating test/improved_attributes_example_web/controllers/comment_controller_test.exs

Add the resource to your browser scope in lib/improved_attributes_example_web/router.ex:

    resources "/comments", CommentController


Remember to update your repository by running migrations:

    $ mix ecto.migrate

$ mix ecto.migrate
Compiling 5 files (.ex)
Generated improved_attributes_example app

00:19:59.339 [info] == Running 20241127221910 ImprovedAttributesExample.Repo.Migrations.CreateComments.change/0 forward

00:19:59.344 [info] create table comments

00:19:59.356 [info] create index comments_post_id_index

00:19:59.358 [info] create index comments_product_id_index

00:19:59.363 [info] == Migrated 20241127221910 in 0.0s

$ mix test
Compiling 6 files (.ex)
Generated improved_attributes_example app
Running ExUnit with seed: 886935, max_cases: 24

.....................................................................
Finished in 0.6 seconds (0.2s async, 0.4s sync)
69 tests, 0 failures
```

</details>

#### Commit 5

<details>

<summary>

```bash
$ mix phx.gen.html Blog Note notes body:text:unique review_day:date:unique product_id:references:Catalog.Product:unique post_id:references book_id:references:assoc,manual:General.Library.Book:column,isbn data:any:virtual meta:[array,string]:virtual points:[array,integer] status:enum:[draft,actual,archived] tags:[array,enum]:[[music,1],[dance,2],[movie,3]]
```

</summary>

```bash
$ mix phx.gen.html Blog Note notes body:text:unique review_day:date:unique product_id:references:Catalog.Product:unique post_id:references book_id:references:assoc,manual:General.Library.Book:column,isbn data:any:virtual meta:[array,string]:virtual points:[array,integer] status:enum:[draft,actual,archived] tags:[array,enum]:[[music,1],[dance,2],[movie,3]]
At least one attribute has to be specified as required.
Use option `required` or its alias `*`.

Examples:

    title:string:required
    name:string:*:unique

None of the given attributes are set to be required,
Hence first attribute `body:text:unique` is going to be required.

Proceed with chosen required attribute? [Yn] Y
You are generating into an existing context.

The ImprovedAttributesExample.Blog context currently has 6 functions and 1 file in its directory.

  * It's OK to have multiple resources in the same context as long as they are closely related. But if a context grows too large, consider breaking it apart

  * If they are not closely related, another context probably works better

The fact that two entities are related in the database does not mean they belong to the same context.

If you are not sure, prefer creating a new context over adding to the existing one.

Would you like to proceed? [Yn] Y
* creating lib/improved_attributes_example/blog/note.ex
* creating priv/repo/migrations/20241127223001_create_notes.exs
* injecting lib/improved_attributes_example/blog.ex
* injecting test/improved_attributes_example/blog_test.exs
* injecting test/support/fixtures/blog_fixtures.ex

Some of the generated database columns are unique. Please provide
unique implementations for the following fixture function(s) in
test/support/fixtures/blog_fixtures.ex:

    def unique_note_review_day do
      raise "implement the logic to generate a unique note review_day"
    end

* creating lib/improved_attributes_example_web/controllers/note_controller.ex
* creating lib/improved_attributes_example_web/controllers/note_html/edit.html.heex
* creating lib/improved_attributes_example_web/controllers/note_html/index.html.heex
* creating lib/improved_attributes_example_web/controllers/note_html/new.html.heex
* creating lib/improved_attributes_example_web/controllers/note_html/show.html.heex
* creating lib/improved_attributes_example_web/controllers/note_html/note_form.html.heex
* creating lib/improved_attributes_example_web/controllers/note_html.ex
* creating test/improved_attributes_example_web/controllers/note_controller_test.exs

Add the resource to your browser scope in lib/improved_attributes_example_web/router.ex:

    resources "/notes", NoteController


Remember to update your repository by running migrations:

    $ mix ecto.migrate

$ mix ecto.migrate
Compiling 5 files (.ex)
Generated improved_attributes_example app

00:31:46.509 [info] == Running 20241127223001 ImprovedAttributesExample.Repo.Migrations.CreateNotes.change/0 forward

00:31:46.513 [info] create table notes

00:31:46.520 [info] create index notes_body_index

00:31:46.522 [info] create index notes_review_day_index

00:31:46.524 [info] create index notes_book_id_index

00:31:46.526 [info] create index notes_post_id_index

00:31:46.527 [info] create index notes_product_id_index

00:31:46.531 [info] == Migrated 20241127223001 in 0.0s

$ mix test
Compiling 1 file (.ex)
Running ExUnit with seed: 120609, max_cases: 24

.....................................................................................
Finished in 2.4 seconds (0.8s async, 1.6s sync)
85 tests, 0 failures
```

</details>

### Live generators

#### Commit 6

<details>

<summary>

```bash
$ mix phx.gen.live LiveCatalog LiveProduct live_products name description:text price:decimal:precision,10:scale,5:default,21.98 rate:float:default,5.0 code:integer:default,1234
```

</summary>

```bash
$ mix phx.gen.live LiveCatalog LiveProduct live_products name description:text price:decimal:precision,10:scale,5:default,21.98 rate:float:default,5.0 code:integer:default,1234
At least one attribute has to be specified as required.
Use option `required` or its alias `*`.

Examples:

    title:string:required
    name:string:*:unique
                                                                                                                                                                                            None of the given attributes are set to be required,
Hence first attribute `name` is going to be required.

Proceed with chosen required attribute? [Yn] Y
* creating lib/improved_attributes_example/live_catalog/live_product.ex
* creating priv/repo/migrations/20241128234124_create_live_products.exs
* creating lib/improved_attributes_example/live_catalog.ex
* injecting lib/improved_attributes_example/live_catalog.ex
* creating test/improved_attributes_example/live_catalog_test.exs
* injecting test/improved_attributes_example/live_catalog_test.exs
* creating test/support/fixtures/live_catalog_fixtures.ex
* injecting test/support/fixtures/live_catalog_fixtures.ex
* creating lib/improved_attributes_example_web/live/live_product_live/show.ex
* creating lib/improved_attributes_example_web/live/live_product_live/index.ex
* creating lib/improved_attributes_example_web/live/live_product_live/form.ex
* creating test/improved_attributes_example_web/live/live_product_live_test.exs

Add the live routes to your browser scope in lib/improved_attributes_example_web/router.ex:

    live "/live_products", LiveProductLive.Index, :index
    live "/live_products/new", LiveProductLive.Form, :new
    live "/live_products/:id", LiveProductLive.Show, :show
    live "/live_products/:id/edit", LiveProductLive.Form, :edit


Remember to update your repository by running migrations:

    $ mix ecto.migrate

$ mix ecto.migrate
Compiling 6 files (.ex)
Generated improved_attributes_example app

01:42:40.306 [info] == Running 20241128234124 ImprovedAttributesExample.Repo.Migrations.CreateLiveProducts.change/0 forward

01:42:40.309 [info] create table live_products

01:42:40.328 [info] == Migrated 20241128234124 in 0.0s

$ mix test
Compiling 7 files (.ex)
Generated improved_attributes_example app
Running ExUnit with seed: 625411, max_cases: 24

...................................................................................................
Finished in 1.0 seconds (0.2s async, 0.8s sync)
99 tests, 0 failures
```

</details>

#### Commit 7

<details>

<summary>

```bash
$ mix phx.gen.live LiveBlog LivePost live_blog_posts title content:text:* public:boolean:default,true topics:integer:default,1 reviewed:datetime tags:array --binary-id
```

</summary>

```bash
$ mix phx.gen.live LiveBlog LivePost live_blog_posts title content:text:* public:boolean:default,true topics:integer:default,1 reviewed:datetime tags:array --binary-id
* creating lib/improved_attributes_example/live_blog/live_post.ex
* creating priv/repo/migrations/20241129000000_create_live_blog_posts.exs
* creating lib/improved_attributes_example/live_blog.ex
* injecting lib/improved_attributes_example/live_blog.ex
* creating test/improved_attributes_example/live_blog_test.exs
* injecting test/improved_attributes_example/live_blog_test.exs
* creating test/support/fixtures/live_blog_fixtures.ex
* injecting test/support/fixtures/live_blog_fixtures.ex
* creating lib/improved_attributes_example_web/live/live_post_live/show.ex
* creating lib/improved_attributes_example_web/live/live_post_live/index.ex
* creating lib/improved_attributes_example_web/live/live_post_live/form.ex
* creating test/improved_attributes_example_web/live/live_post_live_test.exs

Add the live routes to your browser scope in lib/improved_attributes_example_web/router.ex:

    live "/live_blog_posts", LivePostLive.Index, :index
    live "/live_blog_posts/new", LivePostLive.Form, :new
    live "/live_blog_posts/:id", LivePostLive.Show, :show
    live "/live_blog_posts/:id/edit", LivePostLive.Form, :edit


Remember to update your repository by running migrations:

    $ mix ecto.migrate

$ mix ecto.migrate
Compiling 6 files (.ex)
Generated improved_attributes_example app

02:01:20.917 [info] == Running 20241129000000 ImprovedAttributesExample.Repo.Migrations.CreateLiveBlogPosts.change/0 forward

02:01:20.918 [info] create table live_blog_posts

02:01:20.928 [info] == Migrated 20241129000000 in 0.0s

$ mix test
Compiling 7 files (.ex)
Generated improved_attributes_example app
Running ExUnit with seed: 109880, max_cases: 24

.................................................................................................................
Finished in 1.1 seconds (0.2s async, 0.9s sync)
113 tests, 0 failures
```

</details>

#### Commit 8

<details>

<summary>

```bash
$ mix phx.gen.live LiveGeneral.LiveLibrary LiveBook live_books name:string:*:index isbn:string:required:unique index_page:integer:default,1:* print_size:decimal:default,13.45:* rate:float:default,5.0:* free:boolean author_real_name:string:redact
```

</summary>

```bash
$ mix phx.gen.live LiveGeneral.LiveLibrary LiveBook live_books name:string:*:index isbn:string:required:unique index_page:integer:default,1:* print_size:decimal:default,13.45:* rate:float:default,5.0:* free:boolean author_real_name:string:redact
* creating lib/improved_attributes_example/live_general/live_library/live_book.ex
* creating priv/repo/migrations/20241129000421_create_live_books.exs
* creating lib/improved_attributes_example/live_general/live_library.ex
* injecting lib/improved_attributes_example/live_general/live_library.ex
* creating test/improved_attributes_example/live_general/live_library_test.exs
* injecting test/improved_attributes_example/live_general/live_library_test.exs
* creating test/support/fixtures/live_general/live_library_fixtures.ex
* injecting test/support/fixtures/live_general/live_library_fixtures.ex
* creating lib/improved_attributes_example_web/live/live_book_live/show.ex
* creating lib/improved_attributes_example_web/live/live_book_live/index.ex
* creating lib/improved_attributes_example_web/live/live_book_live/form.ex
* creating test/improved_attributes_example_web/live/live_book_live_test.exs

Add the live routes to your browser scope in lib/improved_attributes_example_web/router.ex:

    live "/live_books", LiveBookLive.Index, :index
    live "/live_books/new", LiveBookLive.Form, :new
    live "/live_books/:id", LiveBookLive.Show, :show
    live "/live_books/:id/edit", LiveBookLive.Form, :edit


Remember to update your repository by running migrations:

    $ mix ecto.migrate

$ mix ecto.migrate
Compiling 6 files (.ex)
Generated improved_attributes_example app

02:04:47.890 [info] == Running 20241129000421 ImprovedAttributesExample.Repo.Migrations.CreateLiveBooks.change/0 forward

02:04:47.892 [info] create table live_books

02:04:47.900 [info] create index live_books_isbn_index

02:04:47.902 [info] create index live_books_name_index

02:04:47.905 [info] == Migrated 20241129000421 in 0.0s

$ mix test
Compiling 7 files (.ex)
Generated improved_attributes_example app
Running ExUnit with seed: 277234, max_cases: 24

...............................................................................................................................
Finished in 1.2 seconds (0.3s async, 0.9s sync)
127 tests, 0 failures
```

</details>

#### Commit 9

<details>

<summary>

```bash
$ mix phx.gen.live LiveCatalog LiveComment live_comments body:string:size,303:* live_product_id:references:*:on_delete,delete_all live_post_id:references:LiveBlog.LivePost --binary-id
```

</summary>

```bash
$ mix phx.gen.live LiveCatalog LiveComment live_comments body:string:size,303:* live_product_id:references:*:on_delete,delete_all live_post_id:references:LiveBlog.LivePost --binary-id
You are generating into an existing context.

The ImprovedAttributesExample.LiveCatalog context currently has 6 functions and 1 file in its directory.

  * It's OK to have multiple resources in the same context as long as they are closely related. But if a context grows too large, consider breaking it apart

  * If they are not closely related, another context probably works better

The fact that two entities are related in the database does not mean they belong to the same context.

If you are not sure, prefer creating a new context over adding to the existing one.

Would you like to proceed? [Yn] Y
* creating lib/improved_attributes_example/live_catalog/live_comment.ex
* creating priv/repo/migrations/20241129000942_create_live_comments.exs
* injecting lib/improved_attributes_example/live_catalog.ex
* injecting test/improved_attributes_example/live_catalog_test.exs
* injecting test/support/fixtures/live_catalog_fixtures.ex
* creating lib/improved_attributes_example_web/live/live_comment_live/show.ex
* creating lib/improved_attributes_example_web/live/live_comment_live/index.ex
* creating lib/improved_attributes_example_web/live/live_comment_live/form.ex
* creating test/improved_attributes_example_web/live/live_comment_live_test.exs

Add the live routes to your browser scope in lib/improved_attributes_example_web/router.ex:

    live "/live_comments", LiveCommentLive.Index, :index
    live "/live_comments/new", LiveCommentLive.Form, :new
    live "/live_comments/:id", LiveCommentLive.Show, :show
    live "/live_comments/:id/edit", LiveCommentLive.Form, :edit


Remember to update your repository by running migrations:

    $ mix ecto.migrate

$ mix ecto.migrate
Compiling 6 files (.ex)
Generated improved_attributes_example app

02:10:09.186 [info] == Running 20241129000942 ImprovedAttributesExample.Repo.Migrations.CreateLiveComments.change/0 forward

02:10:09.188 [info] create table live_comments

02:10:09.196 [info] create index live_comments_live_post_id_index

02:10:09.199 [info] create index live_comments_live_product_id_index

02:10:09.203 [info] == Migrated 20241129000942 in 0.0s

$ mix test
Compiling 7 files (.ex)
Generated improved_attributes_example app
Running ExUnit with seed: 430727, max_cases: 24

.............................................................................................................................................
Finished in 1.5 seconds (0.3s async, 1.1s sync)
141 tests, 0 failures
```

</details>

#### Commit 10

<details>

<summary>

```bash
$ mix phx.gen.live LiveBlog LiveNote live_notes body:text:unique review_day:date:unique live_product_id:references:LiveCatalog.LiveProduct:unique live_post_id:references live_book_id:references:assoc,manual:LiveGeneral.LiveLibrary.LiveBook:column,isbn data:any:virtual meta:[array,string]:virtual points:[array,integer] status:enum:[draft,actual,archived] tags:[array,enum]:[[music,1],[dance,2],[movie,3]]
```

</summary>

```bash
$ mix phx.gen.live LiveBlog LiveNote live_notes body:text:unique review_day:date:unique live_product_id:references:LiveCatalog.LiveProduct:unique live_post_id:references live_book_id:references:assoc,manual:LiveGeneral.LiveLibrary.LiveBook:column,isbn data:any:virtual meta:[array,string]:virtual points:[array,integer] status:enum:[draft,actual,archived] tags:[array,enum]:[[music,1],[dance,2],[movie,3]]
At least one attribute has to be specified as required.
Use option `required` or its alias `*`.

Examples:

    title:string:required
    name:string:*:unique

None of the given attributes are set to be required,
Hence first attribute `body:text:unique` is going to be required.

Proceed with chosen required attribute? [Yn] Y
You are generating into an existing context.

The ImprovedAttributesExample.LiveBlog context currently has 6 functions and 1 file in its directory.

  * It's OK to have multiple resources in the same context as long as they are closely related. But if a context grows too large, consider breaking it apart

  * If they are not closely related, another context probably works better

The fact that two entities are related in the database does not mean they belong to the same context.

If you are not sure, prefer creating a new context over adding to the existing one.

Would you like to proceed? [Yn] Y
* creating lib/improved_attributes_example/live_blog/live_note.ex
* creating priv/repo/migrations/20241129001246_create_live_notes.exs
* injecting lib/improved_attributes_example/live_blog.ex
* injecting test/improved_attributes_example/live_blog_test.exs
* injecting test/support/fixtures/live_blog_fixtures.ex

Some of the generated database columns are unique. Please provide
unique implementations for the following fixture function(s) in
test/support/fixtures/live_blog_fixtures.ex:

    def unique_live_note_review_day do
      raise "implement the logic to generate a unique live_note review_day"
    end

* creating lib/improved_attributes_example_web/live/live_note_live/show.ex
* creating lib/improved_attributes_example_web/live/live_note_live/index.ex
* creating lib/improved_attributes_example_web/live/live_note_live/form.ex
* creating test/improved_attributes_example_web/live/live_note_live_test.exs

Add the live routes to your browser scope in lib/improved_attributes_example_web/router.ex:

    live "/live_notes", LiveNoteLive.Index, :index
    live "/live_notes/new", LiveNoteLive.Form, :new
    live "/live_notes/:id", LiveNoteLive.Show, :show
    live "/live_notes/:id/edit", LiveNoteLive.Form, :edit


Remember to update your repository by running migrations:

    $ mix ecto.migrate

$ mix ecto.migrate
Compiling 6 files (.ex)
Generated improved_attributes_example app

02:13:18.853 [info] == Running 20241129001246 ImprovedAttributesExample.Repo.Migrations.CreateLiveNotes.change/0 forward

02:13:18.856 [info] create table live_notes

02:13:18.864 [info] create index live_notes_body_index

02:13:18.866 [info] create index live_notes_review_day_index

02:13:18.867 [info] create index live_notes_live_book_id_index

02:13:18.869 [info] create index live_notes_live_post_id_index

02:13:18.871 [info] create index live_notes_live_product_id_index

02:13:18.874 [info] == Migrated 20241129001246 in 0.0s

$ mix test
Compiling 1 file (.ex)
Running ExUnit with seed: 54660, max_cases: 24

...........................................................................................................................................................
Finished in 1.8 seconds (0.3s async, 1.4s sync)
155 tests, 0 failures
```

</details>

### Json generators

#### Commit 11

<details>

<summary>

```bash
$ mix phx.gen.json ApiCatalog ApiProduct api_products name description:text price:decimal:precision,10:scale,5:default,21.98 rate:float:default,5.0 code:integer:default,1234
```

</summary>

```bash
$ mix phx.gen.json ApiCatalog ApiProduct api_products name description:text price:decimal:precision,10:scale,5:default,21.98 rate:float:default,5.0 code:integer:default,1234
At least one attribute has to be specified as required.
Use option `required` or its alias `*`.

Examples:

    title:string:required
    name:string:*:unique

None of the given attributes are set to be required,
Hence first attribute `name` is going to be required.

Proceed with chosen required attribute? [Yn] Y
* creating lib/improved_attributes_example/api_catalog/api_product.ex
* creating priv/repo/migrations/20241129001804_create_api_products.exs
* creating lib/improved_attributes_example/api_catalog.ex
* injecting lib/improved_attributes_example/api_catalog.ex
* creating test/improved_attributes_example/api_catalog_test.exs
* injecting test/improved_attributes_example/api_catalog_test.exs
* creating test/support/fixtures/api_catalog_fixtures.ex
* injecting test/support/fixtures/api_catalog_fixtures.ex
* creating lib/improved_attributes_example_web/controllers/api_product_controller.ex
* creating lib/improved_attributes_example_web/controllers/api_product_json.ex
* creating lib/improved_attributes_example_web/controllers/changeset_json.ex
* creating test/improved_attributes_example_web/controllers/api_product_controller_test.exs
* creating lib/improved_attributes_example_web/controllers/fallback_controller.ex

Add the resource to the "/api" scope in lib/improved_attributes_example_web/router.ex:

    resources "/api_products", ApiProductController, except: [:new, :edit]


Remember to update your repository by running migrations:

    $ mix ecto.migrate

$ mix ecto.migrate
Compiling 7 files (.ex)
Generated improved_attributes_example app

02:19:12.500 [info] == Running 20241129001804 ImprovedAttributesExample.Repo.Migrations.CreateApiProducts.change/0 forward

02:19:12.501 [info] create table api_products

02:19:12.509 [info] == Migrated 20241129001804 in 0.0s

$ mix test
Compiling 8 files (.ex)
Generated improved_attributes_example app
Running ExUnit with seed: 572072, max_cases: 24

.........................................................................................................................................................................
Finished in 1.7 seconds (0.3s async, 1.4s sync)
169 tests, 0 failures
```

</details>

#### Commit 12

<details>

<summary>

```bash
$ mix phx.gen.json ApiBlog ApiPost api_blog_posts title content:text:* public:boolean:default,true topics:integer:default,1 reviewed:datetime tags:array --binary-id
```

</summary>

```bash
$ mix phx.gen.json ApiBlog ApiPost api_blog_posts title content:text:* public:boolean:default,true topics:integer:default,1 reviewed:datetime tags:array --binary-id
* creating lib/improved_attributes_example/api_blog/api_post.ex
* creating priv/repo/migrations/20241129002121_create_api_blog_posts.exs
* creating lib/improved_attributes_example/api_blog.ex
* injecting lib/improved_attributes_example/api_blog.ex
* creating test/improved_attributes_example/api_blog_test.exs
* injecting test/improved_attributes_example/api_blog_test.exs
* creating test/support/fixtures/api_blog_fixtures.ex
* injecting test/support/fixtures/api_blog_fixtures.ex
* creating lib/improved_attributes_example_web/controllers/api_post_controller.ex
* creating lib/improved_attributes_example_web/controllers/api_post_json.ex
* creating test/improved_attributes_example_web/controllers/api_post_controller_test.exs

Add the resource to the "/api" scope in lib/improved_attributes_example_web/router.ex:

    resources "/api_blog_posts", ApiPostController, except: [:new, :edit]


Remember to update your repository by running migrations:

    $ mix ecto.migrate

$ mix ecto.migrate
Compiling 5 files (.ex)
Generated improved_attributes_example app

02:21:54.384 [info] == Running 20241129002121 ImprovedAttributesExample.Repo.Migrations.CreateApiBlogPosts.change/0 forward

02:21:54.387 [info] create table api_blog_posts

02:21:54.395 [info] == Migrated 20241129002121 in 0.0s

$ mix test
Compiling 6 files (.ex)
Generated improved_attributes_example app
Running ExUnit with seed: 800698, max_cases: 24

.......................................................................................................................................................................................
Finished in 1.9 seconds (0.4s async, 1.5s sync)
183 tests, 0 failures
```

</details>

#### Commit 13

<details>

<summary>

```bash
$ mix phx.gen.json ApiGeneral.ApiLibrary ApiBook api_books name:string:*:index isbn:string:required:unique index_page:integer:default,1:* print_size:decimal:default,13.45:* rate:float:default,5.0:* free:boolean author_real_name:string:redact
```

</summary>

```bash
$ mix phx.gen.json ApiGeneral.ApiLibrary ApiBook api_books name:string:*:index isbn:string:required:unique index_page:integer:default,1:* print_size:decimal:default,13.45:* rate:float:default,5.0:* free:boolean author_real_name:string:redact
* creating lib/improved_attributes_example/api_general/api_library/api_book.ex
* creating priv/repo/migrations/20241129002312_create_api_books.exs
* creating lib/improved_attributes_example/api_general/api_library.ex
* injecting lib/improved_attributes_example/api_general/api_library.ex
* creating test/improved_attributes_example/api_general/api_library_test.exs
* injecting test/improved_attributes_example/api_general/api_library_test.exs
* creating test/support/fixtures/api_general/api_library_fixtures.ex
* injecting test/support/fixtures/api_general/api_library_fixtures.ex
* creating lib/improved_attributes_example_web/controllers/api_book_controller.ex
* creating lib/improved_attributes_example_web/controllers/api_book_json.ex
* creating test/improved_attributes_example_web/controllers/api_book_controller_test.exs

Add the resource to the "/api" scope in lib/improved_attributes_example_web/router.ex:

    resources "/api_books", ApiBookController, except: [:new, :edit]


Remember to update your repository by running migrations:

    $ mix ecto.migrate

$ mix ecto.migrate
Compiling 5 files (.ex)
Generated improved_attributes_example app

02:23:40.712 [info] == Running 20241129002312 ImprovedAttributesExample.Repo.Migrations.CreateApiBooks.change/0 forward

02:23:40.715 [info] create table api_books

02:23:40.721 [info] create index api_books_isbn_index

02:23:40.723 [info] create index api_books_name_index

02:23:40.727 [info] == Migrated 20241129002312 in 0.0s

$ mix test
Compiling 6 files (.ex)
Generated improved_attributes_example app
Running ExUnit with seed: 555637, max_cases: 24

............................................................................................................................................................................................
.........
Finished in 1.9 seconds (0.4s async, 1.5s sync)
197 tests, 0 failures
```

</details>

#### Commit 14

<details>

<summary>

```bash
$ mix phx.gen.json ApiCatalog ApiComment api_comments body:string:size,303:* api_product_id:references:*:on_delete,delete_all api_post_id:references:ApiBlog.ApiPost --binary-id
```

</summary>

```bash
$ mix phx.gen.json ApiCatalog ApiComment api_comments body:string:size,303:* api_product_id:references:*:on_delete,delete_all api_post_id:references:ApiBlog.ApiPost --binary-id
You are generating into an existing context.

The ImprovedAttributesExample.ApiCatalog context currently has 6 functions and 1 file in its directory.

  * It's OK to have multiple resources in the same context as long as they are closely related. But if a context grows too large, consider breaking it apart

  * If they are not closely related, another context probably works better

The fact that two entities are related in the database does not mean they belong to the same context.

If you are not sure, prefer creating a new context over adding to the existing one.

Would you like to proceed? [Yn] Y
* creating lib/improved_attributes_example/api_catalog/api_comment.ex
* creating priv/repo/migrations/20241129002514_create_api_comments.exs
* injecting lib/improved_attributes_example/api_catalog.ex
* injecting test/improved_attributes_example/api_catalog_test.exs
* injecting test/support/fixtures/api_catalog_fixtures.ex
* creating lib/improved_attributes_example_web/controllers/api_comment_controller.ex
* creating lib/improved_attributes_example_web/controllers/api_comment_json.ex
* creating test/improved_attributes_example_web/controllers/api_comment_controller_test.exs

Add the resource to the "/api" scope in lib/improved_attributes_example_web/router.ex:

    resources "/api_comments", ApiCommentController, except: [:new, :edit]


Remember to update your repository by running migrations:

    $ mix ecto.migrate

$ mix ecto.migrate
Compiling 5 files (.ex)
Generated improved_attributes_example app

02:25:39.881 [info] == Running 20241129002514 ImprovedAttributesExample.Repo.Migrations.CreateApiComments.change/0 forward

02:25:39.883 [info] create table api_comments

02:25:39.888 [info] create index api_comments_api_post_id_index

02:25:39.891 [info] create index api_comments_api_product_id_index

02:25:39.895 [info] == Migrated 20241129002514 in 0.0s

$ mix test
Compiling 6 files (.ex)
Generated improved_attributes_example app
Running ExUnit with seed: 39849, max_cases: 24

............................................................................................................................................................................................
.......................
Finished in 2.1 seconds (0.4s async, 1.6s sync)
211 tests, 0 failures
```

</details>

#### Commit 15

<details>

<summary>

```bash
$ mix phx.gen.json ApiBlog ApiNote api_notes body:text:unique review_day:date:unique api_product_id:references:ApiCatalog.ApiProduct:unique api_post_id:references api_book_id:references:assoc,manual:ApiGeneral.ApiLibrary.ApiBook:column,isbn data:any:virtual meta:[array,string]:virtual points:[array,integer] status:enum:[draft,actual,archived] tags:[array,enum]:[[music,1],[dance,2],[movie,3]]
```

</summary>

```bash
$ mix phx.gen.json ApiBlog ApiNote api_notes body:text:unique review_day:date:unique api_product_id:references:ApiCatalog.ApiProduct:unique api_post_id:references api_book_id:references:assoc,manual:ApiGeneral.ApiLibrary.ApiBook:column,isbn data:any:virtual meta:[array,string]:virtual points:[array,integer] status:enum:[draft,actual,archived] tags:[array,enum]:[[music,1],[dance,2],[movie,3]]
At least one attribute has to be specified as required.
Use option `required` or its alias `*`.

Examples:

    title:string:required
    name:string:*:unique

None of the given attributes are set to be required,
Hence first attribute `body:text:unique` is going to be required.

Proceed with chosen required attribute? [Yn] Y
You are generating into an existing context.

The ImprovedAttributesExample.ApiBlog context currently has 6 functions and 1 file in its directory.

  * It's OK to have multiple resources in the same context as long as they are closely related. But if a context grows too large, consider breaking it apart

  * If they are not closely related, another context probably works better

The fact that two entities are related in the database does not mean they belong to the same context.

If you are not sure, prefer creating a new context over adding to the existing one.

Would you like to proceed? [Yn] Y
* creating lib/improved_attributes_example/api_blog/api_note.ex
* creating priv/repo/migrations/20241129002739_create_api_notes.exs
* injecting lib/improved_attributes_example/api_blog.ex
* injecting test/improved_attributes_example/api_blog_test.exs
* injecting test/support/fixtures/api_blog_fixtures.ex

Some of the generated database columns are unique. Please provide
unique implementations for the following fixture function(s) in
test/support/fixtures/api_blog_fixtures.ex:

    def unique_api_note_review_day do
      raise "implement the logic to generate a unique api_note review_day"
    end

* creating lib/improved_attributes_example_web/controllers/api_note_controller.ex
* creating lib/improved_attributes_example_web/controllers/api_note_json.ex
* creating test/improved_attributes_example_web/controllers/api_note_controller_test.exs

Add the resource to the "/api" scope in lib/improved_attributes_example_web/router.ex:

    resources "/api_notes", ApiNoteController, except: [:new, :edit]


Remember to update your repository by running migrations:

    $ mix ecto.migrate

$ mix ecto.migrate
Compiling 5 files (.ex)
Generated improved_attributes_example app

02:28:08.001 [info] == Running 20241129002739 ImprovedAttributesExample.Repo.Migrations.CreateApiNotes.change/0 forward

02:28:08.005 [info] create table api_notes

02:28:08.014 [info] create index api_notes_body_index

02:28:08.016 [info] create index api_notes_review_day_index

02:28:08.019 [info] create index api_notes_api_book_id_index

02:28:08.020 [info] create index api_notes_api_post_id_index

02:28:08.022 [info] create index api_notes_api_product_id_index

02:28:08.027 [info] == Migrated 20241129002739 in 0.0s

$ mix test
Compiling 6 files (.ex)
Generated improved_attributes_example app
Running ExUnit with seed: 42810, max_cases: 24

............................................................................................................................................................................................
.....................................
Finished in 2.3 seconds (0.5s async, 1.7s sync)
225 tests, 0 failures
```

</details>
