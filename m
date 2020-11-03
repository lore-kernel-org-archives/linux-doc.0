Return-Path: <SRS0=f+/j=EJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BA4C388F7
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 22:17:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03844223AC
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 22:17:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dhSpxBoI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729860AbgKCWRu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Nov 2020 17:17:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729828AbgKCWRt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Nov 2020 17:17:49 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355DEC061A04
        for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2020 14:17:49 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id s30so2126730lfc.4
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2020 14:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uu8Iml3WkQaK4KYJrSEtvCll/mhluTTPnzMhsFMYnPU=;
        b=dhSpxBoI6DBXUfSTOC1CtjK6uDXPygJ1S0k1dOCffUBkvoV7Ih5Ur72GNZ2koaw4Ub
         CtZWAidfQrB3+J2hCBi5Q0em6HRnAawyJIhg5CmBgrDTMa8HnfVjuHFKjjUcQZ1y8naN
         1Gflt/XeMglY0pNk+yWuq2vEAVU+JmZNSGuhWwJnvvJs8Ni1fm5pBcyLpOsHHYw6dOv6
         Hr8TBSf4GbmVNPL/l3U+WfZfAO1jeq+Hvx2iMV0koW4m2b/YfoyuUsceU9/axNfJGcXP
         Oz24nL67cXWE04NZlnaIYtF8yKRAGekvEw17+w+G9UsDh+f3wdLnMqNL30GK5mZzJqpd
         WINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uu8Iml3WkQaK4KYJrSEtvCll/mhluTTPnzMhsFMYnPU=;
        b=NCNHryPbXc65EjC3tiLFO2OHC83fsA0+vSArwI+eqldWgTaYT0CfBQpuUojjoai/7P
         AIgf4B7sw0tY6pdxmMJ/1GKWmijfXR/lrBvFolnXkMXCbBhsCTDpHkVygFFAK0bFwunI
         kvnrWSmHOLTU6OncIYOynvRp47deLM1oaY4FBZxO8Xbqs0SGB8CrTU5h0E7DeYnl5Bj5
         HY75fCs8YwrLwkHKzxBsxD5TGPlWcdMV78APRsKJJ4G/Bwzr9hakPXQQT4N0bpwIAz1F
         3Z1STjagy9Nw3fktgQQXTsEoEEy4qFF5IZupp5Hlh8t0+4lzLQ9tsubK7AV2sY4TOs4M
         X14Q==
X-Gm-Message-State: AOAM531Q5Fx2HYQBqZ06P4QXTG3wEoDq4/i6ESC81vqOG05GhdGeK9xg
        VAE39zQyOfG9HMpqkaclmDJrTZNgj4hSVKwBqMxt5A==
X-Google-Smtp-Source: ABdhPJzITc+oz0+9ZFNrPS7EoJ+JENLNGcgV5+6wlPXwd/VZQ9//BD+1mjKKLveDWFezTP2Ffc+c+zXd5cRZPYL9W5Q=
X-Received: by 2002:a19:c357:: with SMTP id t84mr7777784lff.34.1604441867188;
 Tue, 03 Nov 2020 14:17:47 -0800 (PST)
MIME-Version: 1.0
References: <20201103175841.3495947-1-elver@google.com> <20201103175841.3495947-3-elver@google.com>
In-Reply-To: <20201103175841.3495947-3-elver@google.com>
From:   Jann Horn <jannh@google.com>
Date:   Tue, 3 Nov 2020 23:17:20 +0100
Message-ID: <CAG48ez3ZeHbDUv_rgMrmEr7PJEzaVCgAV4SVi6A9aj6GzSh0jQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/9] x86, kfence: enable KFENCE for x86
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
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@purestorage.com>,
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

On Tue, Nov 3, 2020 at 6:59 PM Marco Elver <elver@google.com> wrote:
> Add architecture specific implementation details for KFENCE and enable
> KFENCE for the x86 architecture. In particular, this implements the
> required interface in <asm/kfence.h> for setting up the pool and
> providing helper functions for protecting and unprotecting pages.
>
> For x86, we need to ensure that the pool uses 4K pages, which is done
> using the set_memory_4k() helper function.
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> Co-developed-by: Marco Elver <elver@google.com>
> Signed-off-by: Marco Elver <elver@google.com>
> Signed-off-by: Alexander Potapenko <glider@google.com>

Reviewed-by: Jann Horn <jannh@google.com>
