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
  name: engineimages.longhorn.io
spec:
  preserveUnknownFields: false
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
    kind: EngineImage
    listKind: EngineImageList
    plural: engineimages
    shortNames:
      - lhei
    singular: engineimage
  scope: Namespaced
  versions:
    - additionalPrinterColumns:
        - description: State of the engine image
          jsonPath: .status.state
          name: State
          type: string
        - description: The Longhorn engine image
          jsonPath: .spec.image
          name: Image
          type: string
        - description: Number of resources using the engine image
          jsonPath: .status.refCount
          name: RefCount
          type: integer
        - description: The build date of the engine image
          jsonPath: .status.buildDate
          name: BuildDate
          type: date
        - jsonPath: .metadata.creationTimestamp
          name: Age
          type: date
      name: v1beta1
      schema:
        openAPIV3Schema:
          description: EngineImage is where Longhorn stores engine image object.
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
        - description: Compatibility of the engine image
          jsonPath: .status.incompatible
          name: Incompatible
          type: boolean
        - description: State of the engine image
          jsonPath: .status.state
          name: State
          type: string
        - description: The Longhorn engine image
          jsonPath: .spec.image
          name: Image
          type: string
        - description: Number of resources using the engine image
          jsonPath: .status.refCount
          name: RefCount
          type: integer
        - description: The build date of the engine image
          jsonPath: .status.buildDate
          name: BuildDate
          type: date
        - jsonPath: .metadata.creationTimestamp
          name: Age
          type: date
      name: v1beta2
      schema:
        openAPIV3Schema:
          description: EngineImage is where Longhorn stores engine image object.
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
              description: EngineImageSpec defines the desired state of the Longhorn engine image
              properties:
                image:
                  minLength: 1
                  type: string
              required:
                - image
              type: object
            status:
              description: EngineImageStatus defines the observed state of the Longhorn engine image
              properties:
                buildDate:
                  type: string
                cliAPIMinVersion:
                  type: integer
                cliAPIVersion:
                  type: integer
                conditions:
                  items:
                    properties:
                      lastProbeTime:
                        description: Last time we probed the condition.
                        type: string
                      lastTransitionTime:
                        description: Last time the condition transitioned from one status to another.
                        type: string
                      message:
                        description: Human-readable message indicating details about last transition.
                        type: string
                      reason:
                        description: Unique, one-word, CamelCase reason for the condition's last transition.
                        type: string
                      status:
                        description: Status is the status of the condition. Can be True, False, Unknown.
                        type: string
                      type:
                        description: Type is the type of the condition.
                        type: string
                    type: object
                  nullable: true
                  type: array
                controllerAPIMinVersion:
                  type: integer
                controllerAPIVersion:
                  type: integer
                dataFormatMinVersion:
                  type: integer
                dataFormatVersion:
                  type: integer
                gitCommit:
                  type: string
                incompatible:
                  type: boolean
                noRefSince:
                  type: string
                nodeDeploymentMap:
                  additionalProperties:
                    type: boolean
                  nullable: true
                  type: object
                ownerID:
                  type: string
                refCount:
                  type: integer
                state:
                  type: string
                version:
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
