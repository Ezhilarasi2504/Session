// namespace Demo_Session.Demo_Session;

// using System.IO;

// tableextension 50170 "Excel Buffer Ext" extends "Excel Buffer"
// {
//     fields
//     {
//         field(50170; "Font Size"; Integer)
//         {
//             Caption = 'Font Size';
//             DataClassification = ToBeClassified;
//         }
//         field(50171; "BackGround Color"; Integer)
//         {
//             Caption = 'BackGround Color';
//             DataClassification = ToBeClassified;
//         }
//         field(50172; "Font Name"; Text[100])
//         {
//             Caption = 'Font Name';
//             DataClassification = ToBeClassified;
//         }
//         field(50173; "Font Color"; Integer)
//         {
//             Caption = 'Font Color';
//             DataClassification = ToBeClassified;
//         }
//         field(50174; "Using Custom Decorator"; Boolean)
//         {
//             Caption = 'Using Custom Decorator';
//             DataClassification = ToBeClassified;
//         }
//     }

//     procedure AddColumnNew(Value: Variant; IsFormula: Boolean; CommentText: Text; IsBold: Boolean; IsItalics: Boolean; IsUnderline: Boolean; NumFormat: Text[30]; CellType: Option; FontSize: Integer; BGColourInt: Integer; FontName: Text[100]; Fontcolor: Integer)
//     begin
//         AddColumnToBufferNew(Rec, Value, IsFormula, CommentText, IsBold, IsItalics, IsUnderline, NumFormat, CellType, FontSize, BGColourInt, FontName, Fontcolor);
//     end;

//     local procedure AddColumnToBufferNew(var ExcelBuffer: Record "Excel Buffer"; Value: Variant; IsFormula: Boolean; CommentText: Text; IsBold: Boolean; IsItalics: Boolean; IsUnderline: Boolean; NumFormat: Text[30]; CellType: Option; FontSize: Integer; BGColourInt: Integer; FontName: Text[100]; Fontcolor: Integer)
//     begin
//         if NCurrentRow < 1 then
//             NewRow();

//         NCurrentCol := NCurrentCol + 1;
//         ExcelBuffer.Init();
//         ExcelBuffer.Validate("Row No.", NCurrentRow);
//         ExcelBuffer.Validate("Column No.", NCurrentCol);
//         if IsFormula then
//             ExcelBuffer.SetFormula(Format(Value))
//         else
//             ExcelBuffer."Cell Value as Text" := Format(Value);
//         ExcelBuffer.Comment := CopyStr(CommentText, 1, MaxStrLen(ExcelBuffer.Comment));
//         ExcelBuffer.Bold := IsBold;
//         ExcelBuffer.Italic := IsItalics;
//         ExcelBuffer.Underline := IsUnderline;
//         ExcelBuffer.NumberFormat := NumFormat;
//         ExcelBuffer."Cell Type" := CellType;
//         ExcelBuffer.Insert();
//     end;

//     procedure NewRow2()
//     begin
//         NewSetCurrent(NCurrentRow + 1, 0);
//     end;

//     procedure NewSetCurrent(NewCurrentRow: Integer; NewCurrentCol: Integer)
//     begin
//         NCurrentRow := NewCurrentRow;
//         NCurrentCol := NewCurrentCol;
//     end;


//     procedure GetCellDecorator(IsBold: Boolean; IsItalic: Boolean; IsUnderlined: Boolean; IsDoubleUnderlined: Boolean; var Decorator: DotNet CellDecorator)
//     begin
//         if IsBold and IsItalic then begin
//             if IsDoubleUnderlined then begin
//                 Decorator := XlWrkShtWriter.DefaultBoldItalicDoubleUnderlinedCellDecorator;
//                 exit;
//             end;
//             if IsUnderlined then begin
//                 Decorator := XlWrkShtWriter.DefaultBoldItalicUnderlinedCellDecorator;
//                 exit;
//             end;
//         end;

//         if IsBold and IsItalic then begin
//             Decorator := XlWrkShtWriter.DefaultBoldItalicCellDecorator;
//             exit;
//         end;

//         if IsBold then begin
//             if IsDoubleUnderlined then begin
//                 Decorator := XlWrkShtWriter.DefaultBoldDoubleUnderlinedCellDecorator;
//                 exit;
//             end;
//             if IsUnderlined then begin
//                 Decorator := XlWrkShtWriter.DefaultBoldUnderlinedCellDecorator;
//                 exit;
//             end;
//         end;

//         if IsBold then begin
//             Decorator := XlWrkShtWriter.DefaultBoldCellDecorator;
//             exit;
//         end;

//         if IsItalic then begin
//             if IsDoubleUnderlined then begin
//                 Decorator := XlWrkShtWriter.DefaultItalicDoubleUnderlinedCellDecorator;
//                 exit;
//             end;
//             if IsUnderlined then begin
//                 Decorator := XlWrkShtWriter.DefaultItalicUnderlinedCellDecorator;
//                 exit;
//             end;
//         end;

//         if IsItalic then begin
//             Decorator := XlWrkShtWriter.DefaultItalicCellDecorator;
//             exit;
//         end;

//         if IsDoubleUnderlined then
//             Decorator := XlWrkShtWriter.DefaultDoubleUnderlinedCellDecorator
//         else
//             if IsUnderlined then
//                 Decorator := XlWrkShtWriter.DefaultUnderlinedCellDecorator
//             else
//                 Decorator := XlWrkShtWriter.DefaultCellDecorator;
//     end;

//     var
//         NCurrentRow: Integer;
//         NCurrentCol: Integer;
//         XlWrkShtWriter: DotNet WorksheetWriter;
// }
