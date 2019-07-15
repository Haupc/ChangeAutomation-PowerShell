# This step create the build artifact.

# The built artifact will be export to $exportPath

# Artifact name will be in format: " <PackageId>.<PackageVersion>.nupkg "

$projectRelaPath = "ERP.Database\ERP.Database.sqlproj"
$exportRelaPath = "Artifact"
$PackageId = "MyDataBase"
$PackageVersion = "1.0.0"

$project = $(Resolve-Path -Path $projectRelaPath)
$exportPath = $(Resolve-Path -Path $exportRelaPath)

if (Test-Path -Path $exportPath)
{
    Remove-Item $exportPath -force -recurse
}
mkdir $exportPath

$validatedProject =  $project | Invoke-DatabaseBuild
$buildArtifact = $validatedProject | New-DatabaseBuildArtifact -PackageId $PackageId -PackageVersion $PackageVersion
$buildArtifact | Export-DatabaseBuildArtifact -Path $exportPath

