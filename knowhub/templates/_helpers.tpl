{{/* vim: set filetype=mustache: */}}

{{- define "knowhub.certIssuerName" -}}
{{- printf "%s-%s" .Release.Name "cert-issuer" | trunc 63 | trimSuffix "-" | quote -}}
{{- end -}}

{{- define "knowhub.dnsName" -}}
{{- printf "%s%s" "*." .Values.dnsName | quote -}}
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
helm.sh/chart: {{ include "knowhub.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end -}}