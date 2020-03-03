Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C569C3F2C6
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 20:42:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D74192146E
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 20:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583268135;
	bh=fIagAv8QNE4fo4CvLH0OjsGn+yaGoJdeHmpAUpynYCU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-ID:From;
	b=kwR0/IOLDFnegZ4L16BBww0F4PihBy43K4DDwe8xQVZKxGHEFdow4eyPoNaM59NaK
	 rMMlzcW09sxCgNEPMGQ1S4WpC87aoiPk/dOoIFcNGq6MqBxukm1MFEp80tmBjvBTWF
	 yFLr9Ud4IpR2aWuk5rT3UGRInECn6wwgyjsjq/Ws=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731407AbgCCUmO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 15:42:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:41384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729681AbgCCUmO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 15:42:14 -0500
Received: from tzanussi-mobl7 (c-98-220-238-81.hsd1.il.comcast.net [98.220.238.81])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 977C720848;
        Tue,  3 Mar 2020 20:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583268133;
        bh=fIagAv8QNE4fo4CvLH0OjsGn+yaGoJdeHmpAUpynYCU=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Z7IMOkRmCppKloDHYB12CrXVE07bWvt4V8lBafl/m/iojkrCIQpJAsc5kZOPm19+n
         6S/WMJU2BdpWdpS8V8WHGvSeVF1JhXRQyxCVGiitEoqQGn9l3nNIVAAz2IZvGTiYlw
         fiHpOn4Pl5Q7BD9YwnoJh5aQdTcMuoBn/SIWqPEk=
Message-ID: <1583268131.12738.56.camel@kernel.org>
Subject: Re: [PATCH 1/9] docs: trace: events.rst: convert some new stuff to
 ReST format
From:   Tom Zanussi <zanussi@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-doc@vger.kernel.org
Date:   Tue, 03 Mar 2020 14:42:11 -0600
In-Reply-To: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro,

On Tue, 2020-03-03 at 16:50 +0100, Mauro Carvalho Chehab wrote:
> Some new chapters were added to the documentation. This caused
> Sphinx to complain, as the literal blocks there are not properly
> tagged as such. Also, a new note added there doesn't follow
> the ReST format.
> 

Thanks for fixing these.

Reviewed-by: Tom Zanussi <zanussi@kernel.org>


> This fixes the following warnings:
> 
>     Documentation/trace/events.rst:589: WARNING: Definition list ends
> without a blank line; unexpected unindent.
>     Documentation/trace/events.rst:620: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:623: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:626: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:703: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:697: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:722: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:775: WARNING: Definition list ends
> without a blank line; unexpected unindent.
>     Documentation/trace/events.rst:814: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:817: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:820: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:823: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:826: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:829: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:832: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:844: WARNING: Unexpected
> indentation.
>     Documentation/trace/events.rst:845: WARNING: Block quote ends
> without a blank line; unexpected unindent.
>     Documentation/trace/events.rst:849: WARNING: Unexpected
> indentation.
>     Documentation/trace/events.rst:850: WARNING: Block quote ends
> without a blank line; unexpected unindent.
>     Documentation/trace/events.rst:883: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:886: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:889: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:895: WARNING: Bullet list ends
> without a blank line; unexpected unindent.
>     Documentation/trace/events.rst:895: WARNING: Inline emphasis
> start-string without end-string.
>     Documentation/trace/events.rst:968: WARNING: Inline emphasis
> start-string without end-string.
> 
> Fixes: 34ed63573b66 ("tracing: Documentation for in-kernel synthetic
> event API")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/trace/events.rst | 63 +++++++++++++++++---------------
> --
>  1 file changed, 32 insertions(+), 31 deletions(-)
> 
> diff --git a/Documentation/trace/events.rst
> b/Documentation/trace/events.rst
> index ed79b220bd07..4a2ebe0bd19b 100644
> --- a/Documentation/trace/events.rst
> +++ b/Documentation/trace/events.rst
> @@ -342,7 +342,8 @@ section of Documentation/trace/ftrace.rst), but
> there are major
>  differences and the implementation isn't currently tied to it in any
>  way, so beware about making generalizations between the two.
>  
> -Note: Writing into trace_marker (See Documentation/trace/ftrace.rst)
> +.. Note::
> +     Writing into trace_marker (See Documentation/trace/ftrace.rst)
>       can also enable triggers that are written into
>       /sys/kernel/tracing/events/ftrace/print/trigger
>  
> @@ -569,14 +570,14 @@ The first creates the event in one step, using
> synth_event_create().
>  In this method, the name of the event to create and an array
> defining
>  the fields is supplied to synth_event_create().  If successful, a
>  synthetic event with that name and fields will exist following that
> -call.  For example, to create a new "schedtest" synthetic event:
> +call.  For example, to create a new "schedtest" synthetic event::
>  
>    ret = synth_event_create("schedtest", sched_fields,
>                             ARRAY_SIZE(sched_fields), THIS_MODULE);
>  
>  The sched_fields param in this example points to an array of struct
>  synth_field_desc, each of which describes an event field by type and
> -name:
> +name::
>  
>    static struct synth_field_desc sched_fields[] = {
>          { .type = "pid_t",              .name = "next_pid_field" },
> @@ -615,7 +616,7 @@ synth_event_gen_cmd_array_start(), the user
> should create and
>  initialize a dynevent_cmd object using synth_event_cmd_init().
>  
>  For example, to create a new "schedtest" synthetic event with two
> -fields:
> +fields::
>  
>    struct dynevent_cmd cmd;
>    char *buf;
> @@ -631,7 +632,7 @@ fields:
>                                    "u64", "ts_ns");
>  
>  Alternatively, using an array of struct synth_field_desc fields
> -containing the same information:
> +containing the same information::
>  
>    ret = synth_event_gen_cmd_array_start(&cmd, "schedtest",
> THIS_MODULE,
>                                          fields, n_fields);
> @@ -640,7 +641,7 @@ Once the synthetic event object has been created,
> it can then be
>  populated with more fields.  Fields are added one by one using
>  synth_event_add_field(), supplying the dynevent_cmd object, a field
>  type, and a field name.  For example, to add a new int field named
> -"intfield", the following call should be made:
> +"intfield", the following call should be made::
>  
>    ret = synth_event_add_field(&cmd, "int", "intfield");
>  
> @@ -649,7 +650,7 @@ the field is considered to be an array.
>  
>  A group of fields can also be added all at once using an array of
>  synth_field_desc with add_synth_fields().  For example, this would
> add
> -just the first four sched_fields:
> +just the first four sched_fields::
>  
>    ret = synth_event_add_fields(&cmd, sched_fields, 4);
>  
> @@ -658,7 +659,7 @@ synth_event_add_field_str() can be used to add it
> as-is; it will
>  also automatically append a ';' to the string.
>  
>  Once all the fields have been added, the event should be finalized
> and
> -registered by calling the synth_event_gen_cmd_end() function:
> +registered by calling the synth_event_gen_cmd_end() function::
>  
>    ret = synth_event_gen_cmd_end(&cmd);
>  
> @@ -691,7 +692,7 @@ trace array)), along with an variable number of
> u64 args, one for each
>  synthetic event field, and the number of values being passed.
>  
>  So, to trace an event corresponding to the synthetic event
> definition
> -above, code like the following could be used:
> +above, code like the following could be used::
>  
>    ret = synth_event_trace(create_synth_test, 7, /* number of values
> */
>                            444,             /* next_pid_field */
> @@ -715,7 +716,7 @@ trace array)), along with an array of u64, one
> for each synthetic
>  event field.
>  
>  To trace an event corresponding to the synthetic event definition
> -above, code like the following could be used:
> +above, code like the following could be used::
>  
>    u64 vals[7];
>  
> @@ -739,7 +740,7 @@ In order to trace a synthetic event, a pointer to
> the trace event file
>  is needed.  The trace_get_event_file() function can be used to get
>  it - it will find the file in the given trace instance (in this case
>  NULL since the top trace array is being used) while at the same time
> -preventing the instance containing it from going away:
> +preventing the instance containing it from going away::
>  
>         schedtest_event_file = trace_get_event_file(NULL,
> "synthetic",
>                                                     "schedtest");
> @@ -751,31 +752,31 @@ To enable a synthetic event from the kernel,
> trace_array_set_clr_event()
>  can be used (which is not specific to synthetic events, so does need
>  the "synthetic" system name to be specified explicitly).
>  
> -To enable the event, pass 'true' to it:
> +To enable the event, pass 'true' to it::
>  
>         trace_array_set_clr_event(schedtest_event_file->tr,
>                                   "synthetic", "schedtest", true);
>  
> -To disable it pass false:
> +To disable it pass false::
>  
>         trace_array_set_clr_event(schedtest_event_file->tr,
>                                   "synthetic", "schedtest", false);
>  
>  Finally, synth_event_trace_array() can be used to actually trace the
> -event, which should be visible in the trace buffer afterwards:
> +event, which should be visible in the trace buffer afterwards::
>  
>         ret = synth_event_trace_array(schedtest_event_file, vals,
>                                       ARRAY_SIZE(vals));
>  
>  To remove the synthetic event, the event should be disabled, and the
> -trace instance should be 'put' back using trace_put_event_file():
> +trace instance should be 'put' back using trace_put_event_file()::
>  
>         trace_array_set_clr_event(schedtest_event_file->tr,
>                                   "synthetic", "schedtest", false);
>         trace_put_event_file(schedtest_event_file);
>  
>  If those have been successful, synth_event_delete() can be called to
> -remove the event:
> +remove the event::
>  
>         ret = synth_event_delete("schedtest");
>  
> @@ -784,7 +785,7 @@ remove the event:
>  
>  To trace a synthetic using the piecewise method described above, the
>  synth_event_trace_start() function is used to 'open' the synthetic
> -event trace:
> +event trace::
>  
>         struct synth_trace_state trace_state;
>  
> @@ -809,7 +810,7 @@ along with the value to set the next field in the
> event.  After each
>  field is set, the 'cursor' points to the next field, which will be
> set
>  by the subsequent call, continuing until all the fields have been
> set
>  in order.  The same sequence of calls as in the above examples using
> -this method would be (without error-handling code):
> +this method would be (without error-handling code)::
>  
>         /* next_pid_field */
>         ret = synth_event_add_next_val(777, &trace_state);
> @@ -837,7 +838,7 @@ used.  Each call is passed the same
> synth_trace_state object used in
>  the synth_event_trace_start(), along with the field name of the
> field
>  to set and the value to set it to.  The same sequence of calls as in
>  the above examples using this method would be (without error-
> handling
> -code):
> +code)::
>  
>         ret = synth_event_add_val("next_pid_field", 777,
> &trace_state);
>         ret = synth_event_add_val("next_comm_field", (u64)"silly
> putty",
> @@ -855,7 +856,7 @@ can be used but not both at the same time.
>  
>  Finally, the event won't be actually traced until it's 'closed',
>  which is done using synth_event_trace_end(), which takes only the
> -struct synth_trace_state object used in the previous calls:
> +struct synth_trace_state object used in the previous calls::
>  
>         ret = synth_event_trace_end(&trace_state);
>  
> @@ -878,7 +879,7 @@ function.  Before calling
> kprobe_event_gen_cmd_start(), the user
>  should create and initialize a dynevent_cmd object using
>  kprobe_event_cmd_init().
>  
> -For example, to create a new "schedtest" kprobe event with two
> fields:
> +For example, to create a new "schedtest" kprobe event with two
> fields::
>  
>    struct dynevent_cmd cmd;
>    char *buf;
> @@ -900,18 +901,18 @@ Once the kprobe event object has been created,
> it can then be
>  populated with more fields.  Fields can be added using
>  kprobe_event_add_fields(), supplying the dynevent_cmd object along
>  with a variable arg list of probe fields.  For example, to add a
> -couple additional fields, the following call could be made:
> +couple additional fields, the following call could be made::
>  
>    ret = kprobe_event_add_fields(&cmd, "flags=%cx",
> "mode=+4($stack)");
>  
>  Once all the fields have been added, the event should be finalized
> and
>  registered by calling the kprobe_event_gen_cmd_end() or
>  kretprobe_event_gen_cmd_end() functions, depending on whether a
> kprobe
> -or kretprobe command was started:
> +or kretprobe command was started::
>  
>    ret = kprobe_event_gen_cmd_end(&cmd);
>  
> -or
> +or::
>  
>    ret = kretprobe_event_gen_cmd_end(&cmd);
>  
> @@ -920,13 +921,13 @@ events.
>  
>  Similarly, a kretprobe event can be created using
>  kretprobe_event_gen_cmd_start() with a probe name and location and
> -additional params such as $retval:
> +additional params such as $retval::
>  
>    ret = kretprobe_event_gen_cmd_start(&cmd, "gen_kretprobe_test",
>                                        "do_sys_open", "$retval");
>  
>  Similar to the synthetic event case, code like the following can be
> -used to enable the newly created kprobe event:
> +used to enable the newly created kprobe event::
>  
>    gen_kprobe_test = trace_get_event_file(NULL, "kprobes",
> "gen_kprobe_test");
>  
> @@ -934,7 +935,7 @@ used to enable the newly created kprobe event:
>                                    "kprobes", "gen_kprobe_test",
> true);
>  
>  Finally, also similar to synthetic events, the following code can be
> -used to give the kprobe event file back and delete the event:
> +used to give the kprobe event file back and delete the event::
>  
>    trace_put_event_file(gen_kprobe_test);
>  
> @@ -963,7 +964,7 @@ are described below.
>  
>  The first step in building a new command string is to create and
>  initialize an instance of a dynevent_cmd.  Here, for instance, we
> -create a dynevent_cmd on the stack and initialize it:
> +create a dynevent_cmd on the stack and initialize it::
>  
>    struct dynevent_cmd cmd;
>    char *buf;
> @@ -989,7 +990,7 @@ calls to argument-adding functions.
>  To add a single argument, define and initialize a struct
> dynevent_arg
>  or struct dynevent_arg_pair object.  Here's an example of the
> simplest
>  possible arg addition, which is simply to append the given string as
> -a whitespace-separated argument to the command:
> +a whitespace-separated argument to the command::
>  
>    struct dynevent_arg arg;
>  
> @@ -1007,7 +1008,7 @@ the arg.
>  Here's another more complicated example using an 'arg pair', which
> is
>  used to create an argument that consists of a couple components
> added
>  together as a unit, for example, a 'type field_name;' arg or a
> simple
> -expression arg e.g. 'flags=%cx':
> +expression arg e.g. 'flags=%cx'::
>  
>    struct dynevent_arg_pair arg_pair;
>  
> @@ -1031,7 +1032,7 @@ Any number of dynevent_*_add() calls can be
> made to build up the string
>  (until its length surpasses cmd->maxlen).  When all the arguments
> have
>  been added and the command string is complete, the only thing left
> to
>  do is run the command, which happens by simply calling
> -dynevent_create():
> +dynevent_create()::
>  
>    ret = dynevent_create(&cmd);
>  
