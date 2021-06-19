Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5921BC2B9F4
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 15:22:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 313AE61042
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 15:22:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbhFSPYQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 19 Jun 2021 11:24:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:35732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230024AbhFSPYP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 19 Jun 2021 11:24:15 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4849A60FE5;
        Sat, 19 Jun 2021 15:22:04 +0000 (UTC)
Date:   Sat, 19 Jun 2021 11:22:02 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [RFC PATCH 1/2] ftrace: Introduce cmdline argument
 ftrace_disabled
Message-ID: <20210619112202.0a2c7196@gandalf.local.home>
In-Reply-To: <1624084160-3342-2-git-send-email-yangtiezhu@loongson.cn>
References: <1624084160-3342-1-git-send-email-yangtiezhu@loongson.cn>
        <1624084160-3342-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 19 Jun 2021 14:29:19 +0800
Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

> If set CONFIG_FUNCTION_TRACER=y, we can use the following command to
> disable ftrace after boot up:
> echo 0 > /proc/sys/kernel/ftrace_enabled

I'd love to just remove that. It's original purpose was to stop function
tracing when the latency tracers were active. That's now done via a tracefs
option. The "ftrace_enabled" really has no use anymore.

> 
> ftrace_disabled is much stronger than ftrace_enabled, introduce a new
> cmdline argument ftrace_disabled for user to control whether to disable
> ftrace when boot up.

"ftrace_disabled" is triggered when an anomaly is detected, and for the
safety of the system, ftrace shuts down. It was never meant to be a user
triggered event.

You have no rationale for this change. What's the purpose of this?

-- Steve


> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  kernel/trace/ftrace.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 72ef4dc..a015699 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -5517,6 +5517,14 @@ static char ftrace_filter_buf[FTRACE_FILTER_SIZE] __initdata;
>  /* Used by function selftest to not test if filter is set */
>  bool ftrace_filter_param __initdata;
>  
> +static int __init set_ftrace_disabled(char *str)
> +{
> +	pr_info("Set ftrace_disabled to disable ftrace\n");
> +	ftrace_disabled = 1;
> +	return 1;
> +}
> +__setup("ftrace_disabled", set_ftrace_disabled);
> +
>  static int __init set_ftrace_notrace(char *str)
>  {
>  	ftrace_filter_param = true;

