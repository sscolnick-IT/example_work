# This bash script will take a prompt list made up of text2img prompts and intended file names 
# and run them through the stable diffusion image generator. 

#!/bin/bash
IFS=$'\n'

#test for prompt list argument
if [[ -z "$1" ]]
then
  echo "Please add a formatted prompt list as a command line arugment"
  exit
else
  echo
  echo "Using the prompt list: $1"
fi

#prompt for a file name of where to store generated images
valid_input=false
while [[ $valid_input == false ]]; do
    echo
    read -p "Please enter a folder name to save your images: " dest_folder
    echo 
    if [[ -n $dest_folder ]]; then
	valid_input=true        
    else
    	echo "please enter a valid input"
    fi
done

#make a copy of the promptlist to the destination folder
echo "feedlist copied to destination folder"
echo

#correct folder permissions
mkdir "/home/image-gen/Desktop/$dest_folder/"
chmod 2775 "/home/image-gen/Desktop/$dest_folder/"
echo "$dest_folder created!"
cp $1 "/home/image-gen/Desktop/$dest_folder/$1"
echo
echo "Feedlist successfully copied to $dest_folder"
echo

echo NOW STARTING THE IMAGE CREATION THIS COULD TAKE SOME TIME!
echo
echo "Opening python-venv"
echo
source /home/image-gen/stable_diffusion.openvino/test/bin/activate     # start python enviroment

# this portion of the script will run through the newline seperated text2image prompt list 
# fed into the script as the first argument
for line in $(cat $1)
do
    prompt=$(echo $line | cut -d "~" -f 1)
    name=$(echo $line | cut -d "~" -f 2)
    echo '===+++======================================================================+++==='
    echo '|-\-\-\--------------------------------------------------------------------/-/-/-|'
    echo '|-------\-\-\--------------------------------------------------------/-/-/-------|'
    echo '===+++======================================================================+++==='
    echo
    echo "Creating an image with the prompt: "
    echo "$prompt"
    echo
    python demo.py --prompt "$prompt" --output "/home/image-gen/Desktop/$dest_folder/$name.png"
    echo
    echo "$name file has been completed check the $dest_folder folder"
    echo
done
