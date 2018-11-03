Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 270327D089
	for <lwn-linux-doc@archive.lwn.net>; Sat,  3 Nov 2018 17:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbeKDCp2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 3 Nov 2018 22:45:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:38310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726985AbeKDCp2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 3 Nov 2018 22:45:28 -0400
Received: from vmware.local.home (cpe-66-24-56-78.stny.res.rr.com [66.24.56.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6896D204FD;
        Sat,  3 Nov 2018 17:33:31 +0000 (UTC)
Date:   Sat, 3 Nov 2018 13:33:29 -0400
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
Message-ID: <20181103133329.2160bfd7@vmware.local.home>
In-Reply-To: <20181103133021.6676708c@vmware.local.home>
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
        <20181103133021.6676708c@vmware.local.home>
X-Mailer: Claws Mail 3.15.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 3 Nov 2018 13:30:21 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> What I was thinking was to store a count and the functions to be called:
> 
> 
> 	[original_return_address]
> 	[function_A]
> 	[function_B]
> 	[function_C]
> 	[ 3 ]
> 
> Then the trampoline that processes the return codes for ftrace (and
> kretprobes and everyone else) can simply do:
> 
> 	count = pop_shadow_stack();
> 	for (i = 0; i < count; i++) {
> 		func = pop_shadow_stack();
> 		func(...);
> 	}
> 	return_address = pop_shadow_stack();
> 
> That way we only need to register a function to the return handler and
> it will be called, without worrying about making trampolines. There
> will just be a single trampoline that handles all the work.

And since the most common case is a single function to call, instead of
using a count, we can take advantage that kernel functions are negative
numbers and do:

	[original_return_address]
	[function_A]

	----

	long count;

	count = pop_shadow_stack();
	if (count < 0) {
		func = (void *)count;
		func();
	} else {
		for (i = 0; i < count; i++) {
			[...]

The unwinder will just need to know how to handle all this :-)

-- Steve
