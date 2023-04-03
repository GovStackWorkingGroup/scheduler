---
description: >-
  This section provides a reference for APIs that should be implemented by this
  Building Block.
---

# 8 Service APIs

A Set of microservices are defined to provide all functionalities as services of this Building Block, considering the use cases discussed.  These microservices are through RESTful API endpoints to other GovStack Building Blocks and applications to receive requests with relevant inputs and return processed results.  A summary of the services of this Building Block is summarized in the table below. The Scheduler Building Block can be used also as an internal sub-block of another Building Block. In such a case the same services APIs will be used to embed the Scheduler Building Block (without having to pass through the Information Mediator).

This section provides a reference for APIs that should be implemented by this Building Block. The APIs defined here establish a blueprint for how the Building Block will interact with other Building Blocks. Additional APIs may be implemented by the Building Block, but the listed APIs define a minimal set of functionality that should be provided by any implementation of this Building Block.&#x20;

The [GovStack non-functional requirements document](https://govstack.gitbook.io/specification/architecture-and-nonfunctional-requirements/6-onboarding) provides additional information on how 'adaptors' may be used to translate an existing API to the patterns described here.



A Set of microservices are defined to provide all functionalities as services of this Building Block, considering the use cases discussed.  These microservices are through RESTful API endpoints to other GovStack Building Blocks and applications to receive requests with relevant inputs and return processed results.  A summary of the services of this Building Block is summarized in the table below.

## API standards <a href="#_heading-h.3o7alnk" id="_heading-h.3o7alnk"></a>

* The microservice interfaces are defined as per [OPENAPI Ver3.0 standards](https://swagger.io/specification/).&#x20;
* For implementation purposes, it is suggested to refer [TMF630\_REST\_API\_Design\_Guidelines](https://www.tmforum.org/resources/standard/tmf630-rest-api-design-guidelines-4-2-0/).

## &#x20;Summary of Scheduler microservices

In common for all microservices of the Scheduler Building Block, the API expects the calling application has already authenticated the user's functional ID and sent it as part of the service request from the calling application. For detailed specifications of APIs with input/output formats please refer to API specifications defined in YAML in the corresponding GitHub repository.

#### Service Group: Entity management&#x20;

| Endpoint                  | Inputs                            | Returns                                                        | Description                                                                                                                                            |
| ------------------------- | --------------------------------- | -------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Post:/entity/new          | \[entity Details]                 | Error code or success code with unique ID of registered entity | Enables registering a new entity.                                                                                                                      |
| Delete:/entity/new        | \[entity id]                      | Error code or success code                                     | Removes entity from the entity list and event list.                                                                                                    |
| Put:/entity/modifications | filter\[fields],\[details]        | Error code or success code                                     | Will overwrite values of specified Details only if there is a new value specified in the input. Will not change details where there is no input value. |
| Get:/entity/list\_details | filter\[fields],\[details needed] | Error code or success code with details of matching entities   | Fetches the details of all entities that match the given filtering input fields and values].                                                           |

#### Service Group: Resource Management

| Endpoint                    | Inputs                                                         | Returns                                                           | Description                                                                                                                                            |
| --------------------------- | -------------------------------------------------------------- | ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Post:/resource/new          | \[Resource Details]                                            | Error code or success code with unique ID of registered Resource  | Enables registering a new Resource. A resource MUST be affiliated to atleast one entity .                                                              |
| Put:/resource/modifications | filter\[fields],\[details ]                                    | Error code or success code                                        | Will overwrite values of specified Details only if there is a new value specified in the input. Will not change details where there is no input value. |
| Get:/resource/list\_details | filter\[fields],\[details needed]                              | Error code or success code with details of matching Resources     | Fetches the details of all Resource that match the given filtering input fields and values].                                                           |
| Delete:/resource            | \[Resource\_id]                                                | Error code or success code                                        | Removes the given Resource from Resource List and all dependent tables that bind to an event, such as events, subscribers and alerts.                  |
| Get:/Resource/Availability  | \[Entity\_Id,(Resource Category or id\_list),  datetime range] | Error code or success code with list of available free resources  | Returns unallocated date time zones within a given datetime range of resources by given category or IDs.                                               |

#### Service Group: Subscriber management

| Endpoint                       | Inputs                            | Returns                                                             | Description                                                                                                                                            |
| ------------------------------ | --------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Post:/Subscriber/new           | \[Subscriber Details]             | Error code or success code with unique ID of registered Subscriber  | Enables registering a new Resource.                                                                                                                    |
| Put:/Subscriber /modifications | filter\[fields],\[details ]       | Error code or success code                                          | Will overwrite values of specified Details only if there is a new value specified in the input. Will not change details where there is no input value. |
| Get:/Subscriber /list\_details | filter\[fields],\[details needed] | Error code or success code with details of matching Subscribers     | Fetches the details of all Resource that match the given filtering input fields and values].                                                           |
| Delete:/Subscriber             | Subscriber                        | Error code or success code                                          | Removes the given subscriber from subscriber List and from events having this subscriber.                                                              |

#### Service Group: Event Management

| Endpoint                     | Inputs                                          | Returns                                                        | Description                                                                                                                                            |
| ---------------------------- | ----------------------------------------------- | -------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Post:/event/new              | \[entity Details]                               | Error code or success code with unique ID of registered entity | Enables registering a new entity.                                                                                                                      |
| Put:/event/modifications     | filter\[fields],\[details ]                     | Error code or success code                                     | Will overwrite values of specified Details only if there is a new value specified in the input. Will not change details where there is no input value. |
| Get:/event/list\_details     | filter\[fields],\[details needed]               | Error code or success code with details of matching entities   | Fetches the details of all entities that match the given filtering input fields and values].                                                           |
| Delete:/event                | Event\_Id                                       | Error code or success code                                     | Removes the given event from Event List and all dependent tables that bind to an event, such as resources, subscribers and alerts.                     |
| Post:/event/new\_appointment | \[eventid,participant\_type, participant\_id]   | Error code or success code with appointment id                 | Adds new participant resource or subscriber to a given event if it is still open.                                                                      |
| Delete:/event/appointment    | \[event\_id, participant\_type participant\_id] | Error code or success code                                     | Removes the participant from event in which it is enrolled.                                                                                            |

**Service Group: Alert Management:**

| Endpoint                           | Inputs                            | Returns                                                                | Description                                                                                                                                            |
| ---------------------------------- | --------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Post:/message/new                  | \[message details]                | Error code or success code with unique ID of registered Alert Template | Enables registering a new message. and returns its id.                                                                                                 |
| Put:/message/modifications         | filter\[fields],\[details ]       | Error code or success code                                             | Will overwrite values of specified Details only if there is a new value specified in the input. Will not change details where there is no input value. |
| Get:/message/list\_details         | filter\[fields],\[details needed] | Error code or success code with details of matching message            | Fetches the details of all messages that match the given filtering input fields and values].                                                           |
| Delete:/message                    | message\_id                       | Error code or success code                                             | removes the given message from message List and all dependent tables that bind to an alert List.                                                       |
| Post:/Alert\_Schedule/new          | \[Alert\_Schedule Details]        | Error code or success code with unique Id of new alert schedule        | Enables registering a new Alert\_schedule within the context of a specific event. and returns its ID.                                                  |
| Delete:/Alert\_Schedule            | Alert\_Schedule\_Id               | Error code or success code                                             | Removes the given Alert\_Schedule from Alert list.                                                                                                     |
| Get:/Alert\_Template/list\_details | filter\[fields],\[details needed] | Error code or success code with details of matching Alert Schedules    | fetches the details of all Alert\_Schedules that match the given filtering input fields and values].                                                   |
| Put:/message/modifications         | filter\[fields],\[details ]       | Error code or success code with details of matching message            | Will overwrite values of specified Details only if there is a new value specified in the input. will not change details where there is no input value. |

#### &#x20;Service Group: Logging and Reporting

| Endpoint               | Inputs                     | Returns                                                  | Description                                                                                            |
| ---------------------- | -------------------------- | -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| Get:/Log/List\_details | filter\[fields],\[details] | Error code or success code with details of matching Logs | Fetches the details of all Logged information that match the given filtering input fields and values]. |
| Put:/Log/new           | \[log details]             | Error code or success code                               | Adds new log to log list with date time stamp                                                          |

## Scheduler Building Block APIs

{% swagger src=".gitbook/assets/psramkumar-govstack-scheduler_api-1.0.0-resolved.json" path="/event/new" method="post" %}
[psramkumar-govstack-scheduler_api-1.0.0-resolved.json](.gitbook/assets/psramkumar-govstack-scheduler_api-1.0.0-resolved.json)
{% endswagger %}

{% swagger src=".gitbook/assets/psramkumar-govstack-scheduler_api-1.0.0-resolved.json" path="/event/new_appointment" method="post" %}
[psramkumar-govstack-scheduler_api-1.0.0-resolved.json](.gitbook/assets/psramkumar-govstack-scheduler_api-1.0.0-resolved.json)
{% endswagger %}

{% swagger src=".gitbook/assets/psramkumar-govstack-scheduler_api-1.0.0-resolved.json" path="/event/modifications" method="put" %}
[psramkumar-govstack-scheduler_api-1.0.0-resolved.json](.gitbook/assets/psramkumar-govstack-scheduler_api-1.0.0-resolved.json)
{% endswagger %}

{% swagger src=".gitbook/assets/psramkumar-govstack-scheduler_api-1.0.0-resolved.json" path="/event" method="delete" %}
[psramkumar-govstack-scheduler_api-1.0.0-resolved.json](.gitbook/assets/psramkumar-govstack-scheduler_api-1.0.0-resolved.json)
{% endswagger %}

{% swagger src=".gitbook/assets/psramkumar-govstack-scheduler_api-1.0.0-resolved.json" path="/event/appointment" method="delete" %}
[psramkumar-govstack-scheduler_api-1.0.0-resolved.json](.gitbook/assets/psramkumar-govstack-scheduler_api-1.0.0-resolved.json)
{% endswagger %}

{% swagger src=".gitbook/assets/psramkumar-govstack-scheduler_api-1.0.0-resolved.json" path="/event/list_details" method="get" %}
[psramkumar-govstack-scheduler_api-1.0.0-resolved.json](.gitbook/assets/psramkumar-govstack-scheduler_api-1.0.0-resolved.json)
{% endswagger %}

Detailed API schemas written in YAML that define REST API endpoints for each of the services mentioned above are available on GitHub located at

[https://github.com/GovStackWorkingGroup/bb-scheduler/blob/d205b40edb0bf3ffb33de57b3b90d774e2fb9616/api/govstack-scheduler\_api-1.0.0-resolved.json](https://github.com/GovStackWorkingGroup/bb-scheduler/blob/d205b40edb0bf3ffb33de57b3b90d774e2fb9616/api/govstack-scheduler\_api-1.0.0-resolved.json)
