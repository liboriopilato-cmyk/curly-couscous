codeunit 50100 "Bug Bounty Helper"
{
    procedure GetExtensionInfo(): Text
    var
        AppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);
        exit(StrSubstNo('%1 v%2 by %3', AppInfo.Name, AppInfo.AppVersion, AppInfo.Publisher));
    end;

    procedure LogFinding(FindingDescription: Text; Severity: Text)
    var
        Finding: Record "Bug Bounty Finding";
    begin
        Finding.Init();
        Finding.Description := CopyStr(FindingDescription, 1, MaxStrLen(Finding.Description));
        Finding.Severity := CopyStr(Severity, 1, MaxStrLen(Finding.Severity));
        Finding."Recorded At" := CurrentDateTime();
        Finding."Recorded By" := CopyStr(UserId(), 1, MaxStrLen(Finding."Recorded By"));
        Finding.Insert(true);
    end;
}
