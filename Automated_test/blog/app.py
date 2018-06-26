from blog import Blog

menu_prompt = "Enter 'c' to create a blog, 'l' to list blogs, 'r' to read one, 'p to create a post, or 'q' to quit: "
blogs = dict() #mapping blog_name to Blog_object
post_template = """
    --- {} ---
    
    {}
    
    """


def menu():
    # Show the user the available blogs
    # Let the user make a choice
    # Do something with that choice
    # Eventually exit

    print_blogs()
    selection = input(menu_prompt)

    while selection != "q":
        if selection == "c":
            ask_create_blog()
        elif selection == "l":
            print_blogs()
        elif selection == "r":
            ask_read_blog()
        elif selection == "p":
            ask_create_post()
        selection = input(menu_prompt)


def print_blogs():
    #print the available blogs
    for key, blog in blogs.items():  #blog.items() gives me a list of tuples with key and blog values
        print("- {}".format(blog))

def ask_create_blog():
    title = input("Please enter the title of the blog: ")
    author = input("Please, enter the author of the blog: ")

    blogs[title] = Blog(title, author)

def ask_read_blog():
    title = input("Enter the blog title you want to read: ")
    print_posts(blogs[title])



def print_posts(blog):
    for post in blog.posts:
        print_post(post)

def print_post(post):
    print(post_template.format(post.title, post.content))

def ask_create_post():
    blog_name = input("Enter the blog title you want to write a post in: ")
    title = input("Enter your post title: ")
    content = input("Enter your post content: ")

    blogs[blog_name].create_post(title, content)



