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
