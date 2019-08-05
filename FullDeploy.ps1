$projectRelaPath = "ERP.Database\ERP.Database.sqlproj"
$target = New-DatabaseConnection -ServerInstance "." -Database "ERP" -Username "sa" -Password "123456a@"
$exportRelaPath = "Artifact"
$PackageId = "MyDataBase"
$PackageVersion = "1.0.0"

$project = $(Resolve-Path -Path $projectRelaPath)
$ArtifactPath = $exportRelaPath + "\" + $PackageId + "." + $PackageVersion + ".nupkg"

# Build

if (Test-Path -Path $exportRelaPath)
{
    Remove-Item $exportRelaPath -force -recurse
}
mkdir $exportRelaPath


$exportPath = $(Resolve-Path -Path $exportRelaPath)

$validatedProject =  $project | Invoke-DatabaseBuild
$buildArtifact = $validatedProject | New-DatabaseBuildArtifact -PackageId $PackageId -PackageVersion $PackageVersion
$buildArtifact | Export-DatabaseBuildArtifact -Path $exportPath

# Deploy

$Artifact = Import-DatabaseBuildArtifact $ArtifactPath

$update = New-DatabaseReleaseArtifact -Source $Artifact -Target $target

Use-DatabaseReleaseArtifact $update -DeployTo $target
