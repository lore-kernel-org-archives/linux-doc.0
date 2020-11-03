Return-Path: <SRS0=f+/j=EJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2729C2D0A3
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 22:17:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74CDD223C7
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 22:17:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oDO+8A43"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729665AbgKCWRl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Nov 2020 17:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729466AbgKCWRk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Nov 2020 17:17:40 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA34C061A04
        for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2020 14:17:39 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id 23so20743422ljv.7
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2020 14:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1oYKXAN5GCNK52qKASABkZS4MsOww72x3szPS4VEUtM=;
        b=oDO+8A43pqsEdpFwep2lqes7WkU1VVBO3F6WnCbaHxb3MX4QnoEw9cx5MceFMPFccv
         w/Spe4LXupBhmXcIEiHoP6MNqnoRimNc+UWR6RGvVYasygrQdgTXfWRwbY/ApwsoSKSB
         MOFARBshPTNfVOtqJLAArPNY7eq0fe402dEWg3GeBu21SisinttG6Ro/KF7G9Zv+51/v
         8pLLm7Czirbm2NGXxg7j8H3jTEOq+YZPyih9FiXDM2bsIQ27EXa+qkaVZ3DVgMQ8kONa
         1VhMutiL6QyCTzpeH21STdkZ6ab4guePdNBu6c7qjXpMHJdoth41JoReEpIEklcZa14o
         pIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1oYKXAN5GCNK52qKASABkZS4MsOww72x3szPS4VEUtM=;
        b=koxFTzQzyb5to/fLUE6fnr1A9d4i9PgNyknpb6VUQ4Ry+IgS/tzHqWTTVz25Tm519v
         1OhCGiu9AA/K3ROpPK9NxZ2xxZRrmx63vEoyjjIWpw22dfwPvZrcPejlZV7cQ/217xqU
         kqd7iZlMYX2oWcs+YMyYZonlaUHj38F6STmIlVf6sNnnBoLq5cyTMPxZ5RcgGVOh3YXa
         x8Ea04eRkK1cLdSVS5zTf7ztDiBZNxuri3mqd9ArcuSzqMZTqteZKMYeNdWiaMYLu1o0
         qmrHRzwFpqbPHzr6MCLF4x5mFyeXrDcTMy9lbqeq8YMpyC8p39Z7A4M6+ZMgJK6FisfC
         SlIw==
X-Gm-Message-State: AOAM533o4EufsP8sa9Ul3x4cdwymfrlpPXMIvuzpOF1s8+ZHelSVEgUA
        aF04VauGmwrJsCz1nM/po2bIqi28npuxqP6C1OxkhA==
X-Google-Smtp-Source: ABdhPJzxANwwy8DCO260MRj79UklNQaawFfHnT4W/UwZLqOVM8XdlsOH3LfgzXzugsbmFvH5JnQM130bEYQPeCf+jqc=
X-Received: by 2002:a2e:9a17:: with SMTP id o23mr10126372lji.242.1604441858170;
 Tue, 03 Nov 2020 14:17:38 -0800 (PST)
MIME-Version: 1.0
References: <20201103175841.3495947-1-elver@google.com> <20201103175841.3495947-2-elver@google.com>
In-Reply-To: <20201103175841.3495947-2-elver@google.com>
From:   Jann Horn <jannh@google.com>
Date:   Tue, 3 Nov 2020 23:17:11 +0100
Message-ID: <CAG48ez3rNvqRuU7o1f_Jd3sNZVD+nLSry4rbwMR_VHEXmj6pvA@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] mm: add Kernel Electric-Fence infrastructure
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
        Linux-MM <linux-mm@kvack.org>, SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 3, 2020 at 6:58 PM Marco Elver <elver@google.com> wrote:
> This adds the Kernel Electric-Fence (KFENCE) infrastructure. KFENCE is a
> low-overhead sampling-based memory safety error detector of heap
> use-after-free, invalid-free, and out-of-bounds access errors.

Reviewed-by: Jann Horn <jannh@google.com>
