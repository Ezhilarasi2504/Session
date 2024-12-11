table 50170 "Translation Table"
{
    Caption = 'Translation Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
        }
        field(2; "Name"; Text[250])
        {
        }
        field(3; "Age"; Integer)
        {
        }
        field(4; "Address"; Text[250])
        {
        }
    }
    keys
    {
        key(PK; "Entry No")
        {
            Clustered = true;
        }
    }
}
