workspace "Polyglot Media" "Structural diagrams of Polyglot Media systems" {

    !identifiers hierarchical

    model {
        author = person "Author" {
            description "Person who creates content for Polyglot Media"
        }
        editor = person "Editor" {
            description "An employee of Polyglot Media"
        }
        cust = person "Customer" {
            description "A customer of the products of Polyglot Media"
        }
        pmsys = softwareSystem "Polyglot Media" {
            !docs docs
            !adrs adrs
            description "Online system belonging to Polyglot Media Ltd."
            custUi = container "Customer UI" {
                tags "web"
                description "Customer user interface"
                technology "Angular"
            }
            custApi = container "Customer API" {
                description "API for Customer actions"
                technology "TBC"
            }
            payInt = container "Payment Interface" {
                description "Service interface with the external payment system"
                technology "TBC"
            }
            medSvc = container "Media Service" {
                description "Service for searching and accessing Media"
                technology "TBC"
            }
            medInt = container "External Media Interface" {
                description "Service interface with the external medi API"
                technology "TBC"
            }
            actQ = container "Activity QueueI" {
                tags "queue"
                description "Queue for Activity"
                technology "RabbitMQ"
            }
            actWri = container "Activity Datastore Writer" {
                description "Service to write media activity to the Activity Datastore"
                technology "TBC"
            }
            actDb = container "Activity Datastore" {
                tags "datastore"
                description "Storage for media activity"
                technology "Event Store DB"
            }
            medDb = container "Media Datastore" {
                tags "datastore"
                description "Storage for media data"
                technology "MongoDB"
            }
        }
        expay = softwareSystem "Payment System" {
            tags "external"
            description "External payment system used by the Polyglot Media system"
        }
        exmed = softwareSystem "External Media API" {
            tags "external"
            description "API to search and gain access to media content external to Polyglot Media"
        }

        author -> pmsys "publishes media content using"
        editor -> pmsys "manages and edits media using"
        
        cust -> pmsys.custUi "searches and access media using"
        pmsys.custUi -> pmsys.custApi "requests data from"
        pmsys.custApi -> pmsys.payInt "takes payment using"
        pmsys.payInt -> expay "takes payment using"
        pmsys.custApi -> pmsys.medSvc "requests data from"
        pmsys.medSvc -> pmsys.medInt "looks up external media data using"
        pmsys.medInt -> exmed "accesses external media data using"
        pmsys.custApi -> pmsys.actQ "writes activity to"
        pmsys.custApi -> pmsys.actDb "reads activity from"
        pmsys.actWri -> pmsys.actQ "retrieves activity from"
        pmsys.actWri -> pmsys.actDb "writes activity to"
        pmsys.medSvc -> pmsys.medDb "reads data from"
    }

    views {
        systemContext pmsys "ContextDiagram" {
            title "System Context diagram for Polyglot Media"
            description "Showing the high-level interactions with the Polyglot Media system."
            include *
            autolayout tb
        }

        container pmsys "ConatianerDiagram" {
            title "Container Diagram for Customers using Polyglot Media"
            description "Showing the high-level interactions within the Polyglot Media system."
            include *
            autolayout lr
        }
        systemContext pmsys "ContextDiagramManual" {
            title "System Context diagram for Polyglot Media"
            description "Showing the high-level interactions with the Polyglot Media system (with manual layout)"
            include *
        }

        container pmsys "ConatianerDiagramManual" {
            title "Container Diagram for Customers using Polyglot Media"
            description "Showing the high-level interactions within the Polyglot Media system (with manual layout)"
            include *
        }

        styles {
            element "Element" {
                color #ffffff
            }
            element "Person" {
                background #063f75
                shape person
            }
            element "Software System" {
                background #0d61b0
            }
            element "Container" {
                background #23a2d9
            }
            element "Database" {
                shape cylinder
            }
            relationship "Relationship" { 
                dashed false
            }

            
            element "external" {
                background #8c8496
            }
            element "web" {
                shape WebBrowser
            }
            element "queue" {
                shape Pipe
            }
            element "datastore" {
                shape Cylinder
            }
        }
    }

    configuration {
        scope softwaresystem
    }

}