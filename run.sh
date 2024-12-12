#check python version
python --version
pip --version

#make virtual envoriment
python3 -m venv .venv

#activate virtual environment
source .venv/bin/activate

#install dajango
pip install django

#start a project named demo
django-admin startproject 'projectName'

#change directory to demo
cd 'projectName'

#start new app named myapp
python3 manage.py startapp members

#run the server
python3 manage.py runserver