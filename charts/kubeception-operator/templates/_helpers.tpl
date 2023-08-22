{{/*
Expand the name of the chart.
*/}}
{{- define "kubeception-operator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kubeception-operator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "kubeception-operator.labels" -}}
helm.sh/chart: {{ include "kubeception-operator.chart" . }}
{{ include "kubeception-operator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "kubeception-operator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kubeception-operator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

