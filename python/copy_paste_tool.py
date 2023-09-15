#! python3
#copy_paste_tool.py - Easily copy common email responses to your clipboard from the command line for easy pasting to emails. 
#This tool allows me to store common email response phrases as dictionary key:value pairs. 
#From the terminal I can run the command `copy_paste_tool.py [response key value]` which will copy the response to my clipboard which I can then use to create quick emails. 
#This tool has saved me countless hours manually typeing out common reponses to troubleshooting emails I would get at work.

#Dictionary of key:value pairs of common email responses
TEXT = {'password_failure': """I can see from the server logs that you account account [insert account name here] was able to connect to our server but failed during password authentication. Please be sure you are logging using the correct password and if you need to update your password you can do so via the following link: \nhttps://example.website.com/forgot""",
        'password_forgot':"""You can update your password by navigating the to link below: \nhttps://sftphelp.neurorx.com/forgot/ \nOnce you change your password please let us know if you are able to successfully connect and upload your scans. """,
        'contact_us': """Please let us know if you are able to successfully login or if you continue to have issues with your upload please attach a screenshot of both the error message you receive. These will assist us in troubleshooting the issue.""",
        'directions': """Below are the directions for how to configure your upload files to our site: \nhttps://example.site.com/upload-instructions/""",
        }


import sys, pyperclip
if len(sys.argv) < 2:
    print('Usage: cptool [keyphrase] - copy phrase text')
    sys.exit()

keyphrase = sys.argv[1]     #first command line arg in the keyphrase

if keyphrase in TEXT:
    pyperclip.copy(TEXT[keyphrase])
    print('Text for ' + keyphrase + ' copied to clipboard.')
else:
    print('There is no text for ' + keyphrase)
