'Testing Shoe store application
'User Story1 - Monthly display of new releases
'Input Parameters - Month, Shoe_Brand
SystemUtil.Run "firefox","https://rb-shoe-store.herokuapp.com/"
WaitForThis Browser("title:=Shoe.*"),True,30
If Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext:=Home","html tag:=A").Exist(10) Then	
    FindShoe =Parameter("Shoe_Brand")
    FMonth = Parameter("Month")

    Select Case UCASE(FMonth)
    Case "JUNE" 
        If Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext="&FMonth,"html tag:=A").Exist Then
           Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext="&FMonth,"html tag:=A").Click
           ProductInfo(FindShoe)
        End If
        
    Case "July" 
        If Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext="&FMonth,"html tag:=A").Exist Then
           Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext="&FMonth,"html tag:=A").Click
           ProductInfo(FindShoe)
        End If
     Case "August" 
        If Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext="&FMonth,"html tag:=A").Exist Then
           Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext="&FMonth,"html tag:=A").Click
           ProductInfo(FindShoe)            
        End If   
        Case "September" 
        If Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext="&FMonth,"html tag:=A").Exist Then
           Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext="&FMonth,"html tag:=A").Click
           ProductInfo(FindShoe)
        End If
     Case "October" 
        If Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext="&FMonth,"html tag:=A").Exist Then
           Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext="&FMonth,"html tag:=A").Click
           ProductInfo(FindShoe)
        End If  
    Case "November" 
        If Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext="&FMonth,"html tag:=A").Exist Then
           Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext="&FMonth,"html tag:=A").Click
           ProductInfo(FindShoe)
        End If   
  Case "December" 
        If Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext="&FMonth,"html tag:=A").Exist Then
           Browser("title:=Shoe.*").Page("title:=Shoe.*").Link("Class Name:=Link","innertext="&FMonth,"html tag:=A").Click
           ProductInfo(FindShoe)
        End If        
    End Select		
 End If


Function ProductInfo(FindThis)
Wait 1
For i= 0 To 100
              ShoeBrand =Browser("title:=Shoe.*").Page("title:=Shoe.*").WebElement("Class Name:=WebElement","innertext="&FindShoe,"html tag:=A","index:="&i).GetRoProperty("innertext")
              If ShoeBrand = FindThis Then
                 If Browser("title:=Shoe.*").Page("title:=Shoe.*").WebElement("Class Name:=WebElement","Class:=shoe_result_value shoe_description","index:="&i).Exist Then
                    Reporter.ReportEvent micPass,"Shoe Description","Shoe Description for the Brand "&ShoeBrand&" Exists"
                 Else
                    Reporter.ReportEvent micFail,"Shoe Description","Shoe Description for the Brand "&ShoeBrand&" does not exist"  
                 End If 
                 If Browser("title:=Shoe.*").Page("title:=Shoe.*").Image("Class Name:=Image","html tag:=IMG","image type:=Plain Image","index:="&i).Exist Then
                 	Reporter.ReportEvent micPass,"Shoe Image","Shoe Image for the Brand "&ShoeBrand&" Exists"
                 Else
                    Reporter.ReportEvent micFail,"Shoe Image","Shoe Image for the Brand "&ShoeBrand&" does not exist"                   
                 End If  
                 If Browser("title:=Shoe.*").Page("title:=Shoe.*").WebElement("Class Name:=WebElement","Class:=shoe_result_value shoe_price","index:="&i).Exist Then
                 	Reporter.ReportEvent micPass,"Shoe Price","Shoe Price for the Brand "&ShoeBrand&" Exists"
                 Else
                    Reporter.ReportEvent micFail,"Shoe Price","Shoe Price for the Brand "&ShoeBrand&" does not exist"                   
                 End If                    
                 Exit For
              End If
              Set ShoeBrand = nothing
 Next
 End Function
