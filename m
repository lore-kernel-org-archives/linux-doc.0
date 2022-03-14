Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9734DC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 14 Mar 2022 11:46:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbiCNLsH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Mar 2022 07:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232688AbiCNLsH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Mar 2022 07:48:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9537FBF56
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 04:46:56 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <rhi@pengutronix.de>)
        id 1nTj9x-0003xj-FI; Mon, 14 Mar 2022 12:46:45 +0100
Received: from rhi by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <rhi@pengutronix.de>)
        id 1nTj9w-0002j6-9s; Mon, 14 Mar 2022 12:46:44 +0100
Date:   Mon, 14 Mar 2022 12:46:44 +0100
From:   Roland Hieber <rhi@pengutronix.de>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] docs: tracing: use refs for cross-referencing
Message-ID: <20220314114644.6unqdbpxcsqin3qu@pengutronix.de>
References: <20220313105557.172732-1-rhi@pengutronix.de>
 <20220313195519.78b96a2c@rorschach.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220313195519.78b96a2c@rorschach.local.home>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: rhi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Mar 13, 2022 at 07:55:19PM -0400, Steven Rostedt wrote:
> On Sun, 13 Mar 2022 11:55:55 +0100
> Roland Hieber <rhi@pengutronix.de> wrote:
> 
> > Help cross-linking the documents by using the :ref: role.
> 
> Note, I and many other people read the .rst files directly, and do not
> rely on any processing. Is there a better way to do a cross reference
> like this, because I find this a bit ugly to read.

The main point of this series was to get rid of the manually numbered
sections (which the next patch does). Relying on manual section numbers
for cross-referencing is error-prone, which my first iteration of the
patch already showed… Unfortunately, the sphinx reST syntax is not very
flexible here.

I could imagine leaving the file names in when a reference points to a
different document, like in this hunk:

> > -set_ftrace_filter 'ftrace filter commands' (see the 'Filter commands'
> > -section of Documentation/trace/ftrace.rst), but there are major
> > +set_ftrace_filter 'ftrace filter commands' (see the section
> > +:ref:`ftrace_filter_commands`), but there are major

Otherwise jumping around in the same document should be easy by
searching for the reference label (i.e. pressing '#' or '*' in vim),
which is the same as searching for section numbers or titles.

 - Roland

> > Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> > ---
> > PATCH v2:
> >  * new in v2
> > 
> >  Documentation/trace/events.rst          | 25 ++++++++++------
> >  Documentation/trace/ftrace.rst          | 38 ++++++++++++++++---------
> >  Documentation/trace/kprobetrace.rst     |  2 +-
> >  Documentation/trace/timerlat-tracer.rst |  6 ++--
> >  4 files changed, 46 insertions(+), 25 deletions(-)
> > 
> > diff --git a/Documentation/trace/events.rst b/Documentation/trace/events.rst
> > index c47f381d0c00..e83d0d5378be 100644
> > --- a/Documentation/trace/events.rst
> > +++ b/Documentation/trace/events.rst
> > @@ -20,6 +20,8 @@ tracing information should be printed.
> >  2. Using Event Tracing
> >  ======================
> >  
> > +.. _tracing_set_event_interface:
> > +
> >  2.1 Via the 'set_event' interface
> >  ---------------------------------
> >  
> > @@ -91,21 +93,23 @@ In order to facilitate early boot debugging, use boot option::
> >  
> >  	trace_event=[event-list]
> >  
> > -event-list is a comma separated list of events. See section 2.1 for event
> > -format.
> > +event-list is a comma separated list of events. See
> > +:ref:`tracing_set_event_interface` for event format.
> >  
> >  3. Defining an event-enabled tracepoint
> >  =======================================
> >  
> >  See The example provided in samples/trace_events
> >  
> > +.. _tracing_event_formats:
> > +
> >  4. Event formats
> >  ================
> >  
> >  Each trace event has a 'format' file associated with it that contains
> >  a description of each field in a logged event.  This information can
> >  be used to parse the binary trace stream, and is also the place to
> > -find the field names that can be used in event filters (see section 5).
> > +find the field names that can be used in :ref:`event filters <tracing_event_filters>`.
> >  
> >  It also displays the format string that will be used to print the
> >  event in text mode, along with the event name and ID used for
> > @@ -150,6 +154,8 @@ This event contains 10 fields, the first 5 common and the remaining 5
> >  event-specific.  All the fields for this event are numeric, except for
> >  'comm' which is a string, a distinction important for event filtering.
> >  
> > +.. _tracing_event_filters:
> > +
> >  5. Event filtering
> >  ==================
> >  
> > @@ -178,7 +184,7 @@ double-quotes can be used to prevent the shell from interpreting
> >  operators as shell metacharacters.
> >  
> >  The field-names available for use in filters can be found in the
> > -'format' files for trace events (see section 4).
> > +'format' files for trace events (see :ref:`tracing_event_filters`).
> >  
> >  The relational-operators depend on the type of the field being tested:
> >  
> > @@ -324,6 +330,7 @@ To add more PIDs without losing the PIDs already included, use '>>'.
> >  
> >  	# echo 123 244 1 >> set_event_pid
> >  
> > +.. _tracing_event_triggers:
> >  
> >  6. Event triggers
> >  =================
> > @@ -335,7 +342,7 @@ a stack trace whenever the trace event is hit.  Whenever a trace event
> >  with attached triggers is invoked, the set of trigger commands
> >  associated with that event is invoked.  Any given trigger can
> >  additionally have an event filter of the same form as described in
> > -section 5 (Event filtering) associated with it - the command will only
> > +:ref:`tracing_event_filters` associated with it - the command will only
> >  be invoked if the event being invoked passes the associated filter.
> >  If no filter is associated with the trigger, it always passes.
> >  
> > @@ -356,8 +363,8 @@ enabled, and also allows the current event filter implementation to be
> >  used for conditionally invoking triggers.
> >  
> >  The syntax for event triggers is roughly based on the syntax for
> > -set_ftrace_filter 'ftrace filter commands' (see the 'Filter commands'
> > -section of Documentation/trace/ftrace.rst), but there are major
> > +set_ftrace_filter 'ftrace filter commands' (see the section
> > +:ref:`ftrace_filter_commands`), but there are major
> >  differences and the implementation isn't currently tied to it in any
> >  way, so beware about making generalizations between the two.
> >  
> > @@ -382,8 +389,8 @@ The [if filter] part isn't used in matching commands when removing, so
> >  leaving that off in a '!' command will accomplish the same thing as
> >  having it in.
> >  
> > -The filter syntax is the same as that described in the 'Event
> > -filtering' section above.
> > +The filter syntax is the same as that described in the section
> > +:ref:`tracing_event_filters` above.
> >  
> >  For ease of use, writing to the trigger file using '>' currently just
> >  adds or removes a single trigger and there's no explicit '>>' support
> > diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
> > index 45b8c56af67a..d018bd332200 100644
> > --- a/Documentation/trace/ftrace.rst
> > +++ b/Documentation/trace/ftrace.rst
> > @@ -42,6 +42,7 @@ Implementation Details
> >  
> >  See Documentation/trace/ftrace-design.rst for details for arch porters and such.
> >  
> > +.. _ftrace_the_file_system:
> >  
> >  The File System
> >  ---------------
> > @@ -223,7 +224,7 @@ of ftrace. Here is a list of some of the key files:
> >    set_ftrace_filter:
> >  
> >  	When dynamic ftrace is configured in (see the
> > -	section below "dynamic ftrace"), the code is dynamically
> > +	section :ref:`ftrace_dynamic_ftrace`), the code is dynamically
> >  	modified (code text rewrite) to disable calling of the
> >  	function profiler (mcount). This lets tracing be configured
> >  	in with practically no overhead in performance.  This also
> > @@ -237,7 +238,7 @@ of ftrace. Here is a list of some of the key files:
> >  	can be written into this file.
> >  
> >  	This interface also allows for commands to be used. See the
> > -	"Filter commands" section for more details.
> > +	:ref:`ftrace_dynamic_ftrace` section for more details.
> >  
> >  	As a speed up, since processing strings can be quite expensive
> >  	and requires a check of all functions registered to tracing, instead
> > @@ -305,7 +306,7 @@ of ftrace. Here is a list of some of the key files:
> >  
> >  	Functions listed in this file will cause the function graph
> >  	tracer to only trace these functions and the functions that
> > -	they call. (See the section "dynamic ftrace" for more details).
> > +	they call. (See the section :ref:`ftrace_dynamic_ftrace` for more details).
> >  	Note, set_ftrace_filter and set_ftrace_notrace still affects
> >  	what functions are being traced.
> >  
> > @@ -322,7 +323,7 @@ of ftrace. Here is a list of some of the key files:
> >  	These are the function names that you can pass to
> >  	"set_ftrace_filter", "set_ftrace_notrace",
> >  	"set_graph_function", or "set_graph_notrace".
> > -	(See the section "dynamic ftrace" below for more details.)
> > +	(See the section :ref:`ftrace_dynamic_ftrace` for more details.)
> >  
> >    dyn_ftrace_total_info:
> >  
> > @@ -426,19 +427,19 @@ of ftrace. Here is a list of some of the key files:
> >  
> >  	This displays the "snapshot" buffer and also lets the user
> >  	take a snapshot of the current running trace.
> > -	See the "Snapshot" section below for more details.
> > +	See the section :ref:`ftrace_snapshot` below for more details.
> >  
> >    stack_max_size:
> >  
> >  	When the stack tracer is activated, this will display the
> >  	maximum stack size it has encountered.
> > -	See the "Stack Trace" section below.
> > +	See the section :ref:`ftrace_stack_trace` below.
> >  
> >    stack_trace:
> >  
> >  	This displays the stack back trace of the largest stack
> >  	that was encountered when the stack tracer is activated.
> > -	See the "Stack Trace" section below.
> > +	See the section :ref:`ftrace_stack_trace` below.
> >  
> >    stack_trace_filter:
> >  
> > @@ -578,7 +579,7 @@ of ftrace. Here is a list of some of the key files:
> >  
> >  	This is a way to make multiple trace buffers where different
> >  	events can be recorded in different buffers.
> > -	See "Instances" section below.
> > +	See section :ref:`ftrace_instances` below.
> >  
> >    events:
> >  
> > @@ -630,7 +631,7 @@ of ftrace. Here is a list of some of the key files:
> >    hwlat_detector:
> >  
> >  	Directory for the Hardware Latency Detector.
> > -	See "Hardware Latency Detector" section below.
> > +	See section :ref:`ftrace_hardware_latency_detector` below.
> >  
> >    per_cpu:
> >  
> > @@ -739,7 +740,7 @@ Here is the list of current tracers that may be configured.
> >    "hwlat"
> >  
> >  	The Hardware Latency tracer is used to detect if the hardware
> > -	produces any latency. See "Hardware Latency Detector" section
> > +	produces any latency. See section :ref:`ftrace_hardware_latency_detector`
> >  	below.
> >  
> >    "irqsoff"
> > @@ -2156,6 +2157,8 @@ events.
> >      <idle>-0       2d..3    6us :      0:120:R ==> [002]  5882: 94:R sleep
> >  
> >  
> > +.. _ftrace_hardware_latency_detector:
> > +
> >  Hardware Latency Detector
> >  -------------------------
> >  
> > @@ -2258,7 +2261,7 @@ function
> >  This tracer is the function tracer. Enabling the function tracer
> >  can be done from the debug file system. Make sure the
> >  ftrace_enabled is set; otherwise this tracer is a nop.
> > -See the "ftrace_enabled" section below.
> > +See the :ref:`ftrace_ftrace_enabled` section below.
> >  ::
> >  
> >    # sysctl kernel.ftrace_enabled=1
> > @@ -2679,6 +2682,8 @@ You might find other useful features for this tracer in the
> >  following "dynamic ftrace" section such as tracing only specific
> >  functions or tasks.
> >  
> > +.. _ftrace_dynamic_ftrace:
> > +
> >  dynamic ftrace
> >  --------------
> >  
> > @@ -3029,6 +3034,7 @@ this special filter via::
> >  
> >   echo > set_graph_function
> >  
> > +.. _ftrace_ftrace_enabled:
> >  
> >  ftrace_enabled
> >  --------------
> > @@ -3053,6 +3059,7 @@ This can be disable (and enabled) with::
> >    echo 0 > /proc/sys/kernel/ftrace_enabled
> >    echo 1 > /proc/sys/kernel/ftrace_enabled
> >  
> > +.. _ftrace_filter_commands:
> >  
> >  Filter commands
> >  ---------------
> > @@ -3281,6 +3288,8 @@ This is where the buffer_total_size_kb is useful:
> >  Writing to the top level buffer_size_kb will reset all the buffers
> >  to be the same again.
> >  
> > +.. _ftrace_snapshot:
> > +
> >  Snapshot
> >  --------
> >  CONFIG_TRACER_SNAPSHOT makes a generic snapshot feature
> > @@ -3303,8 +3312,8 @@ feature:
> >  	of the snapshot. Echo 1 into this file to allocate a
> >  	spare buffer and to take a snapshot (swap), then read
> >  	the snapshot from this file in the same format as
> > -	"trace" (described above in the section "The File
> > -	System"). Both reads snapshot and tracing are executable
> > +	"trace" (described above in the section :ref:`ftrace_the_file_system`).
> > +	Both reads snapshot and tracing are executable
> >  	in parallel. When the spare buffer is allocated, echoing
> >  	0 frees it, and echoing else (positive) values clear the
> >  	snapshot contents.
> > @@ -3367,6 +3376,7 @@ one of the latency tracers, you will get the following results.
> >    # cat snapshot
> >    cat: snapshot: Device or resource busy
> >  
> > +.. _ftrace_instances:
> >  
> >  Instances
> >  ---------
> > @@ -3495,6 +3505,8 @@ Note, if a process has a trace file open in one of the instance
> >  directories, the rmdir will fail with EBUSY.
> >  
> >  
> > +.. _ftrace_stack_trace:
> > +
> >  Stack trace
> >  -----------
> >  Since the kernel has a fixed sized stack, it is important not to
> > diff --git a/Documentation/trace/kprobetrace.rst b/Documentation/trace/kprobetrace.rst
> > index b175d88f31eb..8c903e39bdf2 100644
> > --- a/Documentation/trace/kprobetrace.rst
> > +++ b/Documentation/trace/kprobetrace.rst
> > @@ -141,7 +141,7 @@ id:
> >  
> >  trigger:
> >    This allows to install trigger commands which are executed when the event is
> > -  hit (for details, see Documentation/trace/events.rst, section 6).
> > +  hit (for details, see :ref:`tracing_event_triggers`).
> >  
> >  Event Profiling
> >  ---------------
> > diff --git a/Documentation/trace/timerlat-tracer.rst b/Documentation/trace/timerlat-tracer.rst
> > index 64d1fe6e9b93..92bfc3729025 100644
> > --- a/Documentation/trace/timerlat-tracer.rst
> > +++ b/Documentation/trace/timerlat-tracer.rst
> > @@ -96,8 +96,8 @@ For example::
> >  
> >  In this case, the root cause of the timer latency does not point to a
> >  single cause but to multiple ones. Firstly, the timer IRQ was delayed
> > -for 13 us, which may point to a long IRQ disabled section (see IRQ
> > -stacktrace section). Then the timer interrupt that wakes up the timerlat
> > +for 13 us, which may point to a long IRQ disabled section (see section
> > +:ref:`timerlat_tracer_irq_stacktrace`). Then the timer interrupt that wakes up the timerlat
> >  thread took 7597 ns, and the qxl:21 device IRQ took 7139 ns. Finally,
> >  the cc1 thread noise took 9909 ns of time before the context switch.
> >  Such pieces of evidence are useful for the developer to use other
> > @@ -133,6 +133,8 @@ in the timelines means circa 1 us, and the time moves ==>::
> >                              |          +-> irq_noise: 6139 ns
> >                              +-> irq_noise: 7597 ns
> >  
> > +.. _timerlat_tracer_irq_stacktrace:
> > +
> >  IRQ stacktrace
> >  ---------------------------
> >  
> 
> 

-- 
Roland Hieber, Pengutronix e.K.          | r.hieber@pengutronix.de     |
Steuerwalder Str. 21                     | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686         | Fax:   +49-5121-206917-5555 |
