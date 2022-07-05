print_message () {

    local messages
    local message

    declare -a array1=(
        "(╯°□°）╯︵ ┻━┻"
        "¯\_(ツ)_/¯"
        "And the Darwin Award goes to.... ${USER}!"
        "Allowing you to survive childbirth was medical malpractice."
        "Are you always this stupid or are you making a special effort today?!"
        "Are you even trying?!"
        "Bad."
        "Boooo!"
        "Brains aren't everything. In your case they're nothing."
        "Commands, random gibberish, who cares!"
        "Come on! You can do it!"
        "Don't you have anything better to do?!"
        "Don't you know anything?"
        "Dropped on your head as a baby, eh?"
        "error code: 1D10T"
        "Even your mom loves you only as a friend."
        "ERROR_INCOMPETENT_USER"
        "Fake it till you make it!"
        "Go outside."
        "Haha, n00b!"
        "How many times do I have to flush before you go away?"
        "I am _seriously_ considering 'rm -rf /'-ing myself..."
        "I don't know what makes you so stupid, but it really works."
        "I was going to give you a nasty look, but I see you already have one."
        "If brains were gasoline you wouldn’t have enough to propel a flea’s motorcycle around a doughnut."
        "If ignorance is bliss, you must be the happiest person on earth."
        "If shit was music, you'd be an orchestra."
        "If what you don't know can't hurt you, you're invulnerable."
        "I’d slap you, but that’d be animal abuse."
        "I’ve heard of being hit with the ugly stick, but you must have been beaten senseless with it."
        "Keep trying, someday you'll do something intelligent!"
        "Life is good, you should get one."
        "lol"
        "lol... plz"
        "My keyboard is not a touch screen!"
        "My uptime is longer than your relationships."
        "Nice try."
        "n00b alert!"
        "Pathetic"
        "Perhaps computers are not for you..."
        "Perhaps you should leave the command line alone..."
        "Please step away from the keyboard!"
        "Pro tip: type a valid command!"
        "Rose are red. Violets are blue. I have five fingers. The middle one's for you."
        "Sorry what? I don’t understand idiot language."
        "The degree of your stupidity is enough to boil water."
        "The worst one today!"
        "This is not a search engine."
        "This is not Windows"
        "This is why nobody likes you."
        "Try using your brain the next time!"
        "Two wrongs don't make a right, take your parents as an example."
        "Typing incorrect commands, eh?"
        "u suk"
        "What if... you type an actual command the next time!"
        "What if I told you... it is possible to type valid commands."
        "Why are you so stupid?!"
        "Why are you doing this to me?!"
        "Why did the chicken cross the road? To get the hell away from you."
        "Wow! That was impressively wrong!"
        "Y u no speak computer???"
        "You are not as bad as people say, you are much, much worse."
        "You are not useless since you can still be used as a bad example."
        "You must have been born on a highway because that's where most accidents happen."
        "Your application for reduced salary has been sent!"
        "Your mom had a severe case of diarrhea when you were born."
        "You're proof that god has a sense of humor."
        "You're so fat, people jog around you for exercise."
        "I am sick when I do look on thee "
        "I'll beat thee, but I would infect my hands."
        "Methink'st thou art a general offence and every man should beat thee."
        "More of your conversation would infect my brain."
        "The rankest compound of villainous smell that ever offended nostril"
        "Like the toad; ugly and venomous."
        "Thou art unfit for any place but hell."
        "Thou lump of foul deformity"
        "Thy tongue outvenoms all the worms of Nile."
        "Would thou wert clean enough to spit upon"
        "Villain, I have done thy mother"
        "You deserve not only to be given no food to eat, but also to have the dogs set upon you and to be pelted with horse manure."
        "Your words are so foolishly and ignorantly composed that I cannot believe you understand them."
    )
    messages=("${array1[@]}")
    [[ -n ${CMD_NOT_FOUND_MSGS} ]] && messages=( "${CMD_NOT_FOUND_MSGS[@]}" )
    [[ -n ${CMD_NOT_FOUND_MSGS_APPEND} ]] && messages+=( "${CMD_NOT_FOUND_MSGS_APPEND[@]}" )
    RANDOM=$(od -vAn -N4 -tu < /dev/urandom)
    if [[ $((${RANDOM} % 2)) -lt 1 ]]; then
        message=${messages[${RANDOM} % ${#messages[@]}]}
        printf "\n  $(tput bold)$(tput setaf 1)${message}$(tput sgr0)\n\n" >&2
    fi
}
function_exists () {
    declare -f $1 > /dev/null
    return $?
}
if function_exists command_not_found_handler; then
    if ! function_exists orig_command_not_found_handler; then
        eval "orig_$(declare -f command_not_found_handler)"
    fi
else
    orig_command_not_found_handler () {
        printf "zsh: command not found: %s\n" "$1" >&2
        return 127
    }
fi
command_not_found_handler () {
    print_message
    orig_command_not_found_handler "$@"
}
if function_exists command_not_found_handle; then
    if ! function_exists orig_command_not_found_handle; then
        eval "orig_$(declare -f command_not_found_handle)"
    fi
else
    orig_command_not_found_handle () {
        printf "%s: %s: command not found\n" "$0" "$1" >&2
        return 127
    }
fi
command_not_found_handle () {
    print_message
    orig_command_not_found_handle "$@"
}

