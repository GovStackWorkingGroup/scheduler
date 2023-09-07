---
description: >-
  This section will highlight important requirements or describe any additional
  cross-cutting requirements that apply to this Building Block.
---

# 5 Cross-Cutting Requirements

## 5.1 Requirements

The Cross-cutting requirements described in this section are an extension of the cross-cutting requirements defined in the architecture specification document.

### 5.1.1 Source code considerations (RECOMMENDED)

Since Scheduler provides time-based triggering of various Building Blocks/Applications, the Scheduler Building Block may use pre-compiled code in the microservices instead of run-time interpreter-based scripted code, to minimize latency in utilizing the time-keeping functions of the underlying operating system.

### 5.1.2 Infrastructure considerations (RECOMMENDED) <a href="#_heading-h.17dp8vu" id="_heading-h.17dp8vu"></a>

For mission-critical applications, it is recommended to use Scheduler as an embedded internal block of the target Building Block or application. In general, for minimizing internet latency it may be suitable to collocate the scheduler in the same infrastructure hosting other Building Blocks. Multiple instances of Scheduler Building Block may be hosted with load balancing in high-concurrency demand.

### 5.1.3 Audit considerations (REQUIRED) <a href="#_heading-h.3rdcrjn" id="_heading-h.3rdcrjn"></a>

Building Block must provide internal functionality to log and report indicators (such as latency, traffic density, queue depth, system resource consumption, service exceptions, and failures, etc.) provisioning and maintaining adequate Quality of Service (QOS). Building Block must provide internal functionality to configure rules to monitor, detect and notify QOS issues to Administrators.

### 5.1.4 Service caller authentication (REQUIRED) <a href="#_heading-h.3rdcrjn" id="_heading-h.3rdcrjn"></a>

In all service calls to the Scheduler Building Block, the requestor's token (maybe  JWT containing requestor's authentication and requesting application ID) will be published along with the payload of the request, as a security requirement. The BB must be able to independently verify the token with a central IAM server to make sure the service call is from an authenticated user and from an authenticated Application within Govstack.

## 5.2 Exceptions to Architectural Cross-Cutting Specifications

#### 5.2.1 SQL/NoSQL databases

Local factors (cost, convenience, existing Databases, skillsets, suitability of data structures, etc.) of a given target demography will influence this decision. In practical settings, such factors may lead to an implementation time decision of appropriate databases. From GovStack's point of view, the Scheduler Building Block needs to be agnostic to the type of database implementation and allow flexible choice.

#### 5.2.2 Use of stored procedures&#x20;

Several mundane localized operations on data such as searching, filtering, and format transformations may find a better performance by being collocated with the database itself in the form of stored procedures in typical SQL databases. Such procedures must be configured to handle the concurrent processing of multiple requests, with an appropriate mechanism (e.g. SQL agents/SSIS packages/service brokers/etc.). Since data is collocated with the code, when scaled up to clusters of multiple instances of database servers, each instance will utilize local Safeguard for Privileged Sessions. However, this will create an additional burden on maintenance and update of source code as applications may have part of logic in backend code and partially embedded in database servers. To host complex queries related to data from different databases it is recommended to implement it in business logic rather than stored procedures. In this case, scalability must be ensured by suitable application infrastructure scaling mechanisms such as Virtual Machine-level scaling and automatic elastic frameworks.

## 5.3 Standards

The following standards are applicable to data structures in the Scheduler Building Block:

Typical data structure requirements and format representations relevant to this Building Block have been [TMF646\_Appointment\_API\_Specification\_R19.0.0\_fixed](https://es.scribd.com/document/448516776/TMF646-Appointment-API-Specification-R19-0-0-Fixed). However, the schema and data elements are optimized for minimizing footprint and external dependencies, given that this Building Block handles time-critical alerts. The common minimum datasets have been described in the schema and the table in the Data Structures Section.
