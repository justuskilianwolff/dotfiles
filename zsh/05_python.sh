# general python alias
alias p='python'
alias p3='python3'
alias i='ipython'
alias pm='python main.py'
alias pt='python test.py'

# basic aliases for the rye package manager in python
alias rs='rye sync'
alias ri='rye init'
alias ra='rye add'
alias rad='rye add --dev'
alias rr='rye remove'

# basic aliases for the uv package manager in python
alias us='uv sync'
alias ui='uv init'
alias ua='uv add'
alias uad='uv add --dev'
alias uvv='uv venv'

# ruff format
function rf() {
    if [[ "$1" == "--keep" ]]; then
        ruff check --fix
    else
        ruff check --extend-select F401 --fix
    fi    
    
    ruff format
}

# django aliases
alias dj='python manage.py'
alias djr='python manage.py runserver'
alias dja='python manage.py startapp'
alias djm='python manage.py migrate'
alias djmm='python manage.py makemigrations'
alias djcsu='python manage.py createsuperuser'
alias djs='python manage.py shell'