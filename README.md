# [Codecov](https://codecov.io) MATLAB Example


Different continuous integration (CI) platforms enable you to produce code coverage reports for your MATLAB&reg; source code. This guide shows how to run MATLAB tests, produce a code coverage report, and upload the report to Codecov. 

You can use the provided MATLAB code and pipeline configurations by forking this repository. The repository includes these files:

| **File Path**                        | **Description**                                                                                                                                       |
|--------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| `coverage-example/quadraticSolver.m` | The `quadraticSolver` function solves quadratic equations.                                                                                            |
| `coverage-example/SolverTest.m`      | The `SolverTest` class tests the `quadraticSolver` function.                                                                                          |
| `runMyTests.m`      | The `runMyTests` script creates a test suite and a test runner that outputs a Cobertura code coverage report.                                                                                          |
| `azure-pipelines.yml`                | The `azure-pipelines.yml` file defines the pipeline that runs on [Azure&reg; DevOps](https://marketplace.visualstudio.com/items?itemName=MathWorks.matlab-azure-devops-extension). |
| `.circleci/config.yml`               | The `config.yml` file defines the pipeline that runs on [CircleCI&reg;](https://circleci.com/orbs/registry/orb/mathworks/matlab).
| `.travis.yml`               | The `config.yml` file defines the pipeline that runs on [Travis CI](https://docs.travis-ci.com/user/languages/matlab/). 

## Produce and Publish Coverage Reports

Use these example pipeline YAMLs to:

1) Install the latest MATLAB release on a Linux&reg;-based build agent.
2) Run all MATLAB tests in the root of your repository, including its subfolders.
3) Produce a code coverage report in Cobertura XML format.
4) Upload the produced artifact to Codecov.

### Azure DevOps

```yml
pool:
  vmImage: Ubuntu 16.04
steps:
  - task: InstallMATLAB@0
  - task: RunMATLABTests@0
    inputs:
      codeCoverageCobertura: coverage.xml
  - script: bash <(curl -s https://codecov.io/bash)
```



### CircleCI

```yml
version: 2.1
orbs:
  matlab: mathworks/matlab@0.1.4
  codecov: codecov/codecov@1.1.1
jobs:
  build:
    machine:
      image: ubuntu-1604:201903-01
    steps:
      - checkout
      - matlab/install
      - matlab/run-tests: 
          code-coverage-cobertura: coverage.xml
      - codecov/upload: 
          file: coverage.xml
```

### Travis CI

```yml
language: matlab
script: matlab -batch 'runMyTests'
after_success: bash <(curl -s https://codecov.io/bash)
```

## Caveats
* Currently, MATLAB builds are available only for public projects.

## Links
- [Community Boards](https://community.codecov.io)
- [Support](https://codecov.io/support)
- [Documentation](https://docs.codecov.io)
- [Continuous Integration with MATLAB and Simulink](https://www.mathworks.com/solutions/continuous-integration.html)

## Contact Us
If you have any questions or suggestions, please contact MathWorks&reg; at [continuous-integration@mathworks.com](mailto:continuous-integration@mathworks.com).
