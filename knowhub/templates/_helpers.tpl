{{/* vim: set filetype=mustache: */}}
{{/*

Expand the name of the chart.
*/}}
{{- define "knowhub.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create a default fully qualified name for backend service.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "knowhub.backend.name" -}}
{{- printf "%s-%s" .Release.Name .Values.backend.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "knowhub.backend.matchLabels" -}}
app.kubernetes.io/name: {{ .Values.backend.name | quote }}
{{- end -}}

{{- define "knowhub.backend.labels" -}}
{{ include "knowhub.backend.matchLabels" . }}
{{ include "knowhub.labels" . }}
{{- end -}}



{{/*
Create a default fully qualified name for frontend service.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "knowhub.frontend.name" -}}
{{- printf "%s-%s" .Release.Name .Values.frontend.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "knowhub.frontend.matchLabels" -}}
app.kubernetes.io/name: {{ .Values.frontend.name | quote }}
{{- end -}}

{{- define "knowhub.frontend.labels" -}}
{{ include "knowhub.frontend.matchLabels" . }}
{{ include "knowhub.labels" . }}
{{- end -}}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "knowhub.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "knowhub.labels" -}}
helm.sh/chart: {{ include "knowhub.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
