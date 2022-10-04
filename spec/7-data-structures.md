# 7 Data Structures



The scheduler BB stores all sessions in an internal worklist. Each session may for specific activity (consultation, therapy, payroll, training, etc.) delivered by one or more resources (personnel/facility/etc.), targeting one or more subscribers(people/BBs/machines). A Session may need multiple Alerts (such as reminders,   information, announcements, instructions, triggers, etc.) to be sent to subscribers and resources at appropriate times before, during and after a session. The notifications may also embed information to help receiving party in taking specific action. To simplify scheduling multiple sessions that happen on same day, with same resources and activity but targeting different subscribers, the scheduler enables multiple sessions to be grouped into a single Episode (for example a “consultation” episode could host several consultation sessions with different patients). Further, an “Event” can host multiple episodes that occur over a span of multiple days. The building block maintains details of all schedules and associated resources, subscribers, alerts and allocated date-times in a “worklist” in terms of sessions stacked into episodes and events.  For example, an education institution may conduct a course (Event) involving repeated training on subjects on different days(Episodes), each day having multiple training (sessions) involving different batches of students. Similarly, to carry out “settlements”( event) on a monthly basis (Episode), a payroll session and payments sessions are triggered on accounting building blocks. A clinic could plan a medical camp(event) spanning several days, with daily episodes consisting of several medical consultation and screening (sessions), for number of patients(Subscribers).

The data requirements of these heterogenous use cases are reduced into a comprehensive set of unique data elements, organized into a schema of common reusable datasets, formed by grouping of closest related data elements, avoiding unnecessary duplication.  In this model, the basic unit of scheduling is an “Session“.  All sessions have unique IDs that link to corresponding entry in a internal calendar of the Scheduler. The API structure that defines the service interface should accommodate various fields relevant across use cases that may consume the service. However, some fields many be filled mandatorily while others may be optional depending on the use case. Also, all details of a data set in the data model may not be populated at once, it may be filled in parts as and when relevant (e.g., although a consultation session may be provisioned, but consumers may be appointment later). As new use cases are discovered, one can add fields that are not in the set in the model already. It is assumed each use case will define respective  subset of data model along with mandating of appropriate data fields.  Besides the basic data set needed for scheduling, there are data sets such as configurations, etc., that help to administer and audit the scheduler BB itself (e.g, Security, performance, Transactional and Schedule Compliance audit reports, etc.) The proposed resource model showing the relationship between data objects that are used by this Building Block is illustrated in the diagram below.  Support of polymorphic data sets and data types is provided by means of a list of generic meta-attributes, to enable Polymorphism in data-sets which may occur when different collections inherit common data from base entities.

## Standards

Typical data structure requirements and format representations relevant to this building block have been TMF646\_Appointment\_API\_Specification\_R19.0.0\_fixed ([https://www.scribd.com/document/448516776/TMF646-Appointment-API-Specification-R19-0-0-Fixed](https://www.scribd.com/document/448516776/TMF646-Appointment-API-Specification-R19-0-0-Fixed)). However, the schema and data elements are optimized for minimizing footprint and external dependencies, given that this building block handles time-critical alerts.

## Scheduler Building Block Resource Model

<figure><img src=".gitbook/assets/image5.png" alt=""><figcaption><p><a href="https://lucid.app/lucidchart/309762a7-1c77-43ce-8f1f-d5f27be6c782/edit?invitationId=inv_51a931a4-75d0-441e-94f5-3f254d223520">https://lucid.app/lucidchart/309762a7-1c77-43ce-8f1f-d5f27be6c782/edit?invitationId=inv_51a931a4-75d0-441e-94f5-3f254d223520</a></p></figcaption></figure>

### Data elements



| Worklist    | ID                   | Unique ID of a specific session                                                                           |
| ----------- | -------------------- | --------------------------------------------------------------------------------------------------------- |
| Worklist    | Start\_Date          | Starting date of the session                                                                              |
| Worklist    | Start\_Time          | ending date of the session                                                                                |
| Worklist    | End\_Date            | Starting time of the session                                                                              |
| Worklist    | End\_Time            | ending time of the session                                                                                |
| Worklist    | Tolerance            | Duration in days,hours,mins to wait beyond scheduled start date time before concluding session as no show |
| Worklist    | Session\_Location    | GPS coordinates and address of the location from where session is delivered                               |
| Worklist    | Alerts               | List of alert IDs that link to specific alert messages and associated details for this session            |
| Worklist    | Subscriber IDs       | List of Subscriber IDs that have booked appointment for this session                                      |
| Worklist    | Resource IDs         | List of resource  IDs that have been allocated for this session                                           |
| Worklist    | Resource IDs         | Latest updated status of this session(inactive/pending/triggered/in progress/completed/failed/etc)        |
| Worklist    | Host\_Entity         | ID of the entity which hosts this session                                                                 |
| Worklist    | Creation datetime    | When this session was created                                                                             |
| Worklist    | Episode\_Name        | Name tag of the Episode to which this session belongs                                                     |
| Worklist    | Event\_Name          | Name tag of the Event to which this session belongs                                                       |
| Worklist    | CRUD\_Log            | History of transactions done on configuration of this session entry                                       |
| Worklist    | Session name         | Name of this session                                                                                      |
| Worklist    | Subscriber limit     | Max number of subscribers that this session can accommodate                                               |
| Worklist    | Session Charges      | Amount                                                                                                    |
| Worklist    | Currency             | Currency of charges                                                                                       |
| Worklist    | Terms and conditions | Terms and conditions to be accepted by subscriber                                                         |
| Worklist    | instructions         | Instructions to be followed by sucbscriber and resources                                                  |
| Log         | Log\_ID              | Unique identifier of a specific transaction                                                               |
| Log         | Category             | Unique identifier of a specific type of transaction  (Based on what change did the administrator affect)  |
| Log         | Log\_data            | Transaction summary                                                                                       |
| Log         | Entity ID            | Entity of person who did this transaction                                                                 |
| Log         | Creation Datetime    | When this log was created                                                                                 |
| Log         | CRUD\_Log            | Details of transaction done and who did it                                                                |
| Log         | Block\_ID            | Name of internal block which is to be configured                                                          |
| Log         | Config\_data         | Latest Configuration settings of various parameters in this block given in JSON format                    |
| Log         | CRUD\_Log            | ID of user and application which did any CRUD transaction                                                 |
| Alert List  | ID                   | Unique identifier of a specific alert message bound to a session                                          |
| Alert List  | Category             | Type of alert message (appointment alert/ process trigger/ healthalert/crimealert/etc.)                   |
| Alert List  | Entity ID            | Entity which owns this alert message                                                                      |
| Alert List  | Target Resources     | Unique identifiers of specific Resources enrolled in a specific session                                   |
| Alert List  | Target Subscribers   | Unique identifiers of a specific subscribers enrolled in a specific session                               |
| Alert List  | Epoch                | Date-Time when this alert must be generated                                                               |
| Alert List  | AlertMessage         | Alert message to be sent (Common to all recipients)                                                       |
| Alert List  | Status               | Status of alert (pending/sent/delivered)                                                                  |
| Alert List  | CRUD\_Log            | Configuration history of this Alert entry                                                                 |
| Resources   | ID                   | Unique identifier of a specific Resource                                                                  |
| Resources   | Phone                | Resource phone number                                                                                     |
| Resources   | Email                | Resource email address                                                                                    |
| Resources   | Alert\_URL           | Resource URL to send alerts                                                                               |
| Resources   | Category             | Identifies the resource class e.g doctor, nurse, admin, ambulance,etc.                                    |
| Resources   | Name                 | Name of resource                                                                                          |
| Resources   | Entity               | Organization which owns this resource                                                                     |
| Resources   | Location             | Address of the resource                                                                                   |
| Resources   | Alert\_Mode          | Whether alert should be sent to this resource by mail/phone/messaging/URL                                 |
| Resources   | CRUD\_Log            | Configuration history of this Resource entry                                                              |
| Resources   | Status               | Status of this resource (enabled/disabled)                                                                |
| Subscribers | ID                   | Unique identifier of a specific subscriber                                                                |
| Subscribers | Phone                | Subscriber phone number                                                                                   |
| Subscribers | Email                | Subscriber email address                                                                                  |
| Subscribers | Alert URL            | Subscriber URL to send alerts                                                                             |
| Subscribers | Entity               | Organization that the subscriber represents (subscriber may be individual participants also).             |
| Subscribers | Alert\_Mode          | Whether alert should be sent to this subscriber by mail/phone/messaging/URL                               |
| Subscribers | CRUD\_Log            | Configuration history of this Subscriber entry                                                            |
| Subscribers | Status               | Status of this subscriber(Enabled/disabled)                                                               |
| Subscribers | Location             | Address of subscriber                                                                                     |
| Entity      | ID                   | Unique identifier of a Entity                                                                             |
| Entity      | Category             | Class of entity (Hospital, clinic,etc)                                                                    |
| Entity      | Name                 | Name of entity                                                                                            |
| Entity      | Phone                | Phone number of the entity                                                                                |
| Entity      | Email                | Email of the entity                                                                                       |
| Entity      | Status               | Whether this entity is active or not for scheduling                                                       |
| Entity      | CRUD\_Log            | Transaction history of this document                                                                      |
