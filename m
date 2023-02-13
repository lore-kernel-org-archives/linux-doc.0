Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB847C636CC
	for <linux-doc@archiver.kernel.org>; Mon, 13 Feb 2023 17:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjBMRXD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Feb 2023 12:23:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjBMRXB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Feb 2023 12:23:01 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1534518B14
        for <linux-doc@vger.kernel.org>; Mon, 13 Feb 2023 09:22:59 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id b22so3328200pgw.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Feb 2023 09:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NKgWXn2Y3lviSOPdC3CehrW/DrYmAyletD6KjGkPpnA=;
        b=FljE3nfrktQvbnRiGPJb9iov0n9BSYS9DNocCrt7ERcuObehINAb4rt350LipoQepK
         NUhiDEWLIVYvVG+lIokSH0zfg+zKweHHl0wlSdKjqyNuJf5HTC4YJWySoW5qOZ9x+heF
         ItvhkUznCBiN7bVzMRcIJT9nZLZAcuxGVz9RTToLl7aVhWsqKSS3mrYeju157WnVDFtI
         i1WYSwJ9jXskS6zrbKVR03KFZl/au4rde0k5ckWGKsJ+jL6b8FHgl+yWT882vkmOlKxs
         iIl7UIwlw1wb7a4bC8RuEXQ1WTm4d9oFGYIvS+IGDDkjGUa3fTdmdZ76u/CMd24Wmcga
         S+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKgWXn2Y3lviSOPdC3CehrW/DrYmAyletD6KjGkPpnA=;
        b=tNufpV8uqJRKa8DS/wMalB1xm+RhwYxzYbG5991TJmGZPPUrU8rED5WhlLRVJizgW+
         fK3PmTUN37ogghFV9/Y+ls75jY0Cp5WY+EzegpgSg5CvGfAFdLCKPJI81CsJlsQSQjA4
         OA2sbhdtkh/OS0RJNYtqNpPMqF0pGf8y4R8vn7b9VmTbn4nEuflIb+tVpYozUJLY0tzV
         05lQ3N/BNPPlbUUaoOughlS8jAQhZ/SFq1KG/hHlb8D2tDQa9DMc0oq56G+bToHmfYkY
         mHn5vkaiMElGUR8zV/rpLhFxAe++1REhWNloQbhglh1w8NCi1OXA0KYR4glJGRFcdqW/
         J25w==
X-Gm-Message-State: AO0yUKWtYCNNhNexwK+LDfdihWTfN8HNYqdqVSD4UGDxcCHFW8QCQl2F
        Y6c81SMm+mZeaR2jSHcQnq/jpA==
X-Google-Smtp-Source: AK7set+h3Ih9HypAt5vf5UEAyYTYlb4SiUZsGHHbI+IhcSLk5aOd55igK5iyPWmBDQ5P9zRcPXRSrQ==
X-Received: by 2002:aa7:8f0b:0:b0:5a8:46b0:8269 with SMTP id x11-20020aa78f0b000000b005a846b08269mr18102684pfr.31.1676308978584;
        Mon, 13 Feb 2023 09:22:58 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id c10-20020aa78e0a000000b005898fcb7c1bsm8452052pfr.177.2023.02.13.09.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 09:22:58 -0800 (PST)
Date:   Mon, 13 Feb 2023 22:52:51 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Conor Dooley <conor@kernel.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Anup Patel <apatel@ventanamicro.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 15/24] clocksource/timer-riscv: Refactor
 riscv_timer_init_dt()
Message-ID: <Y+px651SpESUdm4a@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-16-sunilvl@ventanamicro.com>
 <Y+Vdc09bWb9CTXyt@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+Vdc09bWb9CTXyt@spud>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Conor,

On Thu, Feb 09, 2023 at 08:54:11PM +0000, Conor Dooley wrote:
> Hey Sunil,
> 
> On Mon, Jan 30, 2023 at 11:52:16PM +0530, Sunil V L wrote:
> > Refactor the timer init function such that few things can be shared by
> > both DT and ACPI based platforms.
> > 
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> 
> What did Anup do here? He's not author or co-author, so the SoB chain
> looks incorrect.
> 
When I wanted to refactor, I realized Anup had done similar in his branch for
a different purpose. So, I took some of his changes and I added SOB. Let me
add him in co-developed-by:

> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  drivers/clocksource/timer-riscv.c | 79 +++++++++++++++----------------
> >  1 file changed, 37 insertions(+), 42 deletions(-)
> > 
> > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > index 1b4b36df5484..4016c065a01c 100644
> > --- a/drivers/clocksource/timer-riscv.c
> > +++ b/drivers/clocksource/timer-riscv.c
> > @@ -119,61 +119,28 @@ static irqreturn_t riscv_timer_interrupt(int irq, void *dev_id)
> >  	return IRQ_HANDLED;
> >  }
> >  
> > -static int __init riscv_timer_init_dt(struct device_node *n)
> > +static int __init riscv_timer_init_common(void)
> >  {
> > -	int cpuid, error;
> > -	unsigned long hartid;
> > -	struct device_node *child;
> > -	struct irq_domain *domain;
> > -
> > -	error = riscv_of_processor_hartid(n, &hartid);
> > -	if (error < 0) {
> > -		pr_warn("Not valid hartid for node [%pOF] error = [%lu]\n",
> > -			n, hartid);
> > -		return error;
> > -	}
> > -
> > -	cpuid = riscv_hartid_to_cpuid(hartid);
> > -	if (cpuid < 0) {
> > -		pr_warn("Invalid cpuid for hartid [%lu]\n", hartid);
> > -		return cpuid;
> > -	}
> > -
> > -	if (cpuid != smp_processor_id())
> > -		return 0;
> > +	int error;
> > +	struct fwnode_handle *intc_fwnode = riscv_get_intc_hwnode();
> > +	struct irq_domain *domain = NULL;
> >  
> > -	child = of_find_compatible_node(NULL, NULL, "riscv,timer");
> > -	if (child) {
> > -		riscv_timer_cannot_wake_cpu = of_property_read_bool(child,
> > -					"riscv,timer-cannot-wake-cpu");
> > -		of_node_put(child);
> > -	}
> 
> Uhh, where did this code go?
> Unless I've badly missed something, this has vanished in the patch.
> 
Oops! Anup's patch had moved this to a separate DT timer node instead of
cpu node which I didn't realize. Thanks for catching this. Will fix it.

> >  
> > -	domain = NULL;
> > -	child = of_get_compatible_child(n, "riscv,cpu-intc");
> > -	if (!child) {
> > -		pr_err("Failed to find INTC node [%pOF]\n", n);
> > -		return -ENODEV;
> > -	}
> > -	domain = irq_find_host(child);
> > -	of_node_put(child);
> > +	domain = irq_find_matching_fwnode(intc_fwnode, DOMAIN_BUS_ANY);
> >  	if (!domain) {
> > -		pr_err("Failed to find IRQ domain for node [%pOF]\n", n);
> > +		pr_err("Failed to find INTC node [%pfwP]\n", intc_fwnode);
> >  		return -ENODEV;
> >  	}
> >  
> >  	riscv_clock_event_irq = irq_create_mapping(domain, RV_IRQ_TIMER);
> >  	if (!riscv_clock_event_irq) {
> > -		pr_err("Failed to map timer interrupt for node [%pOF]\n", n);
> > -		return -ENODEV;
> > +		pr_err("Failed to map timer interrupt for node [%pfwP]\n",
> > +			intc_fwnode);
> >  	}
> >  
> > -	pr_info("%s: Registering clocksource cpuid [%d] hartid [%lu]\n",
> > -	       __func__, cpuid, hartid);
> >  	error = clocksource_register_hz(&riscv_clocksource, riscv_timebase);
> >  	if (error) {
> > -		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
> > -		       error, cpuid);
> > +		pr_err("clocksource register failed [%d]\n", error);
> 
> If you're changing this, s/register/registration/ to be grammatically
> correct I suppose.
> 
Sure.
> >  		return error;
> >  	}
> >  
> > @@ -199,7 +166,35 @@ static int __init riscv_timer_init_dt(struct device_node *n)
> >  		static_branch_enable(&riscv_sstc_available);
> >  	}
> >  
> > +	pr_info("timer registered using %s\n",
> > +		(static_branch_likely(&riscv_sstc_available)) ?
> > +		"RISC-V Sstc" : "RISC-V SBI");
> 
> Why is this needed? Isn't there a print like 3 lines above here that
> says "Timer interrupt in S-mode is available via sstc extension"?
> 
Yes, will remove it.

> > +
> >  	return error;
> >  }
> >  
> > +static int __init riscv_timer_init_dt(struct device_node *n)
> > +{
> > +	int cpuid, error;
> > +	unsigned long hartid;
> > +
> > +	error = riscv_of_processor_hartid(n, &hartid);
> > +	if (error < 0) {
> > +		pr_warn("Not valid hartid for node [%pOF] error = [%lu]\n",
> 
> While you're already moving this, may as well fix the grammar IMO.
> s/Not valid/Invalid/
>
Okay

Thanks!
Sunil 
