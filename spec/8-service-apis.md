---
description: >-
  This section provides a reference for APIs that should be implemented by this
  Building Block.
---

# 8 Service APIs

A Set of microservices are defined to receive requests from other GovStack-compatible Building Blocks and applications with relevant inputs and return processed results from key digital functionalities of this Building Block. This section provides a reference for APIs that should be implemented by this Building Block. The APIs defined here establish a blueprint for how the Building Block will interact with other Building Blocks. Additional APIs may be implemented by the Building Block, but the listed APIs define a minimal set of functionality that should be provided by any implementation of this Building Block.

Scheduler must expose its microservices through RESTful API interfaces as defined by OpenAPI v3+ standards. The Scheduler must have any response data payload it returns through its API only in the form of JSON formatted datasets. A summary of the APIS exposed by this Building Block is summarized in the table below. The Scheduler Building Block can be used also as an internal sub-block of another Building Block. In such a case the same services APIs will be used to embed the Scheduler Building Block (without having to pass through the Information Mediator).

The [GovStack non-functional requirements document](https://govstack.gitbook.io/specification/v/1.0/architecture-and-nonfunctional-requirements/6-onboarding) provides additional information on how 'adaptors' may be used to translate an existing API to the patterns described here.

### 8.1 Event Management

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/event/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/event/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/event" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/event/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

### 8.2 Entity Management

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/entity/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/entity/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/entity" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/entity/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

### 8.3 Alert Schedule Management

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/alert_schedule/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/alert_schedule/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/alert_schedule" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/alert_schedule/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

### 8.4 Alert Message Management

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/message/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/message/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/message" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/message/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

### 8.5 Resource management

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/resource/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/resource/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/resource" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/resource/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/resource/availability" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

### 8.6 Subscriber management

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/subscriber/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/subscriber/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/subscriber" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/subscriber/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

### 8.7 Affiliation management

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/affiliation/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/affiliation/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/affiliation" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/affiliation/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

### 8.8 Appointment management

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/appointment/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/appointment/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/appointment" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/appointment/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

### 8.9 Status Logging and Reporting

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/log/new" method="post" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/log/modifications" method="put" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/log" method="delete" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

{% swagger src="https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json" path="/log/list_details" method="get" %}
[https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json](https://raw.githubusercontent.com/GovStackWorkingGroup/bb-scheduler/main/api/Govstack_scheduler_BB_APIs.json)
{% endswagger %}

## **4.10 Information Mediator Interface**&#x20;

This Services APIs is not yet specified, but it should be the purpose of a next iteration of the Scheduler Building Block Specification.

## **4.11 PubSub Interface**&#x20;

This Services APIs is not yet specified, but it should be the purpose of a next iteration of the Scheduler Building Block Specification.

## **4.12 Messaging interface**&#x20;

This Services APIs is not yet specified, but it should be the purpose of a next iteration of the Scheduler Building Block Specification.

## **4.13 Scheduler Administration**&#x20;

This Services APIs is not yet specified, but it should be the purpose of a next iteration of the Scheduler Building Block Specification.

## API standards <a href="#_heading-h.3o7alnk" id="_heading-h.3o7alnk"></a>

* The microservice interfaces are defined as per [OPENAPI Ver3.0 standards](https://swagger.io/specification/).
* For implementation purposes, it is suggested to refer [TMF630\_REST\_API\_Design\_Guidelines](https://www.tmforum.org/resources/standard/tmf630-rest-api-design-guidelines-4-2-0/).
