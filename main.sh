#!/bin/bash 

function help() {
    echo "-m/--main main word, example domain.com so main word should be domain, default empty"
    echo "-h/--help help"
    echo "-d/--domain"
    echo "example"
    echo "- ./main.sh -d domain.com -m domain"
	exit 0
}

MAIN_WORD=""
DOMAIN=""

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -d|--domain)
    DOMAIN=$2
    shift
    shift
    ;;

    -m|--main)
    MAIN_WORD="$2"
    shift
    shift
    ;;

    -h|--help)
	help
    shift
    shift
    ;;

    *) 
	help
esac
done

set -- "${POSITIONAL[@]}"

# you can add more username here
users=(
    admin
    root
    user
    demo 
    superAdmin
    superadmin
    sadmin
    adminUser
    adminuser
    support
    test
)

function oneVariant() {
    first=$1
    echo "${first}1"
    echo "${first}123"
    echo "${first}@123"
    echo "${first}@1"
    echo "${first}@@"
    echo "${first}$(date +%Y)"
    # you can add more here
}

function oneUser() {
    first=$1
    FIRST=${first^^}
    First=${first^}

    oneVariant $first
    oneVariant $First
    oneVariant $FIRST

}

[ -n "$MAIN_WORD" ] && oneUser $MAIN_WORD

NAME=${MAIN_WORD^^}
Name=${MAIN_WORD^}
for((i=0; i<${#users[@]}; i++)); do
    user=${users[i]}
    USER=${user^^}
    User=${User^}

    oneUser $user

    echo $user@$DOMAIN
    echo $USER@$DOMAIN
    echo $User@$DOMAIN
    
    if [ -n "$MAIN_WORD" ]; then
        echo $user$MAIN_WORD
        echo $USER$MAIN_WORD
        echo $User$MAIN_WORD
        echo $MAIN_WORD$user
        echo $MAIN_WORD$User
        echo $MAIN_WORD$USER
        echo $NAME$user
        echo $NAME$User
        echo $NAME$USER
        echo $Name$user
        echo $Name$User
        echo $Name$USER
    fi
done
