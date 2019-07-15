$projectRelaPath = "ERP.Database\ERP.Database.sqlproj"
$exportRelaPath = "Artifact"
$PackageId = "MyDataBase"
$PackageVersion = "1.0.0"

$target = New-DatabaseConnection -ServerInstance "PC" -Database "ERP" -Username "sa" -Password "123456a@"
$ArtifactPath = Import-DatabaseBuildArtifact "Artifact\MyDatabase.1.0.0.nupkg"

$project = $(Resolve-Path -Path $projectRelaPath)
$exportPath = $(Resolve-Path -Path $exportRelaPath)

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

$update = New-DatabaseReleaseArtifact -Source $ArtifactPath -Target $target

Use-DatabaseReleaseArtifact $update -DeployTo $target