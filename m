Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F428C4363A
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 02:50:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2359A20791
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 02:50:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BFe+B8BC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgJ3Cu1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Oct 2020 22:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgJ3Cu1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Oct 2020 22:50:27 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E32BC0613CF
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 19:50:26 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id a7so5946875lfk.9
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 19:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QNSPCer1UJ6z9F+/9uXH8Oi4/yk+Ks5V2RaOCBC84Eg=;
        b=BFe+B8BCoqJXOuPrpuUVE7tdWQlIyZYKI6lgD8DdEJw7Fw7hxMafsAOgYEEVUe5bMr
         ZtqYvhzx1+ZmfCDBA3ge5JqRcpP2Zak/C8k4r+2wYwfndyMxKdBlzpKeMjhev14391YM
         30LPsApdaI+vyC/hB8MQAfIaeOBByfXpjIh7XQjg6jzfzBzqzJ0fsxCPtOVt4dqaKlDE
         HFh9yd5znlsNeBPMJ+7Dg6RUzHxECikYBo4O3jD0b3XIxVaSNyT1Ku/8qSTAuyV0Ruie
         kNqbSQemBnpsFfIbXPk9LapxT/rFS623ucGXQn8/g3QBY1QuWC/8uU1/Xy9c+HCRrjAe
         e6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QNSPCer1UJ6z9F+/9uXH8Oi4/yk+Ks5V2RaOCBC84Eg=;
        b=Vq4yY4rPNEYF0ZEI0rPEB8Pm8pbraV8HsgiIuJAt4zrDwsAUEXVosq+Y8yEQe79RWj
         oR339dk2z2fF151oigTF951pPywzyuhGH/lzJhko78YTF74kPc5sLVhH4yjYv+rBrioh
         ZiHAJ+mUeHgCEi/OGRQ8PUoIkZKByA7/pIBoRFTuysBsJyARuS81w8+eK6HLUTKDih0w
         wq9AnRew8WcCrmby3WCWqS+G97+J9EkDuoswCgFQGktig4ib4yXuWcpGOjM4pIL96Ov7
         xAhaLZ5/UjW0u38Qc4Dmze8zBBuAcHg7rARfYutgp2wyrz9mhkEJHdmwV0G2scnH0bqn
         lM+Q==
X-Gm-Message-State: AOAM533Qzaki83SNZL2bbmg8ApFu+c5rdMy3HtK1s13zuFYVzW3Nm/dK
        be8YAbXFdFrR9I8IoJl+MzeEEsMRD1DGRsHMTSLbvw==
X-Google-Smtp-Source: ABdhPJzZDsWksombIayWMw7AEBuFa0vS0U2LyAiDnt6EXpu4yfnzFsa5p0ZxrTmOgj8g6qibOehM8hv/+sRQ0s+89sc=
X-Received: by 2002:a19:e308:: with SMTP id a8mr12857lfh.573.1604026224931;
 Thu, 29 Oct 2020 19:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201029131649.182037-1-elver@google.com> <20201029131649.182037-9-elver@google.com>
In-Reply-To: <20201029131649.182037-9-elver@google.com>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 30 Oct 2020 03:49:58 +0100
Message-ID: <CAG48ez071wf5kvBwpmRk9QiSDzDDN7zh17zEcZjPDWKUjbqosA@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] kfence: add test suite
To:     Marco Elver <elver@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Potapenko <glider@google.com>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, joern@purestorage.com,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        SeongJae Park <sjpark@amazon.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 29, 2020 at 2:17 PM Marco Elver <elver@google.com> wrote:
> Add KFENCE test suite, testing various error detection scenarios. Makes
> use of KUnit for test organization. Since KFENCE's interface to obtain
> error reports is via the console, the test verifies that KFENCE outputs
> expected reports to the console.
[...]
> diff --git a/mm/kfence/kfence_test.c b/mm/kfence/kfence_test.c
[...]
> +static void *test_alloc(struct kunit *test, size_t size, gfp_t gfp, enum allocation_policy policy)
> +{
> +       void *alloc;
> +       unsigned long timeout, resched_after;
[...]
> +       /*
> +        * 100x the sample interval should be more than enough to ensure we get
> +        * a KFENCE allocation eventually.
> +        */
> +       timeout = jiffies + msecs_to_jiffies(100 * CONFIG_KFENCE_SAMPLE_INTERVAL);
> +       /*
> +        * Especially for non-preemption kernels, ensure the allocation-gate
> +        * timer has time to catch up.
> +        */
> +       resched_after = jiffies + msecs_to_jiffies(CONFIG_KFENCE_SAMPLE_INTERVAL);
> +       do {
[...]
> +               if (time_after(jiffies, resched_after))
> +                       cond_resched();

You probably meant to recalculate resched_after after the call to
cond_resched()?

> +       } while (time_before(jiffies, timeout));
> +
> +       KUNIT_ASSERT_TRUE_MSG(test, false, "failed to allocate from KFENCE");
> +       return NULL; /* Unreachable. */
> +}
[...]
> +/*
> + * KFENCE is unable to detect an OOB if the allocation's alignment requirements
> + * leave a gap between the object and the guard page. Specifically, an
> + * allocation of e.g. 73 bytes is aligned on 8 and 128 bytes for SLUB or SLAB
> + * respectively. Therefore it is impossible for the allocated object to adhere
> + * to either of the page boundaries.

Should this be "to the left page boundary" instead of "to either of
the page boundaries"?

> + * However, we test that an access to memory beyond the gap result in KFENCE

*results



> + * detecting an OOB access.
> + */
> +static void test_kmalloc_aligned_oob_read(struct kunit *test)
