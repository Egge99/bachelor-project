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
  name: backingimages.longhorn.io
spec:
  conversion:
    strategy: Webhook
    webhook:
      clientConfig:
        service:
          name: longhorn-conversion-webhook
          namespace: longhorn-system
          path: /v1/webhook/conversion
          port: 9501
      conversionReviewVersions:
        - v1beta2
        - v1beta1
  group: longhorn.io
  names:
    kind: BackingImage
    listKind: BackingImageList
    plural: backingimages
    shortNames:
      - lhbi
    singular: backingimage
  scope: Namespaced
  versions:
    - additionalPrinterColumns:
        - description: The backing image name
          jsonPath: .spec.image
          name: Image
          type: string
        - jsonPath: .metadata.creationTimestamp
          name: Age
          type: date
      name: v1beta1
      schema:
        openAPIV3Schema:
          description: BackingImage is where Longhorn stores backing image object.
          properties:
            apiVersion:
              description: 'APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources'
              type: string
            kind:
              description: 'Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds'
              type: string
            metadata:
              type: object
            spec:
              x-kubernetes-preserve-unknown-fields: true
            status:
              x-kubernetes-preserve-unknown-fields: true
          type: object
      served: true
      storage: false
      subresources:
        status: {}
    - additionalPrinterColumns:
        - description: The system generated UUID
          jsonPath: .status.uuid
          name: UUID
          type: string
        - description: The source of the backing image file data
          jsonPath: .spec.sourceType
          name: SourceType
          type: string
        - description: The backing image file size in each disk
          jsonPath: .status.size
          name: Size
          type: string
        - jsonPath: .metadata.creationTimestamp
          name: Age
          type: date
      name: v1beta2
      schema:
        openAPIV3Schema:
          description: BackingImage is where Longhorn stores backing image object.
          properties:
            apiVersion:
              description: 'APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources'
              type: string
            kind:
              description: 'Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds'
              type: string
            metadata:
              type: object
            spec:
              description: BackingImageSpec defines the desired state of the Longhorn backing image
              properties:
                checksum:
                  type: string
                disks:
                  additionalProperties:
                    type: string
                  type: object
                sourceParameters:
                  additionalProperties:
                    type: string
                  type: object
                sourceType:
                  enum:
                    - download
                    - upload
                    - export-from-volume
                    - restore
                  type: string
              type: object
            status:
              description: BackingImageStatus defines the observed state of the Longhorn backing image status
              properties:
                checksum:
                  type: string
                diskFileStatusMap:
                  additionalProperties:
                    properties:
                      lastStateTransitionTime:
                        type: string
                      message:
                        type: string
                      progress:
                        type: integer
                      state:
                        type: string
                    type: object
                  nullable: true
                  type: object
                diskLastRefAtMap:
                  additionalProperties:
                    type: string
                  nullable: true
                  type: object
                ownerID:
                  type: string
                size:
                  format: int64
                  type: integer
                uuid:
                  type: string
              type: object
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
