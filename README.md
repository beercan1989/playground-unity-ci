# Playground Unity CI
![Build Unity](https://github.com/beercan1989/playground-unity-ci/workflows/Build%20Unity/badge.svg)
![Publish Unity](https://github.com/beercan1989/playground-unity-ci/workflows/Publish%20Unity/badge.svg)

Playing with Unity and 2D, along with other stuff like continuous integration and delivery/deployment.

## Continuous Integration (CI) and Continuous Delivery or Deployment (CD)

Okay so I forget whether this is actually continuous delivery or deployment, but both do include easy and semi automated deployment methods.

Also I've not been including any unit or functional tests in my learning projects so far, so I don't know if they will run or not with this.

### Locally

* [.local/functions.ps1](.local/functions.ps1) contains the commands to build and publish in the current project.
  * `UnityBuild` takes a `BuildTarget`, `BuildName` and `UNITY_VERSION`
    * `BuildTarget` is the Unity defined build target (architecture) such as `Android` or `WebGL`
    * `BuildName` is the output name such as `playground-unity-ci.exe` or `playground-unity-ci.apk` or `playground-unity-ci`
    * `UNITY_VERSION` is the version of Unity to use assuming you're using the Hub in its default location.
    * Example usage:
    ```bash
    UnityBuild -BuildTarget "StandaloneWindows64" -BuildName "playground-unity-ci.exe"
    ```
  * `ItchIoPublish` takes a `BuildTarget`, `Project` and `Channel`
    * `BuildTarget` is the Unity defined build target (architecture) such as `Android` or `WebGL`
    * `Project` is the name of the project on [itch.io](itch.io) such as `beercan/playground-unity-ci` for this project into https://beercan.itch.io/playground-unity-ci
    * `Channel` is the tag for the upload to [itch.io](itch.io) such as `android`, `webgl`, `windows`, `linux`, `osx`
    * Example usage:
    ```bash
    ItchIoPublish -BuildTarget "WebGL" -Project "beercan/playground-unity-ci" -Channel "webgl"
    ```
* [.local/build.ps1](.local/build.ps1) builds each architecture its configured to build using Unity in batch mode.
  * Each build is placed in its own folder so it ends up looking something like:
  ```
  playground-unity-ci/
        Build/
            Android/
                playground-unity-ci.apk
            StandaloneLinux64/
                playground-unity-ci
            StandaloneOSX/
                playground-unity-ci.app/
            StandaloneWindows64/
                playground-unity-ci.exe
            WebGL/
                playground-unity-ci/
                    index.html
  ```
* [.local/publish.ps1](.local/publish.ps1) publishes the latest build for each architecture to [itch.io](itch.io) using Butler.
* [.local/publish.ps1](.local/build-and-publish.ps1) builds and then publishes in one go.
* [.local/snapshot-build-publish.ps1](.local/snapshot-build-and-publish.ps1) will snapshot the project, build it and publish all in one go.
   * we take a snapshot to enable running the Unity Editor while it builds in the background.
   * it builds using the build script above
   * it publishes using the publish script above

### Github Actions

* [.github/workflows/build.yml](.github/workflows/build.yml) runs to build against the target platforms (windows, linux, osx and webgl) on every new pull request.
* [.github/workflows/publish.yml](.github/workflows/publish.yml) runs to publish the target platform builds to https://beercan.itch.io/playground-unity-ci

## Sources of information

### CI with Unity

#### Github
* https://github.com/marketplace/actions/unity-builder
* https://unity-ci.com/docs/github
* https://github.com/webbertakken/unity-actions
* https://github.com/marketplace/actions/butler-push
* https://github.community/t/syntax-for-replacing-characters-in-string/17240/2

#### Travis
* https://stablekernel.com/article/continuous-integration-for-unity-5-using-travisci/

#### Azure DevOps
* https://github.com/microsoft/Azure-DevOps-YAML-for-Unity
* https://medium.com/medialesson/continuous-integration-for-unity-3d-projects-using-azure-pipelines-e61ddf64ad79

### Nuget dependencies
* https://github.com/GlitchEnzo/NuGetForUnity
* https://medium.com/@jonfoust/using-gcp-nuget-packages-with-unity-8dbd29c42cc4
* https://docs.microsoft.com/en-us/visualstudio/cross-platform/unity-scripting-upgrade?view=vs-2019

### Pixel perfect
* https://blogs.unity3d.com/2019/03/13/2d-pixel-perfect-how-to-set-up-your-unity-project-for-retro-8-bits-games/

## Idea's for what to do differently
* Don't run build if PR is not up to date with master
* Stop running build if new changes are pushed on PR builds
* Create previous releases to match releases
* Limit the concurrency of releases
* Convert from master publish to:
 * Create a tag / release
 * Use merge commit / feature branch to name release
 * Trigger a release from creation of a release
 * Upload artefacts to github release
 * Upload artefacts to itch.io using the release as version source
 * Mark release as published?
