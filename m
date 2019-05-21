Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B30947D926
	for <lwn-linux-doc@archive.lwn.net>; Tue, 21 May 2019 13:33:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbfEUNdV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 21 May 2019 09:33:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:58876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728053AbfEUNdV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 21 May 2019 09:33:21 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 117F9217D7;
        Tue, 21 May 2019 13:33:19 +0000 (UTC)
Date:   Tue, 21 May 2019 09:33:17 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Ingo Molnar <mingo@kernel.org>,
        "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
        "David S . Miller" <davem@davemloft.net>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/2] Enable new kprobe event at boot
Message-ID: <20190521093317.7d698f79@gandalf.local.home>
In-Reply-To: <155842537599.4253.14690293652007233645.stgit@devnote2>
References: <155842537599.4253.14690293652007233645.stgit@devnote2>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 21 May 2019 16:56:16 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Note that 'trace_event=' option enables trace event at very early
> timing, but the events added by 'kprobe_event=' are enabled right
> before enabling device drivers at this point. It is enough for
> tracing device driver initialization etc.

Nice!

I wonder if we can have this called before the trace_event boot is
analyzed. Then have the kprobe_event work more like the kprobe_events
file, and not enable the kprobes but only create them. If you want to
enable them you do a trace_event=kprobes as well.

Perhaps we could enable kprobes at early init?

What do you think? Or is there something else in kprobes that prevents
such an early enabling of it?

-- Steve
