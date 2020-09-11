Return-Path: <SRS0=2AiA=CU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967A8C43461
	for <linux-doc@archiver.kernel.org>; Fri, 11 Sep 2020 14:36:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AC31222C4
	for <linux-doc@archiver.kernel.org>; Fri, 11 Sep 2020 14:36:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oMdmCnlt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgIKOgz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Sep 2020 10:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgIKNLy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Sep 2020 09:11:54 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBEAEC06179E
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2020 06:10:00 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id 19so7768511qtp.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2020 06:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cdR3w46F1Dqn8ODmMx+KwCNXsWHRoDripL6i3lIvacY=;
        b=oMdmCnlt8lmmyeZ8HZF4hvSetFh4a/FGX7F9pYyQ0c4gKFLo18nZDhm0+bAqRxIM/6
         ac3TUcHIJpWRenNDkVebVbxd7/wFZsrFNWOS1zZfVrCySAP+MPwpWFnU6qkiWjnmvnmZ
         4DYq3smX4xOVQXyPeDAi0/RHf1rMdmIYSslwPh4QlJV4tPfzaxn1ikgXolTzHS615PIo
         Q7BQwm4rQwR4v5WTkQ5bARgzbATuOOolcVe9PLwyjJImInoD6yBMqNA9dm2Ez4yistRa
         znZGesjvYnDJlsP9GCJr5FXeEJ+PMIuTEs/KE7/bKs6hW9SU+uRwXtBXuVMYVJ7dayPA
         tK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cdR3w46F1Dqn8ODmMx+KwCNXsWHRoDripL6i3lIvacY=;
        b=oDxzip47n4L0ZOI3UwG1iDs1CRDhJpbz0nG49udHKuzs1oJn1NajH4tjfNRtPbgJmn
         /TLoo+J7Xn12DpN95H9XZeukFZ9P4S0FYKeWjZMX0+rmm2ovqiMX6Tkl6sPCFa5R+4MB
         VuU6v8RO33gBSbKibKHOwuUg2aXwMtclHjfsvWVuWZomi3OvPiOJuoFmlT6EGtvIfwcK
         /SfZXgd870Z+ifgg0G1M4aiRwyvFwQ6eyODJz16pBRx5qEvK+Fgn95/n0ua1CQs5WknC
         AaXV6K8fs4uJfR9mNq3rLtR0uKPc013HY13I/KrRoOjUcDjq1j91NOVCL5iSXTufdSeu
         fFEw==
X-Gm-Message-State: AOAM530OfeClXA//HBWeCIpcIw8TmuDvCQLaByxSKzJk1xDTfwlw396C
        zv0u/E4+yzAOszhgg2lADa54LvWWqT15GLjkZTYyPg==
X-Google-Smtp-Source: ABdhPJxtOrWFRpjyjE/AeKgto6iqAU7H82BpLpwF7xdyPcMTjz46Ebj3ahrxr+pLczwcS2UqKMm4LiADeFKJGyPRvcQ=
X-Received: by 2002:ac8:4658:: with SMTP id f24mr1770470qto.158.1599829799395;
 Fri, 11 Sep 2020 06:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200907134055.2878499-1-elver@google.com> <e399d8d5-03c2-3c13-2a43-3bb8e842c55a@intel.com>
 <20200908153102.GB61807@elver.google.com> <feb73053-17a6-8b43-5b2b-51a813e81622@suse.cz>
 <20200908155631.GC61807@elver.google.com> <CACT4Y+YZqj0CJTumpHr-g9HcRgs+JHwWP5eg1nYHP0E-Zw25DQ@mail.gmail.com>
 <CANpmjNO7XwhefA+NKszVkNqj8a60QY45n-=EUtGns+ysNYV9mQ@mail.gmail.com>
In-Reply-To: <CANpmjNO7XwhefA+NKszVkNqj8a60QY45n-=EUtGns+ysNYV9mQ@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 11 Sep 2020 15:09:48 +0200
Message-ID: <CACT4Y+YSQDjEh6+XMXiHvMaKAT8bA=JkC8xY3AXfcSk+f9yR+g@mail.gmail.com>
Subject: Re: [PATCH RFC 00/10] KFENCE: A low-overhead sampling-based memory
 safety error detector
To:     Marco Elver <elver@google.com>
Cc:     Vlastimil Babka <vbabka@suse.cz>,
        Dave Hansen <dave.hansen@intel.com>,
        Alexander Potapenko <glider@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>, Qian Cai <cai@lca.pw>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 11, 2020 at 2:03 PM Marco Elver <elver@google.com> wrote:
>
> On Fri, 11 Sep 2020 at 09:36, Dmitry Vyukov <dvyukov@google.com> wrote:
> > On Tue, Sep 8, 2020 at 5:56 PM Marco Elver <elver@google.com> wrote:
> > > On Tue, Sep 08, 2020 at 05:36PM +0200, Vlastimil Babka wrote:
> [...]
> > > > Hmm did you observe that with this limit, a long-running system would eventually
> > > > converge to KFENCE memory pool being filled with long-aged objects, so there
> > > > would be no space to sample new ones?
> > >
> > > Sure, that's a possibility. But remember that we're not trying to
> > > deterministically detect bugs on 1 system (if you wanted that, you
> > > should use KASAN), but a fleet of machines! The non-determinism of which
> > > allocations will end up in KFENCE, will ensure we won't end up with a
> > > fleet of machines of identical allocations. That's exactly what we're
> > > after. Even if we eventually exhaust the pool, you'll still detect bugs
> > > if there are any.
> > >
> > > If you are overly worried, either the sample interval or number of
> > > available objects needs to be tweaked to be larger. The default of 255
> > > is quite conservative, and even using something larger on a modern
> > > system is hardly noticeable. Choosing a sample interval & number of
> > > objects should also factor in how many machines you plan to deploy this
> > > on. Monitoring /sys/kernel/debug/kfence/stats can help you here.
> >
> > Hi Marco,
> >
> > I reviewed patches and they look good to me (minus some local comments
> > that I've left).
>
> Thank you.
>
> > The main question/concern I have is what Vlastimil mentioned re
> > long-aged objects.
> > Is the default sample interval values reasonable for typical
> > workloads? Do we have any guidelines on choosing the sample interval?
> > Should it depend on workload/use pattern?
>
> As I hinted at before, the sample interval & number of objects needs
> to depend on:
> - number of machines,
> - workload,
> - acceptable overhead (performance, memory).
>
> However, workload can vary greatly, and something more dynamic may be
> needed. We do have the option to monitor
> /sys/kernel/debug/kfence/stats and even change the sample interval at
> runtime, e.g. from a user space tool that checks the currently used
> objects, and as the pool is closer to exhausted, starts increasing
> /sys/module/kfence/parameters/sample_interval.
>
> Of course, if we figure out the best dynamic policy, we can add this
> policy into the kernel. But I don't think it makes sense to hard-code
> such a policy right now.
>
> > By "reasonable" I mean if the pool will last long enough to still
> > sample something after hours/days? Have you tried any experiments with
> > some workload (both short-lived processes and long-lived
> > processes/namespaces) capturing state of the pool? It can make sense
> > to do to better understand dynamics. I suspect that the rate may need
> > to be orders of magnitude lower.
>
> Yes, the current default sample interval is a lower bound, and is also
> a reasonable default for testing. I expect real deployments to use
> much higher sample intervals (lower rate).
>
> So here's some data (with CONFIG_KFENCE_NUM_OBJECTS=1000, so that
> allocated KFENCE objects isn't artificially capped):
>
> -- With a mostly vanilla config + KFENCE (sample interval 100 ms),
> after ~40 min uptime (only boot, then idle) I see ~60 KFENCE objects
> (total allocations >600). Those aren't always the same objects, with
> roughly ~2 allocations/frees per second.
>
> -- Then running sysbench I/O benchmark, KFENCE objects allocated peak
> at 82. During the benchmark, allocations/frees per second are closer
> to 10-15. After the benchmark, the KFENCE objects allocated remain at
> 82, and allocations/frees per second fall back to ~2.
>
> -- For the same system, changing the sample interval to 1 ms (echo 1 >
> /sys/module/kfence/parameters/sample_interval), and re-running the
> benchmark gives me: KFENCE objects allocated peak at exactly 500, with
> ~500 allocations/frees per second. After that, allocated KFENCE
> objects dropped a little to 496, and allocations/frees per second fell
> back to ~2.
>
> -- The long-lived objects are due to caches, and just running 'echo 1
> > /proc/sys/vm/drop_caches' reduced allocated KFENCE objects back to
> 45.

Interesting. What type of caches is this? If there is some type of
cache that caches particularly lots of sampled objects, we could
potentially change the cache to release sampled objects eagerly.

> > Also I am wondering about the boot process (both kernel and init).
> > It's both inherently almost the same for the whole population of
> > machines and inherently produces persistent objects. Should we lower
> > the rate for the first minute of uptime? Or maybe make it proportional
> > to uptime?
>
> It should depend on current usage, which is dependent on the workload.
> I don't think uptime helps much, as seen above. If we imagine a user
> space tool that tweaks this for us, we can initialize KFENCE with a
> very large sample interval, and once booted, this user space
> tool/script adjusts /sys/module/kfence/parameters/sample_interval.
>
> At the very least, I think I'll just make
> /sys/module/kfence/parameters/sample_interval root-writable
> unconditionally, so that we can experiment with such a tool.
>
> Lowering the rate for the first minute of uptime might also be an
> option, although if we do that, we can also just move kfence_init() to
> the end of start_kernel(). IMHO, I think it still makes sense to
> sample normally during boot, because who knows how those allocations
> are used with different workloads once the kernel is live. With a
> sample interval of 1000 ms (which is closer to what we probably want
> in production), I see no more than 20 KFENCE objects allocated after
> boot. I think we can live with that.
>
> > I feel it's quite an important aspect. We can have this awesome idea
> > and implementation, but radically lower its utility by using bad
> > sampling value (which will have silent "failure mode" -- no bugs
> > detected).
>
> As a first step, I think monitoring the entire fleet here is key here
> (collect /sys/kernel/debug/kfence/stats). Essentially, as long as
> allocations/frees per second remains >0, we're probably fine, even if
> we always run at max. KFENCE objects allocated.
>
> An improvement over allocations/frees per second >0 would be
> dynamically tweaking sample_interval based on how close we get to max
> KFENCE objects allocated.
>
> Yet another option is to skip KFENCE allocations based on the memcache
> name, e.g. for those caches dedicated to long-lived allocations.
>
> > But to make it clear: all of this does not conflict with the merge of
> > the first version. Just having tunable sampling interval is good
> > enough. We will get the ultimate understanding only when we start
> > using it widely anyway.
>
> Thanks,
> -- Marco
