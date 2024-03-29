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
  name: replicas.longhorn.io
spec:
  group: longhorn.io
  names:
    kind: Replica
    listKind: ReplicaList
    plural: replicas
    shortNames:
      - lhr
    singular: replica
  scope: Namespaced
  versions:
    - additionalPrinterColumns:
        - description: The current state of the replica
          jsonPath: .status.currentState
          name: State
          type: string
        - description: The node that the replica is on
          jsonPath: .spec.nodeID
          name: Node
          type: string
        - description: The disk that the replica is on
          jsonPath: .spec.diskID
          name: Disk
          type: string
        - description: The instance manager of the replica
          jsonPath: .status.instanceManagerName
          name: InstanceManager
          type: string
        - description: The current image of the replica
          jsonPath: .status.currentImage
          name: Image
          type: string
        - jsonPath: .metadata.creationTimestamp
          name: Age
          type: date
      name: v1beta1
      schema:
        openAPIV3Schema:
          description: Replica is where Longhorn stores replica object.
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
        - description: The data engine of the replica
          jsonPath: .spec.dataEngine
          name: Data Engine
          type: string
        - description: The current state of the replica
          jsonPath: .status.currentState
          name: State
          type: string
        - description: The node that the replica is on
          jsonPath: .spec.nodeID
          name: Node
          type: string
        - description: The disk that the replica is on
          jsonPath: .spec.diskID
          name: Disk
          type: string
        - description: The instance manager of the replica
          jsonPath: .status.instanceManagerName
          name: InstanceManager
          type: string
        - description: The current image of the replica
          jsonPath: .status.currentImage
          name: Image
          type: string
        - jsonPath: .metadata.creationTimestamp
          name: Age
          type: date
      name: v1beta2
      schema:
        openAPIV3Schema:
          description: Replica is where Longhorn stores replica object.
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
              description: ReplicaSpec defines the desired state of the Longhorn replica
              properties:
                active:
                  type: boolean
                backendStoreDriver:
                  description: 'Deprecated: Replaced by field `dataEngine`.'
                  type: string
                backingImage:
                  type: string
                dataDirectoryName:
                  type: string
                dataEngine:
                  enum:
                    - v1
                    - v2
                  type: string
                desireState:
                  type: string
                diskID:
                  type: string
                diskPath:
                  type: string
                engineImage:
                  description: 'Deprecated: Replaced by field `image`.'
                  type: string
                engineName:
                  type: string
                evictionRequested:
                  type: boolean
                failedAt:
                  type: string
                hardNodeAffinity:
                  type: string
                healthyAt:
                  type: string
                image:
                  type: string
                logRequested:
                  type: boolean
                nodeID:
                  type: string
                rebuildRetryCount:
                  type: integer
                revisionCounterDisabled:
                  type: boolean
                salvageRequested:
                  type: boolean
                snapshotMaxCount:
                  type: integer
                snapshotMaxSize:
                  format: int64
                  type: string
                unmapMarkDiskChainRemovedEnabled:
                  type: boolean
                volumeName:
                  type: string
                volumeSize:
                  format: int64
                  type: string
              type: object
            status:
              description: ReplicaStatus defines the observed state of the Longhorn replica
              properties:
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
                currentImage:
                  type: string
                currentState:
                  type: string
                evictionRequested:
                  description: 'Deprecated: Replaced by field `spec.evictionRequested`.'
                  type: boolean
                instanceManagerName:
                  type: string
                ip:
                  type: string
                logFetched:
                  type: boolean
                ownerID:
                  type: string
                port:
                  type: integer
                salvageExecuted:
                  type: boolean
                started:
                  type: boolean
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
