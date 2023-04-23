---
description: This section provides context for this Building Block.
---

# 2 Description

Digital governance may employ common software components (Building Blocks) to automate heterogeneous software applications. Different activities of such components may be triggered based on a specific epoch (date-time) in order to orchestrate a sequence of steps within an automated workflow. Instead of replicating the logic needed by each component to schedule, track, trigger and coordinate its activities with other building blocks and applications the "Scheduler" Building Block enables aggregated coordination of time-driven activities within and across Building Blocks by sending appropriate "alert" messages to appropriate Building Blocks according to a predefined schedule.

Each event is identified by an ID field and has a specific name, date, time, and duration. An event may empanel multiple resources (personnel, facilities, equipment, etc.) from different entities to perform various activities. An event may also enrol subscribers to benefit from activities of the event. The Scheduler may have to alert (trigger) specific resources and subscribers at specific times before, during, and after the event. With specific messages in order to carry out respective activities. The Scheduler Building Block contains various functionalities necessary to enable planning, booking, tracking, triggering, notifying, and status reporting needs of multiple events. It hosts several micro-services that orchestrate these functionalities, exposed through RESTful APIs. This Building Block can be used for scheduling events in a wide variety of applications and use cases such as:

**Health sector**

• Booking appointments with service providers for consultation, therapy, tests, etc.

• Planning and tracking prescribed activities for medication, diet, or exercises.

• Acquiring periodic reports from medical monitoring devices.

**eCommerce Sector**

• Shipment planning and tracking in supply chain management.

• Announcements for public awareness and programs.

• Maintenance checks for equipment.

**Agriculture sector**

• Custom planning for agricultural activity such as seeding, harvesting, etc., involving agro-machinery and skilled labor force.

• Planning and booking of third-party services such as machinery maintenance, transportation, etc.

**Education sector**

• Scheduling classes, exams, official meetings, seminars, etc.

• Scheduled events as deadline-based submission of assignments, reports, etc.
