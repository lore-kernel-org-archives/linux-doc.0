Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EEE4A7D089
	for <lwn-linux-doc@archive.lwn.net>; Sat,  3 Nov 2018 17:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbeKDCmT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 3 Nov 2018 22:42:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:37838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727281AbeKDCmT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 3 Nov 2018 22:42:19 -0400
Received: from vmware.local.home (cpe-66-24-56-78.stny.res.rr.com [66.24.56.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DE824204FD;
        Sat,  3 Nov 2018 17:30:22 +0000 (UTC)
Date:   Sat, 3 Nov 2018 13:30:21 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Aleksa Sarai <cyphar@cyphar.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Brendan Gregg <bgregg@netflix.com>,
        Christian Brauner <christian@brauner.io>,
        Aleksa Sarai <asarai@suse.de>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 1/2] kretprobe: produce sane stack traces
Message-ID: <20181103133021.6676708c@vmware.local.home>
In-Reply-To: <20181104013430.9d3e91b8ebbae7dcb6860ef1@kernel.org>
References: <20181101083551.3805-1-cyphar@cyphar.com>
        <20181101083551.3805-2-cyphar@cyphar.com>
        <20181101204720.6ed3fe37@vmware.local.home>
        <20181102050509.tw3dhvj5urudvtjl@yavin>
        <20181102065932.bdt4pubbrkvql4mp@yavin>
        <20181102091658.1bc979a4@gandalf.local.home>
        <20181102154325.bt6xoysl4xdl33wd@treble>
        <20181102121307.32e99414@gandalf.local.home>
        <20181103220012.55ecd97e671c43e4959c8b62@kernel.org>
        <20181103091341.3d32683e@vmware.local.home>
        <20181104013430.9d3e91b8ebbae7dcb6860ef1@kernel.org>
X-Mailer: Claws Mail 3.15.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 4 Nov 2018 01:34:30 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:
> 
> > I was thinking of a bitmask that represents the handlers, and use that
> > to map which handler gets called for which shadow entry for a
> > particular task.  
> 
> Hmm, I doubt that is too complicated and not scalable. I rather like to see
> the open shadow entry...

It can scale and not too complex (I already played a little with it).
But that said, I'm not committed to it, and using the shadow stack is
also an interesting idea.

> 
> entry: [[original_retaddr][function][modified_retaddr]]
> 
> So if there are many users on same function, the entries will be like this 
> 
> [[original_return_address][function][trampoline_A]]
> [[trampline_A][function][trampoline_B]]
> [[trampline_B][function][trampoline_C]]
> 
> And on the top of the stack, there is trampline_C instead of original_return_address.
> In this case, return to trampoline_C(), it jumps back to trampline_B() and then
> it jumps back to trampline_A(). And eventually it jumps back to
> original_return_address.

Where are trampolines A, B, and C made? Do we also need to dynamically
create them? If I register multiple function tracing ones, each one
will need its own trampoline?

> 
> This way, we don't need allocate another bitmap/pages for the shadow stack.
> We only need a shadow stack for each task.
> Also, unwinder can easily find the trampline_C from the shadow stack and restores
> original_return_address. (of course trampline_A,B,C must be registered so that
> search function can skip it.)

What I was thinking was to store a count and the functions to be called:


	[original_return_address]
	[function_A]
	[function_B]
	[function_C]
	[ 3 ]

Then the trampoline that processes the return codes for ftrace (and
kretprobes and everyone else) can simply do:

	count = pop_shadow_stack();
	for (i = 0; i < count; i++) {
		func = pop_shadow_stack();
		func(...);
	}
	return_address = pop_shadow_stack();

That way we only need to register a function to the return handler and
it will be called, without worrying about making trampolines. There
will just be a single trampoline that handles all the work.

-- Steve

