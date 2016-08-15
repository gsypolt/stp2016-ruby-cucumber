node {
  stage 'Checkout'
    checkout scm
    // sh 'pipeline/prepare-gems.sh'
    echo 'Stage Checkout'

  stage 'Commit'
    // parallel 'Static Analysis and Local Testing': {
    //  sh 'pipeline/run-static-analysis.sh'
    //  sh 'pipeline/run-unit-tests.sh'
    // }
    echo 'Stage Commit'

  stage 'Acceptance'
    // sh 'launch-environment-acceptance.sh'
    // parallel 'Acceptance Testing': {
    //  sh 'run-infrastructure-tests.sh'
    //  sh 'run-selenium-tests.sh'
    // }
}
