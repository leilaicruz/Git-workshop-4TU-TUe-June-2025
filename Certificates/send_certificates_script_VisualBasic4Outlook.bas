Attribute VB_Name = "Module1"
Sub SendCertificates()
    Dim xlApp As Object
    Dim xlWorkbook As Object
    Dim xlSheet As Object
    Dim i As Long
    Dim lastRow As Long
    Dim email As String
    Dim filePath As String
    Dim mail As Outlook.MailItem
    
    ' Change "C:\path\to\your\spreadsheet.xlsx" to the path of your Excel file
    Set xlApp = CreateObject("Excel.Application")
    Set xlWorkbook = xlApp.Workbooks.Open("C:\Users\linigodelacruz\Documents\4TU.ResearchData\Projects\Git-lesson-4TU-members\Certificates\Excel2send_certificates_1.xlsx")
    Set xlSheet = xlWorkbook.Sheets(1) ' Assumes data is in the first sheet
    
    xlApp.Visible = False ' Hide Excel
    
       
    lastRow = xlSheet.Cells(xlSheet.Rows.Count, "A").End(-4162).Row ' -4162 is xlUp
    
    ' Loop through each row in the Excel file
    For i = 1 To lastRow ' Assuming row 1 has headers
        email = xlSheet.Cells(i, 2).Value
        filePath = xlSheet.Cells(i, 3).Value
        
        ' Create a new mail item
        Set mail = Application.CreateItem(0) ' 0 is olMailItem
        
        ' Configure the email
        With mail
            .To = email
            .Subject = "Your Certificate of Attendance for the online Git workshop on February 21-22, 2024"
            .Body = "Dear participant,please find your certificate attached."
            .attachments.Add filePath ' Attach the certificate
            .Send ' To send the email immediately
            '.Display ' To display the email before sending, for review
        End With
    Next i
    
    ' Clean up
    xlWorkbook.Close SaveChanges:=False
    xlApp.Quit
    Set xlSheet = Nothing
    Set xlWorkbook = Nothing
    Set xlApp = Nothing
    Set mail = Nothing
End Sub

