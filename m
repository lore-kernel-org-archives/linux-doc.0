Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6006C433DB
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 16:28:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8ACEC22CAD
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 16:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406713AbhALQ2C (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Jan 2021 11:28:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:58688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406701AbhALQ2C (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 12 Jan 2021 11:28:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6208A2080D;
        Tue, 12 Jan 2021 16:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610468841;
        bh=N03fXhX7j8KopuLszMnGRdw43uzVhuyDY5aQ5Oy5CDo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LEM720mRTCYcIGt0wBPoCvkxGP5ypG987HKxljGZE/XgF3s2EKkjdH+p4KSZALNVf
         vJEly5ES2+uyFzKZtLHtfYGQF9hDmaTPd/t8EM2+UXvoPGI9GqnvYpo74Zh302BbWq
         bBr3S8vvRslmKpX/Nt625nkAtBH9xqwKvmBIKYgKM0Fh/okWsxoDuoi2tJlxyRV/Me
         wlt7rRfY2MYL6Sv0M3ZiWA2zDzXi98/DSfmhlco3+YGP3MdcQCOpKjPecph+BTYPBo
         m1I93dCp0MJ8XMIaba6XHMkGcO8Vp807d3hL9ngksXTKCmSm7KDKr3y4FpS7CcpR5S
         k6uUki0dOi4iQ==
Date:   Wed, 13 Jan 2021 01:27:16 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Marc Koderer <marc@koderer.com>
Cc:     linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH] samples/kprobes: Add ARM support
Message-Id: <20210113012716.045ca4c2d73e42236ecb554c@kernel.org>
In-Reply-To: <20210112154054.17138-1-marc@koderer.com>
References: <20210112154054.17138-1-marc@koderer.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 12 Jan 2021 16:40:54 +0100
Marc Koderer <marc@koderer.com> wrote:

> Plenty of architectures are already supported and this adds ARM
> support.
> 
> Signed-off-by: Marc Koderer <marc@koderer.com>

This looks good to me.

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

Thank you,

> ---
>  samples/kprobes/kprobe_example.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/samples/kprobes/kprobe_example.c b/samples/kprobes/kprobe_example.c
> index 365905cb24b1..65a1188a8b3b 100644
> --- a/samples/kprobes/kprobe_example.c
> +++ b/samples/kprobes/kprobe_example.c
> @@ -44,6 +44,10 @@ static int __kprobes handler_pre(struct kprobe *p, struct pt_regs *regs)
>  			" pstate = 0x%lx\n",
>  		p->symbol_name, p->addr, (long)regs->pc, (long)regs->pstate);
>  #endif
> +#ifdef CONFIG_ARM
> +	pr_info("<%s> pre_handler: p->addr = 0x%p, pc = 0x%lx, cpsr = 0x%lx\n",
> +		p->symbol_name, p->addr, (long)regs->ARM_pc, (long)regs->ARM_cpsr);
> +#endif
>  #ifdef CONFIG_S390
>  	pr_info("<%s> pre_handler: p->addr, 0x%p, ip = 0x%lx, flags = 0x%lx\n",
>  		p->symbol_name, p->addr, regs->psw.addr, regs->flags);
> @@ -73,6 +77,10 @@ static void __kprobes handler_post(struct kprobe *p, struct pt_regs *regs,
>  	pr_info("<%s> post_handler: p->addr = 0x%p, pstate = 0x%lx\n",
>  		p->symbol_name, p->addr, (long)regs->pstate);
>  #endif
> +#ifdef CONFIG_ARM
> +	pr_info("<%s> post_handler: p->addr = 0x%p, cpsr = 0x%lx\n",
> +		p->symbol_name, p->addr, (long)regs->ARM_cpsr);
> +#endif
>  #ifdef CONFIG_S390
>  	pr_info("<%s> pre_handler: p->addr, 0x%p, flags = 0x%lx\n",
>  		p->symbol_name, p->addr, regs->flags);
> -- 
> 2.20.1
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
