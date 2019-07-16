$projectRelaPath = "ERP.Database\ERP.Database.sqlproj"
$target = New-DatabaseConnection -ServerInstance "PC" -Database "ERP" -Username "sa" -Password "123456a@"
$exportRelaPath = "Artifact"
$PackageId = "MyDataBase"
$PackageVersion = "1.0.0"

$project = $(Resolve-Path -Path $projectRelaPath)
$exportPath = $(Resolve-Path -Path $exportRelaPath)
$ArtifactPath = $exportRelaPath + "\" + $PackageId + "." + $PackageVersion + ".nupkg"

# Build

if (Test-Path -Path $exportPath)
{
    Remove-Item $exportPath -force -recurse
}
mkdir $exportPath

$validatedProject =  $project | Invoke-DatabaseBuild
$buildArtifact = $validatedProject | New-DatabaseBuildArtifact -PackageId $PackageId -PackageVersion $PackageVersion
$buildArtifact | Export-DatabaseBuildArtifact -Path $exportPath

# Deploy

$Artifact = Import-DatabaseBuildArtifact $ArtifactPath

$update = New-DatabaseReleaseArtifact -Source $Artifact -Target $target

Use-DatabaseReleaseArtifact $update -DeployTo $target