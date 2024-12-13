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

4. Django creates a folder named persons in my project, with this content:

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

5. There is a views.py in your persons folder. Find it and open it, and replace the content with this:

from django.shortcuts import render
from django.http import HttpResponse

def members(request):
    return HttpResponse("persons")

6. Create a file named urls.py in the same folder as the views.py file, and type this code in it:

myapp/persons/urls.py:

from django.urls import path
from . import views

urlpatterns = [
    path('persons/', views.persons, name='persons'),
]

7. There is a file called urls.py on the myapp, open that file and add the include module in the import statement, and also add a path() function in the urlpatterns[] list, with arguments that will route users that comes in via 127.0.0.1:8000/.

Then your file will look like this:

myapp/myapp/urls.py:

from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('', include('persons.urls')),
    path('admin/', admin.site.urls),
]

8. Create a templates folder inside the persons folder, and create a HTML file named myfirst.html.

The file structure should be like this:

my_tennis_club
    manage.py
    my_tennis_club/
    members/
        templates/
            myfirst.html

9. Open the HTML file and insert the following:

my_tennis_club/members/templates/myfirst.html:

<!DOCTYPE html>
<html>
<body>

<h1>Hello World!</h1>
<p>Welcome to my first Django project!</p>

</body>
</html>

10. Open the views.py file and replace the persons view with this:

myapp/persons/views.py:

from django.http import HttpResponse
from django.template import loader

def persons(request):
  template = loader.get_template('myfirst.html')
  return HttpResponse(template.render())

11. add the members app like this:

my_tennis_club/my_tennis_club/settings.py:

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'persons'
]

12. Then run this command:

python manage.py migrate