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

In common for all microservices of the Scheduler Building Block, the API expects the calling application has already authenticated the user's functional ID and sent it as part of the service request from the calling application. Listed below are various servic apis grouped according to the Key digital functionalities that they help orchastrate. Also an interactive graphical representation of the APIs and underlying datasets exchanged are shown below the tables. However for detailed API schemas written in JSON that define REST API endpoints for each of the services mentioned above are available on GitHub located at

{% embed url="https://github.com/GovStackWorkingGroup/bb-scheduler/blob/f25360e34ba029cc8c68d1f6cd752da30e06928a/api/psramkumar-govstack-scheduler_api-1.0.0-resolved.json" %}

### Service Group: Event management&#x20;

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/event/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/event/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/event" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/event/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

### Service Group: Appointment management&#x20;

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/appointment/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/appointment/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/appointment" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/appointment/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

### Service Group: Entity management

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/entity/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/entity/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/entity" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/entity/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

### Service Group: Resource management&#x20;

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/resource/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/resource/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/resource" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/resource/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/resource/availability" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

### Service Group: Subscriber management

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/subscriber/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/subscriber/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/subscriber" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/subscriber/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

### &#x20;Service Group: Alert Message management&#x20;

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/message/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/message/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/message" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/message/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

### Service Group: Affiliation management&#x20;

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/affiliation/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/affiliation/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/affiliation" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/affiliation/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

### Service Group: Alert Schedule management&#x20;

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/alert_schedule/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/alert_schedule/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/alert_schedule" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/alert_schedule/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

### Service Group: Log management&#x20;

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/log/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/log/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/log" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json" path="/log/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack-scheduler-building_block-apis.json)
{% endswagger %}
