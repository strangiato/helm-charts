# helm-charts

This is a personal repository for managing and building helm charts.  These charts are often experimental.  For additional charts, please also refer to the [Red Hat Intelligent Application Practice Helm Charts](https://github.com/rh-intelligent-application-practice/helm-charts) repo.

## Usage

To access charts from this from the cli repository add it:

```sh
helm repo add strangiato https://strangiato.github.io/helm-charts/
```

To include a chart from this repository in an umbrella chart, include it in your dependencies in your `Chart.yaml` file.

```yaml
apiVersion: v2
name: example-chart
description: A Helm chart for Kubernetes
type: application

version: 0.1.0

appVersion: "1.16.0"

dependencies:
  - name: "odh"
    version: "0.1.3"
    repository: "https://strangiato.github.io/helm-charts/"
```
