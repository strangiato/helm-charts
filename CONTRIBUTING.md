# Contributing

Thanks for showing interest in my helm charts!

This repo is intended as a central chart repository for charts I host and maintain.  Most of my charts are designed to work on OpenShift but any contributions to help make them more compatible with other k8s versions are welcome!

Any and all contributions are welcome.  I will do my best to respond quickly.

## Chart Versioning

Chart versions should follow symantec versioning numbers and every change to a chart should include an incrementation to the dot release.  App Version should utilize a reasonable version number for the application the chart is deploying.

For example, a Postgres chart version may be 0.3.2 but the app version is 13.7 indicating that it is deploying Postgres 13.7.

### Goals for 1.0 Releases

At a high level charts targeting a 1.0 release should meet the requirements defined for [Red Hat Helm Chart Certification](https://redhat-connect.gitbook.io/partner-guide-for-red-hat-openshift-and-container/helm-chart-certification/helm-chart-requirements).

Some of those requirements include:

* Charts should container a README.md
* README file for each chart should contain documentation for the configurable values
* Charts should contain a values.schema.json file
* Charts should include tests
* Charts must pass `helm lint`
