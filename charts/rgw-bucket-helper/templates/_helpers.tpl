{{/*
Expand the name of the chart.
*/}}
{{- define "rgw-bucket-helper.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rgw-bucket-helper.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rgw-bucket-helper.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "rgw-bucket-helper.bucketFullname" -}}
{{- if .Values.bucket.namespacedName }}
{{- printf "%s-%s" .Release.Namespace .Values.bucket.name | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s" .Values.bucket.name | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}


{{/*
Common labels
*/}}
{{- define "rgw-bucket-helper.labels" -}}
helm.sh/chart: {{ include "rgw-bucket-helper.chart" . }}
{{ include "rgw-bucket-helper.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rgw-bucket-helper.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rgw-bucket-helper.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rgw-bucket-helper.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "rgw-bucket-helper.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
