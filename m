Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59B6C47423
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 16:52:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36DCD208B8
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 16:52:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VqnhGR7e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728795AbgI2QwZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 12:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgI2QwZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 12:52:25 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67BBC061755
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 09:52:24 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id t17so2902975wmi.4
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 09:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=09UR9SuLwWLskf/m2OzcloavK4YxVGusfREn6SghSM8=;
        b=VqnhGR7e5Y+QNVAikhl7b51GeAH0EF7GfRijsXSqLCApylXqui81r15GHmRn5NZZkT
         WLGdkW9xG86unltU1fBRLlBax2QXjGmvOovG6PuhQ3fY0nztGMo6g++2xONgQDoiLAvw
         rcAjPYA6JiB6PZfyVfONcNCvNGQdZW5qr+iMHxyqQeQEIUsS5oODanUYK1uAmAFWzQXK
         n1ah0v3kFA89AXxKTVDnYkAZIlSFvFE0WDktm+kOn3FueQE9hONwJHlB2HswC4WWrgGR
         WulwwyJT9pFPdi2ANZocEl9EwCJDK1CvAkQD7Ipkiu9AZh3v8WgO63C2qhDrs/Mqwhox
         hpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=09UR9SuLwWLskf/m2OzcloavK4YxVGusfREn6SghSM8=;
        b=iIRHCIoZZcCk56hY6lCj2F2Lpcm/5IV68sGobbSrw233xPL8yawV+n6lWqTYPt3jEo
         dUHI1Aa/lWBYWBm0BTYFwnByRBwXmvBX/p2lh7kFdu6pmqtFN2hGOrfld9RKgWzpqdNY
         Igwn0t06yRJQCKFO/mx3h6N4hb3V9lw1GAun53vEFMyOX1N+j6/7l47ec+QBUx0W/gUM
         2kDvCJPvQtvSLIc0+7YIC6fBPv3opxnxVq9z2SPyK+ULWw5Xunx++1leq+xITkR9buUU
         gRZqTw70Id3hOj1y5KEjyaL85MeiewD/XxLZUZ67gkyu/q+1srCpsjEa3Q9d3Eq5sKYD
         GWyQ==
X-Gm-Message-State: AOAM531XgrWdohIZcjgTpbXdEwDGgqF5XetqgVaUSiwVAmrNKgwFt1Dt
        lH52wa3vcx5E6fwd4KANForFzTRS8N76/JwzuTxNLw==
X-Google-Smtp-Source: ABdhPJzdU1RWleO2umQ9ZG81ji0BI7nypy2kf9m7DnuKVGNdNbNHLvDBW4+tA8/N5goYPJThzjRgNtE1rY9gVnAYr5k=
X-Received: by 2002:a1c:b388:: with SMTP id c130mr5533839wmf.175.1601398343136;
 Tue, 29 Sep 2020 09:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com> <20200921132611.1700350-4-elver@google.com>
 <20200921143059.GO2139@willie-the-truck> <CAG_fn=WKaY9MVmbpkgoN4vaJYD_T_A3z2Lgqn+2o8-irmCKywg@mail.gmail.com>
 <CAG_fn=XV7JfJDK+t1X6bnV6gRoiogNXsHfww0jvcEtJ2WZpR7Q@mail.gmail.com>
 <20200921174357.GB3141@willie-the-truck> <CANpmjNNdGWoY_FcqUDUZ2vXy840H2+LGzN3WWrK8iERTKntSTw@mail.gmail.com>
 <20200929135355.GA53442@C02TD0UTHF1T.local>
In-Reply-To: <20200929135355.GA53442@C02TD0UTHF1T.local>
From:   Alexander Potapenko <glider@google.com>
Date:   Tue, 29 Sep 2020 18:52:11 +0200
Message-ID: <CAG_fn=UzvZfOzKEnc_ouqchNcg359yhykKc3tDTYdPhMAQooSQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] arm64, kfence: enable KFENCE for ARM64
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitriy Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>,
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kees Cook <keescook@chromium.org>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        SeongJae Park <sjpark@amazon.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> > On x86 we just do `char __kfence_pool[KFENCE_POOL_SIZE] ...;` to
> > statically allocate the pool. On arm64 this doesn't seem to work
> > because static memory doesn't have struct pages?
>
> Are you using virt_to_page() directly on that statically-allocated
> __kfence_pool? If so you'll need to use lm_alias() if so, as is done in
> mm/kasan/init.c.
>
> Anything statically allocated is part of the kernel image address range
> rather than the linear/direct map, and doesn't have a valid virt addr,
> but its linear map alias does.
>
> If you enable CONFIG_DEBUG_VIRTUAL you should get warnings if missing
> lm_alias() calls.

I just checked that on x86 CONFIG_DEBUG_VIRTUAL prints no warnings on our tests.
virt_addr_valid() also returns true for addresses belonging to
__kfence_pool declared in BSS.
Could this be related to x86 mapping the kernel twice?
