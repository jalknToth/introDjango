## Installation

1. **Clone the repository:**
```bash
git clone https://github.com/jalknToth/introDjango.git
```
2. **Run the setup script:**
```bash
chmod +x run.sh
./run.sh
```
3. **Create a file named urls.py** in the same folder as the views.py file, and type this code in it:

myapp/persons/urls.py:
```
from django.urls import path
from . import views

urlpatterns = [
    path('persons/', views.persons, name='persons'),
    path('persons/details/<int:id>', views.details, name='details'),

]
```
4. There is a file called urls.py on the myapp, open that file and add the include module in the import statement, and also add a path() function in the urlpatterns[] list, with arguments that will route users that comes in via 127.0.0.1:8000/.

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
5. Create new View

myapp/persons/views.py:
```
from django.http import HttpResponse
from django.template import loader
from .models import Person

def persons(request):
    persons = Person.objects.all().values()
    template = loader.get_template('persons.html')
    context = {
    'persons': persons,
    }
    return HttpResponse(template.render(context, request))

def details(request, id):
    person = Person.objects.get(id=id)
    template = loader.get_template('details.html')
    context = {
    'person': person,
    }
    return HttpResponse(template.render(context, request))
```
6. add the members app like this:

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
7. create a model, navigate to the models.py file in the /persons/ folder.

myapp/persons/models.py:
```
from django.db import models

class Person(models.Model):
    firstname = models.CharField(max_length=255)
    lastname = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    jobTitle = models.CharField(max_length=255)
```
8. open a Python shell, type this command:
```
python3 manage.py shell
```
9. At the bottom, after the three >>> write the following:
```
>>> from persons.models import Person
```
10. Hit [enter] and write this to look at the empty Member table:
```
>>> Person.objects.all()
```
11. Add a record to the table, by executing these two lines:
```
>>> person = Person(firstname='Write name', lastname='write surname', email='', jobTitle='')
>>> person.save()
```
12. Execute this command to see if the Member table got a person:
```
>>> Person.objects.all().values()
```
13. add multiple records by making a list of Member objects, and execute .save() on each entry:
```
>>> person1 = Person(firstname='name1', lastname='surname1', email='', jobtitle='')
>>> person2 = Person(firstname='name2', lastname='surname2', email='', jobtitle='')
>>> person3 = Person(firstname='name3', lastname='surname3', email='', jobtitle='')
>>> person4 = Person(firstname='name4', lastname='surname4', email='', jobtitle='')
>>> person5 = Person(firstname='name5', lastname='surname5', email='', jobtitle='')
>>> persons_list = [person1, person2, person3, person4, person5]
>>> for x in persons_list:
>>>   x.save()
```

14. make a migration to tell Django that it has to update the database:
```
py manage.py makemigrations persons
```
15. Run the migrate command:
```
py manage.py migrate
```

16. Create new View

myapp/persons/views.py:
```
from django.http import HttpResponse
from django.template import loader
from .models import Person

def persons(request):
    persons = Person.objects.all().values()
    template = loader.get_template('persons.html')
    context = {
    'persons': persons,
    }
    return HttpResponse(template.render(context, request))

def details(request, id):
    person = Person.objects.get(id=id)
    template = loader.get_template('details.html')
    context = {
    'person': person,
    }
    return HttpResponse(template.render(context, request))
```

17. Create a template called master.html, with all the necessary HTML elements:

myapp/persons/templates/master.html
```
<!DOCTYPE html>
<html>
<head>
<title>{% block title %}{% endblock %}</title>
</head>
<body>

{% block content %}
{% endblock %}

</body>
</html>
```
18. Include the master template with the {% extends %} tag, and inserting a title block and a content block:

myapp/persons/templates/persons.html:
```
{% extends "master.html" %}

{% block title %}
My App - List of all persons
{% endblock %}


{% block content %}
<h1>Persons</h1>

<ul>
{% for x in persons %}
    <li><a href="details/{{ x.id }}">{{ x.firstname }} {{ x.lastname }}</a></li>
{% endfor %}
</ul>
{% endblock %}
```
19. myapp/persons/template/details.html
```
{% extends "master.html" %}

{% block title %}
Details about {{ person.firstname }} {{ person.lastname }}
{% endblock %}


{% block content %}
<h1>{{ person.firstname }} {{ person.lastname }}</h1>

<p>Phone {{ mymember.phone }}</p>
<p>Job Title: {{ person.jobTitle }}</p>

<p>Back to <a href="/persons">Persons</a></p>

{% endblock %}
```
20. Create a template called main.html

myapp/persons/template/main.html:
```
{% extends "master.html" %}

{% block title %}
My Tennis Club
{% endblock %}


{% block content %}
<h1>My Tennis Club</h1>

<h3>Members</h3>

<p>Check out all our <a href="members/">members</a></p>

{% endblock %}
```

