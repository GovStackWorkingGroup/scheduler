---
description: >-
  This section provides information on the core data structures/data models that
  are used by this Building Block.
---

# 7 Data Structures

The internal data requirements of the Scheduler operations from heterogenous use cases can be reduced into a comprehensive set of unique data elements, organized into a schema of common reusable datasets, formed by grouping of closest related data elements, avoiding unnecessary duplication.  In this model, the basic unit of Scheduling is an “Event“, each Event has a unique ID. The API structure that defines the service interface should accommodate various fields relevant across use cases that may consume the service. Some fields may be mandatory inputs while others may be optional depending on the use case. Also, all details of a data set in the data model may not be populated at once, it may be filled in parts as and when relevant (e.g., although a consultation session may be provisioned, consumers may be appointed later). As new use cases are discovered, one can add fields that are not in the set in the model already. It is assumed each use case will define the respective subset of data model along with the mandating of appropriate data fields.  Besides the basic data set needed for scheduling, there are data sets such as configurations, etc., that help to administer and audit the Scheduler Building Block itself (e.g, Security, performance, Transactional and Schedule Compliance audit reports, etc.). The proposed resource model showing the relationship between data objects that are used by this Building Block is illustrated in the diagram below.  Support of polymorphic data sets and data types is provided by means of a list of generic meta-attributes, to enable Polymorphism in data sets which may occur when different collections inherit common data from base entities. The Scheduler Building Block stores registered details of scheduled Events in an internal Event\_List,  of all Resources in a Resource\_List, all Subscribers in a Subscriber\_List, all templates of Alert messages in an ALERT List, and alert schedules in an Alert list. Entries in this list include properties of respective items and linkages between them (e.g. a resource list indicates not only resources but also which entities and events they are enrolled into.). Apart from these, the Scheduler has several "internal" registers that are used to log information arising from transactions, from the system, from communications, etc., and metrics/indicators as needed for housekeeping, audit, and administration of the Building Block. The archival and retrieval of data generated or received in the Scheduler Building Block is left to implementation time considerations of IT infrastructure planning.

## Standards

Typical data structure requirements and format representations relevant to this Building Block have been [TMF646\_Appointment\_API\_Specification\_R19.0.0\_fixed](https://es.scribd.com/document/448516776/TMF646-Appointment-API-Specification-R19-0-0-Fixed). However, the schema and data elements are optimized for minimizing footprint and external dependencies, given that this Building Block handles time-critical alerts. The common minimum datasets have been illustrated in the schema below (source: [https://lucid.app/lucidchart/309762a7-1c77-43ce-8f1f-d5f27be6c782/edit?invitationId=inv\_51a931a4-75d0-441e-94f5-3f254d223520\&page=0\_0#](https://lucid.app/lucidchart/309762a7-1c77-43ce-8f1f-d5f27be6c782/edit?invitationId=inv\_51a931a4-75d0-441e-94f5-3f254d223520\&page=0\_0)) and described in the table below.&#x20;

## Scheduler Building Block Data Model

<figure><img src=".gitbook/assets/Govstack_Scheduler_BB_Resource_Model.png" alt=""><figcaption></figcaption></figure>

### Data elements

**Group: Event\_List**

| Data Element      | Default format                                   | description                                                                                                                                                                                                             |
| ----------------- | ------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Event\_Id         | Integer                                          | unique id of the event                                                                                                                                                                                                  |
| Event\_name       | String                                           | title of event                                                                                                                                                                                                          |
| Period            | String start and end DateTime (dd/mm/yyyy/hh/mm) | when event will start and end                                                                                                                                                                                           |
| Deadline          | String (dd/hh/mm)                                | If participant does not update attendance to Scheduler within this deadline after an event starts, the participant is marked as a no-show. If all participants are in no-show status then the event status is no-show.  |
| Address           | Object                                           | location of the event                                                                                                                                                                                                   |
| Status            | String                                           | pending/started/completed/no-show/etc.                                                                                                                                                                                  |
| Host\_Entity\_Id  | Integer                                          | id of the entity which is organizing the event                                                                                                                                                                          |
| Event Name        | String                                           | name may show event type and branding                                                                                                                                                                                   |
| Subscriber\_Limit | String                                           | Maximum number of subscribers allowed                                                                                                                                                                                   |
| Terms             | String                                           | Any conditions and instructions for to subscribers for participation in an event                                                                                                                                        |
| Category          | string                                           | category of the event (e.g. consultation, training, salary payments, etc.)                                                                                                                                              |
| Subscriber\_ids   | array\[integer]                                  | ids of subscribers enrolled for event                                                                                                                                                                                   |
| Resource\_ids     | array\[integer]                                  | ids of resources enrolled for event                                                                                                                                                                                     |

#### Group: Entity\_List

| Data Element | Default format | Description                |
| ------------ | -------------- | -------------------------- |
| Entity\_Id   | Integer        | unique id of entity        |
| Name         | String         | name of entity             |
| Category     | String         | hospital/clinic/bank/etc.  |
| Phone        | String         | default phone number       |
| Email        | String         | default email id           |
| Website      | String: URL    | URL of website of entity   |
| Address      | Object         | physical address of entity |

#### Group: Address

| Building name | String | Unique ID of a specific event                                                                                                           |
| ------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------- |
| Street        | String | Name of the Event                                                                                                                       |
| Locality      | String | Starting date and time of event                                                                                                         |
| Town          | String | Ending date and time of event                                                                                                           |
| District      | String | Duration (days, hours, mins) to wait for status update after triggering start of an event failing which the event is flagged as no show |
| State         | String | Location of event in GPS coordinates(Lat, Long) and address (building, street, area, town, state, country, postal code)                 |
| Country       | String | List of IDs linked to respective alert configuration details of all notifications scheduled for a specific event                        |
| PinCode       | String | List of resource IDs that have been allocated for this Event                                                                            |

#### Group: Resource\_List

| Data Element     | Default format | Description                                                                                          |
| ---------------- | -------------- | ---------------------------------------------------------------------------------------------------- |
| Resource Id      | Integer        | Unique ID of a specific Resource                                                                     |
| Phone            | String         | contact phone on which this resource receives alerts by sms/etc                                      |
| Email            | String         | contact mail id on which this resource receives alerts                                               |
| Alert URL        | String         | webhook address on which this resource receives alerts                                               |
| Status poll URL  | String         | URL endpoint at which this Resource will report status of alert it received when queried             |
| Category         | String         | profession of this resource (Doctor/nurse/mechanic/teacher/etc.)                                     |
| Alert preference | String         | which channels (sms/email/webhook/etc) are preffered for alerting this resource in order of priority |
| Name             | String         | proper name of the Resource (person/facility/vehicle/equipment)                                      |

#### Data Group: Affiliation

| Data Element       | Default format | Description                                                                                                 |
| ------------------ | -------------- | ----------------------------------------------------------------------------------------------------------- |
| Affiliation\_id    | Integer        | Entity to which a Resource is affiliated                                                                    |
| resouce\_id        | integer        | Working days and time zones that a specific resource allocated to work in an affiliated entity              |
| entity\_id         | integer        | IDs of one or more events a resource is bound to within work hours of the resource in the affiliated entity |
| resource\_category | string         | doctor/healthworker/application/device/etc.                                                                 |
| day\_of\_week      | string         | day name (sunday/monday/etc.)                                                                               |
| start\_datetime    | datetime       | start of work hours                                                                                         |
| end\_datetime      | datetime       | end of work hours                                                                                           |

#### Group: Subscriber List

| Data Element     | Default format | Description                                                                                             |
| ---------------- | -------------- | ------------------------------------------------------------------------------------------------------- |
| Subscriber\_Id   | Integer        | Unique ID of a specific person as a Subscriber                                                          |
| Phone            | String         | contact phone on which this Subscriber receives alerts by sms/etc                                       |
| Email            | String         | contact mail id on which this Subscriber  receives alerts                                               |
| Alert URL        | String         | webhook address on which this Subscriber receives alerts                                                |
| Status poll URL  | String         | URL endpoint at which this Subscriber will report the status of the alert it received when queried      |
| Alert preference | String         | which channels (sms/email/webhook/etc.) are preferred for alerting this Subscriber in order of priority |
| Name             | String         | proper name of the Subscriber (person/facility/vehicle/equipment)                                       |

#### Group: Alert\_Schedule\_List

| Data Element        | Default format | Description                                       |
| ------------------- | -------------- | ------------------------------------------------- |
| Alert\_Schedule\_Id | Integer        | unique id of this schedule for a specific alert   |
| Message\_Id         | Integer        | specific alert message template to be sent        |
| Event\_ID           | Integer        | the event to which this alert chedule is bound to |
| Alert\_dateTime     | String         | Date time at which this alert is to be sent       |
| Target\_category    | String         | who should be alerted Subscribers/resources/both  |

| Data Element | Default format | Description                                          |
| ------------ | -------------- | ---------------------------------------------------- |
| Target\_Type | String         | If the alert target is Resource or Subscriber        |
| Target\_Id   | Integer        | Id of specific resource/subscriber to sent the alert |

**Group: Message\_templates**

| Data Element | Default format | Description                                        |
| ------------ | -------------- | -------------------------------------------------- |
| Message\_Id  | Integer        | specific alert message template                    |
|  Category    | String         | (e.g. info/status/acknowledgement/ emergency/etc.) |
| Message      | String         | content of alert message                           |

**Group: Log**

| Data Element     | Default format  | Description                                                       |
| ---------------- | --------------- | ----------------------------------------------------------------- |
| Log\_Id          | Integer         | unique id of this log entry                                       |
| Entity\_Id       | Integer         | entity logging this data                                          |
| DateTime         | String:Datetime | when this log was entered                                         |
| Logger\_id       | integer         | id of the resource/subscriber/etc.                                |
| Logger\_category | string          | resource/subscriber/internal/etc.                                 |
| Log\_Category    | String          | parameter which is logged (e.g. latency/communication error/etc.) |
| Log\_Data        | String          | content of Log                                                    |

**Group: Free\_Resources**

| Data Element   | Default format                       | Description                                                                |
| -------------- | ------------------------------------ | -------------------------------------------------------------------------- |
| Resource\_Id   | Integer                              | unique id of resource                                                      |
| Resource\_name | string                               | name of resource                                                           |
| free\_slots    | array(start\_datetime,end\_datetime) | list of free slots of this resource (start and end date-time of all slots) |
