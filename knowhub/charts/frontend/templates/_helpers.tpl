{{/* vim: set filetype=mustache: */}}

{{/*
Create a default fully qualified name for service.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "knowhub.name" -}}
{{- printf "%s-%s" .Release.Name .Values.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "knowhub.matchLabels" -}}
app.kubernetes.io/name: {{ .Values.name | quote }}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "knowhub.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" | quote -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "knowhub.labels" -}}
{{ include "knowhub.matchLabels" . }}
helm.sh/chart: {{ include "knowhub.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end -}}