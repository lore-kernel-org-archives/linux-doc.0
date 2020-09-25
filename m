Return-Path: <SRS0=pZ1j=DC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBC8C4363D
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 11:32:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 594A921775
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 11:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qyHbJgNn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727290AbgIYLcB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Sep 2020 07:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbgIYLcB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Sep 2020 07:32:01 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE5CC0613D3
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 04:32:01 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id o8so1964149otl.4
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 04:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6L8pDz+HxatuOD/RjMAAdgwqh+b4jciwbLlL8vlXkeA=;
        b=qyHbJgNndjOJTaIgRnJQ6gdz3KVViOFrAgXDGuXJJIRD74pqZXl32ezx/nLKfU26eO
         4Sswiyv+wYx+68aCOYEcsAZf3hLxli00w3yhK/RaeNtOxUrc10pokEGeU+s1NS9L342a
         f/3qUcxxVICL9wVpKmpyDNMssvgh9Q51lddnuQkfdLh0ATuhFv3NzEnuvvXUTsOLsvgO
         YJLBGwF8305u0itBfxkYCF5CDWafOUXiMyTZvcIvDk2rDy10zKMmhaH5F/2Ze2kOAEPI
         at+QdWNp6iNyaX5chYaA3CG+ThU646hbW4DslUpQHdVbrXIUHwwyE7WKMgtzG5rLJb2I
         29cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6L8pDz+HxatuOD/RjMAAdgwqh+b4jciwbLlL8vlXkeA=;
        b=oXVFjs2uytS1lxDiS9JOxZwmcu51pf2+O2nNKwVABGUT6G/biNGVWbJQ8xpbXAPEym
         iJT72QGqvJSv9tdGmLlj6Q/abUyl9T0oSvN9gTQLUySQXN4ww7KNmUUqUJdMFiXVKH0f
         SXbMwdc0Q03LhJ1D0GYzbaMkWDLiTdi7/vsKuDZzvCokc3f0MVxm5b/cZTUZZc1VvQeD
         EpAF1kvWg7baEPBPA1sc8B1x4T+oLFqgu3np3BO4Z7EuHdXglqnKI9s34SZHTHRDguld
         0K4PHyPTPZwT+7V3IJrJlPrgmp59RH/MZLQeY27CF/wfp+vWDDjPx+mFKvjAPKUdqa9L
         vbzw==
X-Gm-Message-State: AOAM530evMD1BHZWNdNRLPtWeYK/HWBoKiYeGUXEwT71ruqTnEkMveA8
        Su7MBWYmrTEYJmytnYxU6d02iWrAO6lhSRo05+RMNOIkJAWCfA==
X-Google-Smtp-Source: ABdhPJyormovoExEyKquxcPkW3fXKMFM7xowV9E55jiL8kHHZvbTZiiejygZobwfWQwB8aFC0qqx0h8nfjkvgKtV6TA=
X-Received: by 2002:a9d:66a:: with SMTP id 97mr2621626otn.233.1601033519970;
 Fri, 25 Sep 2020 04:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200921132611.1700350-2-elver@google.com> <20200925112328.10057-1-sjpark@amazon.com>
In-Reply-To: <20200925112328.10057-1-sjpark@amazon.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 25 Sep 2020 13:31:48 +0200
Message-ID: <CANpmjNMG+1Fiff+_PMFanRVc9SRoTKa-Z9SMM9eKTRL9MsoD0w@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] mm: add Kernel Electric-Fence infrastructure
To:     SeongJae Park <sjpark@amazon.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Potapenko <glider@google.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Hillf Danton <hdanton@sina.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Eric Dumazet <edumazet@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Christoph Lameter <cl@linux.com>,
        Will Deacon <will@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Ingo Molnar <mingo@redhat.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        David Rientjes <rientjes@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Kees Cook <keescook@chromium.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Jann Horn <jannh@google.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Pekka Enberg <penberg@kernel.org>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 25 Sep 2020 at 13:24, 'SeongJae Park' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Mon, 21 Sep 2020 15:26:02 +0200 Marco Elver <elver@google.com> wrote:
>
> > From: Alexander Potapenko <glider@google.com>
> >
> > This adds the Kernel Electric-Fence (KFENCE) infrastructure. KFENCE is a
> > low-overhead sampling-based memory safety error detector of heap
> > use-after-free, invalid-free, and out-of-bounds access errors.
> >
> > KFENCE is designed to be enabled in production kernels, and has near
> > zero performance overhead. Compared to KASAN, KFENCE trades performance
> > for precision. The main motivation behind KFENCE's design, is that with
> > enough total uptime KFENCE will detect bugs in code paths not typically
> > exercised by non-production test workloads. One way to quickly achieve a
> > large enough total uptime is when the tool is deployed across a large
> > fleet of machines.
> >
> > KFENCE objects each reside on a dedicated page, at either the left or
> > right page boundaries. The pages to the left and right of the object
> > page are "guard pages", whose attributes are changed to a protected
> > state, and cause page faults on any attempted access to them. Such page
> > faults are then intercepted by KFENCE, which handles the fault
> > gracefully by reporting a memory access error. To detect out-of-bounds
> > writes to memory within the object's page itself, KFENCE also uses
> > pattern-based redzones. The following figure illustrates the page
> > layout:
> >
> >   ---+-----------+-----------+-----------+-----------+-----------+---
> >      | xxxxxxxxx | O :       | xxxxxxxxx |       : O | xxxxxxxxx |
> >      | xxxxxxxxx | B :       | xxxxxxxxx |       : B | xxxxxxxxx |
> >      | x GUARD x | J : RED-  | x GUARD x | RED-  : J | x GUARD x |
> >      | xxxxxxxxx | E :  ZONE | xxxxxxxxx |  ZONE : E | xxxxxxxxx |
> >      | xxxxxxxxx | C :       | xxxxxxxxx |       : C | xxxxxxxxx |
> >      | xxxxxxxxx | T :       | xxxxxxxxx |       : T | xxxxxxxxx |
> >   ---+-----------+-----------+-----------+-----------+-----------+---
> >
> > Guarded allocations are set up based on a sample interval (can be set
> > via kfence.sample_interval). After expiration of the sample interval, a
> > guarded allocation from the KFENCE object pool is returned to the main
> > allocator (SLAB or SLUB). At this point, the timer is reset, and the
> > next allocation is set up after the expiration of the interval.
> >
> > To enable/disable a KFENCE allocation through the main allocator's
> > fast-path without overhead, KFENCE relies on static branches via the
> > static keys infrastructure. The static branch is toggled to redirect the
> > allocation to KFENCE. To date, we have verified by running synthetic
> > benchmarks (sysbench I/O workloads) that a kernel compiled with KFENCE
> > is performance-neutral compared to the non-KFENCE baseline.
> >
> > For more details, see Documentation/dev-tools/kfence.rst (added later in
> > the series).
> >
> > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > Co-developed-by: Marco Elver <elver@google.com>
> > Signed-off-by: Marco Elver <elver@google.com>
> > Signed-off-by: Alexander Potapenko <glider@google.com>
> > ---
> > v3:
> > * Reports by SeongJae Park:
> >   * Remove reference to Documentation/dev-tools/kfence.rst.
> >   * Remove redundant braces.
> >   * Use CONFIG_KFENCE_NUM_OBJECTS instead of ARRAY_SIZE(...).
> >   * Align some comments.
> > * Add figure from Documentation/dev-tools/kfence.rst added later in
> >   series to patch description.
> >
> > v2:
> > * Add missing __printf attribute to seq_con_printf, and fix new warning.
> >   [reported by kernel test robot <lkp@intel.com>]
> > * Fix up some comments [reported by Jonathan Cameron].
> > * Remove 2 cases of redundant stack variable initialization
> >   [reported by Jonathan Cameron].
> > * Fix printf format [reported by kernel test robot <lkp@intel.com>].
> > * Print (in kfence-#nn) after address, to more clearly establish link
> >   between first and second stacktrace [reported by Andrey Konovalov].
> > * Make choice between KASAN and KFENCE clearer in Kconfig help text
> >   [suggested by Dave Hansen].
> > * Document CONFIG_KFENCE_SAMPLE_INTERVAL=0.
> > * Shorten memory corruption report line length.
> > * Make /sys/module/kfence/parameters/sample_interval root-writable for
> >   all builds (to enable debugging, automatic dynamic tweaking).
> > * Reports by Dmitry Vyukov:
> >   * Do not store negative size for right-located objects
> >   * Only cache-align addresses of right-located objects.
> >   * Run toggle_allocation_gate() after KFENCE is enabled.
> >   * Add empty line between allocation and free stacks.
> >   * Add comment about SLAB_TYPESAFE_BY_RCU.
> >   * Also skip internals for allocation/free stacks.
> >   * s/KFENCE_FAULT_INJECTION/KFENCE_STRESS_TEST_FAULTS/ as FAULT_INJECTION
> >     is already overloaded in different contexts.
> >   * Parenthesis for macro variable.
> >   * Lower max of KFENCE_NUM_OBJECTS config variable.
> > ---
> >  MAINTAINERS            |  11 +
> >  include/linux/kfence.h | 174 ++++++++++
> >  init/main.c            |   2 +
> >  lib/Kconfig.debug      |   1 +
> >  lib/Kconfig.kfence     |  63 ++++
> >  mm/Makefile            |   1 +
> >  mm/kfence/Makefile     |   3 +
> >  mm/kfence/core.c       | 733 +++++++++++++++++++++++++++++++++++++++++
> >  mm/kfence/kfence.h     | 102 ++++++
> >  mm/kfence/report.c     | 219 ++++++++++++
> >  10 files changed, 1309 insertions(+)
> >  create mode 100644 include/linux/kfence.h
> >  create mode 100644 lib/Kconfig.kfence
> >  create mode 100644 mm/kfence/Makefile
> >  create mode 100644 mm/kfence/core.c
> >  create mode 100644 mm/kfence/kfence.h
> >  create mode 100644 mm/kfence/report.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b5cfab015bd6..863899ed9a29 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -9673,6 +9673,17 @@ F:     include/linux/keyctl.h
> >  F:   include/uapi/linux/keyctl.h
> >  F:   security/keys/
> >
> > +KFENCE
> > +M:   Alexander Potapenko <glider@google.com>
> > +M:   Marco Elver <elver@google.com>
> > +R:   Dmitry Vyukov <dvyukov@google.com>
> > +L:   kasan-dev@googlegroups.com
> > +S:   Maintained
> > +F:   Documentation/dev-tools/kfence.rst
>
> This patch doesn't introduce this file yet, right?  How about using a separate
> final patch for MAINTAINERS update?

Sure.

> Other than that,
>
> Reviewed-by: SeongJae Park <sjpark@amazon.de>

Thanks!
