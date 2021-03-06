'Input Parameters - Email_Address
SystemUtil.Run "firefox","https://rb-shoe-store.herokuapp.com/"
WaitForThis Browser("title:=Shoe.*"),True,30
EmailAddress = Parameter(Email_Address)
If Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext:=Home","html tag:=A").Exist(10) Then
  'Verify Label for Email Address Exists
  If Browser("title:=Shoe.*").Page("title:=Shoe.*").WebElement("Class Name:=WebElement","html tag:=LABEL","innertext:=Remind me of new shoes").Exist Then
  	 Reporter.ReportEvent micPass,"Label for Email Address","Label for Email Address Exists"
  Else
      Reporter.ReportEvent micPass,"Label for Email Address","Label for Email Address does not exist"  
  End If  
  
  'Verify Textbox for Email Address, Submit Quert button, Success Message Exists
  If Browser("title:=Shoe.*").Page("title:=Shoe.*").WebEdit("Class Name:=WebEdit","html id:=remind_email_input").Exist Then
     Reporter.ReportEvent micPass,"Email Address","Textbox for Email Address Exists"
     Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=WebEdit","html id:=remind_email_input").set(EmailAddress)
     If Browser("title:=Shoe.*").Page("title:=Shoe.*").WebButton("Class Name:=WebButton","html id:=remind_email_submit").Exist Then
        Browser("title:=Shoe.*").Page("title:=Shoe.*").WebButton("Class Name:=WebButton","html id:=remind_email_submit").click     
        If Browser("title:=Shoe.*").Page("title:=Shoe.*").WebElement("Class Name:=WebElement","class:=flash flash_success").Exist Then     	
     	    Reporter.ReportEvent micPass,"Success Message","Sucess Message - Thanks! We will notify you of our new shoes at this email: "&EmailAddress&" Exists"
        Else
            Reporter.ReportEvent micPass,"Success Message","Sucess Message - Thanks! We will notify you of our new shoes at this email: "&EmailAddress&" does not exist"
        End If
     Else
        Reporter.ReportEvent micFail,"Submit Query Button","Submit Query button does not Exist"         
     End If 
  Else
     Reporter.ReportEvent micFail,"Email Address","Textbox for Email Address does not Exist" 
  End If
End If
