table 50100 "Bug Bounty Finding"
{
    Caption = 'Bug Bounty Finding';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; Description; Text[2048])
        {
            Caption = 'Description';
        }
        field(3; Severity; Text[20])
        {
            Caption = 'Severity';
        }
        field(4; "Recorded At"; DateTime)
        {
            Caption = 'Recorded At';
        }
        field(5; "Recorded By"; Code[50])
        {
            Caption = 'Recorded By';
            TableRelation = User."User Name";
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(BySeverity; Severity, "Recorded At") { }
    }
}
