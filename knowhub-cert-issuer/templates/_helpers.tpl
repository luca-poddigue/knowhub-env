{{/* vim: set filetype=mustache: */}}

{{- define "knowhub-cert-issuer.certIssuerName" -}}
{{- printf "%s-%s" .Release.Name "cert-issuer" | trunc 63 | trimSuffix "-" | quote -}}
{{- end -}}

{{- define "knowhub-cert-issuer.istioGatewayName" -}}
{{- printf "%s-%s" .Release.Name "istio-gateway" | trunc 63 | trimSuffix "-" | quote -}}
{{- end -}}

{{- define "knowhub-cert-issuer.certificateName" -}}
{{- printf "%s-%s" .Release.Name "certificate" | trunc 63 | trimSuffix "-" | quote -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "knowhub-cert-issuer.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" | quote -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "knowhub-cert-issuer.labels" -}}
helm.sh/chart: {{ include "knowhub-cert-issuer.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end -}}