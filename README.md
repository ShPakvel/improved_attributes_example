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

### Commit 1

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

### Commit 2

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

### Commit 3

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
