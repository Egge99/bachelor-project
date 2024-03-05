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
  name: backingimagedatasources.longhorn.io
spec:
  group: longhorn.io
  names:
    kind: BackingImageDataSource
    listKind: BackingImageDataSourceList
    plural: backingimagedatasources
    shortNames:
      - lhbids
    singular: backingimagedatasource
  scope: Namespaced
  versions:
    - additionalPrinterColumns:
        - description: The current state of the pod used to provision the backing image file from source
          jsonPath: .status.currentState
          name: State
          type: string
        - description: The data source type
          jsonPath: .spec.sourceType
          name: SourceType
          type: string
        - description: The node the backing image file will be prepared on
          jsonPath: .spec.nodeID
          name: Node
          type: string
        - description: The disk the backing image file will be prepared on
          jsonPath: .spec.diskUUID
          name: DiskUUID
          type: string
        - jsonPath: .metadata.creationTimestamp
          name: Age
          type: date
      name: v1beta1
      schema:
        openAPIV3Schema:
          description: BackingImageDataSource is where Longhorn stores backing image data source object.
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
        - description: The system generated UUID of the provisioned backing image file
          jsonPath: .spec.uuid
          name: UUID
          type: string
        - description: The current state of the pod used to provision the backing image file from source
          jsonPath: .status.currentState
          name: State
          type: string
        - description: The data source type
          jsonPath: .spec.sourceType
          name: SourceType
          type: string
        - description: The backing image file size
          jsonPath: .status.size
          name: Size
          type: string
        - description: The node the backing image file will be prepared on
          jsonPath: .spec.nodeID
          name: Node
          type: string
        - description: The disk the backing image file will be prepared on
          jsonPath: .spec.diskUUID
          name: DiskUUID
          type: string
        - jsonPath: .metadata.creationTimestamp
          name: Age
          type: date
      name: v1beta2
      schema:
        openAPIV3Schema:
          description: BackingImageDataSource is where Longhorn stores backing image data source object.
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
              description: BackingImageDataSourceSpec defines the desired state of the Longhorn backing image data source
              properties:
                checksum:
                  type: string
                diskPath:
                  type: string
                diskUUID:
                  type: string
                fileTransferred:
                  type: boolean
                nodeID:
                  type: string
                parameters:
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
                uuid:
                  type: string
              type: object
            status:
              description: BackingImageDataSourceStatus defines the observed state of the Longhorn backing image data source
              properties:
                checksum:
                  type: string
                currentState:
                  type: string
                ip:
                  type: string
                message:
                  type: string
                ownerID:
                  type: string
                progress:
                  type: integer
                runningParameters:
                  additionalProperties:
                    type: string
                  nullable: true
                  type: object
                size:
                  format: int64
                  type: integer
                storageIP:
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
