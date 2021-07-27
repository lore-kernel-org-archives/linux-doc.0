Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E97CC4338F
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 21:30:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E66C60FE3
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 21:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhG0Vax (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jul 2021 17:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232573AbhG0Vaw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jul 2021 17:30:52 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E6AC061757
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 14:30:51 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id u20so564684ljo.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 14:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q1oEgvB9xwtjzMmFRjkCvx9OZZwaZHJCuRXqeK2qa/M=;
        b=f2FiTpac9qSFO843emkXD5RZfJPgc3/XxAk9HtVomdQNg3epUQrZV7lnvHbSulbDCf
         X9SoKJWCkxkDOhz4GTTgKSRbNUFYi0DRgdYgQhyBmdPGxH9lBJ3JnSvmt9s12j1BsRYW
         HTrdiwca25FgxzbzPMdK1zPF6/bq2WWj/8KqnqIZqwX5YZA7z6yCbrJnpZJk1955/FBq
         +0snDel9yryxzZbxY/2QciiGeq1TXN+UBmr1KVcmWGjaxycBgIZAnsEQCiUATA83ZapX
         x6Ck4OHsP0ZS6W3BlFKYi6bNbZTsgo6B6WVwuDQAvjEWvUMmCObd7tO0tFWWzleiYYfm
         dASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q1oEgvB9xwtjzMmFRjkCvx9OZZwaZHJCuRXqeK2qa/M=;
        b=smOiV6hsBsp+dPdZ4gz7Q0vn9HGJV3PCuUl/9w4wIbU+fpEI6DcDQV0fP4zvfVDCZu
         uoPAggcRMFf2bTUBWbz/JadH+9ILlzRInz9eEPDD9rHHWw/gU86dm06zzjLsmK3/XFpG
         FWiNpr8flMGPkLHxwb+rUA1ZBZIuVrLj2Z8GrqGIq8/Q70TPN+ok6wBgf9c6Dh9gV249
         9cb3Ew20J7BqEE/aRUXT/sozA+JdJqL1WDXv83Ij3TaIPv30v2sx5Lqu+A0efmKvrQ0n
         sV4Qy6GYWZaMCAr9pueRqNdufgtdp+Sg1nZVjcsU1FzsE7KoD8yVUwD2vlbLruX9jErY
         F1bg==
X-Gm-Message-State: AOAM531bKjvNHgoQ3KOkBWoK+PmqEjdTQGJijLkTZDT5u1+gKISlQjpt
        46k3W2MBqVEKAQdxYe8/Ax3jZ5lv22zROejs/W4rHQ==
X-Google-Smtp-Source: ABdhPJzABaVEdLMnfvrQQ6MCpyOmnx/JbktRxaRt/3TzVhGUD/2AMNAku6+0Q+i3GfGoQxvvXfJef5TVX4kp1yTFl1g=
X-Received: by 2002:a05:651c:1211:: with SMTP id i17mr17261522lja.122.1627421449749;
 Tue, 27 Jul 2021 14:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210716081449.22187-1-sj38.park@gmail.com>
In-Reply-To: <20210716081449.22187-1-sj38.park@gmail.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Tue, 27 Jul 2021 14:30:38 -0700
Message-ID: <CALvZod53+KD_F+3z3ztdx6ELFWt+jAXY6Vq-S49bq6-Y2=Cneg@mail.gmail.com>
Subject: Re: [PATCH v34 00/13] Introduce Data Access MONitor (DAMON)
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@huawei.com,
        amit@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>, dwmw@amazon.com,
        foersleo@amazon.de, Greg Thelen <gthelen@google.com>,
        jgowans@amazon.com, mheyne@amazon.de,
        David Rientjes <rientjes@google.com>, sieberf@amazon.com,
        Vlastimil Babka <vbabka@suse.cz>, linux-damon@amazon.com,
        Linux MM <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, Wei Xu <weixugc@google.com>,
        Paul Turner <pjt@google.com>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

(reduced CC list)

Hi all,

I have been asked to comment if Google is interested in using this
feature, its general usefulness and if it is sufficiently general and
non-duplicative. I will try to answer these but first I will explain
the use-cases we are particularly interested in and for which we want
a general access monitoring mechanism.

At the moment Google is particularly interested in four use-cases:

1) Working set estimation: This is used for cluster level scheduling
and controlling the knobs of memory overcommit.

2) Proactive reclaim

3) Balancing between memory tiers: Moving hot pages to fast tiers and
cold pages to slow tiers

4) Hugepage optimization: Hot memory backed by hugepages

In addition, these uses are not happening in isolation. We want a
combination of these running concurrently on a system. So, it is clear
that the first version or step of DAMON which only targets virtual
address space monitoring is not sufficient for these use-cases.

I think the more important question is if DAMON can be extended to
system level monitoring to fulfill these use-cases. Address space
monitoring is a core concept in DAMON and it has implemented address
space based optimizations (i.e. dividing address space into regions,
assuming locality within regions, random sampling within regions
instead of looking at each page and dynamically adjusting regions).
There is a followup proposal on monitoring physical address space in
DAMON. However for systems running multiple workloads, the address
space optimizations core to DAMON would be ineffective.

There are discussions/brainstorming on supporting abstract address
space based on LRUs which is somewhat similar to Multigen LRU [1]
proposal but not well articulated yet. BTW Multigen LRU [1] is another
similar proposal but targets one specific use-case i.e. memory reclaim
(proactive reclaim). Anyways I think we need more brainstorming for a
generalized solution of system level access monitoring.

Regarding merging DAMON, I personally think there are users who might
be interested in only their virtual address space and DAMON is
providing a solution for such users. SeongJae can provide more details
or knowledge if any big user other than Amazon is interested in the
feature. DAMON does not expose stable APIs at the moment, so these can
be changed later if needed. I think it is ok to merge DAMON for some
exposure. However I do want to make this clear that the solution space
is not complete. The solution of system level monitoring is still
needed which can be a future extension to DAMON or more generalized
Multigen LRU.

thanks,
Shakeel

[1] https://lore.kernel.org/lkml/20210520065355.2736558-1-yuzhao@google.com/
