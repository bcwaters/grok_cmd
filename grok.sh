#!/bin/bash

# Get the directory of the script, resolving any symbolic links
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# Change to the directory of the script
cd "$SCRIPT_DIR"
current_dir=$(pwd)

color_green="\e[32m"
color_red="\e[31m"
color_yellow="\e[33m"
color_blue="\e[34m"
color_magenta="\e[35m"
color_cyan="\e[36m"
color_white="\e[37m"
color_reset="\e[0m"

color_green_light="\e[92m"
color_red_light="\e[91m"
color_yellow_light="\e[93m"
color_blue_light="\e[94m"
color_magenta_light="\e[95m"
color_cyan_light="\e[96m"
color_white_light="\e[97m"

color_background_green="\e[42m"
color_background_green_light="\e[102m"
color_background_blue_light="\e[104m"
color_background_yellow_light="\e[103m"
color_background_red_light="\e[101m"
color_background_magenta_light="\e[105m"
color_background_cyan_light="\e[106m"
color_background_white_light="\e[107m"
color_background_black_light="\e[100m"



color_background_red="\e[41m"
color_background_yellow="\e[43m"
color_background_blue="\e[44m"
color_background_magenta="\e[45m"
color_background_cyan="\e[46m"
color_background_white="\e[47m"
color_background_black="\e[40m"
color_background_reset="\e[49m"

# Your script commands go here
echo "Current directory is now: $(pwd)"

# Greet the user
echo -e  "${color_background_black_light}${color_green_light}----------------------------------------------${color_reset}"
echo -e  "${color_background_black_light}${color_green_light}  ____             _   _   ___    __    ___   ${color_reset}"
echo -e  "${color_background_black_light}${color_green_light} / ___|_ __  __   | | / /|  _ \ / _ \  / __|  ${color_reset}"
echo -e  "${color_background_black_light}${color_green_light}| |  _  '__|/ _ \ | |/ / | | | | | | || |     ${color_reset}"
echo -e  "${color_background_black_light}${color_green_light}| |_| | |  | |_| || |\ \\ | |_| | |_| || |__   ${color_reset}"
echo -e  "${color_background_black_light}${color_green_light} \____|_|   \___/ | | \ \\|____/ \___/  \___|  ${color_reset}"
echo -e  "${color_background_black_light}${color_green_light}----------------------------------------------${color_reset}"
echo -e  "${color_yellow}This is GrokDOC. Request a readme on any subject.${color_reset}"


echo "   "
echo ""



# Function to display a spinner
spin() {
    local pid=$1
    local delay=0.1
    local spinchars='*~*-^*~*-'
    local spinchars2='---***'
    local i=0

    while ps -p $pid > /dev/null; do
        local temp2=${spinchars2:i%${#spinchars2}:1}
        local temp=${spinchars:i++%${#spinchars}:1}
        local temp3=${spinchars2:i%${#spinchars2}:1}
        
        
        if [ $((i%5)) -eq 0 ]; then
            echo -ne "\r$color_white$temp-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp3-$temp"
        elif [ $((i%5)) -eq 1 ]; then
            echo -ne "\r$color_red_light$temp-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp3-$temp"
        elif [ $((i%5)) -eq 2 ]; then
            echo -ne "\r$color_yellow_light$temp-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp3-$temp"
        elif [ $((i%5)) -eq 3 ]; then
            echo -ne "\r$color_blue_light$temp-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp3-$temp"
        elif [ $((i%5)) -eq 4 ]; then
            echo -ne "\r$color_green_light$temp-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp3--$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp2-$temp3-$temp3-$temp"
        fi
        sleep $delay
   
    done
    echo -ne "\r"  # Clear the spinner
}

# Continuously receive prompts until "exit" is typed
firstRun=true
while true; do
    if [ $firstRun = true ]; then

        # Declare variables for commands
        setContext="setContext"
        new="new"
        depth="depth"
        file=""
        flags=""  # flags should be set by depth flag, new flag, file flag, and specialty flag just before execution to allow multiple updating of flags between rens
        displayContext=""
        displaySpecialty=""
        displayNew=""
        displayDepth="--depth 500"
        displayFile=""
        treeMode=false
        source .grokRuntime
        firstRun=false
        displayTreeMode=false
        displayContext=$contextState
        displayNew=$newState
        displayDepth=$depthState
        displayFile=$fileState
        displaySpecialty=$specialtyState
        echo -e "Loaded State: \e[34m[ $contextState]\e[0m \e[32m[ $newState]\e[0m \e[33m[ $depthState]\e[0m \e[35m[ $fileState]\e[0m \e[36m[ $specialtyState]\e[0m"
    fi
    #GOTO here
    #branch feature added next    
    # Prompt the user for input
    echo -e "$color_white--------------------------------\e[0m"
    echo -e "type $color_blue setContext\e[0m to set the context" 
    echo -e "type $color_green new\e[0m to start a new conversation"
    echo -e "type $color_yellow depth\e[0m set the context depth for better memory"
    echo -e "type $color_magenta file\e[0m to load a file"
    echo -e "type $color_cyan specialty\e[0m to set the specialty"
    echo -e "type $color_red exit\e[0m to quit"
    echo -e "type $color_blue treeMode\e[0m to generate a set of organized documents"
    echo -e "$color_white--------------------------------\e[0m"
    echo -e "current settings: \e[34m[ $displayContext]\e[0m \e[32m[ $displayNew]\e[0m \e[33m[ $displayDepth]\e[0m \e[35m[ $displayFile]\e[0m \e[36m[ $displaySpecialty]\e[0m \e[44m[$displayTreeMode]\e[0m"
    echo -e "$color_white--------------------------------\e[0m"
    read -p "enter you prompt: " prompt

    # Check if the user wants to exit
    if [ "$prompt" == "exit" ]; then
        echo -e "$color_red_light Exiting...\e[0m"
        break
    fi
    if [ "$prompt" == "treeMode" ]; then
        treeMode=true
        displayTreeMode=true
        echo -e "$color_background_blue_light Tree mode: Dynamic Prompt Generation\e[0m"
        flags="$flags --treeMode"
        continue
    fi
    if [ "$prompt" == "specialty" ]; then
        echo -e "$color_cyan_light roles available: software, teaching, writing\e[0m" #TODO: this can be abstracted to recieve a sentence and then pass it to the profile help me to: write code, write a readme, write a blog post etc.
        read -p "Enter the specialty: " specialty
        specialty=$specialty
        displaySpecialty=$specialty
        flags="$flags --specialty $specialty"
        continue
    fi
    if [ "$prompt" == "file" ]; then
        echo -e "$color_magenta_light Loading file...\e[0m"
        read -p "Enter the file path: " filePath
        flags="$flags --file $filePath"
        file=$filePath
        displayFile=$filePath
        continue
    fi

    # Check if the user wants to set the context
    if [ "$prompt" == "setContext" ]; then
        echo -e "$color_green_light Setting context...\e[0m"
        read -p "Enter the context: " context
  
        #GOTO begining of loop
        context=$context
        flags="$flags --setContext $context"
        displayContext="$context"
        continue
        node --no-warnings $current_dir/grok/grok.js "--setContext" "$context" "$prompt" &
        spin $!  # Start spinner while waiting for the node process
    else
    if [ "$prompt" == "new" ]; then 
        # Run node with the absolute path to grok.js and the provided prompt

        new=$prompt
        flags="$flags --new" 
        displayNew="$new"
        continue
        node --no-warnings $current_dir/grok/grok.js "--new" "$prompt" &
        spin $!  # Start spinner while waiting for the node process
    else
    if [ "$prompt" == "depth" ]; then
        # Run node with the absolute path to grok.js and the provided prompt
        echo " " 
        echo -e "$color_yellow_light How many words stored in context memory? 1 to 10000\e[0m"
        read -p "Enter the depth value(default 500): " depthValue

        depth=$depthValue
        flags="$flags --depth $depthValue"
        displayDepth="$depthValue"
        continue
        node --no-warnings $current_dir/grok/grok.js "--depth" "$depthValue" "$prompt" &
        spin $!  # Start spinner while waiting for the node process
    else
        echo "grokking..."
        # Run node with the absolute path to grok.js and the provided prompt
        node --no-warnings $current_dir/grok/grok.js $flags "PROMPT" "$prompt" &
        spin $!  # Start spinner while waiting for the node process
    fi
    fi
    fi
    firstRun=true

    
done