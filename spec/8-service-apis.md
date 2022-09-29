# 8 Service APIs

A Set of microservices are defined to provide all functionalities as services of this BB, considering the use cases discussed.  These microservices are through RESTful API end points to other GovStack building blocks and applications to receive requests with relevant inputs and return processed results.  A summary of the services of this BB are summarized in the table below.

## API standards: <a href="#_heading-h.3o7alnk" id="_heading-h.3o7alnk"></a>

* The microservice interfaces are defined as per OPENAPI Ver3.0 standards. For details see [https://swagger.io/specification/#:\~:text=The%20OpenAPI%20Specification%20(OAS)%20defines,or%20through%20network%20traffic%20inspection](https://swagger.io/specification/).
* TMF630\_REST\_API\_Design\_Guidelines have been referenced as guidelines in the process : for details see ([https://www.tmforum.org/resources/standard/tmf630-rest-api-design-guidelines-4-2-0/](https://www.tmforum.org/resources/standard/tmf630-rest-api-design-guidelines-4-2-0/))&#x20;

## &#x20;Summary of scheduler services

&#x20;

| 1  | Create\_session(sessionconfig\[fieldnames, field values])                            | Returns new session ID after creating new Session in worklist with given details in JSON array of \[field name: field value]pairs                                           |
| -- | ------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 2  | update\_session(Session Id, sessionconfig\[fieldnames, field values])                | Returns success code after changing details of given session ID in the worklist, as per given details in JSON array of \[field name: field value]pairs                      |
| 3  | cancel\_sessions(session\_id)                                                        | Returns success code after deleting given Session in worklist                                                                                                               |
| 4  | get\_session\_details (Session ID, sessiondetails \[field names])                    | Returns details as per JSON array of {fields} for a specific session ID                                                                                                     |
| 5  | get\_session\_list(sessionfilter\[field names])                                      | Returns list of sessions corresponding to filter field names                                                                                                                |
| 6  | find\_free\_resource\_slots (resource\_Ids, period, coinciding)                      | Returns list of time zones within a given date-time range where specified resources are free (unallocated), optionally choose only slots when all stated resources are free |
| 7. | find\_free\_resources (period, Entity, category, coinciding)                         | Returns list of resources that are free(unallocated) within given time zone(s), optionally select only resources that have coinciding free slots                            |
| 8  | create\_alert(alertconfig \[fieldnames, field values])                               | Returns new alert ID after storing alert message template in local registry                                                                                                 |
| 9  | update\_alert(Alert Id, alertconfig \[field names, field values])                    | Update values of particular fields of given alert ID Note: status field can be used to enable or disable further usage of this alert.                                       |
| 11 | get\_alert\_details(Alert Id,alertdetails \[field names])                            | Returns requested details of alert for given alert id                                                                                                                       |
| 12 | get\_alert\_list(alertfilter\[field names])                                          | Returns IDs of alerts of given entity selected as per filter field names                                                                                                    |
| 13 | allocate\_alert(Session\_ID, alert ID)                                               | Returns success add an alert message to list of alerts to be sent to specified resources, subscribers in the specified Session                                              |
| 14 | deallocate\_ alert(Session ID, Alert Id)                                             | Returns success after removing specified alerts from specified Session                                                                                                      |
| 15 | get\_Session\_alerts (Session ID, alertdetails\[field names]                         | Returns requested details of alerts that have been allocated to a specified session                                                                                         |
| 16 | Send session Alert(Session ID, Alert ID)                                             | Called by internal tracker to notifiy subscribers/resources at scheduled times directly/through IMPubsub / messaging BB and obtain a response Token                         |
| 17 | create\_Resource(Resourceconfig \[fieldnames, field values])                         | Returns new Resource ID after storing Resource details in local registry                                                                                                    |
| 18 | update\_Resource(Resource Id, Resourceconfig \[field names, field values])           | Update values of particular fields of given Resource ID Note: status field can be used to enable or disable further usage of this Resource.                                 |
| 19 | get\_Resource\_details(Resource Id,Resourcedetails \[field names])                   | Returns requested details of Resource for given Resource id                                                                                                                 |
| 20 | get\_Resource\_list(entity ID, Resourcefilter\[field names])                         | Returns IDs of Resources of given entity selected as per filter field names                                                                                                 |
| 21 | allocate\_Resource(Session\_ID, Resource ID)                                         | Returns success add a Resource to list of Resources to be sent to specified resources, subscribers in the specified Session                                                 |
| 22 | deallocate\_ Resource(Session ID, Resource Id(s))                                    | Returns success after removing specified Resources from specified Session                                                                                                   |
| 23 | get\_Session\_Resources (Session ID, Resourcedetails\[field names, field values]     | Returns requested details of Resources that have been allocated to a specified session                                                                                      |
| 24 | create\_Subscriber(Subscriberconfig \[fieldnames, field values])                     | Returns new Subscriber ID after storing Subscriber details in local registry                                                                                                |
| 25 | update\_Subscriber(Subscriber Id, Subscriberconfig \[field names, field values])     | Update values of particular fields of given Subscriber ID Note: status field can be used to enable or disable further usage of this Subscriber.                             |
| 26 | get\_Subscriber\_details(Subscriber Id,Subscriberdetails \[field names])             | Returns requested details of Subscriber for given Subscriber id                                                                                                             |
| 27 | get\_Subscriber\_list(entity ID, Subscriberfilter\[field names])                     | Returns IDs of Subscribers of given entity selected as per filter field names                                                                                               |
| 28 | allocate\_Subscriber(Session\_ID, Subscriber ID)                                     | Returns success add an Subscriber to list of Subscribers to be sent to specified resources, subscribers in the specified Session                                            |
| 29 | deallocate\_ Subscriber(Session ID, Subscriber Id(s))                                | Returns success after removing specified Subscribers from specified Session                                                                                                 |
| 30 | get\_Session\_Subscribers (Session ID, Subscriberdetails\[field names, field values] | Returns requested details of Subscribers that have been allocated to a specified session                                                                                    |
| 31 | Show\_status(category: Alert/Event/Episode/Session/resource /subscriber, ID)         | Report logged status of objects in specified category and ID in a specified period                                                                                          |
| 32 | get\_Log\_report(logdetails, logfilter)                                              | Publish chronological transaction report of specified category and ID                                                                                                       |
| 33 | Request session Status (Target BB ID, Token ID)                                      | This internally generated request by schedule tracker to an external BB to obtain current status of a session was triggered earlier by Scheduler BB.                        |
| 34 | Update session Status(source BB ID, Token ID)                                        | An external BB or its Pubsub proactively informs status of a specific session it was triggered for by sheduler                                                              |
| 35 | create\_Entity(Entityconfig \[fieldnames, field values])                             | Returns new Entity ID after storing Entity details in local registry                                                                                                        |
| 36 | update\_Entity(Entity Id, Entityconfig \[field names, field values])                 | Update values of particular fields of given Entity ID Note: status field can be used to enable or disable further usage of this Entity.                                     |
| 37 | get\_Entity\_details(Entity Id,Entitydetails \[field names])                         | Returns requested details of Entity for given Entity id                                                                                                                     |
| 38 | get\_Entity\_list(entity ID, Entityfilter\[field names])                             | Returns IDs of Entities of given entity selected as per filter field names                                                                                                  |
| 39 | affiliate\_Entity(Entity\_ID,Target\_ID,Target\_Category)                            | Returns success after binding Entity ID to specific target ID of an internal register of a given category (Resource/subscriber/worklist/alert)                              |
| 40 | deaffiliate\_Entity(Entity\_ID,Target\_ID,Target\_Category)                          | Returns success after removing entity ID affiliation from specific target ID of an internal register of a given category (Resource/subscriber/worklist/alert)               |

## Scheduler BB APIs:

&#x20;Detailed API schemas written in YAML that define RESTAPI endpoints for each of the services mentioned above are available on SwaggerHub located at [https://app.swaggerhub.com/apis/GovStack/govstack-scheduler\_bb\_api/0.0.8](https://app.swaggerhub.com/apis/GovStack/govstack-scheduler\_bb\_api/0.0.8)&#x20;

An example of APIs defined for above services is given below purely for illustration:

```
openapi: 3.0.1
info:
  title: Govstack Scheduler BB API
  description: Interfaces to services rendered by Scheduler building block
  termsOfService: TBD
  contact:
    email: psramkumar2@gmail.com
  license:
    name: Apache 2.0
    url: "http://www.apache.org/licenses/LICENSE-2.0.html"
  version: 1.0.0
externalDocs:
  description: Find out more about scheduler
  url: https://www.govstack.global/
servers: [
    {
      "url": "http://ss2.egovstack.net/r1/eGovStack/COM/11222456/SchedulerBB/creg/",
      "description": "Scheduler BB Security server"
    }
  ]
tags:
- name: session
  description: session  API
- name: find
  description: find  API
- name: alert
  description: alert  API
- name: resources
  description: resources  API
- name: subscribers
  description: subscribers  API
- name: status
  description: status  API
- name: get_log_report
  description: log report

paths:

 # session
  /session/create_session/{requestor_Entity}/{requestor_Role}/:
    post:
      tags:
      - session
      summary: create a new session 
      operationId: createSession
      parameters:
      - name: requestor_Entity
        in: path
        required: true
        schema:
          type: string
      - name: requestor_Role
        in: path
        required: true
        schema:
          type: string
      requestBody:
        content:
          'json':
            schema:
              $ref: '#/components/schemas/sessionconfig'
      responses:
        200:
          description: success
          content:
            application/json:
              schema:
                type: string
                example: "4524458935"
                description: ID of created session
        '405':
          description: Invalid input 
        '403':
          description: requestor doesnot have permission to create a new session
        default:
          description: Unexpected error

```
