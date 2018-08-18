{{ with secret "sky/test" }}
{{ .Data.keytest }}{{ end }}
