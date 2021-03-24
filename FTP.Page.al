page 50100 FTP
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'FTP';

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                Caption = 'DownloadFile';

                trigger OnAction()
                var
                    ftpmanagement: Codeunit FTPdocument;
                begin
                    ftpmanagement.DownloadFile();
                end;
            }
            action(ActionName1)
            {
                ApplicationArea = All;
                Caption = 'ftpdownload';

                trigger OnAction()
                var
                    ftpmanagement: Codeunit FTPdocument;
                begin
                    ftpmanagement.ftpdownload();
                end;
            }
        }
    }

    var
        myInt: Integer;
}