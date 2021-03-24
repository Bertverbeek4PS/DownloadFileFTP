codeunit 50100 FTPdocument
{
    trigger OnRun()
    begin

    end;

    procedure DownloadFile()
    var
        Url: Text;
        MemoryStream: DotNet MemoryStream;
        WebClient: DotNet WebClient;
        NetworkCredential: dotnet NetworkCredential;
        Stream: DotNet Stream;
        DocumentManagement: Codeunit "Document Management";
        DocumentStorageTypes: Option " ","File System on Premise","SharePoint Online","Azure File Storage",,,,,,,,PPT,DPTDUAL;
        Filename: Text;
    begin
        Url := 'ftp://ftp.drivehq.com/Test.txt';
        WebClient := WebClient.WebClient;
        WebClient.Credentials := NetworkCredential.NetworkCredential('bertverbeek', 'Koterweg42');
        Stream := WebClient.OpenRead(Url);
        MemoryStream := MemoryStream.MemoryStream;
        Stream.CopyTo(MemoryStream);
        Filename := 'C:\temp\testBC.txt';
        DocumentManagement.PutContentToStorageByStream(MemoryStream, DocumentStorageTypes::"File System on Premise", Filename);
    end;

    procedure ftpdownload()
    var
        FTPWebRequest: dotnet FTPWebRequest;
        FTPWebResponse: dotnet FTPWebResponse;
        NetworkCredential: dotnet NetworkCredential;
        MemoryStream: DotNet MemoryStream;
        Stream: DotNet Stream;
        DocumentManagement: Codeunit "Document Management";
        DocumentStorageTypes: Option " ","File System on Premise","SharePoint Online","Azure File Storage",,,,,,,,PPT,DPTDUAL;
        Filename: Text;
    begin
        FTPWebRequest := FTPWebRequest.Create('ftp://ftp.drivehq.com/Test.txt');
        FTPWebRequest.Credentials := NetworkCredential.NetworkCredential('bertverbeek', 'Koterweg42');
        FTPWebRequest.UseBinary := TRUE;
        FTPWebRequest.UsePassive := TRUE;
        FTPWebRequest.KeepAlive := TRUE;
        FTPWebRequest.Method := 'RETR';
        FTPWebResponse := FTPWebRequest.GetResponse();
        Stream := FTPWebResponse.GetResponseStream();
        MemoryStream := MemoryStream.MemoryStream;
        Stream.CopyTo(MemoryStream);
        Filename := 'C:\temp\testBC.txt';
        DocumentManagement.PutContentToStorageByStream(MemoryStream, DocumentStorageTypes::"File System on Premise", Filename);
    end;
}