# general python alias
alias p='python'
alias p3='python3'
alias i='ipython'

# basic aliases for the rye package manager in python
alias rs='rye sync'
alias ri='rye init'
alias ra='rye add'
alias rad='rye add --dev'
alias rr='rye remove'
function rf(){
    # format the code using ruff
    rye fmt
    # lint and fix the code using ruff
    rye lint --fix
}

# django aliases
alias dj='python manage.py'
alias djr='python manage.py runserver'
alias dja='python manage.py startapp'
alias djm='python manage.py migrate'
alias djmm='python manage.py makemigrations'
alias djcsu='python manage.py createsuperuser'
alias djs='python manage.py shell'