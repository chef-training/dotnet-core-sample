$pkg_name="dotnet-core-sample"
$pkg_origin="hab"
$pkg_version="0.1.0"
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
$pkg_license=@("Apache-2.0")
$pkg_deps=@("core/dotnet-asp-core")
$pkg_build_deps=@("core/dotnet-core-sdk")

function Invoke-SetupEnvironment {
  Set-RuntimeEnv "HAB_CONFIG_PATH" $pkg_svc_config_path
}

function Invoke-Build {
  cp $PLAN_CONTEXT/../* $HAB_CACHE_SRC_PATH/$pkg_dirname -recurse -force -Exclude ".vagrant"
  & "$(Get-HabPackagePath dotnet-core-sdk)\bin\dotnet.exe" build
  if($LASTEXITCODE -ne 0) {
      Write-Error "dotnet build failed!"
  }
}

function Invoke-Install {
  & "$(Get-HabPackagePath dotnet-core-sdk)\bin\dotnet.exe" publish --output "$pkg_prefix/www"
  if($LASTEXITCODE -ne 0) {
      Write-Error "dotnet install failed!"
  }
}