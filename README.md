This is a minimal .Net Core application to accompany the Chef Habitat Essentials on Windows training. 

The app was created with dotnet-core-sdk 3.1.0 by running:

`dotnet new webapp -o dotnet-core-sample`

Very few changes were made to allow Chef Habitat to configure this application with user-defined variables that can be injected at runtime. In particular we needed the RazorPages framework to compile the application at build time instead of runtime:

### Startup.cs
``` 
// This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services
              .AddRazorPages()
              .AddRazorRuntimeCompilation();
        }
```
### dotnet-core-sample.csproj
```
<Project Sdk="Microsoft.NET.Sdk.Web">

  <PropertyGroup>
    <TargetFramework>netcoreapp3.1</TargetFramework>
    <RootNamespace>dotnet_core_sample</RootNamespace>
    <MvcRazorCompileOnPublish>false</MvcRazorCompileOnPublish>
    <RazorCompileOnBuild>false</RazorCompileOnBuild>
  </PropertyGroup>

  <ItemGroup>
    <PackageReference Include="Microsoft.AspNetCore.Mvc.Razor.RuntimeCompilation" Version="3.1.0" />
  </ItemGroup>

</Project>
```

The master branch only contains the application code. Learners are expected to package the application with Chef Habitat.

The branches on this repo accompany the lab exercises for the class. After cloning, to switch to a branch, build the app with habitat and run in the studio:

```
git fetch origin <branch>
git checkout <branch>
hab studio enter
[HAB_STUDIO] Habitat:\src> build
[HAB_STUDIO] Habitat:\src> hab svc load <myorigin>/dotnet-core-sample
```