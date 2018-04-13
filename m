Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6668D7DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 15:54:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751024AbeDMPyG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 11:54:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:49602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751011AbeDMPyG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 13 Apr 2018 11:54:06 -0400
Received: from gandalf.local.home (cpe-66-24-56-78.stny.res.rr.com [66.24.56.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F3BF2177F;
        Fri, 13 Apr 2018 15:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F3BF2177F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=rostedt@goodmis.org
Date:   Fri, 13 Apr 2018 11:54:03 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Steffen Maier <maier@linux.ibm.com>
Cc:     linux-doc@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2] Documentation: ftrace: clarify filters with dynamic
 ftrace and graph
Message-ID: <20180413115403.757b8c27@gandalf.local.home>
In-Reply-To: <20180413153915.26931-1-maier@linux.ibm.com>
References: <20180413095745.4662eb8f@gandalf.local.home>
        <20180413153915.26931-1-maier@linux.ibm.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 13 Apr 2018 17:39:15 +0200
Steffen Maier <maier@linux.ibm.com> wrote:

> I fell into the trap of having set up function tracer with a very
> limited filter and then switched over to function_graph and was
> erroneously wondering why the latter did not trace what I expected,
> which was the full unabridged graph recursion.
> 
> Signed-off-by: Steffen Maier <maier@linux.ibm.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>

Looks good.

Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Jonathan Corbet <corbet@lwn.net>

Jon, you want to take it in your tree?

-- Steve

> Cc: linux-doc@vger.kernel.org
> ---
> 
> Changes since v1:
> Integrated review comments by Steven Rostedt
> * less emotional phrasing
> * also mention function profiling with set_ftrace_filter
>   (hopefully I got that right as I don't have experience with it)
> 
>  Documentation/trace/ftrace.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
> index e45f0786f3f9..9bbd3aefadb2 100644
> --- a/Documentation/trace/ftrace.rst
> +++ b/Documentation/trace/ftrace.rst
> @@ -224,6 +224,8 @@ of ftrace. Here is a list of some of the key files:
>  	has a side effect of enabling or disabling specific functions
>  	to be traced. Echoing names of functions into this file
>  	will limit the trace to only those functions.
> +	This influences the tracers "function" and "function_graph"
> +	and thus also function profiling (see "function_profile_enabled").
>  
>  	The functions listed in "available_filter_functions" are what
>  	can be written into this file.
> @@ -265,6 +267,8 @@ of ftrace. Here is a list of some of the key files:
>  	Functions listed in this file will cause the function graph
>  	tracer to only trace these functions and the functions that
>  	they call. (See the section "dynamic ftrace" for more details).
> +	Note, set_ftrace_filter and set_ftrace_notrace still affects
> +	what functions are being traced.
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
>  
>    dyn_ftrace_total_info:

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
