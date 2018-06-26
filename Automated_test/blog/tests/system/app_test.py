from unittest import TestCase
from unittest.mock import patch         #patch allows to look at something as outsider and change.
import app              #imports all functions
from blog import Blog
from post import Post


class AppTest(TestCase):

    #SetUp is a function that will run before every test
    def setUp(self):
        # creating a blog object, using Blog function from the file blog.py
        blog = Blog("Test", "Test Author")
        # sets app.blogs to be a dict that contains a single blog
        app.blogs = {"Test": blog}



    def test_menu_calls_create_blog(self):
        with patch("builtins.input") as mocked_input:
            with patch("app.ask_create_blog") as mocked_ask_create_blog:
                mocked_input.side_effect = ["c", "q"]

                app.menu()

                mocked_ask_create_blog.assert_called()

    def test_menu_calls_print_blogs(self):
        with patch("builtins.input") as mocked_input:
            with patch("app.print_blogs") as mocked_ask_print_blogs:
                mocked_input.side_effect = ["l", "q"]

                app.menu()

                mocked_ask_print_blogs.assert_called()


    def test_menu_calls_read_blog(self):
        with patch("builtins.input") as mocked_input:
            with patch("app.ask_read_blog") as mocked_ask_read_blog:
                mocked_input.side_effect = ["r", "q"]

                app.menu()

                mocked_ask_read_blog.assert_called()



    def test_menu_calls_create_posts(self):
        with patch("builtins.input") as mocked_input:
            with patch("app.ask_create_post") as mocked_ask_create_post:
                mocked_input.side_effect = ["p", "q"]

                app.menu()

                mocked_ask_create_post.assert_called()


    def test_menu_prints_prompt(self):
        with patch("builtins.input", return_value = "q") as mocked_input:
            app.menu()
            mocked_input.assert_called_with(app.menu_prompt)

    def test_menu_calls_prints_blogs(self):
        with patch ("app.print_blogs") as mocked_print_blogs:
            with patch("builtins.input", return_value = "q"):
                app.menu()
                mocked_print_blogs.assert_called_with()

    def test_print_blogs(self):
        # how do I test this, when it is printing to the console and not returning?
        # we are going to patch the print function.
        with patch("builtins.print") as mocked_print:
            # it is builtins.print, because this is the library that we use print from. Patch requires us to tell us from where we use the function
            # when you are patching something it replaces the patched function with a mock
            app.print_blogs()
            mocked_print.assert_called_with("- Test by Test Author (0 posts)")

    def test_ask_create_blog(self):
        with patch("builtins.input") as mocked_input:
            mocked_input.side_effect = ("Test", "Test Author")

            app.ask_create_blog()

            self.assertIsNotNone(app.blogs.get("Test"))
            self.assertEqual(app.blogs.get("Test").title, "Test")
            self.assertEqual(app.blogs.get("Test").author, "Test Author")


    def test_ask_read_blog(self):

        with patch("builtins.input", return_value = "Test"):
            with patch("app.print_posts") as mocked_print_posts:
                app.ask_read_blog()

                mocked_print_posts.assert_called_with(app.blogs["Test"])



    def test_print_posts(self):
        blog = app.blogs["Test"]
        blog.create_post("Test Post", "Test Content")

        with patch("app.print_post") as mocked_print_post:
            app.print_posts(blog)

            mocked_print_post.assert_called_with(blog.posts[0])

    def test_print_post(self):
        post = Post("Post title", "Post content")
        expected_print = """
    --- Post title ---
    
    Post content
    
    """

        with patch("builtins.print") as mocked_print:
            app.print_post(post)

            mocked_print.assert_called_with(expected_print)

    def test_ask_create_post(self):

        with patch("builtins.input") as mocked_input:
            mocked_input.side_effect = ("Test", "Test Title", "Test Content")

            app.ask_create_post()

            self.assertEqual(app.blogs["Test"].posts[0].title, "Test Title")
            self.assertEqual(app.blogs["Test"].posts[0].content, "Test Content")

