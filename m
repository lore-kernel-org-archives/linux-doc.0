Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2C2C32771
	for <linux-doc@archiver.kernel.org>; Sun, 18 Sep 2022 08:17:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiIRIR6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 18 Sep 2022 04:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiIRIR5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 18 Sep 2022 04:17:57 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B91B22B32
        for <linux-doc@vger.kernel.org>; Sun, 18 Sep 2022 01:17:53 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id q26so21499828vsr.7
        for <linux-doc@vger.kernel.org>; Sun, 18 Sep 2022 01:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1RQT6ZUvczeoaRPplunvS/UF2W+GT/ANijT55uawz7o=;
        b=kCm0eYH8uHV+mpt/ousLYi9kx4TU1+jSTgVvZcCP7oQJ/7W+1muuuVQcEDNDnp8JVY
         eJwf6lG5lBeWQun+mA7ozlDl0KTY7FtfFqU33SXinqBNWaQ5CqXbludizCD0y3B5gKB1
         oCqKAtppUmIe/EHAHEApyoUtD720xKQadRMr/UPWeGJeaLE2wX2LoyuQyJsETQ8Gr7JT
         HrYn/WL+ardsRIdI65gMXX2+niWUuH80dcUGlbYNI/sIz4eor1MQaIMKIpwejjQDgvqY
         8kzkLFSpmpZr3j+X6VuFvvjD2bIpkDh6opEdM3mW1mFc/BgKag+p01XsYMDF1+ximxm6
         3zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1RQT6ZUvczeoaRPplunvS/UF2W+GT/ANijT55uawz7o=;
        b=PsaW68uY8/PGPqjiNzFc+0Qjmo5rREgHsMBk2KCR5ERXW+mmfKke1Fu7IHfCyB2msN
         xkBeg0D8WfxAB00pPIAo/kCm3cg3kW2EiNnIrS+TdBzP3B3MeDi9B9oylqo3cTcEgdUt
         7mYGX46ave6jzcHPhKze2n8xHAuivAMrVG4a9jnPpgMOQ9S/yZewta1/AxvH6qjjfKpD
         UG/ikYSkLqAuSYxkUKkkswTBf/998L6wR5YTKuDApMsDzWARrQtTJfjN4sEZJBZJreo/
         czlzeMXZ6kcKTXrYarXlLe7VX7EdVdCbHYcykvJ7uFRqTrqiyjLpJYrCYwjsQcJJJWAD
         JQdA==
X-Gm-Message-State: ACrzQf39C5nss6MKK4uvbKaQVxA2cex8x6CmPazbl1Ja4lb0wVA5LC6H
        wyVJNASsxRbYe67ttdMpwxO/jJE6zcVjcMzWUVEPAg==
X-Google-Smtp-Source: AMsMyM4v5RQfDbwmieO7CIiyFGLMLy8eTDBGVAXobhjr+eOhIdfGkDnfsk55xkhz8Ap4SQbQFwxKKFykyJIV/VAL5ao=
X-Received: by 2002:a05:6102:3309:b0:39a:e5eb:8508 with SMTP id
 v9-20020a056102330900b0039ae5eb8508mr1186221vsc.65.1663489072391; Sun, 18 Sep
 2022 01:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220918080010.2920238-1-yuzhao@google.com> <20220918080010.2920238-9-yuzhao@google.com>
In-Reply-To: <20220918080010.2920238-9-yuzhao@google.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Sun, 18 Sep 2022 02:17:16 -0600
Message-ID: <CAOUHufa1tm7FXUhiW0NtzhBZ_-qcr-drM1BY-HWrT6Odmnc17w@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v15 08/14] mm: multi-gen LRU: support page
 table walks
To:     Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>, Tejun Heo <tj@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 18, 2022 at 2:01 AM Yu Zhao <yuzhao@google.com> wrote:

...

> This patch uses the following optimizations when walking page tables:
> 1. It tracks the usage of mm_struct's between context switches so that
>    page table walkers can skip processes that have been sleeping since
>    the last iteration.

...

> @@ -672,6 +672,22 @@ struct mm_struct {
>                  */
>                 unsigned long ksm_merging_pages;
>  #endif
> +#ifdef CONFIG_LRU_GEN
> +               struct {
> +                       /* this mm_struct is on lru_gen_mm_list */
> +                       struct list_head list;
> +                       /*
> +                        * Set when switching to this mm_struct, as a hint of
> +                        * whether it has been used since the last time per-node
> +                        * page table walkers cleared the corresponding bits.
> +                        */
> +                       unsigned long bitmap;

...

> +static inline void lru_gen_use_mm(struct mm_struct *mm)
> +{
> +       /*
> +        * When the bitmap is set, page reclaim knows this mm_struct has been
> +        * used since the last time it cleared the bitmap. So it might be worth
> +        * walking the page tables of this mm_struct to clear the accessed bit.
> +        */
> +       WRITE_ONCE(mm->lru_gen.bitmap, -1);
> +}

...

> @@ -5180,6 +5180,7 @@ context_switch(struct rq *rq, struct task_struct *prev,
>                  * finish_task_switch()'s mmdrop().
>                  */
>                 switch_mm_irqs_off(prev->active_mm, next->mm, next);
> +               lru_gen_use_mm(next->mm);
>
>                 if (!prev->mm) {                        // from kernel
>                         /* will mmdrop() in finish_task_switch(). */

Adding Ingo, Peter, Juri and Vincent for the bit above, per previous
discussion here:
https://lore.kernel.org/r/CAOUHufY91Eju-g1+xbUsGkGZ-cwBm78v+S_Air7Cp8mAnYJVYA@mail.gmail.com/

I trimmed 99% of this patch to save your time. In case you want to
hear the whole story:
https://lore.kernel.org/r/20220918080010.2920238-9-yuzhao@google.com/
