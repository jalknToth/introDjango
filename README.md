## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/jalknToth/introDjango.git
   ```

2. **Run the setup script:**

   ```bash
   chmod +x run.sh
   ./run.sh

3. **Run the server:**

   ```bash
   python manage.py runserver
   ```

4. Django **creates a folder named persons** in /myapp/, with this content:

    ```
    myapp
        manage.py
        myapp/
        persons/
            migrations/
                __init__.py
            __init__.py
            admin.py
            apps.py
            models.py
            tests.py
            views.py
    ```
5. **Create a file named urls.py** in the same folder as the views.py file, and type this code in it:

myapp/persons/urls.py:
    ```
    from django.urls import path
    from . import views

    urlpatterns = [
        path('persons/', views.persons, name='persons'),
    ]
    ```
6. There is a file called urls.py on the myapp, open that file and add the include module in the import statement, and also add a path() function in the urlpatterns[] list, with arguments that will route users that comes in via 127.0.0.1:8000/.

Then your file will look like this:

myapp/myapp/urls.py:
    ```
    from django.contrib import admin
    from django.urls import include, path

    urlpatterns = [
        path('', include('persons.urls')),
        path('admin/', admin.site.urls),
    ]
    ```
7. Create a templates folder inside the persons folder, and create a HTML file named myfirst.html.

The file structure should be like this:
    ```
    my_tennis_club
        manage.py
        my_tennis_club/
        members/
            templates/
                myfirst.html
    ```
8. Open the HTML file and insert the following:

my_tennis_club/members/templates/myfirst.html:
    ```
    <!DOCTYPE html>
    <html>
    <body>

    <h1>Hello World!</h1>
    <p>Welcome to my first Django project!</p>

    </body>
    </html>
    ```
9. Open the views.py file and replace the persons view with this:

myapp/persons/views.py:
    ```
    from django.http import HttpResponse
    from django.template import loader

    def persons(request):
    template = loader.get_template('myfirst.html')
    return HttpResponse(template.render())
    ```
10. add the members app like this:

myapp/myapp/settings.py:
    ```
    INSTALLED_APPS = [
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.messages',
        'django.contrib.staticfiles',
        'persons'
    ]
    ```
11. Then run this command:
    ```
    python manage.py migrate
    ```
12. create a model, navigate to the models.py file in the /persons/ folder.

Open it, and add a Person table by creating a Person class, and describe the table fields in it:

myapp/persons/models.py:
    ```
    from django.db import models

    class Person(models.Model):
    firstname = models.CharField(max_length=255)
    lastname = models.CharField(max_length=255)
    ```
13. Navigate to the /myapp/ folder and run this command:
    ```
    python3 manage.py makemigrations persons
    ```
14. create and execute an SQL statement, based on the content of the new file in the /migrations/ folder.

Run the migrate command:
    ```
    python3 manage.py migrate
    ```
15. run this command, with the migration number:
    ```
    py manage.py sqlmigrate members 0001
    ```
16. open a Python shell, type this command:
    ```
    py manage.py shell
    ```
17. At the bottom, after the three >>> write the following:
    ```
    >>> from persons.models import Person
    ```
18. Hit [enter] and write this to look at the empty Member table:
    ```
    >>> Person.objects.all()
    ```
19. Add a record to the table, by executing these two lines:
    ```
    >>> person = Person(firstname='Write name', lastname='write surname')
    >>> person.save()
    ```
20. Execute this command to see if the Member table got a member:
    ```
    >>> Person.objects.all().values()
    ```
21. add multiple records by making a list of Member objects, and execute .save() on each entry:
    ```
    >>> person1 = Person(firstname='name1', lastname='surname1')
    >>> person2 = Person(firstname='name2', lastname='surname2')
    >>> person3 = Person(firstname='name3', lastname='surname3')
    >>> person4 = Person(firstname='name4', lastname='surname4')
    >>> person5 = Person(firstname='name5', lastname='surname5')
    >>> persons_list = [person1, person2, person3, person4, person5]
    >>> for x in persons_list:
    >>>   x.save()
    ```
22. add a field to a table after it is created, open the models.py file, and make your changes:

myapp/persons/models.py:
    ```
    from django.db import models

    class Person(models.Model):
    firstname = models.CharField(max_length=255)
    lastname = models.CharField(max_length=255)
    phone = models.IntegerField(null=True)
    jobTitle = models.CharField(max_length=255, null=True)
    ```
23. make a migration to tell Django that it has to update the database:
    ```
    py manage.py makemigrations persons
    ```
24. Run the migrate command:
    ```
    py manage.py migrate
    ```