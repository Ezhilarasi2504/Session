namespace Demo_Session.Demo_Session;
using System.IO;
using Microsoft.Sales.Setup;
using Microsoft.Sales.Document;
using Microsoft.Purchases.Document;

codeunit 50170 TestExcelCU
{
    var
        ExcelBuffer: Record "Excel Buffer";

    trigger OnRun()
    begin
        // ExcelBuffer.AddColumn('Unit', false, '', True, false, false, '', TempExcelBuffer."Cell Type"::Text);
    end;

}
