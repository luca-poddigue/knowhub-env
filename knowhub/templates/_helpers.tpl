{{/* vim: set filetype=mustache: */}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "knowhub.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" | quote -}}
{{- end -}}

{{- define "knowhub.istioGatewayName" -}}
{{- printf "%s-%s" .Release.Name "istio-gateway" | trunc 63 | trimSuffix "-" | quote -}}
{{- end -}}

{{- define "knowhub.hosts" -}}
- {{ include "knowhub.host" . }}
- www.{{ include "knowhub.host" . }}
{{- end -}}

{{- define "knowhub.host" -}}
{{- if .Values.global.envName -}}
{{- printf "%s.%s" .Values.global.envName .Values.global.domain -}}
{{- else -}}
{{- .Values.global.domain -}}
{{- end -}}
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