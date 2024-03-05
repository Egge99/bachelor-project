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
  name: instancemanagers.longhorn.io
spec:
  group: longhorn.io
  names:
    kind: InstanceManager
    listKind: InstanceManagerList
    plural: instancemanagers
    shortNames:
      - lhim
    singular: instancemanager
  scope: Namespaced
  versions:
    - additionalPrinterColumns:
        - description: The state of the instance manager
          jsonPath: .status.currentState
          name: State
          type: string
        - description: The type of the instance manager (engine or replica)
          jsonPath: .spec.type
          name: Type
          type: string
        - description: The node that the instance manager is running on
          jsonPath: .spec.nodeID
          name: Node
          type: string
        - jsonPath: .metadata.creationTimestamp
          name: Age
          type: date
      name: v1beta1
      schema:
        openAPIV3Schema:
          description: InstanceManager is where Longhorn stores instance manager object.
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
        - description: The data engine of the instance manager
          jsonPath: .spec.dataEngine
          name: Data Engine
          type: string
        - description: The state of the instance manager
          jsonPath: .status.currentState
          name: State
          type: string
        - description: The type of the instance manager (engine or replica)
          jsonPath: .spec.type
          name: Type
          type: string
        - description: The node that the instance manager is running on
          jsonPath: .spec.nodeID
          name: Node
          type: string
        - jsonPath: .metadata.creationTimestamp
          name: Age
          type: date
      name: v1beta2
      schema:
        openAPIV3Schema:
          description: InstanceManager is where Longhorn stores instance manager object.
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
              description: InstanceManagerSpec defines the desired state of the Longhorn instance manager
              properties:
                dataEngine:
                  type: string
                image:
                  type: string
                nodeID:
                  type: string
                type:
                  enum:
                    - aio
                    - engine
                    - replica
                  type: string
              type: object
            status:
              description: InstanceManagerStatus defines the observed state of the Longhorn instance manager
              properties:
                apiMinVersion:
                  type: integer
                apiVersion:
                  type: integer
                proxyApiMinVersion:
                  type: integer
                proxyApiVersion:
                  type: integer
                currentState:
                  type: string
                instanceEngines:
                  additionalProperties:
                    properties:
                      spec:
                        properties:
                          backendStoreDriver:
                            description: 'Deprecated: Replaced by field `dataEngine`.'
                            type: string
                          dataEngine:
                            type: string
                          name:
                            type: string
                        type: object
                      status:
                        properties:
                          conditions:
                            additionalProperties:
                              type: boolean
                            type: object
                          endpoint:
                            type: string
                          errorMsg:
                            type: string
                          listen:
                            type: string
                          portEnd:
                            format: int32
                            type: integer
                          portStart:
                            format: int32
                            type: integer
                          resourceVersion:
                            format: int64
                            type: integer
                          state:
                            type: string
                          type:
                            type: string
                        type: object
                    type: object
                  nullable: true
                  type: object
                instanceReplicas:
                  additionalProperties:
                    properties:
                      spec:
                        properties:
                          backendStoreDriver:
                            description: 'Deprecated: Replaced by field `dataEngine`.'
                            type: string
                          dataEngine:
                            type: string
                          name:
                            type: string
                        type: object
                      status:
                        properties:
                          conditions:
                            additionalProperties:
                              type: boolean
                            type: object
                          endpoint:
                            type: string
                          errorMsg:
                            type: string
                          listen:
                            type: string
                          portEnd:
                            format: int32
                            type: integer
                          portStart:
                            format: int32
                            type: integer
                          resourceVersion:
                            format: int64
                            type: integer
                          state:
                            type: string
                          type:
                            type: string
                        type: object
                    type: object
                  nullable: true
                  type: object
                instances:
                  additionalProperties:
                    properties:
                      spec:
                        properties:
                          backendStoreDriver:
                            description: 'Deprecated: Replaced by field `dataEngine`.'
                            type: string
                          dataEngine:
                            type: string
                          name:
                            type: string
                        type: object
                      status:
                        properties:
                          conditions:
                            additionalProperties:
                              type: boolean
                            type: object
                          endpoint:
                            type: string
                          errorMsg:
                            type: string
                          listen:
                            type: string
                          portEnd:
                            format: int32
                            type: integer
                          portStart:
                            format: int32
                            type: integer
                          resourceVersion:
                            format: int64
                            type: integer
                          state:
                            type: string
                          type:
                            type: string
                        type: object
                    type: object
                  nullable: true
                  description: 'Deprecated: Replaced by InstanceEngines and InstanceReplicas'
                  type: object
                ip:
                  type: string
                ownerID:
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
