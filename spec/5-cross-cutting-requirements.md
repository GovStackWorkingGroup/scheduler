---
description: >-
  This section will highlight important requirements or describe any additional
  cross-cutting requirements that apply to this Building Block.
---

# 5 Cross-Cutting Requirements

The Cross-cutting requirements described in this section are an extension of the cross-cutting requirements defined in the architecture specification document. This section will describe any additional cross-cutting requirements that apply to this Building Block. Cross-cutting requirements will use the same language (MUST or SHOULD) as specified in the architecture document and Security Building Block documents.

## Exceptions to Architectural Cross-Cutting Specifications

* SQL/NoSQL databases: Local factors (cost, convenience, existing Databases, skillsets, suitability of data structures, etc.) of a given target demography will influence this decision.  In practical settings, such factors may lead to an implementation time decision of appropriate databases. From GovStack's point of view, the Scheduler Building Block needs to be agnostic to the type of database implementation and allow flexible choice.
* Use of stored procedures: Several mundane localized operations on data such as searching, filtering, and format transformations may find a better performance by being collocated with the database itself in form of stored procedures in typical SQL databases. Such procedures must be configured to handle the concurrent processing of multiple requests, with an appropriate mechanism(e.g. SQL agents/SSIS packages/service brokers/etc.). Since data is collocated with the code, when scaled up to clusters of multiple instances of database servers, each instance will utilize local Safeguard for Privileged Sessions.  However, this will create an additional burden on maintenance and update of source code as applications may have part of logic in backend code and partially embedded in database servers. To host complex queries related to data from different databases it is recommended to implement it in business logic rather than stored procedures.  In this case, scalability must be ensured by suitable application infrastructure scaling mechanisms such as Virtual Machine-level scaling and automatic elastic frameworks.

### Exceptions to privacy and security considerations mentioned in the security Building Block specifications

* None.

### Source code considerations

* Since Scheduler provides time-based triggering of various Building Blocks/Applications, the Scheduler Building Block may use pre-compiled code in the microservices instead of run-time interpreter-based scripted code, to minimize latency in utilizing the time-keeping functions of the underlying operating system.

### Infrastructure considerations <a href="#_heading-h.17dp8vu" id="_heading-h.17dp8vu"></a>

* For mission-critical applications, it is recommended to use Scheduler as an embedded internal block of the target Building Block or application.
* In general, for minimizing internet latency it may be suitable to collocate the scheduler in the same infrastructure hosting other Building Blocks.
* Multiple instances of Scheduler Building Block may be hosted with load balancing in high-concurrency demand.

### Audit considerations <a href="#_heading-h.3rdcrjn" id="_heading-h.3rdcrjn"></a>

* Building Block must provide internal functionality to log and report indicators (such as latency, traffic density, queue depth, system resource consumption, service exceptions, and failures, etc.) provisioning and maintaining adequate Quality of Service (QOS).
* Building Block must provide internal functionality to configure rules to monitor, detect and notify QOS issues to Administrators.
