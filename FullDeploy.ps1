# This step create the build artifact.

# The built artifact will be export to $exportPath

# Artifact name will be in format: " <PackageId>.<PackageVersion>.nupkg "

$project = "D:\ChangeAutomation-PowerShell\ERP.Database\ERP.Database.sqlproj"
$exportPath = "D:\ChangeAutomation-PowerShell\Artifact"
# $exportFolder = ".\Artifact"
$PackageId = "MyDataBase"
$PackageVersion = "1.0.0"

$validatedProject = $project | Invoke-DatabaseBuild
$buildArtifact = $validatedProject | New-DatabaseBuildArtifact -PackageId $PackageId -PackageVersion $PackageVersion
$buildArtifact | Export-DatabaseBuildArtifact -Path $exportPath

# DONE
