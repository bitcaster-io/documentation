.. include:: _globals

.. _userjourney:


Typical user journey
====================


Administrator
~~~~~~~~~~~~~

The role of an administrator in Bitcaster is to:

1. configure one or more :ref:`Application`\s.
2. select which of the :ref:`Channel` to make available in the application
3. define :ref:`Event`\s and authorization keys to receive from :ref:`Remote System`\s
4. create :ref:`messagetemplate`\s for each :ref:`Channel` the :ref:`Event`\s must be dispatched through
5. Invite :ref:`Subscriber`\s to the

Regular user
~~~~~~~~~~~~

A Bitcaster user will be receiving an invitation to become member of a :ref:`Application` peliminarily configured in
Bitcaster by an administrator.


Bitcaster will send a :ref:`Message` for any :ref:`Subscriber` over the :ref:`Subscriber` preferred :ref:`Channel`.
The message content will be formatted based on the :ref:`messagetemplate` available for the :ref:`Channel`
