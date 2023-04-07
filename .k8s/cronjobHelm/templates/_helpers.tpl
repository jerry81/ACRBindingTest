
{{/* Generate a env variable from a secret */}}
{{- define "secret" -}}
- name: {{ .name }}
  valueFrom:
    secretKeyRef:
      name: {{ .namespace | default "influx-backup"}}
      key: {{ .key | default (.name | lower )}}
{{- end -}}

{{/* Generate a env variable from a config */}}
{{- define "config" -}}
- name: {{ .name }}
  valueFrom:
    configMapKeyRef:
      name: {{ .namespace | default "influx-backup"}}
      key: {{ .key | default (.name | lower )}}
{{- end -}}

