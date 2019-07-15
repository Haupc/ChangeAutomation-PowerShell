


$target = New-DatabaseConnection -ServerInstance "PC" -Database "ERP" -Username "sa" -Password "123456a@"
$ArtifactPath = Import-DatabaseBuildArtifact "C:\Users\PC\Desktop\Artifact\DatabaseBuildArtifact.1.0.0.nupkg"

$update = New-DatabaseReleaseArtifact -Source $ArtifactPath -Target $target

Use-DatabaseReleaseArtifact $update -DeployTo $target