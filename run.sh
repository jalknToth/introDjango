GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

set -e

command -v python3 >/dev/null 2>&1 || { echo >&2 "Python3 is required but not installed.  Aborting."; exit 1; }
command -v virtualenv >/dev/null 2>&1 || { python3 -m pip install --user virtualenv; }

gitignore() {
    echo -e "${YELLOW}♠︎ Generating .gitignore file${NC}"
    cat > .gitignore << EOL
.vscode
__pycache__
*.pyc
.venv
.env
EOL
}

main() {
    echo -e "${YELLOW}🔧 Audio Recognition Application Initialization${NC}"

    touch .gitignore .env
    gitignore

    python3 -m venv .venv
    source .venv/bin/activate
    pip install --upgrade pip setuptools wheel
    pip install --upgrade pip
    pip install django

    #start a project named app
    django-admin startproject 'myapp'

    #change directory to app
    cd myapp

    #start new app named myapp
    python3 manage.py startapp persons

    echo -e "${GREEN}🎉 Project is ready! run 'python manage.py runserver' to start.${NC}"
}

main