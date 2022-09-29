# 5 Cross-Cutting Requirements

The Cross-cutting requirements described in this section are an extension of the cross-cutting requirements defined in the architecture specification document. This section will describe any additional cross-cutting requirements that apply to this building block. Cross-cutting requirements will use the same language (MUST or SHOULD) as specified in the architecture document and Security Building Block documents.

## Exceptions to Architectural cross cutting specs:

* Sql/Nosql databases: Local factors (cost, convenience, existing DBs, skillsets, suitability of data structures, etc.) of a given target demography will influence this decision.  In practical settings such factors may lead to an implementation time decision of appropriate data bases. From Govstack point of view, the Scheduler BB need to be agnostic to the type of database implementation and allow flexible choice.
* Use of stored procedures: Several mundane localized operations on data such as searching, filtering and format transformations may find better performance by being collocated with the database itself in form of stored procedures in typical SQL databases. Such procedures must be  configured to handle concurrent processing of multiple requests, with an appropriate mechanism(e.g ,sql agents/ssis packages/service brokers/etc.). Since data is collocated with the code, when scaled up to clusters of multiple instances of db servers, each instance will utilize local SPs.  \[1] \[2] \[3] \[4] However, this will create an additional burden on maintenance and update of source code as applications may have part of logic in backend code and part embedded in db servers. To host complex queries related to data from different databases it is recommended to implement it in business logic rather than stored procedures.  In this case\[5] \[6] \[7] \[8]  scalability must be ensured by a suitable application infrastructure scaling mechanisms such as VM level scaling and  automatic elastic frameworks.

### Exceptions to Privacy and Security considerations mentioned in security BB specs:

* None

### Source Code considerations:

* Since Scheduler provides time-based triggering of various BBs/Applications, the Scheduler BB may use pre-compiled code in the microservices instead of run-time interpreter based scripted code, to minimize latency in utilizing the time-keeping functions of the underlying OS.

### Infrastructure considerations: <a href="#_heading-h.17dp8vu" id="_heading-h.17dp8vu"></a>

* For mission critical applications it is recommended to use scheduler as an embedded internal block of the target BB or application
* In general, for minimizing internet latency it may be suitable to collocate the scheduler in the same infrastructure hosting other BBs
* Multiple instances of scheduler BB may be hosted with load balancing in high concurrency demand

### Audit Considerations: <a href="#_heading-h.3rdcrjn" id="_heading-h.3rdcrjn"></a>

* BB must provide internal functionality to log and report indicators (such as latency, traffic density, queue depth, system resource consumption, service exceptions and failures, etc.) provisioning and maintaining adequate QOS.
* BB must provide internal functionality to configure rules to monitor, detect and notify QOS issues to Administrators
