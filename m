Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF620C433F5
	for <linux-doc@archiver.kernel.org>; Sun, 13 Mar 2022 11:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbiCMLDo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 13 Mar 2022 07:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbiCMLDo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 13 Mar 2022 07:03:44 -0400
Received: from ceres.rohieb.name (ceres.rohieb.name [46.38.232.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 923351AAA65
        for <linux-doc@vger.kernel.org>; Sun, 13 Mar 2022 04:02:35 -0700 (PDT)
Received: from glados.home.rohieb.name (p4ff9fcb6.dip0.t-ipconnect.de [79.249.252.182])
        by ceres.rohieb.name (Postfix) with ESMTPSA id C1C6C1002C9;
        Sun, 13 Mar 2022 11:56:17 +0100 (CET)
Received: by glados.home.rohieb.name (sSMTP sendmail emulation); Sun, 13 Mar 2022 11:56:17 +0100
From:   Roland Hieber <rhi@pengutronix.de>
To:     Jonathan Corbet <corbet@lwn.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Daniel Bristot de Oliveira <bristot@kernel.org>
Cc:     linux-doc@vger.kernel.org, Roland Hieber <rhi@pengutronix.de>
Subject: [PATCH 3/3] docs: trace: events: apply literal markup
Date:   Sun, 13 Mar 2022 11:55:57 +0100
Message-Id: <20220313105557.172732-3-rhi@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220313105557.172732-1-rhi@pengutronix.de>
References: <20220313105557.172732-1-rhi@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The document can be easier readable if not everything is in 'quotes',
but sometimes also in fixed-width font.

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
PATCH v2:
* new in v2

 Documentation/trace/events.rst | 298 ++++++++++++++++-----------------
 1 file changed, 149 insertions(+), 149 deletions(-)

diff --git a/Documentation/trace/events.rst b/Documentation/trace/events.rst
index 0d4f8f63236f..f4bbc4f7c115 100644
--- a/Documentation/trace/events.rst
+++ b/Documentation/trace/events.rst
@@ -22,25 +22,25 @@ Using Event Tracing
 
 .. _tracing_set_event_interface:
 
-Via the 'set_event' interface
------------------------------
+Via the ``set_event`` interface
+-------------------------------
 
 The events which are available for tracing can be found in the file
-/sys/kernel/debug/tracing/available_events.
+``/sys/kernel/debug/tracing/available_events``.
 
-To enable a particular event, such as 'sched_wakeup', simply echo it
-to /sys/kernel/debug/tracing/set_event. For example::
+To enable a particular event, such as ``sched_wakeup``, simply echo it
+to ``/sys/kernel/debug/tracing/set_event``. For example::
 
 	# echo sched_wakeup >> /sys/kernel/debug/tracing/set_event
 
-.. Note:: '>>' is necessary, otherwise it will firstly disable all the events.
+.. Note:: ``>>`` is necessary, otherwise it will firstly disable all the events.
 
 To disable an event, echo the event name to the set_event file prefixed
 with an exclamation point::
 
 	# echo '!sched_wakeup' >> /sys/kernel/debug/tracing/set_event
 
-To disable all events, echo an empty line to the set_event file::
+To disable all events, echo an empty line to the ``set_event`` file::
 
 	# echo > /sys/kernel/debug/tracing/set_event
 
@@ -49,7 +49,7 @@ To enable all events, echo ``*:*`` or ``*:`` to the set_event file::
 	# echo *:* > /sys/kernel/debug/tracing/set_event
 
 The events are organized into subsystems, such as ext4, irq, sched,
-etc., and a full event name looks like this: <subsystem>:<event>.  The
+etc., and a full event name looks like this: ``<subsystem>:<event>``.  The
 subsystem name is optional, but it is displayed in the available_events
 file.  All of the events in a subsystem can be specified via the syntax
 ``<subsystem>:*``; for example, to enable all irq events, you can use the
@@ -57,13 +57,13 @@ command::
 
 	# echo 'irq:*' > /sys/kernel/debug/tracing/set_event
 
-Via the 'enable' toggle
------------------------
+Via the ``enable`` toggle
+-------------------------
 
-The events available are also listed in /sys/kernel/debug/tracing/events/ hierarchy
+The events available are also listed in the ``/sys/kernel/debug/tracing/events/`` hierarchy
 of directories.
 
-To enable event 'sched_wakeup'::
+To enable event ``sched_wakeup``::
 
 	# echo 1 > /sys/kernel/debug/tracing/events/sched/sched_wakeup/enable
 
@@ -106,7 +106,7 @@ See The example provided in samples/trace_events
 Event formats
 =============
 
-Each trace event has a 'format' file associated with it that contains
+Each trace event has a ``format`` file associated with it that contains
 a description of each field in a logged event.  This information can
 be used to parse the binary trace stream, and is also the place to
 find the field names that can be used in :ref:`event filters <tracing_event_filters>`.
@@ -127,7 +127,7 @@ Each field in the format has the form::
 where offset is the offset of the field in the trace record and size
 is the size of the data item, in bytes.
 
-For example, here's the information displayed for the 'sched_wakeup'
+For example, here's the information displayed for the ``sched_wakeup``
 event::
 
 	# cat /sys/kernel/debug/tracing/events/sched/sched_wakeup/format
@@ -152,7 +152,7 @@ event::
 
 This event contains 10 fields, the first 5 common and the remaining 5
 event-specific.  All the fields for this event are numeric, except for
-'comm' which is a string, a distinction important for event filtering.
+``comm`` which is a string, a distinction important for event filtering.
 
 .. _tracing_event_filters:
 
@@ -172,7 +172,7 @@ Expression syntax
 -----------------
 
 A filter expression consists of one or more 'predicates' that can be
-combined using the logical operators '&&' and '||'.  A predicate is
+combined using the logical operators ``&&`` and ``||``.  A predicate is
 simply a clause that compares the value of a field contained within a
 logged event with a constant value and returns either 0 or 1 depending
 on whether the field value matched (1) or didn't match (0)::
@@ -184,20 +184,20 @@ double-quotes can be used to prevent the shell from interpreting
 operators as shell metacharacters.
 
 The field-names available for use in filters can be found in the
-'format' files for trace events (see :ref:`tracing_event_filters`).
+``format`` files for trace events (see :ref:`tracing_event_filters`).
 
 The relational-operators depend on the type of the field being tested:
 
-The operators available for numeric fields are:
+The operators available for numeric fields are::
 
-==, !=, <, <=, >, >=, &
+  ==, !=, <, <=, >, >=, &
 
-And for string fields they are:
+And for string fields they are::
 
-==, !=, ~
+  ==, !=, ~
 
-The glob (~) accepts a wild card character (\*,?) and character classes
-([). For example::
+The glob (``~``) accepts a wild card character (``*``, ``?``) and character classes
+(``[``). For example::
 
   prev_comm ~ "*sh"
   prev_comm ~ "sh*"
@@ -217,7 +217,7 @@ Setting filters
 ---------------
 
 A filter for an individual event is set by writing a filter expression
-to the 'filter' file for the given event.
+to the ``filter`` file for the given event.
 
 For example::
 
@@ -241,7 +241,7 @@ an error message can be seen by looking at the filter e.g.::
 	^
 	parse_error: Field not found
 
-Currently the caret ('^') for an error always appears at the beginning of
+Currently the caret (``^``) for an error always appears at the beginning of
 the filter string; the error message should still be useful though
 even without more accurate position info.
 
@@ -258,10 +258,10 @@ string compare will be treated as not matching.
 Clearing filters
 ----------------
 
-To clear the filter for an event, write a '0' to the event's filter
+To clear the filter for an event, write a ``0`` to the event's filter
 file.
 
-To clear the filters for all events in a subsystem, write a '0' to the
+To clear the filters for all events in a subsystem, write a ``0`` to the
 subsystem's filter file.
 
 Subsystem filters
@@ -301,7 +301,7 @@ subsystem (all events end up with the same filter)::
 	common_pid == 0
 
 Attempt to set a filter using a non-common field for all events in the
-sched subsystem (all events but those that have a prev_pid field retain
+sched subsystem (all events but those that have a ``prev_pid`` field retain
 their old filters)::
 
 	# cd /sys/kernel/debug/tracing/events/sched
@@ -314,9 +314,9 @@ their old filters)::
 PID filtering
 -------------
 
-The set_event_pid file in the same directory as the top events directory
+The ``set_event_pid`` file in the same directory as the top events directory
 exists, will filter all events from tracing any task that does not have the
-PID listed in the set_event_pid file.
+PID listed in the ``set_event_pid`` file.
 ::
 
 	# cd /sys/kernel/debug/tracing
@@ -325,7 +325,7 @@ PID listed in the set_event_pid file.
 
 Will only trace events for the current task.
 
-To add more PIDs without losing the PIDs already included, use '>>'.
+To add more PIDs without losing the PIDs already included, use ``>>``.
 ::
 
 	# echo 123 244 1 >> set_event_pid
@@ -347,7 +347,7 @@ be invoked if the event being invoked passes the associated filter.
 If no filter is associated with the trigger, it always passes.
 
 Triggers are added to and removed from a particular event by writing
-trigger expressions to the 'trigger' file for the given event.
+trigger expressions to the ``trigger`` file for the given event.
 
 A given event can have any number of triggers associated with it,
 subject to any restrictions that individual commands may have in that
@@ -363,46 +363,46 @@ enabled, and also allows the current event filter implementation to be
 used for conditionally invoking triggers.
 
 The syntax for event triggers is roughly based on the syntax for
-set_ftrace_filter 'ftrace filter commands' (see the section
+``set_ftrace_filter`` ftrace filter commands (see the section
 :ref:`ftrace_filter_commands`), but there are major
 differences and the implementation isn't currently tied to it in any
 way, so beware about making generalizations between the two.
 
 .. Note::
-     Writing into trace_marker (See Documentation/trace/ftrace.rst)
+     Writing into ``trace_marker`` (See Documentation/trace/ftrace.rst)
      can also enable triggers that are written into
-     /sys/kernel/tracing/events/ftrace/print/trigger
+     ``/sys/kernel/tracing/events/ftrace/print/trigger``.
 
 Expression syntax
 -----------------
 
-Triggers are added by echoing the command to the 'trigger' file::
+Triggers are added by echoing the command to the ``trigger`` file::
 
   # echo 'command[:count] [if filter]' > trigger
 
-Triggers are removed by echoing the same command but starting with '!'
-to the 'trigger' file::
+Triggers are removed by echoing the same command but starting with ``!``
+to the ``trigger`` file::
 
   # echo '!command[:count] [if filter]' > trigger
 
 The [if filter] part isn't used in matching commands when removing, so
-leaving that off in a '!' command will accomplish the same thing as
+leaving that off in a ``!`` command will accomplish the same thing as
 having it in.
 
 The filter syntax is the same as that described in the section
 :ref:`tracing_event_filters` above.
 
-For ease of use, writing to the trigger file using '>' currently just
-adds or removes a single trigger and there's no explicit '>>' support
-('>' actually behaves like '>>') or truncation support to remove all
-triggers (you have to use '!' for each one added.)
+For ease of use, writing to the trigger file using ``>`` currently just
+adds or removes a single trigger and there's no explicit ``>>`` support
+(``>`` actually behaves like ``>>``) or truncation support to remove all
+triggers (you have to use ``!`` for each one added.)
 
 Supported trigger commands
 --------------------------
 
 The following commands are supported:
 
-- enable_event/disable_event
+- ``enable_event``/``disable_event``
 
   These commands can enable or disable another trace event whenever
   the triggering event is hit.  When these commands are registered,
@@ -412,7 +412,7 @@ The following commands are supported:
   in effect that can trigger it.
 
   For example, the following trigger causes kmalloc events to be
-  traced when a read system call is entered, and the :1 at the end
+  traced when a read system call is entered, and the ``:1`` at the end
   specifies that this enablement happens only once::
 
 	  # echo 'enable_event:kmem:kmalloc:1' > \
@@ -438,15 +438,15 @@ The following commands are supported:
 	  # echo '!disable_event:kmem:kmalloc' > \
 	      /sys/kernel/debug/tracing/events/syscalls/sys_exit_read/trigger
 
-  Note that there can be any number of enable/disable_event triggers
+  Note that there can be any number of ``enable_event``/``disable_event`` triggers
   per triggering event, but there can only be one trigger per
-  triggered event. e.g. sys_enter_read can have triggers enabling both
-  kmem:kmalloc and sched:sched_switch, but can't have two kmem:kmalloc
-  versions such as kmem:kmalloc and kmem:kmalloc:1 or 'kmem:kmalloc if
-  bytes_req == 256' and 'kmem:kmalloc if bytes_alloc == 256' (they
-  could be combined into a single filter on kmem:kmalloc though).
+  triggered event. e.g. ``sys_enter_read`` can have triggers enabling both
+  ``kmem:kmalloc`` and ``sched:sched_switch``, but can't have two ``kmem:kmalloc``
+  versions such as ``kmem:kmalloc`` and ``kmem:kmalloc:1`` or ``kmem:kmalloc if
+  bytes_req == 256`` and ``kmem:kmalloc if bytes_alloc == 256`` (they
+  could be combined into a single filter on ``kmem:kmalloc`` though).
 
-- stacktrace
+- ``stacktrace``
 
   This command dumps a stacktrace in the trace buffer whenever the
   triggering event occurs.
@@ -481,10 +481,10 @@ The following commands are supported:
 	  # echo '!stacktrace:5' > \
 		/sys/kernel/debug/tracing/events/kmem/kmalloc/trigger
 
-  Note that there can be only one stacktrace trigger per triggering
+  Note that there can be only one ``stacktrace`` trigger per triggering
   event.
 
-- snapshot
+- ``snapshot``
 
   This command causes a snapshot to be triggered whenever the
   triggering event occurs.
@@ -510,10 +510,10 @@ The following commands are supported:
 	  # echo '!snapshot:1 if nr_rq > 1' > \
 		/sys/kernel/debug/tracing/events/block/block_unplug/trigger
 
-  Note that there can be only one snapshot trigger per triggering
+  Note that there can be only one ``snapshot`` trigger per triggering
   event.
 
-- traceon/traceoff
+- ``traceon``/``traceoff``
 
   These commands turn tracing on and off when the specified events are
   hit. The parameter determines how many times the tracing system is
@@ -528,7 +528,7 @@ The following commands are supported:
 	  # echo 'traceoff:1 if nr_rq > 1' > \
 		/sys/kernel/debug/tracing/events/block/block_unplug/trigger
 
-  To always disable tracing when nr_rq  > 1::
+  To always disable tracing when ``nr_rq``  > 1::
 
 	  # echo 'traceoff if nr_rq > 1' > \
 		/sys/kernel/debug/tracing/events/block/block_unplug/trigger
@@ -541,10 +541,10 @@ The following commands are supported:
 	  # echo '!traceoff if nr_rq > 1' > \
 		/sys/kernel/debug/tracing/events/block/block_unplug/trigger
 
-  Note that there can be only one traceon or traceoff trigger per
+  Note that there can be only one ``traceon`` or ``traceoff`` trigger per
   triggering event.
 
-- hist
+- ``hist``
 
   This command aggregates event hits into a hash table keyed on one or
   more trace event format fields (or stacktrace) and a set of running
@@ -592,17 +592,17 @@ Dyamically creating synthetic event definitions
 There are a couple ways to create a new synthetic event from a kernel
 module or other kernel code.
 
-The first creates the event in one step, using synth_event_create().
+The first creates the event in one step, using ``synth_event_create()``.
 In this method, the name of the event to create and an array defining
-the fields is supplied to synth_event_create().  If successful, a
+the fields is supplied to ``synth_event_create()``.  If successful, a
 synthetic event with that name and fields will exist following that
-call.  For example, to create a new "schedtest" synthetic event::
+call.  For example, to create a new ``schedtest`` synthetic event::
 
   ret = synth_event_create("schedtest", sched_fields,
                            ARRAY_SIZE(sched_fields), THIS_MODULE);
 
-The sched_fields param in this example points to an array of struct
-synth_field_desc, each of which describes an event field by type and
+The ``sched_fields`` param in this example points to an array of struct
+``synth_field_desc``, each of which describes an event field by type and
 name::
 
   static struct synth_field_desc sched_fields[] = {
@@ -615,11 +615,11 @@ name::
         { .type = "int",                .name = "my_int_field" },
   };
 
-See synth_field_size() for available types.
+See ``synth_field_size()`` for available types.
 
-If field_name contains [n], the field is considered to be a static array.
+If ``field_name`` contains ``[n]``, the field is considered to be a static array.
 
-If field_names contains[] (no subscript), the field is considered to
+If ``field_names`` contains ``[]`` (no subscript), the field is considered to
 be a dynamic array, which will only take as much space in the event as
 is required to hold the array.
 
@@ -630,7 +630,7 @@ other non-piecewise in-kernel APIs can, however, be used with dynamic
 arrays.
 
 If the event is created from within a module, a pointer to the module
-must be passed to synth_event_create().  This will ensure that the
+must be passed to ``synth_event_create()``.  This will ensure that the
 trace buffer won't contain unreadable events when the module is
 removed.
 
@@ -642,17 +642,17 @@ allows events to be created dynamically and without the need to create
 and populate an array of fields beforehand.
 
 To use this method, an empty or partially empty synthetic event should
-first be created using synth_event_gen_cmd_start() or
-synth_event_gen_cmd_array_start().  For synth_event_gen_cmd_start(),
+first be created using ``synth_event_gen_cmd_start()`` or
+``synth_event_gen_cmd_array_start()``.  For ``synth_event_gen_cmd_start()``,
 the name of the event along with one or more pairs of args each pair
-representing a 'type field_name;' field specification should be
-supplied.  For synth_event_gen_cmd_array_start(), the name of the
-event along with an array of struct synth_field_desc should be
-supplied. Before calling synth_event_gen_cmd_start() or
-synth_event_gen_cmd_array_start(), the user should create and
-initialize a dynevent_cmd object using synth_event_cmd_init().
-
-For example, to create a new "schedtest" synthetic event with two
+representing a ``type field_name;`` field specification should be
+supplied.  For ``synth_event_gen_cmd_array_start()``, the name of the
+event along with an array of ``struct synth_field_desc`` should be
+supplied. Before calling ``synth_event_gen_cmd_start()`` or
+``synth_event_gen_cmd_array_start()``, the user should create and
+initialize a ``dynevent_cmd`` object using ``synth_event_cmd_init()``.
+
+For example, to create a new ``schedtest`` synthetic event with two
 fields::
 
   struct dynevent_cmd cmd;
@@ -668,7 +668,7 @@ fields::
                                   "pid_t", "next_pid_field",
                                   "u64", "ts_ns");
 
-Alternatively, using an array of struct synth_field_desc fields
+Alternatively, using an array of ``struct synth_field_desc`` fields
 containing the same information::
 
   ret = synth_event_gen_cmd_array_start(&cmd, "schedtest", THIS_MODULE,
@@ -676,27 +676,27 @@ containing the same information::
 
 Once the synthetic event object has been created, it can then be
 populated with more fields.  Fields are added one by one using
-synth_event_add_field(), supplying the dynevent_cmd object, a field
-type, and a field name.  For example, to add a new int field named
-"intfield", the following call should be made::
+``synth_event_add_field()``, supplying the ``dynevent_cmd`` object, a field
+``type``, and a field ``name``.  For example, to add a new int field named
+``intfield``, the following call should be made::
 
   ret = synth_event_add_field(&cmd, "int", "intfield");
 
-See synth_field_size() for available types. If field_name contains [n]
+See ``synth_field_size()`` for available types. If ``field_name`` contains ``[n]``
 the field is considered to be an array.
 
 A group of fields can also be added all at once using an array of
-synth_field_desc with add_synth_fields().  For example, this would add
-just the first four sched_fields::
+``synth_field_desc`` with ``add_synth_fields()``.  For example, this would add
+just the first four ``sched_fields``::
 
   ret = synth_event_add_fields(&cmd, sched_fields, 4);
 
-If you already have a string of the form 'type field_name',
-synth_event_add_field_str() can be used to add it as-is; it will
-also automatically append a ';' to the string.
+If you already have a string of the form ``type field_name``,
+``synth_event_add_field_str()`` can be used to add it as-is; it will
+also automatically append a ``;`` to the string.
 
 Once all the fields have been added, the event should be finalized and
-registered by calling the synth_event_gen_cmd_end() function::
+registered by calling the ``synth_event_gen_cmd_end()`` function::
 
   ret = synth_event_gen_cmd_end(&cmd);
 
@@ -707,23 +707,23 @@ Tracing synthetic events from in-kernel code
 --------------------------------------------
 
 To trace a synthetic event, there are several options.  The first
-option is to trace the event in one call, using synth_event_trace()
-with a variable number of values, or synth_event_trace_array() with an
+option is to trace the event in one call, using ``synth_event_trace()``
+with a variable number of values, or ``synth_event_trace_array()`` with an
 array of values to be set.  A second option can be used to avoid the
 need for a pre-formed array of values or list of arguments, via
-synth_event_trace_start() and synth_event_trace_end() along with
-synth_event_add_next_val() or synth_event_add_val() to add the values
+``synth_event_trace_start()`` and ``synth_event_trace_end()`` along with
+``synth_event_add_next_val()`` or ``synth_event_add_val()`` to add the values
 piecewise.
 
 Tracing a synthetic event all at once
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-To trace a synthetic event all at once, the synth_event_trace() or
-synth_event_trace_array() functions can be used.
+To trace a synthetic event all at once, the ``synth_event_trace()`` or
+``synth_event_trace_array()`` functions can be used.
 
-The synth_event_trace() function is passed the trace_event_file
+The ``synth_event_trace()`` function is passed the ``trace_event_file``
 representing the synthetic event (which can be retrieved using
-trace_get_event_file() using the synthetic event name, "synthetic" as
+``trace_get_event_file()`` using the synthetic event name, "synthetic" as
 the system name, and the trace instance name (NULL if using the global
 trace array)), along with an variable number of u64 args, one for each
 synthetic event field, and the number of values being passed.
@@ -744,10 +744,10 @@ All vals should be cast to u64, and string vals are just pointers to
 strings, cast to u64.  Strings will be copied into space reserved in
 the event for the string, using these pointers.
 
-Alternatively, the synth_event_trace_array() function can be used to
-accomplish the same thing.  It is passed the trace_event_file
+Alternatively, the ``synth_event_trace_array()`` function can be used to
+accomplish the same thing.  It is passed the ``trace_event_file``
 representing the synthetic event (which can be retrieved using
-trace_get_event_file() using the synthetic event name, "synthetic" as
+``trace_get_event_file()`` using the synthetic event name, "synthetic" as
 the system name, and the trace instance name (NULL if using the global
 trace array)), along with an array of u64, one for each synthetic
 event field.
@@ -765,7 +765,7 @@ above, code like the following could be used::
   vals[5] = (u64)"thneed";        /* my_string_field */
   vals[6] = 398;                  /* my_int_field */
 
-The 'vals' array is just an array of u64, the number of which must
+The ``vals`` array is just an array of u64, the number of which must
 match the number of field in the synthetic event, and which must be in
 the same order as the synthetic event fields.
 
@@ -774,7 +774,7 @@ strings, cast to u64.  Strings will be copied into space reserved in
 the event for the string, using these pointers.
 
 In order to trace a synthetic event, a pointer to the trace event file
-is needed.  The trace_get_event_file() function can be used to get
+is needed.  The ``trace_get_event_file()`` function can be used to get
 it - it will find the file in the given trace instance (in this case
 NULL since the top trace array is being used) while at the same time
 preventing the instance containing it from going away::
@@ -785,34 +785,34 @@ preventing the instance containing it from going away::
 Before tracing the event, it should be enabled in some way, otherwise
 the synthetic event won't actually show up in the trace buffer.
 
-To enable a synthetic event from the kernel, trace_array_set_clr_event()
+To enable a synthetic event from the kernel, ``trace_array_set_clr_event()``
 can be used (which is not specific to synthetic events, so does need
 the "synthetic" system name to be specified explicitly).
 
-To enable the event, pass 'true' to it::
+To enable the event, pass ``true`` to it::
 
        trace_array_set_clr_event(schedtest_event_file->tr,
                                  "synthetic", "schedtest", true);
 
-To disable it pass false::
+To disable it pass ``false``::
 
        trace_array_set_clr_event(schedtest_event_file->tr,
                                  "synthetic", "schedtest", false);
 
-Finally, synth_event_trace_array() can be used to actually trace the
+Finally, ``synth_event_trace_array()`` can be used to actually trace the
 event, which should be visible in the trace buffer afterwards::
 
        ret = synth_event_trace_array(schedtest_event_file, vals,
                                      ARRAY_SIZE(vals));
 
 To remove the synthetic event, the event should be disabled, and the
-trace instance should be 'put' back using trace_put_event_file()::
+trace instance should be 'put' back using ``trace_put_event_file()``::
 
        trace_array_set_clr_event(schedtest_event_file->tr,
                                  "synthetic", "schedtest", false);
        trace_put_event_file(schedtest_event_file);
 
-If those have been successful, synth_event_delete() can be called to
+If those have been successful, ``synth_event_delete()`` can be called to
 remove the event::
 
        ret = synth_event_delete("schedtest");
@@ -821,16 +821,16 @@ Tracing a synthetic event piecewise
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 To trace a synthetic using the piecewise method described above, the
-synth_event_trace_start() function is used to 'open' the synthetic
+``synth_event_trace_start()`` function is used to 'open' the synthetic
 event trace::
 
        struct synth_event_trace_state trace_state;
 
        ret = synth_event_trace_start(schedtest_event_file, &trace_state);
 
-It's passed the trace_event_file representing the synthetic event
+It's passed the ``trace_event_file`` representing the synthetic event
 using the same methods as described above, along with a pointer to a
-struct synth_event_trace_state object, which will be zeroed before use and
+``struct synth_event_trace_state`` object, which will be zeroed before use and
 used to maintain state between this and following calls.
 
 Once the event has been opened, which means space for it has been
@@ -841,8 +841,8 @@ tradeoff is flexibility in doing the assignments vs the cost of a
 lookup per field.
 
 To assign the values one after the other without lookups,
-synth_event_add_next_val() should be used.  Each call is passed the
-same synth_event_trace_state object used in the synth_event_trace_start(),
+``synth_event_add_next_val()`` should be used.  Each call is passed the
+same ``synth_event_trace_state`` object used in the ``synth_event_trace_start()``,
 along with the value to set the next field in the event.  After each
 field is set, the 'cursor' points to the next field, which will be set
 by the subsequent call, continuing until all the fields have been set
@@ -870,9 +870,9 @@ this method would be (without error-handling code)::
        /* my_int_field */
        ret = synth_event_add_next_val(395, &trace_state);
 
-To assign the values in any order, synth_event_add_val() should be
-used.  Each call is passed the same synth_event_trace_state object used in
-the synth_event_trace_start(), along with the field name of the field
+To assign the values in any order, ``synth_event_add_val()`` should be
+used.  Each call is passed the same ``synth_event_trace_state`` object used in
+the ``synth_event_trace_start()``, along with the field name of the field
 to set and the value to set it to.  The same sequence of calls as in
 the above examples using this method would be (without error-handling
 code)::
@@ -887,17 +887,17 @@ code)::
                                  &trace_state);
        ret = synth_event_add_val("my_int_field", 3999, &trace_state);
 
-Note that synth_event_add_next_val() and synth_event_add_val() are
+Note that ``synth_event_add_next_val()`` and ``synth_event_add_val()`` are
 incompatible if used within the same trace of an event - either one
 can be used but not both at the same time.
 
 Finally, the event won't be actually traced until it's 'closed',
-which is done using synth_event_trace_end(), which takes only the
-struct synth_event_trace_state object used in the previous calls::
+which is done using ``synth_event_trace_end()``, which takes only the
+struct ``synth_event_trace_state`` object used in the previous calls::
 
        ret = synth_event_trace_end(&trace_state);
 
-Note that synth_event_trace_end() must be called at the end regardless
+Note that ``synth_event_trace_end()`` must be called at the end regardless
 of whether any of the add calls failed (say due to a bad field name
 being passed in).
 
@@ -905,18 +905,18 @@ Dyamically creating kprobe and kretprobe event definitions
 ----------------------------------------------------------
 
 To create a kprobe or kretprobe trace event from kernel code, the
-kprobe_event_gen_cmd_start() or kretprobe_event_gen_cmd_start()
+``kprobe_event_gen_cmd_start()`` or ``kretprobe_event_gen_cmd_start()``
 functions can be used.
 
 To create a kprobe event, an empty or partially empty kprobe event
-should first be created using kprobe_event_gen_cmd_start().  The name
+should first be created using ``kprobe_event_gen_cmd_start()``.  The name
 of the event and the probe location should be specfied along with one
 or args each representing a probe field should be supplied to this
-function.  Before calling kprobe_event_gen_cmd_start(), the user
-should create and initialize a dynevent_cmd object using
-kprobe_event_cmd_init().
+function.  Before calling ``kprobe_event_gen_cmd_start()``, the user
+should create and initialize a ``dynevent_cmd`` object using
+``kprobe_event_cmd_init()``.
 
-For example, to create a new "schedtest" kprobe event with two fields::
+For example, to create a new ``schedtest`` kprobe event with two fields::
 
   struct dynevent_cmd cmd;
   char *buf;
@@ -936,15 +936,15 @@ For example, to create a new "schedtest" kprobe event with two fields::
 
 Once the kprobe event object has been created, it can then be
 populated with more fields.  Fields can be added using
-kprobe_event_add_fields(), supplying the dynevent_cmd object along
+``kprobe_event_add_fields()``, supplying the ``dynevent_cmd`` object along
 with a variable arg list of probe fields.  For example, to add a
 couple additional fields, the following call could be made::
 
   ret = kprobe_event_add_fields(&cmd, "flags=%cx", "mode=+4($stack)");
 
 Once all the fields have been added, the event should be finalized and
-registered by calling the kprobe_event_gen_cmd_end() or
-kretprobe_event_gen_cmd_end() functions, depending on whether a kprobe
+registered by calling the ``kprobe_event_gen_cmd_end()`` or
+``kretprobe_event_gen_cmd_end()`` functions, depending on whether a kprobe
 or kretprobe command was started::
 
   ret = kprobe_event_gen_cmd_end(&cmd);
@@ -957,7 +957,7 @@ At this point, the event object is ready to be used for tracing new
 events.
 
 Similarly, a kretprobe event can be created using
-kretprobe_event_gen_cmd_start() with a probe name and location and
+``kretprobe_event_gen_cmd_start()`` with a probe name and location and
 additional params such as $retval::
 
   ret = kretprobe_event_gen_cmd_start(&cmd, "gen_kretprobe_test",
@@ -978,11 +978,11 @@ used to give the kprobe event file back and delete the event::
 
   ret = kprobe_event_delete("gen_kprobe_test");
 
-The "dynevent_cmd" low-level API
+The ``dynevent_cmd`` low-level API
 --------------------------------
 
 Both the in-kernel synthetic event and kprobe interfaces are built on
-top of a lower-level "dynevent_cmd" interface.  This interface is
+top of a lower-level ``dynevent_cmd`` interface.  This interface is
 meant to provide the basis for higher-level interfaces such as the
 synthetic and kprobe interfaces, which can be used as examples.
 
@@ -994,14 +994,14 @@ subystem for creating the corresponding trace events.
 
 In a nutshell, the way it works is that the higher-level interface
 code creates a struct dynevent_cmd object, then uses a couple
-functions, dynevent_arg_add() and dynevent_arg_pair_add() to build up
+functions, ``dynevent_arg_add()`` and ``dynevent_arg_pair_add()`` to build up
 a command string, which finally causes the command to be executed
-using the dynevent_create() function.  The details of the interface
+using the ``dynevent_create()`` function.  The details of the interface
 are described below.
 
 The first step in building a new command string is to create and
-initialize an instance of a dynevent_cmd.  Here, for instance, we
-create a dynevent_cmd on the stack and initialize it::
+initialize an instance of a ``dynevent_cmd``.  Here, for instance, we
+create a ``dynevent_cmd`` on the stack and initialize it::
 
   struct dynevent_cmd cmd;
   char *buf;
@@ -1012,20 +1012,20 @@ create a dynevent_cmd on the stack and initialize it::
   dynevent_cmd_init(cmd, buf, maxlen, DYNEVENT_TYPE_FOO,
                     foo_event_run_command);
 
-The dynevent_cmd initialization needs to be given a user-specified
-buffer and the length of the buffer (MAX_DYNEVENT_CMD_LEN can be used
+The ``dynevent_cmd`` initialization needs to be given a user-specified
+buffer and the length of the buffer (``MAX_DYNEVENT_CMD_LEN`` can be used
 for this purpose - at 2k it's generally too big to be comfortably put
 on the stack, so is dynamically allocated), a dynevent type id, which
 is meant to be used to check that further API calls are for the
-correct command type, and a pointer to an event-specific run_command()
+correct command type, and a pointer to an event-specific ``run_command()``
 callback that will be called to actually execute the event-specific
 command function.
 
 Once that's done, the command string can by built up by successive
 calls to argument-adding functions.
 
-To add a single argument, define and initialize a struct dynevent_arg
-or struct dynevent_arg_pair object.  Here's an example of the simplest
+To add a single argument, define and initialize a struct ``dynevent_arg``
+or ``struct dynevent_arg_pair`` object.  Here's an example of the simplest
 possible arg addition, which is simply to append the given string as
 a whitespace-separated argument to the command::
 
@@ -1037,15 +1037,15 @@ a whitespace-separated argument to the command::
 
   ret = dynevent_arg_add(cmd, &arg);
 
-The arg object is first initialized using dynevent_arg_init() and in
+The arg object is first initialized using ``dynevent_arg_init()`` and in
 this case the parameters are NULL or 0, which means there's no
 optional sanity-checking function or separator appended to the end of
 the arg.
 
 Here's another more complicated example using an 'arg pair', which is
 used to create an argument that consists of a couple components added
-together as a unit, for example, a 'type field_name;' arg or a simple
-expression arg e.g. 'flags=%cx'::
+together as a unit, for example, a ``type field_name;`` arg or a simple
+expression arg e.g. ``flags=%cx``::
 
   struct dynevent_arg_pair arg_pair;
 
@@ -1062,19 +1062,19 @@ neither part of the pair is NULL), along with a character to be used
 to add an operator between the pair (here none) and a separator to be
 appended onto the end of the arg pair (here ';').
 
-There's also a dynevent_str_add() function that can be used to simply
+There's also a ``dynevent_str_add()`` function that can be used to simply
 add a string as-is, with no spaces, delimeters, or arg check.
 
-Any number of dynevent_*_add() calls can be made to build up the string
-(until its length surpasses cmd->maxlen).  When all the arguments have
+Any number of ``dynevent_*_add()`` calls can be made to build up the string
+(until its length surpasses ``cmd->maxlen``).  When all the arguments have
 been added and the command string is complete, the only thing left to
 do is run the command, which happens by simply calling
-dynevent_create()::
+``dynevent_create()``::
 
   ret = dynevent_create(&cmd);
 
 At that point, if the return value is 0, the dynamic event has been
 created and is ready to use.
 
-See the dynevent_cmd function definitions themselves for the details
+See the ``dynevent_cmd`` function definitions themselves for the details
 of the API.
-- 
2.30.2

