{
    "schemaVersion": "${schemaVersion}",
    "description": "Join an instance to a domain",
    "mainSteps": [
        {
            "action": "aws:domainJoin",
            "name": "domainJoin",
            "inputs": {
                "directoryId": "${directoryId}",
                "directoryName": "${directoryName}",
                "dnsIpAddresses": [${dnsIpAddresses}]
            }
        }
    ]
}