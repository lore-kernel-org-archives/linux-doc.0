Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79730C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 08:56:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46BB6613DF
	for <linux-doc@archiver.kernel.org>; Fri, 14 May 2021 08:56:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233612AbhENI5K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 May 2021 04:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44087 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231562AbhENI5K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 May 2021 04:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620982558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7SRl+mtOr1MBJ1v0HNyfzl2qKEhHpIhbfEOzZEj6rYg=;
        b=EgYlFDJ8BV9XIzKOj1xfL0BKNP5TRiafGQVTQ4tbFdafFaDHdQCPjvlAkmjIEh1bQ2ZWSM
        N04xs2Xl/tqXM9FtzrlmppafIp7ZEjqFYVXliqBWvJtPEaXhF8n3CLYv1i1cU5HPALVdbH
        1uTODc4+9as7nHdQsKoYYwP06meRcPU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-C5WS2imhPiSiq6TfL1lK-A-1; Fri, 14 May 2021 04:55:57 -0400
X-MC-Unique: C5WS2imhPiSiq6TfL1lK-A-1
Received: by mail-wm1-f70.google.com with SMTP id 129-20020a1c02870000b029016fa2bab83bso848580wmc.7
        for <linux-doc@vger.kernel.org>; Fri, 14 May 2021 01:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7SRl+mtOr1MBJ1v0HNyfzl2qKEhHpIhbfEOzZEj6rYg=;
        b=B0Cv6RDZ7Kjcdd1hfDLzLQSKfAn2OTizqXT1fFK6QJQ1xnvoRvI1OETSUCgwD/mCUn
         mkx3uoftknAM9eadoHw6UwLR/F1NeN+jQv4k9zi9erxj0SQzdwjiTOsjDNGX+b4X3Rrc
         fS6vCasIzIGcR+a2KAWQGowMHhvqp9ju3gv7unpB53OS5nSsO3PFwv5bGNeYs8gdf4/b
         hjCxgDCZWsM2ruuGisD6zL0oMUXzngJkprxdlap7WeaPI+KoXqbwjaNC63pZZvIFxpFZ
         TPwZhiX1gwMCFJdYt07tAJOGsW7My74Aeiu7NB6e54Chb6Sb2GEyi/Hid7ME5U9cR5OV
         whoA==
X-Gm-Message-State: AOAM5335r6MyLvoZ6Xr9fvTEXoeiWLhduO3LhZRBf5j1SoUIo/J90kob
        R88t/SSRrOTfQyJjjYfPJ3wZRhswTGjIuyN2eeNQqRPnyZVqE7Vat3t7g3gr+Yh7KS3hfB6jJdd
        cqDjKLyTtjxwOtPXGpNf6
X-Received: by 2002:a5d:490d:: with SMTP id x13mr7358550wrq.49.1620982556187;
        Fri, 14 May 2021 01:55:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxKBj4lQTNdPmXIPyr2HKo7tkkQszMUgyBGoGSGvvQj0Rs2TyHrXbICVB6fiCDDztyHQqsow==
X-Received: by 2002:a5d:490d:: with SMTP id x13mr7358525wrq.49.1620982555978;
        Fri, 14 May 2021 01:55:55 -0700 (PDT)
Received: from localhost.localdomain ([151.29.91.215])
        by smtp.gmail.com with ESMTPSA id o13sm4800369wmh.34.2021.05.14.01.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 01:55:55 -0700 (PDT)
Date:   Fri, 14 May 2021 10:55:53 +0200
From:   Juri Lelli <juri.lelli@redhat.com>
To:     Daniel Bristot de Oliveira <bristot@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Phil Auld <pauld@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Kate Carcia <kcarcia@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH V2 9/9] tracing: Add timerlat tracer
Message-ID: <YJ47Gc6ej9jeAsoK@localhost.localdomain>
References: <cover.1619210818.git.bristot@redhat.com>
 <1f3b97ca52e6a4eec58f18bf190218bdbfe30f20.1619210818.git.bristot@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f3b97ca52e6a4eec58f18bf190218bdbfe30f20.1619210818.git.bristot@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Daniel,

Just a couple of things I noticed while playing with this nice additon.

On 23/04/21 23:05, Daniel Bristot de Oliveira wrote:

...

> +/**
> + * tlat_var_reset - Reset the values of the given timerlat_variables
> + */
> +static inline void tlat_var_reset(void)
> +{
> +	struct timerlat_variables *tlat_var;
> +	int cpu;
>  	/*
>  	 * So far, all the values are initialized as 0, so
>  	 * zeroing the structure is perfect.
>  	 */
> -	memset(osn_var, 0, sizeof(struct osnoise_variables));
> +	for_each_cpu(cpu, cpu_online_mask) {
> +		memset(tlat_var, 0, sizeof(struct timerlat_variables));
> +		tlat_var = per_cpu_ptr(&per_cpu_timerlat_var, cpu);

Think these two above want to be the other way around?

> +	}
>  }

...

> +#ifdef CONFIG_TIMERLAT_TRACER
> +static void timerlat_tracer_start(struct trace_array *tr)
> +{
> +	int retval;
> +
> +	if (osnoise_busy)
> +		return;
> +
> +	retval = __osnoise_tracer_start(tr);
> +	if (retval)
> +		goto out_err;
> +
> +	osnoise_data.timerlat_tracer = 1;

It seems this needs to be set before calling __osnoise_tracer_start()?

Thanks!

Juri

