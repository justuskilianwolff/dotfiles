function ru(){
    # format the code using ruff
    ruff format 
    # check and fix the code using ruff
    ruff check --fix
}

# basic aliases for the rye package manager in python
alias rs='rye sync'
alias ri='rye init'
alias ra='rye add'
alias rr='rye remove'

# django aliases
alias dj='python manage.py'
alias djr='python manage.py runserver'
alias dja='python manage.py startapp'
alias djm='python manage.py migrate'
alias djmm='python manage.py makemigrations'
alias djcsu='python manage.py createsuperuser'
alias djs='python manage.py shell'