report 50170 ExcelReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {

            dataitem(PurchaseLine; "Purchase Line")
            {
                #region AL
                trigger OnPreDataItem()
                begin
                    PurchaseLine.SetRange("Qty. Rcd. Not Invoiced", 0);
                    TempExcelBuffer.NewRow();
                    TempExcelBuffer.AddColumn(PurchaseLine.FieldCaption("Document Type"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.FieldCaption("Document No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.FieldCaption("Buy-from Vendor No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.FieldCaption(Type), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.FieldCaption("No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.FieldCaption(Description), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.FieldCaption("Location Code"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.FieldCaption(Quantity), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.FieldCaption("Reserved Qty. (Base)"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.FieldCaption("Unit of Measure Code"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.FieldCaption("Direct Unit Cost"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.FieldCaption("Line Amount"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.FieldCaption("Qty. Rcd. Not Invoiced"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.FieldCaption("Expected Receipt Date"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.FieldCaption("Outstanding Qty. (Base)"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                end;
                #endregion

                trigger OnAfterGetRecord()
                begin

                    TempExcelBuffer.NewRow();
                    TempExcelBuffer.AddColumn(PurchaseLine."Document Type", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine."Document No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine."Buy-from Vendor No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.Type, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine."No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.Description, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine."Location Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine.Quantity, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                    TempExcelBuffer.AddColumn(PurchaseLine."Reserved Qty. (Base)", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                    TempExcelBuffer.AddColumn(PurchaseLine."Unit of Measure Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    TempExcelBuffer.AddColumn(PurchaseLine."Direct Unit Cost", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                    TempExcelBuffer.AddColumn(PurchaseLine."Line Amount", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                    TempExcelBuffer.AddColumn(PurchaseLine."Qty. Rcd. Not Invoiced", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                    TempExcelBuffer.AddColumn(PurchaseLine."Expected Receipt Date", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
                    TempExcelBuffer.AddColumn(PurchaseLine."Outstanding Qty. (Base)", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                end;

#if Test
                trigger OnPostDataItem()
                begin
                    TempExcelBuffer.CreateNewBook(PurchLineLbl);
                    TempExcelBuffer.WriteSheet(PurchLineLbl, CompanyName, UserId);
                    TempExcelBuffer.CloseBook();
                    TempExcelBuffer.SetFriendlyFilename(StrSubstNo(FileName, CurrentDateTime, UserId));
                    TempBlob.CreateOutStream(OutStream);
                    TempExcelBuffer.SaveToStream(Outstream, true);
                    TempBlob.CreateInStream(InStream);
                    SendEmail(MailBody);
                end;
#endif
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(EmailSetting)
                {
                    Caption = 'Email Setting';
                    field(EmailID; EmailID)
                    {
                        Caption = 'Email ID';
                        ApplicationArea = All;
                    }
                    field(MailSubject; MailSubject)
                    {
                        ApplicationArea = All;
                        Caption = 'MailSubject';
                    }
                    field(CCRecipients; CCRecipients)
                    {
                        ApplicationArea = All;
                        Caption = 'CCRecipients';
                    }
                }
                group(BodyOfTheMail)
                {
                    field(MailBody; MailBody)
                    {
                        ApplicationArea = All;
                        Caption = 'MailBody';
                        MultiLine = true;
                        ExtendedDatatype = RichContent;
                    }
                }
            }
        }
    }

    var
        EmailID: Text[128];
        CCList: List of [Text];
        CCRecipients: Text[128];
        MailBody: Text;
        TempExcelBuffer: Record "Excel Buffer" temporary;
        PurchLineLbl: Label 'Purchase Line';
        FileName: Label 'PurchaseLine_%1_%2';
        XlWrkBkWriter: DotNet CellDecorator;
        MailSubject: Text;
        RichTextVar: Text;
        TempBlob: Codeunit "Temp Blob";
        OutStream: OutStream;
        InStream: InStream;
        Mailer: Codeunit Email;
        EmailMsg: Codeunit "Email Message";
        RichTextBodyInStream: InStream;
        RichTextBodyOutStream: OutStream;
        ContentTypeExcel: Label 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', Locked = true;

    procedure SendEmail(RichText: Text)
    begin
        EmailMsg.Create(EmailID, MailSubject, MailBody, true);
        EmailMsg.AddAttachment('Invoiced Line.xlsx', ContentTypeExcel, InStream);
        if CCRecipients <> '' then begin
            CCList := CCRecipients.Split(';');
            foreach CCRecipients in CCList do
                EmailMsg.AddRecipient(Enum::"Email Recipient Type"::Cc, CCRecipients.Trim());
        end;
        if Mailer.Send(EmailMsg, Enum::"Email Scenario"::Default) then
            Message('Mail Sent')
        else
            Message('Not sent%1', GetLastErrorText());
    end;
}