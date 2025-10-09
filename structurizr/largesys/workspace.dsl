workspace {

    model {
        sys = softwareSystem "A Large System" "Our large software system" {
            !docs docs
            !adrs adrs
            webApp = container "Web Application"

            service1 = group "Service 1" {
                service1api = container "Service 1 API" {
                    tags "Service 1" "Service API"
                }
                container "Service 1 Datastore" {
                    tags "Service 1" "Datastore"
                    service1api -> this "Reads from and writes to"
                }
            }
            
            service2 = group "Service 2" {
                service2api = container "Service 2 API" {
                    tags "Service 2" "Service API"
                }
                container "Service 2 Datastore" {
                    tags "Service 2" "Datastore"
                    service2api -> this "Reads from and writes to"
                }
            }

            service3 = group "Service 3" {
                service3api = container "Service 3 API" {
                    tags "Service 3" "Service API"
                }
                container "Service 3 Datastore" {
                    tags "Service 3" "Datastore"
                    service3api -> this "Reads from and writes to"
                }
            }

            service4 = group "Service 4" {
                service4api = container "Service 4 API" {
                    tags "Service 4" "Service API"
                }
                container "Service 4 Datastore" {
                    tags "Service 4" "Datastore"
                    service4api -> this "Reads from and writes to"
                }
            }

            service5 = group "Service 5" {
                service5api = container "Service 5 API" {
                    tags "Service 5" "Service API"
                }
                container "Service 5 Datastore" {
                    tags "Service 5" "Datastore"
                    service5api -> this "Reads from and writes to"
                }
            }
        }

        user = person "User" "A user of our software system"
        admin = person "Administrator" "An administrator of our software system"

        user -> webApp
        admin -> webApp
        webApp -> service1api
        service1api -> service2api
        service1api -> service3api
        webApp -> service3api
        service3api -> service4api
        service4api -> service2api
        service4api -> service5api
        service5api -> service2api
    }

    views {
        systemContext sys "SystemContext" {
            include *
            autoLayout
        }
        container sys "ContainerAll" {
            include *
            autolayout lr
        }
        container sys "ContainerService1" {
            include ->service1->
            autolayout
        }
        container sys "ContainerService2" {
            include ->service2->
            autolayout
        }
        container sys "ContainerService3" {
            include ->service3->
            autolayout
        }
        container sys "ContainerService4" {
            include ->service4->
            autolayout
        }
        container sys "ContainerService5" {
            include ->service5->
            autolayout
        }
        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }
            element "Service API" {
                shape RoundedBox
            }
            element "Datastore" {
                shape cylinder
            }
            element "Service 1" {
                background #ffc000
                color #000000
            }
            element "Service 2" {
                background #a3aa3f
                color #000000
            }
            element "Service 3" {
                background #8f6374
                color #ffffff
            }
            element "Service 4" {
                background #addcee
                color #000000
            }
            element "Service 5" {
                background #006260
                color #ffffff
            }
            element "Decision:Superseded" {
                colour white
                background #d2752d
            }

        }
    }
    
}