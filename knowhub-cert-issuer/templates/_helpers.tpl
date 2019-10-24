{{/* vim: set filetype=mustache: */}}

{{- define "knowhub-ingress-gateway.certIssuerName" -}}
{{- printf "%s-%s" .Release.Name "cert-issuer" | trunc 63 | trimSuffix "-" | quote -}}
{{- end -}}

{{- define "knowhub-ingress-gateway.istioGatewayName" -}}
{{- printf "%s-%s" .Release.Name "istio-gateway" | trunc 63 | trimSuffix "-" | quote -}}
{{- end -}}

{{- define "knowhub-ingress-gateway.domain" -}}
{{- printf "%s%s" "*." .Values.global.domain -}}
{{- end -}}

{{- define "knowhub-ingress-gateway.certificateName" -}}
{{- printf "%s-%s" .Release.Name "certificate" | trunc 63 | trimSuffix "-" | quote -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "knowhub-ingress-gateway.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" | quote -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "knowhub-ingress-gateway.labels" -}}
helm.sh/chart: {{ include "knowhub-ingress-gateway.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end -}}