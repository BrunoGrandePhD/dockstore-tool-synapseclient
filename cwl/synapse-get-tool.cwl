#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

id: "synapse-get"
label: "Synapse Get Tool"

baseCommand: 
  - synapse
  - get

$namespaces:
  s: https://schema.org/

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0002-5841-0198
    s:email: thomas.yu@sagebionetworks.org
    s:name: Thomas Yu
  - class: s:Person
    s:identifier: https://orcid.org/0000-0002-4621-1589
    s:email: bruno.grande@sagebase.org
    s:name: Bruno Grande

hints:
  DockerRequirement:
    dockerPull: sagebionetworks/synapsepythonclient:v2.2.0

inputs:
  - id: synapse_config
    type: File
  - id: synapseid
    type: string?
    inputBinding:
      position: 2
  - id: query
    type: string?
    inputBinding:
      position: 1
      prefix: --query

requirements:
  InitialWorkDirRequirement:
    listing:
      - entryname: .synapseConfig
        entry: $(inputs.synapse_config)
     
outputs:
  - id: filepath
    type: File
    outputBinding:
      glob: '*'
