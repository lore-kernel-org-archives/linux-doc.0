Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B26777DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 13:57:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753956AbeDMN5s (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 09:57:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:52410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753588AbeDMN5r (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 13 Apr 2018 09:57:47 -0400
Received: from gandalf.local.home (cpe-66-24-56-78.stny.res.rr.com [66.24.56.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00FBE2177F;
        Fri, 13 Apr 2018 13:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00FBE2177F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=rostedt@goodmis.org
Date:   Fri, 13 Apr 2018 09:57:45 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Steffen Maier <maier@linux.ibm.com>
Cc:     linux-doc@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: ftrace: clarify filters with dynamic
 ftrace and graph
Message-ID: <20180413095745.4662eb8f@gandalf.local.home>
In-Reply-To: <20180413092616.9239-1-maier@linux.ibm.com>
References: <20180413092616.9239-1-maier@linux.ibm.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 13 Apr 2018 11:26:16 +0200
Steffen Maier <maier@linux.ibm.com> wrote:

> I fell into the trap of having set up function tracer with a very
> limited filter and then switched over to function_graph and was
> erroneously wondering why the latter did not trace what I expected,
> which was the full unabridged graph recursion.

I didn't realize that the documentation doesn't state this. I mention
it in all my talks that talk about function and function_graph tracer
and set_ftrace_filter.

> 
> Signed-off-by: Steffen Maier <maier@linux.ibm.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/trace/ftrace.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
> index e45f0786f3f9..68835d062344 100644
> --- a/Documentation/trace/ftrace.rst
> +++ b/Documentation/trace/ftrace.rst
> @@ -224,6 +224,7 @@ of ftrace. Here is a list of some of the key files:
>  	has a side effect of enabling or disabling specific functions
>  	to be traced. Echoing names of functions into this file
>  	will limit the trace to only those functions.
> +	This influences both the tracers "function" and "function_graph"!

I know you probably were a bit upset about the documentation not
emphasizing that this affects function_graph, but there's no reason to
have an exclamation point at the end of that statement.

It states that it affects what functions are traced without mentioning
tracers. The assumption was that any "function type" tracing will be
affected by it. Which is no longer true, because stack tracer has its
own filter files.

We should also mention that function profiling is affected by that too.


>  
>  	The functions listed in "available_filter_functions" are what
>  	can be written into this file.
> @@ -265,6 +266,9 @@ of ftrace. Here is a list of some of the key files:
>  	Functions listed in this file will cause the function graph
>  	tracer to only trace these functions and the functions that
>  	they call. (See the section "dynamic ftrace" for more details).
> +	With dynamic ftrace, the graph tracer can only trace functions that
> +	set_ftrace_filter minus set_ftrace_notrace armed; this also influences
> +	the ability to chase function call chains.

Again, the above seems a bit emotional ;-) Just something like this:

	Note, set_ftrace_filter and set_ftrace_notrace still affects
	what functions are being traced.


>  
>    set_graph_notrace:
>  
> @@ -277,7 +281,8 @@ of ftrace. Here is a list of some of the key files:
>  
>  	This lists the functions that ftrace has processed and can trace.
>  	These are the function names that you can pass to
> -	"set_ftrace_filter" or "set_ftrace_notrace".
> +	"set_ftrace_filter", "set_ftrace_notrace",
> +	"set_graph_function", or "set_graph_notrace".
>  	(See the section "dynamic ftrace" below for more details.)

This part is fine.

-- Steve

-- Steve

>  
>    dyn_ftrace_total_info:

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
