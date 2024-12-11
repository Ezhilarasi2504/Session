namespace Demo_Session.Demo_Session;

page 50170 "Translation Page"
{
    ApplicationArea = All;
    Caption = 'Translation Page';
    PageType = Card;
    SourceTable = "Translation Table";
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Entry No"; Rec."Entry No")
                {
                    Caption = 'Entry No', Locked = true;
                    ToolTip = 'Specifies the value of the Entry No field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Age; Rec.Age)
                {
                    Caption = 'Age';
                    ToolTip = 'Specifies the value of the Age field.', Comment = '%';
                }
                field(Address; Rec.Address)
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("AllowTest")
            {

                Image = AbsenceCalendar;
                trigger OnAction()
                begin

                    Message('C:\Users\ezhilarasi.s.CETASTECH\Documents\COD8.TXT');
#if Test
                    Message('Conditional Directive IF');
#endif
                end;

            }
        }
    }
}
