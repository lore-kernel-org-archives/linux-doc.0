Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D83C4743C
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 14:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91E5A61245
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 14:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhFUOCV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Jun 2021 10:02:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:57306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229747AbhFUOCU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 Jun 2021 10:02:20 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 099646120D;
        Mon, 21 Jun 2021 14:00:05 +0000 (UTC)
Date:   Mon, 21 Jun 2021 10:00:04 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [RFC PATCH 1/2] ftrace: Introduce cmdline argument
 ftrace_disabled
Message-ID: <20210621100004.7c1505be@oasis.local.home>
In-Reply-To: <6847bf76-698d-a314-0825-803b48cb8740@loongson.cn>
References: <1624084160-3342-1-git-send-email-yangtiezhu@loongson.cn>
        <1624084160-3342-2-git-send-email-yangtiezhu@loongson.cn>
        <20210619112202.0a2c7196@gandalf.local.home>
        <6847bf76-698d-a314-0825-803b48cb8740@loongson.cn>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 21 Jun 2021 09:21:31 +0800
Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

> >
> > You have no rationale for this change. What's the purpose of this?  
> 
> The "System Benchmarks Index Score" of UnixBench under FUNCTION_TRACER
> is lower than !FUNCTION_TRACER, I want to use this new cmdline argument
> ftrace_disabled to test it, this is the original intention.
> 
> I see the following help info of "config FUNCTION_TRACER":
> 
> [If it's runtime disabled (the bootup default), then the overhead of the
> instructions is very small and not measurable even in micro-benchmarks.]

Those benchmarks were done a long time ago, and they may be measurable today :-/

> 
> I am not quite understand the above description, could you tell me how to
> avoid the runtime performance overhead under FUNCTION_TRACER?

Anyway, your patch wont do anything to change the benchmarks.

When CONFIG_FUNCTION_TRACER is enabled, on x86_64, most functions will
start with a call to fentry. At boot up, these functions will be
converted over to become a nop. And thinking about it, "ftrace_disable"
stops all conversions, so if you add that to the kernel command line,
those calls to fentry, wont be converted to nops, and you'll make
things much worse!

Now, some versions of gcc (and perhaps clang) can do the conversion to
nops at compile time (in which case, your patch would keep the nops and
not the calls to fentry).

The overhead that FUNCTION_TRACER adds is the 5 byte nop at the start
of most functions. This causes a slight hit to instruction cache, and a
minuscule amount of time in the instruction pipeline of the CPU. This
is the "overhead" that is talked about. Your patch doesn't do anything
to address it. The only way to remove that overhead is to compile the
kernel without CONFIG_FUNCTION_TRACER.

-- Steve

