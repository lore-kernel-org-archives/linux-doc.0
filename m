Return-Path: <SRS0=90uN=D5=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90417C4363A
	for <linux-doc@archiver.kernel.org>; Thu, 22 Oct 2020 08:37:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25ABC221FB
	for <linux-doc@archiver.kernel.org>; Thu, 22 Oct 2020 08:37:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B99Knje7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SBL2SbiG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2508320AbgJVIhs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Oct 2020 04:37:48 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:46070 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2508247AbgJVIhs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Oct 2020 04:37:48 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603355866;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QyrQSQmCRoE8e/yyUqmfECgKX4VgXOUeiqXGpq3mP/o=;
        b=B99Knje7mrFwyx04a4DftGWbzUOcUu5Q2wD49824cq5FfoSS6yVttHCESYzlP4uy+Io29N
        FF8KMUsdetdGVgt+iYV0r6eLMNEiVnt1fOXzX8h6Uxkx0tl1iC2TRQB+vR7UkmV+wXjUJ/
        Hut1ewDzhQSVJNcC+6FNZdOrARtyNeBDoXLf2KnvpkZBm62uzIFHXgzZm6PPvHvLmXescC
        Hp8SN2W0SYT0Wgwe1T+vtvWjPZ/DpOzsmzlju1PPdqrYbvsB72+wPQt/mz78FjPnQMGeoP
        HmC9ZcYTWOd8nzEPIPAy/3GUV7d0AV2N0c5LGYr6+zI2oTObq79jpFnSYkGwKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603355866;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QyrQSQmCRoE8e/yyUqmfECgKX4VgXOUeiqXGpq3mP/o=;
        b=SBL2SbiGQs74m8lQq8dx4auN2wtwVZkTfiXi6gnjnezfm5dpJdZhHv7gzNIyeeuhl0yb11
        JAtMRK9rJNxqB+Cw==
To:     Pingfan Liu <kernelfans@gmail.com>, linux-kernel@vger.kernel.org
Cc:     Pingfan Liu <kernelfans@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Petr Mladek <pmladek@suse.com>, Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Lina Iyer <ilina@codeaurora.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Maulik Shah <mkshah@codeaurora.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Oliver Neukum <oneukum@suse.com>, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org
Subject: Re: [PATCH 0/3] warn and suppress irqflood
In-Reply-To: <1603346163-21645-1-git-send-email-kernelfans@gmail.com>
References: <1603346163-21645-1-git-send-email-kernelfans@gmail.com>
Date:   Thu, 22 Oct 2020 10:37:46 +0200
Message-ID: <871rhq7j1h.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 22 2020 at 13:56, Pingfan Liu wrote:
> I hit a irqflood bug on powerpc platform, and two years ago, on a x86 platform.
> When the bug happens, the kernel is totally occupies by irq.  Currently, there
> may be nothing or just soft lockup warning showed in console. It is better
> to warn users with irq flood info.
>
> In the kdump case, the kernel can move on by suppressing the irq flood.

You're curing the symptom not the cause and the cure is just magic and
can't work reliably.

Where is that irq flood originated from and why is none of the
mechanisms we have in place to shut it up working?

Thanks,

        tglx




