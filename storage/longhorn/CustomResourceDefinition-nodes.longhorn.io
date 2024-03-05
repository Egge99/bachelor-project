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
  name: nodes.longhorn.io
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
    kind: Node
    listKind: NodeList
    plural: nodes
    shortNames:
      - lhn
    singular: node
  scope: Namespaced
  versions:
    - additionalPrinterColumns:
        - description: Indicate whether the node is ready
          jsonPath: .status.conditions['Ready']['status']
          name: Ready
          type: string
        - description: Indicate whether the user disabled/enabled replica scheduling for the node
          jsonPath: .spec.allowScheduling
          name: AllowScheduling
          type: boolean
        - description: Indicate whether Longhorn can schedule replicas on the node
          jsonPath: .status.conditions['Schedulable']['status']
          name: Schedulable
          type: string
        - jsonPath: .metadata.creationTimestamp
          name: Age
          type: date
      name: v1beta1
      schema:
        openAPIV3Schema:
          description: Node is where Longhorn stores Longhorn node object.
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
        - description: Indicate whether the node is ready
          jsonPath: .status.conditions[?(@.type=='Ready')].status
          name: Ready
          type: string
        - description: Indicate whether the user disabled/enabled replica scheduling for the node
          jsonPath: .spec.allowScheduling
          name: AllowScheduling
          type: boolean
        - description: Indicate whether Longhorn can schedule replicas on the node
          jsonPath: .status.conditions[?(@.type=='Schedulable')].status
          name: Schedulable
          type: string
        - jsonPath: .metadata.creationTimestamp
          name: Age
          type: date
      name: v1beta2
      schema:
        openAPIV3Schema:
          description: Node is where Longhorn stores Longhorn node object.
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
              description: NodeSpec defines the desired state of the Longhorn node
              properties:
                allowScheduling:
                  description: Allow scheduling replicas on the node.
                  type: boolean
                disks:
                  additionalProperties:
                    properties:
                      allowScheduling:
                        type: boolean
                      diskType:
                        enum:
                          - filesystem
                          - block
                        type: string
                      evictionRequested:
                        type: boolean
                      path:
                        type: string
                      storageReserved:
                        format: int64
                        type: integer
                      tags:
                        items:
                          type: string
                        type: array
                    type: object
                  type: object
                evictionRequested:
                  type: boolean
                instanceManagerCPURequest:
                  type: integer
                name:
                  type: string
                tags:
                  items:
                    type: string
                  type: array
              type: object
            status:
              description: NodeStatus defines the observed state of the Longhorn node
              properties:
                autoEvicting:
                  type: boolean
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
                diskStatus:
                  additionalProperties:
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
                      diskType:
                        type: string
                      diskUUID:
                        type: string
                      filesystemType:
                        type: string
                      scheduledReplica:
                        additionalProperties:
                          format: int64
                          type: integer
                        nullable: true
                        type: object
                      storageAvailable:
                        format: int64
                        type: integer
                      storageMaximum:
                        format: int64
                        type: integer
                      storageScheduled:
                        format: int64
                        type: integer
                    type: object
                  description: The status of the disks on the node.
                  nullable: true
                  type: object
                region:
                  description: The Region of the node.
                  type: string
                snapshotCheckStatus:
                  description: The status of the snapshot integrity check.
                  properties:
                    lastPeriodicCheckedAt:
                      format: date-time
                      type: string
                  type: object
                zone:
                  description: The Zone of the node.
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
