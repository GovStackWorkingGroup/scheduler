---
description: >-
  This section provides a detailed view of how this Building Block will interact
  with other Building Blocks to support common use cases.
---

# 9 Internal Workflows

In the current scope, examples drawn from user-journey steps of use-cases of Post-Partum care and Unconditional Social Benefit transfer programs were considered to derive key digital functionalities required to orchestrate services from this Building Block. In this section, we identify workflows to manifest some of the main services. These may be enhanced or customized as needed for specific implementation needs. The following common preconditions may be needed to be met before utilizing these services:

* Entities that Host an Event registered in the Scheduler before scheduling respective events;
* Subscriber, Organizer, and Resources are registered in Scheduler before being used in Event;
* Service Endpoints of Scheduler and other Building Blocks it will interact with are already configured in Information Mediator Building Block;
* All users are logged into GovStack Host application to do their respective tasks;
* Subscriber/Organizer knows preferred host entity, event category to search for resources and available events;
* Any payments associated with event subscription are done outside of the Scheduler;
* Records of the latest resource and subscriber contact details stored in the Scheduler are up-to-date;
* Target Building Block is registered as publisher and Scheduler is registered as a subscriber in “status” room of Information Mediator Building Block Pub/Sub dedicated to the target Building Block before using Pub/Sub mode for status updates/triggers;
* Event schedule with a unique ID already exists in Scheduler before seeking cancellation update;
* Scheduler can also call some of its APIs from inside for operations that do not need external interaction in a particular workflow if the information is already available internally.

This section captures the example workflows that may take place between internal functional blocks to orchestrate key functionalities for a minimum viable product as follows. The exact workflows may be decided depending on implementation time considerations.

* Event creation;
* Finding resources of a host entity which are available in a given date-time range;
* Finding event slots of a given category and resource Id in a given date-time range;
* Appointment Scheduling for the resource or subscriber to a specific event;
* Cancellation of appointment;
* Registering new Alert Message Template;
* Scheduling Alerts for a given event;
* Tracking and Alerting as per schedule;
* Cancellation of a scheduled event;
* Log Reporting;
* Registering a new entity;
* Registering a new resource;
* Affiliating an existing resource to a new entity;
* Registering a new subscriber.

### 9.1 Workflow sequence diagrams

The example workflows mentioned above are represented in sequence diagrams as illustrated as examples below. As defined earlier, the scheduler responds to four types of actors:

* Building Block admins who configure the Building Block's functional aspects, monitor and administer the performance of the Building Block in live environments. (This is an implementation detail and not discussed in the scope of the workflows below).
* Resource who is affiliated to one or more entities and gets allocated to specific events to carry out some activities.
* Subscribers who are enrolled in one or more events as a beneficiary of the event. Subscribers may be individuals or represent some entity.
* Organizer who can manage the configuration of events, resources, alerts, and subscribers.

The sequence diagrams assume that in all services to the Scheduler building blocks the requestor's id (maybe auth token) and requestor's role will be published along with the payload of the request, as a security requirement, although not displayed here for simplicity. All fields contained in exchanges between blocks are not shown for simplicity, the exact fields and formats can be found in API schemas described in the APIs section

**9.1.1. Event Creation**

An organizer can use this workflow to create a new event in the system. The Organizer will need to feed in minimum details such as the event name, category, address, start and end date-time, host entity, terms for subscription, and subscription limit (e.g. a doctor consultation event is limited to one patient. In a training event the limit may include multiple students). Optionally, a deadline may be specified for participants to log attendance to the event (else marked as absent). The Scheduler avoids duplication of a given event by checking if the same properties are already registered in its Event\_List. It then returns either success status along with a unique event id or an appropriate error code to host the application of the organizer.

```mermaid
sequenceDiagram

Organizer->>Host_App: Submit details of <br>new event 
Host_App->>Scheduler: Post/entity/new<br> {Event_Details}
alt: if given entity/<br>is already registered <br>and event is<br> not duplicate
  note over Scheduler: Generate unique Event_Id
  Scheduler->>EventList: Add new event <br>{Details, unique Event_Id} 
  Scheduler->>Host_App:return{success,unique Event_Id}
  Host_App->>Organizer: Publish new Event_Id
else 
  Scheduler->>Host_App: Return error code
  Host_App->>Organizer: Publish error
end
```

#### 9.1.2. Finding resource availability in a given date-time range

An organizer may use a host application to seek the Scheduler for availability within a specific period (date-time range) of a chosen resource in a chosen entity. The Scheduler finds the affiliated workdays-hours of a given resource in the given entity from its Affiliation\_List and calculates corresponding date-time slots that fall within the given date-time range. Then it finds from Appointments List the start and end date-time zones of all events booked for a given resource id and entity, in a given date-time range. From all this information it calculates the free time zones of the given resource, within the affiliated time zones of the given entity and given date-time range. Finally, the Scheduler returns a list of free zones of the given resource within the given date-time range and affiliated work day hours in the given entity. The host application presents this information to the Organizer. If any of the given criteria have invalid values, the scheduler notifies an appropriate error message to Host-App.

```mermaid
sequenceDiagram
Organizer->>Host_App: Request resource availability
Host_App->>Scheduler: Get/resource/availablity:<br>{free_resource_details}<br> in{Entity_id,Resource_Id<br>from_datetime,<br>to_date_time}
Scheduler->>Affiliation_List: Get/affiliation/list_details<br>{Workdays_hours}<br>in{resource_id, Entity_id}
Affiliation_List->>Scheduler: returns workdays_hours 
note over Scheduler: calculate affiliated<br> dates in given <br>date-time range.
Scheduler->>Appointment_List: Get/appointment/list_details<br>{start,end}in{participant_id=<br>resource_id, participant_type='resource,<br>Entity_id,Event_type,datetime range}
Appointment_List->>Scheduler: returns starting<br> and ending time<br> of appointments
note over Scheduler: calculate free slots<br> (affiliated time <br>zones - booked slots)
  Scheduler->>Host_App: Return Array{resource id,free_slots}
  Host_App->>Organizer: Publish available slots<br> of each resource
```

#### 9.1.3. Finding events of a given type and status having a specific resource in a given date-time range

In some scenarios, one may search for events of a specific category involving a specific resource of a specific host entity (e.g. consultation with a specific doctor in a particular hospital) that are open for subscription. The organizer can feed through a host app, a date range, event type, entity ID, and resource\_id seeking matching events with status=open. The Scheduler seeks its appointment\_List for the event\_ids of events with a given type, resource and entity, within a given time range. For each event, the Scheduler gets details of the event if the event status is = "open". The Schedule returns details of selected open events or returns the appropriate error code (e.g. if specified category/resource not found, etc.). The Host app will present the results or error appropriately to the Organizer.

```mermaid
sequenceDiagram
Organizer->>Host_App:Submit category,<br> resource_id,<br>datetime_range,<br> event_type
Host_App->>Scheduler:Get/appointment/list_details<br>{event_id} in {entity_id,event_type,<br>paticipant_id=resource_id,<br>paticipant_type='resource',<br>from_datetime,to_datetime)
Scheduler-->Host_app: return ids of<br> matching events
Host_App->>Scheduler:Get/event/list_details<br> in {event_ids, status='open'}  
Scheduler->>Host_App: return details of <br>specific events with<br> status=open
Host_App->> Organizer: Publish event details 

```

#### 9.1.4. Appointment Scheduling for resource or subscriber to a specific event

An organizer may enrol a subscriber or resource to a specific event through a host app. The host application first finds out details of a chosen event\_id. Then the host application requests a new appointment booking by giving participant details, and event details as needed. The Scheduler stores appointment details against a unique appointment id in its Appointment List. The Scheduler then confirms successful enrolment to the user through the host app and publishes the unique appointment id for that participant.

```mermaid
sequenceDiagram
Organizer->>Host_App:request enrollment<br> of chosen participant<br> to chosen event
Host_App->>Scheduler:Get/event/list_details<br>{event_type,from,to,<br>status} in {event_id}
Scheduler->>Host_App: return requested <br>event details for<br> given event ids
alt if subscriber_limit >0 and event_status = 'open'
  Host_App->> Scheduler: put/event/modifications<br>{subscriber_limit-1}in{event_id}      
  Scheduler->>Host_App: return success
  Host_App->>Scheduler:Post/Appointment/new<br>{event_id,event_type,<br>participant_type,participant_id,<br>from,to,deadline}
  alt if participant type is "resource"
    Scheduler->>Resource_List: Get/Resource/list_details<br>{resource_details} in {Resouce_id=<br>participant_id}
    Resource_List->>Scheduler:return target details <br> Resource or error
    else if participant type is "subscriber"
    Scheduler->>Subscriber_List: Get/Resource/list_details<br>{subcriber_details} in {Resouce_id=<br>participant_id}
    Subscriber_List->>Scheduler:return target details <br> subscriber or error
  end 
  Scheduler->>Messaging_BB: send appointment id<br> with event details<br> to subscriber
  Scheduler->>Host_App: return success <br>with unique appointment id 
  Host_App->> Organizer: publish appointment<br> id with event details
end      
```

**9.1.5. Cancellation of appointment:**

An organizer may cancel an existing appointment of a resource or a subscriber for an event using the Host App. The user may submit the participant id or participant type (subscriber/resource) and the event id to the Scheduler through the host app, requesting for cancellation of respective enrollment for the event. If the Scheduler finds the given event id and subscriber/resource id in the appointment\_list it will delete the enrolment entry of the given resource in the given event, else it will return an appropriate error message. The Host-app confirms success or error condition to the user. The Scheduler also emits a notification through Messaging Building Block to inform the cancelled participant only (in different implementations one can also inform all participants). It should be noted that the deletion of the enrolment of a subscriber does not remove subscriber/resource details stored in the subscriber/resource list, but it removes only the allocation to the specific event.

```mermaid
sequenceDiagram
Organizer->>Host_App: request deletion <br>of appointment <br> of selected <br>resource/subscriber <br>in selected event<br> required details
Host_App->>Scheduler: Delete/appointment<br> <br>{event_Id,participant_type<br>, participant_id}
Scheduler->>Appointment_List: mark matching appointment as cancelled
alt If event or participant not found 
  Scheduler->>Host_App: publish error
else 
  Scheduler->>Host_App: Confirm cancellation success
  Event_List->>Messaging BB: send cancellation <br>information to specific<br> resoure/subscriber
end
```

#### 9.1.6. Registering new Alert Message Template

Several predefined templates of alert messages can be stored in a Message List so that they can be reused in different alerts and events (for example appointment reminders, triggers to devices and s/w applications, etc. Using a host app an organizer may submit a new message and request the Scheduler to register the message. The Scheduler tries to store a new entry in its message list and returns a success or error code in response.

```mermaid
sequenceDiagram
Organizer->>Host_App:Request addition of<br> given alert template
Host_App->>Scheduler:Post:/Alert_Template/new{message_details}
Scheduler->>message_List:Store new template<br> and generate <br>new template id
Scheduler->>Host_App:Return new template ID
Host_App->>Organizer: confirm template registration
```

#### 9.1.7. Scheduling Alerts for a given event

An organizer may schedule different alert messages to be sent to subscribers and resources before, during, and after a prescheduled event. It is assumed here that the alert messages are borrowed from a list of messaging templates within the Scheduler that have been pre-registered and affiliated with a specific entity. The Organizer may use a host app to request the Scheduler to create a new alert schedule by choosing the alert message template, date-time of when the alert is to be sent, and type of targets to receive the message (subscriber/resource/both). If the Scheduler finds all inputs valid it will store the details against a unique Alert Schedule id in the Alert\_schedile\_list and returns success status and the unique id, otherwise, it will return an appropriate error code. This workflow assumes that the message templates created by the organizer of one entity should not be accessible to organizers affiliated with the host entity. Also, it is assumed that all participants of a given type (resource/subscriber/both) will receive the alert. If a specific implementation needs to define individual participants who should receive a specific alert, it will require further refining of the steps laid out here and is out of scope of the current workflow.

```mermaid
sequenceDiagram
Organizer->>Host_App: request new alert <br>schedule with chosen<br> message, epoch<br>,target type,event 
Host_App->>Scheduler:Post/alert_schedule/new<br>{alert_schedule_details}
Scheduler->>Event_List: Get/event/list_details<br>{period} in {event_id}
alt if entity not found<br> or event has ended
  Scheduler->>Host_App: return error code
  Host_App->>Organizer: publish error
else
Scheduler->> Alert_Schedule_Details: store alert schdeule
Alert_Schedule_Details->>Scheduler: return new<br> Alert_schedule_id
Scheduler->>Host_App:Return new alert_schedule_id
Host_App->>Organizer: confirm success
end
```

#### 9.1.8. Tracking and Alerting as per schedule

The Scheduler's internal tracker keeps fetching (with a predefined interval) a list of all alerts for which the scheduled date time has arrived (within the interval). For each alert that is ready to go and based on the given target type (resource/ subscriber/ both) it will list participants of that associated event from the appointment list and send the alert message to them. The alert message will be sent using the preferred channel (sms/URL/mail) registered in the resources /subscribers list. It should be noted that the Scheduler does not wait for confirmation of the delivery of the message. In the current context, a recipient of an alert may asynchronously send back a delivery acknowledgement to the log update (see log update workflow) of the Scheduler.

```mermaid
sequenceDiagram
loop for each interval(x minutes)
  note over Scheduler: update datetime<br>range by interval
  Scheduler->>Alert_Schedule_List:Get/alert_schedule/list_details<br>{datetime,message_id<br>target_type,event_id}<br>in {datetime_range}
  Alert_Schedule_List-->Scheduler:Details of all alerts<br>falling within given <br>date-time range
  loop for each alert,
    Scheduler->>message_list:Get/message/list_details<br><{message}in{message_id}: 
    message_list->Scheduler: return message<br> to be sent
    alt if target_category is resource or both
      Scheduler->>appointment_list:Get/appintment/list_details<br><{participant_id}in{event_id,<br>partipant_type=resource} 
      appointment_list->>Scheduler:return resource_ids of event
      loop for each resource
        Scheduler->>Resource_list:/resource/list_details<br>{phone,url,email,<br>preffered channel}in<br>{resource_id}
        Resource_list->>Scheduler:return {phone,url,email,<br>preffered channel}
        note over Scheduler: append resource <br>info to target list
      end
    end
    alt if target_category is subscriber or both
      Scheduler->>event_list:Get/event/list_details<br><{participant_id}in{event_id,<br>partipant_type=subscriber} 
      event_list->>Scheduler:return resource_ids of event
      loop for each subscriber
        Scheduler->>subscriber_list:/subscriber/list_details<br>{phone,url,email,<br>preffered channel}in<br>{subscriber_id=target_id}
        subscriber_list->>Scheduler:return {phone,url,email,<br>preffered channel}
        note over Scheduler: append resource <br>info to target list
      end
    end
    loop for each target
       note over Scheduler: generate unique token
       alt if prefered channel <br> = "messaging":
         Scheduler->>messaging BB: Send Alert<br>(phone_no,message,token)
       end
       alt if prefered channel= "direct"
           Scheduler->>Target_BB/App: Send to target URL<br>(message,token) 
       end
       alt if prefered channel = "pubsub"
             Scheduler->>Pubsub: Publish to room<br>(message,alert_token) 
       end  
     end
   end
end


```

#### 9.1.9. Cancellation of scheduled event <a href="#_heading-h.3fwokq0" id="_heading-h.3fwokq0"></a>

Organizer can request the cancellation of a prescheduled event through the host app by supplying the event id. The Scheduler first removes dependent alert\_schedules and appointments empanelled in the event. It then deletes the event from the event list and returns success to the host app for confirmation to the organizer. Optionally it can send out event cancellation message through preferred channels to all subscribers and resources of the event, before deleting the event from the event list.

```mermaid
sequenceDiagram
Organizer->>Host_App:Request Cancellation <br> of selected event
Host_App->>Scheduler: Delete/event{event_Id}
Scheduler->>Alert_Schedule_List: Get/Alert_Schedule/List_details<br>{Alert_Schedule_id}<br>in {event_id}
loop for each Alert_Schedule_id:
  Scheduler->>Alert_Schedule_List: Delete/Alert_Schedule/{event_id}
end
Scheduler->>Appointment_List: Get/appointment/List_details<br>{appointment_id}in<br> {event_id}
loop for each appointment id:
  Scheduler->>Appointment_List: Delete/appointment/<br>{appointment_id}
end

 loop for each target
   alt if participant type = resource:
       Scheduler->>Resource_List: Get/Resource/List_Details{Resource_id}
   else if participant type = Subscriber:
       Scheduler->>Subscriber_List: Get/Subscriber/List_Details{Subscriber_id}
   end
   opt if  prefered channel= "direct"
       Scheduler->>Target_BB/App: notify cancellation[url] 
    end
    opt if prefered channel = "pubsub"
       Scheduler->>Pubsub: notify cancellation <br>[Event Id] 
    end
    opt if prefered channel = "messaging":
       Scheduler->>messaging BB: notify cancellation[messaging BB]
    end
 end

Scheduler->>Event_List: delete/event in {event_id}
Scheduler->>Host_App: return success or error
Host_App->>Organizer:confirm deletion <br>or error information

```

#### 9.1.10. Log reporting

In this workflow, a simple case of extracting chosen type of log in a given time range is described. The Organizer requests the scheduler through a host app to report logs of a chosen category within a chosen date range. The scheduler fetches a list of matching logs found from its Log\_List, or null if nothing is found. The scheduler publishes the logs or null to the user through the host app. This function can be extended in different implementations to generate more complex types of reports based on information in the log.

```mermaid
sequenceDiagram
Organizer->>Host_App: request logs in <br>given period,<br>entity_id,log category
Host_App->>Scheduler:Get/log/list_details<br>{details} in {entity_id,<br>datetime_range,<br>log_category}
Scheduler->>Log_List:Fetch matching<br> log entries
Log_List->>Scheduler:return error or <br>null or any <br> matching logs
Scheduler->>Host_App:Return error or <br> list of logs
Host_App->>Organizer: Publish Logs or <br> error message
```

**9.1.11.Registering a new entity**

A new entity that can use the scheduler MUST be registered by the administrator of the Scheduler Building Block. The Administrator requests entity registration in the scheduler through Scheduler's administrative front-end user interface by supplying relevant entity details. The Scheduler after verifying the requestor's credentials will store the entity information against a new entity id it generates. In case it finds that the entity details match any of the earlier registered entities it returns an error code and avoids duplication. In the normal course, the entity id is returned to the Administrator along with a prompt to register an Organizer resource for that entity, to use the Scheduler further.

```mermaid
sequenceDiagram
Adminstrator->>Host_App:Request addition of<br> given Entity and<br> entity profile
Host_App->>Scheduler:Post:/entity/new<br>{entity_details}
Scheduler->>Entity_List: Store new entity profile<br> and generate new entity id
Entity_List->>Scheduler: Return new template id<br> or error(if entity<br> exists already)
Host_App->>Adminstrator: confirm template<br> registration and prompt<br> for registration of <br>"organizer" resource
```

**9.1.12. Registering a new resource**

An organizer MUST register into the scheduler various categories of resources {people, equipment, vehicles, facility, etc.) into a specific entity before the resource can be used in different events. An organizer is also a resource of an entity but can be registered only by the Administrator of the Building Block. An organizer can register resources of other categories only into his/her affiliated entity only. The registration process begins with the submission of resource details with the request to Scheduler for registration of resource. The Scheduler internally stores details of the resource into a resource\_list and generates a new resource id.

```mermaid
sequenceDiagram
Adminstrator/Organizer->>Host_App:Request addition of<br> given Resource as<br> Organizer in given entity
Host_App->>Scheduler:Post:/resource/new<br>{entity_id,resouce_details}
Scheduler->>Resource_List: Store new resource profile<br>
note over Resource_List: if matching resource<br> exists fetch resource_id,<br> else store deteails and<br> generate new id 
Resource_List->>Scheduler: return Resource_Id
Scheduler->>Host_App: return Resource_Id
Host_App->>Adminstrator/Organizer: confirm registration

```

**9.1.13. Affiliating a resource to an entity**

A registered resource MUST be affiliated with at least one entity. A resource MAY be affiliated to different entities only in non-overlapping day-time zones(e.g. doctor may give consultation in multiple hospitals). An organizer can be affiliated only by an administrator. All other categories of resources can be affiliated by an Organizer. The affiliation request may be submitted through the host-App to the scheduler along with affiliation details (resource\_id,entity\_id, affiliated days and time zones in that entity, etc.). The scheduler will add a new affiliation of that resource to the new entity in the Affiliation List and generate a new affiliation id. The Scheduler flags an error if it finds a duplicate entry.

```mermaid
sequenceDiagram
Adminstrator/Organizer->Host_App: request affiliation with details
Host_App-->Scheduler: Post/affiliation/new:<br>{affiliation_details}
Scheduler->>Affiliation_List: store new affiliation deetails
Affiliation_List->>Scheduler: return Affiliation id<br> or duplication error 
Scheduler->>Host_App: return Affiliation id <br> or error
Host_App->>Adminstrator/Organizer: confirm affiliation of <br>resource to specified entity

```

**9.1.14. Registering a new Subscriber**

An organizer can register into the scheduler a new subscriber's details into a specific entity. A subscriber must be registered into the scheduler before they are allowed to book appointments for various events. This example considers that Organizer can register resources of other categories only into his/her affiliated entity only. The organizer submits subscriber details through Host\_App to Scheduler requesting registration. The Scheduler internally stores details of the subscriber into its subscriber\_list and generates a new resource id. The Scheduler returns the new subscriber id or a duplication error if it finds the subscriber profile is already existing. The Host app confirms registration or duplication error to the Organizer.

```mermaid
sequenceDiagram
Organizer->>Host_App:Request addition of<br> given Subscriberas<br> Organizer in given entity
Host_App->>Scheduler:Post:/Subscriber/new<br>{entity_id,Subscriber_details}
Scheduler->>Subscriber_List: Store new Subscriber profile<br>
note over Subscriber_List: if matching Subscriber<br> exists fetch Subscriber_id,<br> else store deteails and<br> generate new id 
Subscriber_List->>Scheduler: return Subscriber_Id
Scheduler->>Host_App: return Subscriber_Id
Host_App->>Organizer: confirm subscriber registration

```
