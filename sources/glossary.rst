.. include:: _globals

.. _glossary:

Glossary
========


.. _address:

Address
-------

An address in Bitcaster is any potential destination for the :ref:`Message`



.. _agent:

Agent
-----

Bitcaster component than contains the logic to poll an external system and trigger specific event based on
its configuration


.. _application:

Application
-----------

The Bitcaster is an organisational unit where to register a set of :ref:`Event`\s that will be notified by
:ref:`remote_system`\s. Such :ref:`Event`\s will be then dispatched to :ref:`Subscriber`\s along the
:ref:`Subscriber`'s preferred :ref:`Channel`.

.. _assignment:

Assignment
----------


.. _channel:

Channel
-------

A channel represent a way that :ref:`Application` can use to propagate their :ref:`Event`


.. _dispatcher:

Dispatcher
----------

A dispatcher is the software component that provide support for a specific :ref:`Channel`.
Bitcaster comes out-of-box with a set of :ref:`Dispatchers`.
A plugin mechanism ensure the number of dispatcher is virtually limitless.


.. _event:

Event
-----

An event represent a notification received by esternal System/Application.
When remote system notify an event to Bitcaster it is forwared to the `subscriber`_ using their
preferred `channel`_

.. _key:

Key
---

Unique token used by :ref:`remote_system` to trigger an `event`_.
Each key is authorized to trigger only specific events.


.. _membership:

Membership
----------

.. _message:

Message
-------

.. _messagetemplate:

Message Template
----------------

.. _monitor:

Monitor
-------

Bitcaster has the capability of checking for events on some 3rd parties by using a
software component named Monitor.

.. _organization:

Organization
------------

Organization is the primary subject in Bitcaster, it refers to your Company or Community,
it is where all the Bitcaster users belogn to.



.. _plugin:

Plugin
------

A software component that can be deployed that can extend capabilities of Bitcaster.
It can be an implememtation of an :ref:`Agent` or :ref:`Dispatcher`


.. _Remote_System:

Remote System
-------------

A remote system is any third party system/application/script that is authorized to trigger :ref:`Event` in
Bitcaster. It is usually mapped into Bitcaster using a single :ref:`Application`


.. _role:

Role
----

Bitcaster assigns to  each member a specific role.

    - Superuser
    - Owner
    - Admin
    - Subscriber

See :ref:`security` for detailed informations about roles.



.. _subscriber:

Subscriber
----------

A `user`_ subscribed to an `event`_ using his preferred `channel`_

.. _team:


Team
----

A Team is a group of `user`_ inside a specific `application`_



.. _user:


User
----
