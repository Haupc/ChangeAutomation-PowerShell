$project = "D:\ChangeAutomation-PowerShell\ERP.Database\ERP.Database.sqlproj"
$validatedProject = $project | Invoke-DatabaseBuild
$buildArtifact = $validatedProject | New-DatabaseBuildArtifact -PackageId MyDatabase -PackageVersion 1.0.0
$buildArtifact | Export-DatabaseBuildArtifact -Path "C:\Users\PC\Desktop\Artifact"

# DONE