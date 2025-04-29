# How to make certificates that maintain a template but only changes one item like Name, Date, etc 

## Step 1: Prepare Your Google Slides Template
	- The model for the attendace certificate I use was : https://docs.google.com/presentation/d/1JklzMCTxLW6AhhiC4GoLSc-fT1SrQRrE2Yw21PaOizg/edit?usp=sharing
	- Create a Google Slides document that will serve as your certificate template. Design the certificate layout as needed.
	- Mark placeholders in the template that you will replace with personalized information (e.g., [NAME], [DATE], [COURSE]).
	- The ID of your template is on the url of the slide. For example, if the URL of a presentation is:
https://docs.google.com/presentation/d/1W47G9K0IoZOWrFH_U9-Wj68CgrUvqWUF0h17uHNQ/edit#slide=id.f6c90a8d-cce3-11c7-a34e-c6fa1cb0cc11

Then the presentation ID is: 1W47G9K0IoZOWrFH_U9-Wj68CgrUvqWUF0h17uHNQ
i.e. the hash immediately after /d/ and before /edit


## Step 2: Prepare Your Google Sheets Spreadsheet
	- Create a Google Sheets document with the information of the participants.
	- Include necessary details like names, email addresses, dates, courses, or any other information that needs to be personalized on each certificate.
	- The ID if your sheets follows the same logic as for the google slide

## Step 3: Write the Google Apps Script
	- Go to your Google Sheets document.
	- Click on Extensions > Apps Script.
	- Copy the script names "create_certificates_GoogleScript.js"
	- click Run 


# To download all the certificates and make one pdf file per certificate (Windows)

	- Download the slide deck to a .pptx
	- Export it as pdf in Power Point
	- Using Adobe Acrobat, split the pdf deck into single pages 

# To send each certificate to each participant as a separate email with the proper certificate as atachment (Windows)

	- Create an excel sheet where each participant name is on the first column, the email is on the second, and the absolute local path
to the certificate in your computer in the third column.
	- Open Outlook
	- In the developer Tab, go to Visual Basic (if you dont see it, go to File>Options>Customize Ribbon>Select Developer>Apply)
	- In Visual Basic go to Insert>Module
	- Copy the script in send_certificates_script_VisualBasic4Outlook.bas
	- Change the file path as it is in your computer, and the text for your email Body if necessary
	- Save 
	- Close Visual Basic
	- To run it : Go to the developer tab > Macros
	- And click on the name of your module 
	- Done 