.. include:: _globals

.. _userjourney:


Typical user journey
====================


Administrator
~~~~~~~~~~~~~

The role of an administrator in Bitcaster is to:

1. configure one or more :ref:`Application`.
2. select which of the :ref:`Channel` to make available in the application
3. define :ref:`Events<event>` and :ref:`authorization keys<key>` to receive from :ref:`Remote_System`
4. create :ref:`Message Templates<messagetemplate>` for each :ref:`Channel` the :ref:`Event` must be dispatched through
5. Invite :ref:`Subscriber` to the

Regular user
~~~~~~~~~~~~

A Bitcaster user will be receiving an invitation to become member of a :ref:`Application` peliminarily configured in
Bitcaster by an administrator.


Bitcaster will send a :ref:`Message` for any :ref:`Subscriber` over the :ref:`Subscriber` preferred :ref:`Channel`.
The message content will be formatted based on the :ref:`messagetemplate` available for the :ref:`Channel`
