---
# Source: longhorn/templates/crds.yaml
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  annotations:
    controller-gen.kubebuilder.io/version: v0.7.0
  creationTimestamp: null
  labels:
    app.kubernetes.io/name: longhorn
    helm.sh/chart: longhorn-1.6.0
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/instance: longhorn
    app.kubernetes.io/version: v1.6.0
    longhorn-manager: ""
  name: settings.longhorn.io
spec:
  group: longhorn.io
  names:
    kind: Setting
    listKind: SettingList
    plural: settings
    shortNames:
      - lhs
    singular: setting
  scope: Namespaced
  versions:
    - additionalPrinterColumns:
        - description: The value of the setting
          jsonPath: .value
          name: Value
          type: string
        - jsonPath: .metadata.creationTimestamp
          name: Age
          type: date
      name: v1beta1
      schema:
        openAPIV3Schema:
          description: Setting is where Longhorn stores setting object.
          properties:
            apiVersion:
              description: 'APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources'
              type: string
            kind:
              description: 'Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds'
              type: string
            metadata:
              type: object
            value:
              type: string
          required:
            - value
          type: object
      served: true
      storage: false
      subresources:
        status: {}
    - additionalPrinterColumns:
        - description: The value of the setting
          jsonPath: .value
          name: Value
          type: string
        - jsonPath: .metadata.creationTimestamp
          name: Age
          type: date
      name: v1beta2
      schema:
        openAPIV3Schema:
          description: Setting is where Longhorn stores setting object.
          properties:
            apiVersion:
              description: 'APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources'
              type: string
            kind:
              description: 'Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds'
              type: string
            metadata:
              type: object
            value:
              description: The value of the setting.
              type: string
          required:
            - value
          type: object
      served: true
      storage: true
      subresources:
        status: {}
status:
  acceptedNames:
    kind: ""
    plural: ""
  conditions: []
  storedVersions: []
