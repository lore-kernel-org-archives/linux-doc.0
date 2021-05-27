Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E530C47089
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 11:58:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBC34610FC
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 11:58:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234467AbhE0MAb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 May 2021 08:00:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50795 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234257AbhE0MAa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 May 2021 08:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622116737;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wjPIN2JnhuUc4ncCd4AUurBqU2Abl/WhHOre8Sqosdk=;
        b=dVr33mHxAo5UQXE1gIwvwiNgTEqgCokvy2SDWpPyGbgCZlawzdowRsxe4PEvzQ47yjapbn
        7xDr9rPO73ND2AjO3qQOrPmm+o8ECeWvSjmGQXhdDD6hkBV4KyjQcQL/97fSukxIbLpvO7
        o6Hox7t26B31jPqHGIV3upnAjJ/95W0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-symhKhuNOkqbyN7_1bQWcA-1; Thu, 27 May 2021 07:58:56 -0400
X-MC-Unique: symhKhuNOkqbyN7_1bQWcA-1
Received: by mail-ej1-f69.google.com with SMTP id j16-20020a1709062a10b02903ba544485d0so1574957eje.3
        for <linux-doc@vger.kernel.org>; Thu, 27 May 2021 04:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wjPIN2JnhuUc4ncCd4AUurBqU2Abl/WhHOre8Sqosdk=;
        b=XhQpm7Lcb/TAFeo9R5pEit5CaH3EOGbiTKpnhVI96TM6EOSFme/fxkZ+Pf00UwI66K
         LiCIDlblBuGpjgo3Hn1BxnjzbEr0FbDrCJtkMP265Yudz0RCig85iV92fhdbSzNcpFeG
         M5L4dHB2ghHFlHfCsDfpGu1vqdCsb+d1X8lDCMOrZfA2tzsM20b8P7AGaZT/TVJVA2C6
         /wUBDf+ZGR/xFKRsrrFy3dGm0ezjWeJHE9c1jOnGhsP/hCFPg7OwZ3ZOR6++9DoCR1XK
         a6Kdng3/TpZuTVSnMiNqxTWV9X82ufovYrPNDgulefpYhSVxYMOSO2do0YFjWnwgfub0
         ut+Q==
X-Gm-Message-State: AOAM530YbZsBs/GJn2xHNB7Bz6a2zs/4/pXvHhhbgH4klBfiAOfiUEVO
        DJHjw5QteVz0vdLzGNBWw/wXW/8sfbXrsTIl9JYBvRKX/aIVduqJQiU3KIT2s6VgX4ewDWLl+qt
        06b2MlCixcEY0PfqiOHrK
X-Received: by 2002:a17:906:40cf:: with SMTP id a15mr3413626ejk.181.1622116734867;
        Thu, 27 May 2021 04:58:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI4hefZVEXGQJKCWltH1Y1Bc9bZRIv+jfizbEcnuKXGxBcsLjympjaoZ9j+8ttg8WO7W2pJg==
X-Received: by 2002:a17:906:40cf:: with SMTP id a15mr3413610ejk.181.1622116734710;
        Thu, 27 May 2021 04:58:54 -0700 (PDT)
Received: from localhost.localdomain ([151.29.18.58])
        by smtp.gmail.com with ESMTPSA id v16sm890216ejr.65.2021.05.27.04.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 04:58:54 -0700 (PDT)
Date:   Thu, 27 May 2021 13:58:52 +0200
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
Subject: Re: [PATCH V3 4/9] tracing/hwlat: Implement the per-cpu mode
Message-ID: <YK+JfHHNbvV7odqX@localhost.localdomain>
References: <cover.1621024265.git.bristot@redhat.com>
 <187db3f9eed1603c858a1f7669d0140dfb753bfd.1621024265.git.bristot@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <187db3f9eed1603c858a1f7669d0140dfb753bfd.1621024265.git.bristot@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 14/05/21 22:51, Daniel Bristot de Oliveira wrote:

[...]

> +/**
> + * start_per_cpu_kthread - Kick off the hardware latency sampling/detector kthreads
> + *
> + * This starts the kernel threads that will sit on potentially all cpus and
> + * sample the CPU timestamp counter (TSC or similar) and look for potential
> + * hardware latencies.
> + */
> +static int start_per_cpu_kthreads(struct trace_array *tr)
> +{
> +	struct cpumask *current_mask = &save_cpumask;
> +	struct cpumask *this_cpumask;
> +	struct task_struct *kthread;
> +	char comm[24];
> +	int cpu;
> +
> +	if (!alloc_cpumask_var(&this_cpumask, GFP_KERNEL))
> +		return -ENOMEM;

Is this_cpumask actually used anywhere?

Thanks,
Juri

