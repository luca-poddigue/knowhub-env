{{/* vim: set filetype=mustache: */}}

{{/*
Create a default fully qualified name for service.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "backend.name" -}}
{{- printf "%s-%s" .Release.Name .Values.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "backend.matchLabels" -}}
app.kubernetes.io/name: {{ .Values.name | quote }}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "backend.labels" -}}
{{ include "backend.matchLabels" . }}
helm.sh/chart: {{ include "knowhub.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end -}}