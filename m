Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 57F377E66E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Mar 2018 13:50:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751408AbeCNNu3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Mar 2018 09:50:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:51508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751131AbeCNNu2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 14 Mar 2018 09:50:28 -0400
Received: from devbox (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0AE772176E;
        Wed, 14 Mar 2018 13:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AE772176E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=mhiramat@kernel.org
Date:   Wed, 14 Mar 2018 22:50:21 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Cc:     oleg@redhat.com, peterz@infradead.org, srikar@linux.vnet.ibm.com,
        acme@kernel.org, ananth@linux.vnet.ibm.com,
        akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
        alexis.berlemont@gmail.com, corbet@lwn.net,
        dan.j.williams@intel.com, gregkh@linuxfoundation.org,
        huawei.libin@huawei.com, hughd@google.com, jack@suse.cz,
        jglisse@redhat.com, jolsa@redhat.com, kan.liang@intel.com,
        kirill.shutemov@linux.intel.com, kjlx@templeofstupid.com,
        kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com,
        milian.wolff@kdab.com, mingo@redhat.com, namhyung@kernel.org,
        naveen.n.rao@linux.vnet.ibm.com, pc@us.ibm.com,
        pombredanne@nexb.com, rostedt@goodmis.org, tglx@linutronix.de,
        tmricht@linux.vnet.ibm.com, willy@infradead.org,
        yao.jin@linux.intel.com, fengguang.wu@intel.com
Subject: Re: [PATCH 8/8] trace_uprobe/sdt: Document about reference counter
Message-Id: <20180314225021.64109239de8b14b0aec1e1c5@kernel.org>
In-Reply-To: <20180313125603.19819-9-ravi.bangoria@linux.vnet.ibm.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
        <20180313125603.19819-9-ravi.bangoria@linux.vnet.ibm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 13 Mar 2018 18:26:03 +0530
Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com> wrote:

> No functionality changes.

Please consider to describe what is this change and why, here.

> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
> ---
>  Documentation/trace/uprobetracer.txt | 16 +++++++++++++---
>  kernel/trace/trace.c                 |  2 +-
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/trace/uprobetracer.txt b/Documentation/trace/uprobetracer.txt
> index bf526a7c..8fb13b0 100644
> --- a/Documentation/trace/uprobetracer.txt
> +++ b/Documentation/trace/uprobetracer.txt
> @@ -19,15 +19,25 @@ user to calculate the offset of the probepoint in the object.
>  
>  Synopsis of uprobe_tracer
>  -------------------------
> -  p[:[GRP/]EVENT] PATH:OFFSET [FETCHARGS] : Set a uprobe
> -  r[:[GRP/]EVENT] PATH:OFFSET [FETCHARGS] : Set a return uprobe (uretprobe)
> -  -:[GRP/]EVENT                           : Clear uprobe or uretprobe event
> +  p[:[GRP/]EVENT] PATH:OFFSET[(REF_CTR_OFFSET)] [FETCHARGS]
> +  r[:[GRP/]EVENT] PATH:OFFSET[(REF_CTR_OFFSET)] [FETCHARGS]

Ah, OK in this context, [] means optional syntax :)

> +  -:[GRP/]EVENT
> +
> +  p : Set a uprobe
> +  r : Set a return uprobe (uretprobe)
> +  - : Clear uprobe or uretprobe event
>  
>    GRP           : Group name. If omitted, "uprobes" is the default value.
>    EVENT         : Event name. If omitted, the event name is generated based
>                    on PATH+OFFSET.
>    PATH          : Path to an executable or a library.
>    OFFSET        : Offset where the probe is inserted.
> +  REF_CTR_OFFSET: Reference counter offset. Optional field. Reference count
> +                  gate the invocation of probe. If present, by default
> +                  reference count is 0. Kernel needs to increment it before
> +                  tracing the probe and decrement it when done. This is
> +                  identical to semaphore in Userspace Statically Defined
> +                  Tracepoints (USDT).
>  
>    FETCHARGS     : Arguments. Each probe can have up to 128 args.
>     %REG         : Fetch register REG
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 20a2300..2104d03 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -4604,7 +4604,7 @@ static int tracing_trace_options_open(struct inode *inode, struct file *file)
>    "place (kretprobe): [<module>:]<symbol>[+<offset>]|<memaddr>\n"
>  #endif
>  #ifdef CONFIG_UPROBE_EVENTS
> -	"\t    place: <path>:<offset>\n"
> +  "   place (uprobe): <path>:<offset>[(ref_ctr_offset)]\n"
>  #endif
>  	"\t     args: <name>=fetcharg[:type]\n"
>  	"\t fetcharg: %<register>, @<address>, @<symbol>[+|-<offset>],\n"
> -- 
> 1.8.3.1
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
