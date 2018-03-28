Sub CSVFile()
Dim SrcRg As Range
Dim CurrRow As Range
Dim CurrCell As Range
Dim CurrTextStr As String
Dim ListSep As String
Dim FName As Variant
FName = Application.GetSaveAsFilename("", "CSV File (*.csv), *.csv")
ListSep = Application.International(xlListSeparator)
  If Selection.Cells.Count > 1 Then
    Set SrcRg = Selection
  Else
    Set SrcRg = ActiveSheet.UsedRange
  End If
Open FName For Output As #1
For Each CurrRow In SrcRg.Rows
  CurrTextStr = ìî
For Each CurrCell In CurrRow.Cells
  CurrTextStr = CurrTextStr & """" & CurrCell.Value & """" & ListSep
Next
While Right(CurrTextStr, 1) = ListSep
  CurrTextStr = Left(CurrTextStr, Len(CurrTextStr) - 1)
Wend
Print #1, CurrTextStr
Next
Close #1
End Sub
