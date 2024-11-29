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
