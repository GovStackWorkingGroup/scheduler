---
description: >-
  Key Digital Functionalities describe the core (required) functions that this
  Building Block must be able to perform.
---

# 4 Key Digital Functionalities

The various actors and their activities described in section 2 must be supported by a set of non-redundant, Key Digital Functionalities listed below:

## **4.1 Event Management**

Authorized organizers of a host entity (such as health workers/admins/etc.)must be able to create and manage schedules of events involving several resources, subscribers, and activities that have to be reminded/triggered/informed through alerts at appropriate times before/during/after the event. Schedules of multiple events can be configured, tracked, and managed, avoiding any duplication.

## **4.2 Entity Management**

The Scheduler must enable the administrator of the Building Block to register multiple entities that will use the Scheduler. Each entity will have at least one person registered under "resources" as an Organizer of various events hosted by that entity. An entity may have multiple affiliated resources that can be allocated to different events hosted by the entity. The Scheduler must enable the registration of details about registered entities with duplication avoidance.

## **4.3 Alert Schedule Management**

Authorized organizers of a host entity may schedule one or more alert messages to be sent to specific resources/subscribers of an event before, during, or after an event. It also provides for the mechanism to send alert messages according to the preferred Alerting mode (through Information Mediator to a target Building Block/application URL endpoint, or publish it in its local Information Mediator + Pub/Sub module or through Messaging Building Block. Every alert sent is tagged for tracking status updates from alerted parties (for example an event started/ended/no show/etc.). Each alert sent is tagged with a unique token from Scheduler that can be used to relate responses from recipients of the alerts. The alerted Building Block/app can take appropriate actions based on the alert message and may send attendance/status to an endpoint on the scheduler along with the token. The Scheduler can also poll for status updates, by giving the unique token of a specific alert it sent.

## **4.4 Alert Message Management**&#x20;

It must be possible for an entity to have its own stack of ready-made message templates that be reused in one or more notifications in multiple events hosted by that entity. Typically organizers of the event maintain this stack of alert templates (reminders/updates/etc.) under specific categories aligned to their business needs. The alerts may further be tagged with a category (appointment reminders/ activity triggers/ etc.) for easy search and identification purposes.

## **4.5 Resource Management**

Authorized organizers of a host entity may enrol different resources resource (persons, facilities, equipment, vehicle, etc.) into respective entities. This scheduler retains the Resource details such as its name, category (doctor/nurse/teacher/health worker/admin/etc.), contact details (phone/mail/URL), etc., as needed for communication, against a unique event id for each Resource. Organizers may search for resources that are free (unallocated) together in a chosen date-time range, or look for time zones when chosen resources are free together. The Scheduler allows multiple entities to register the same resource supported by a de-duplication filter from the Scheduler to avoid replicas in storage.

## **4.6 Subscriber Management**&#x20;

The subscriber is details of a person/equipment/facility identified by a name and contact details. The Scheduler enables registration of new subscribers by storing their profile and contact information against a unique Id in such a way the same subscriber details can be reused for subscription to several events. Subscribers may also be tagged to a category such as a student/ patient /beneficiary/etc.

## **4.7 Affiliation Management**&#x20;

The Scheduler must enable the same resource to be affiliated with multiple entities with non-overlapping weekdays and working hours. (e.g. a doctor may work at different hospitals on specific days and time spans). The organizer may allocate resources of their entity into multiple non-overlapping events within the affiliated time zone of their entity for that resource. (e.g. a doctor could provide consultation to a series of patients during their work hours at a specific hospital).

## **4.8 Appointment Management**&#x20;

This key digital functionality enables the enrollment of registered subscribers into a specific event. The same subscriber may be enrolled with different token ids into different events. In case a subscriber is a person, the person can subscribe to a chosen event or take assistance from an authorized third party (e.g. health worker or a call-center admin) to subscribe him/her self or their application/device that represents them as a participant subscriber into a chosen event.

## &#x20;**4.9 Status Logging and Reporting**&#x20;

This key digital functionality maintains logs of user-driven transactions, activities originating from this Building Block as well as status updates coming from external sources. All logs contain a date time stamp, an optional location stamp, details of the information source, and the status of the transaction. For example, the Scheduler can log all alerts it generates and all events that are created/updated/cancelled. It can also log status updates from external Building Blocks or applications (e.g. completion of an event) coming through Information Mediator, Pub/Sub, or Messaging Building Block interfaces. The Scheduler must enable an authorized administrator to get a report of logged information in a chosen category and date range and category across events. The Scheduler does not retain any reports. The Scheduler may also monitor and log internal metrics (e.g. latency/capacity utilization/communication failures/etc.) to help in maintenance and capacity management depending on the needs of implementation. For example, if an alert recipient does not acknowledge within a fixed duration the Scheduler may be designed to resend the trigger/notification for a given number of retries before logging a communication success or failure. In another implementation, the Scheduler may be designed to monitor the logs and mark the participant as absent if an attendance log did not arrive within a certain duration after the alert was sent. These are implementation-specific details that are not specified here.

## **4.10 Information Mediator Interface**&#x20;

This interface handles protocols to interact with the Information Mediator Building Block in order to securely expose Scheduler services to other Building Blocks and also enables scheduler access services of other Building Blocks and applications through the Information Mediator Building Block.

## **4.11 PubSub Interface**&#x20;

The interface handles protocols to interact with Pub/Sub messaging rooms assigned to publish asynchronous messages to event participants and receive incoming messages published by participants in the Pub/Sub rooms of the host application.

## **4.12 Messaging Interface**&#x20;

The interface handles protocols to interact with the messaging Building Block for sending alerts to event participants and receiving incoming messages through the Messaging Building Block. This maintains an internal queue of messages until they are passed on to the Messaging Building Block.

## **4.13 Scheduler Administration**&#x20;

This key digital functionality enables the setting up of internal configuration requirements that define the technical behavior of the Scheduler Building Block. It also provides for an administrator to monitor and take actions that regulate the usage and performance of the Building Block. This also provides functionalities for the registration of new entities and Event Organizers within those entities.

To facilitate various activities and different actors as described in section 2, the Scheduler building block MUST have specific key digital functionalities. A scheduled event by definition should have pre-determined start and ending date time, venue, resources (to carry out some activity associated with the event) and subscribers (to consume activities of an event). For example, a doctor (resource), may provide consultation (event), to a patient(subscriber), at a specific hospital (host-entity), on specific days and time (schedule) of which patient can book a specific day and time (Appointment). Similarly, the scheduler may be configured to alert a payroll application (Resource) to calculate salary payments (event) on last day of the month (schedule) and alert a payment building block (Resource) to transfer salaries to health workers (event) in Post-Partum Care program or subsidies to beneficiaries in USCT program on first day of month (schedule).
