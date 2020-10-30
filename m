Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3939FC00A89
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 15:42:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4D9920657
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 15:42:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DTRV++Wj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgJ3PmL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 11:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgJ3PmK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Oct 2020 11:42:10 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13280C0613D2
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 08:42:10 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id 9so7063730oir.5
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 08:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jliMwvFbMuf3FmeyCOZHebsGYCHgE565UHogT5/5F4c=;
        b=DTRV++Wj97wRkgJERXq0rJLt5u61M6aqsGpPrrOnjKGZx0REQwXzkR/pMuc8yZvrEZ
         g2R1TVm26ePxCZVC0YEei38ODl21B1c3cWcMr2+PJorWGXwMP6J5U0Ntm+10TM2p6tJV
         CpCTQDAOD8oVls4YRHUrINL85+YtP9RuBxOGPHozp/ye9UomJjfrAgkI4rC1viw6jBG1
         u1uT9ybUrxa3TuQUNEFsK7bR9VjHCl2kWaOmTzJSlRJDGUptBLq263qR0rJJEHAyP3Aj
         vpPFDPfu3rWEXImVRC/Ipfyq5ldHGwmYoQ/ppzDNpXCJDsezNiAo0JKRBtZ5i7/I6ZB9
         zmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jliMwvFbMuf3FmeyCOZHebsGYCHgE565UHogT5/5F4c=;
        b=V182IU6MRU7KuEvX3Luw5hhrsdP9wuL8KGAsBXg0I2EzyRswkyfrnpj2KMkWeN6H2j
         /o7OXvm3NKpC4ZIIr7eWBoONk/ilzI2lcRi8EqDaJNri4cuUpmf3d4ez82ce5D3EI7Dt
         5o2/LyrAvQDbnA5IpARqjw7ss8lNxI6fqoeS7lZ+Erl6QahRY8E0wUkio8FhwlK2zP9m
         /vqIjpTwglXqXxHDtou6dXdTI1TP9WHFk6sHIm5hFHxmGwcSsTeJTCvzmNIvDQg28f4z
         /yrf9dtdOdzp2U+YHHfsPOGJLkO/dxRT2SKZ2rtSSLChtnJS3dd27j/+CxQGvKPXogUI
         ktxw==
X-Gm-Message-State: AOAM530dl11jUMV8QvNyymGSrlCjUo3xVerOzFOgBTHT5yMZO9EV//vm
        WQ46rHpVR6881PqUZ0MIBNABDyEXZYZb9fQ6WrWxvA==
X-Google-Smtp-Source: ABdhPJz78rXAmUYJT2EaihG4wO2tbRCMfvht01XOnXsfIeEuKEo7TR1erogbgNJurtY7525vFsiGR0VO98zOblDC/OA=
X-Received: by 2002:aca:6206:: with SMTP id w6mr2138653oib.121.1604072528251;
 Fri, 30 Oct 2020 08:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201029131649.182037-1-elver@google.com> <20201029131649.182037-5-elver@google.com>
 <CAG48ez1DxttDs6vj61c0jSGSbhoUmAW9_OSBSENrC-=hz-d+HA@mail.gmail.com>
In-Reply-To: <CAG48ez1DxttDs6vj61c0jSGSbhoUmAW9_OSBSENrC-=hz-d+HA@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 30 Oct 2020 16:41:56 +0100
Message-ID: <CANpmjNOPmgeVLb5COyE734F-1NNSU4vfok-8AQuDoAcLnQ=PbQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/9] mm, kfence: insert KFENCE hooks for SLAB
To:     Jann Horn <jannh@google.com>
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

On Fri, 30 Oct 2020 at 03:49, Jann Horn <jannh@google.com> wrote:
> On Thu, Oct 29, 2020 at 2:17 PM Marco Elver <elver@google.com> wrote:
> > Inserts KFENCE hooks into the SLAB allocator.
> [...]
> > diff --git a/mm/slab.c b/mm/slab.c
> [...]
> > @@ -3416,6 +3427,11 @@ static void cache_flusharray(struct kmem_cache *cachep, struct array_cache *ac)
> >  static __always_inline void __cache_free(struct kmem_cache *cachep, void *objp,
> >                                          unsigned long caller)
> >  {
> > +       if (kfence_free(objp)) {
> > +               kmemleak_free_recursive(objp, cachep->flags);
> > +               return;
> > +       }
>
> This looks dodgy. Normally kmemleak is told that an object is being
> freed *before* the object is actually released. I think that if this
> races really badly, we'll make kmemleak stumble over this bit in
> create_object():
>
> kmemleak_stop("Cannot insert 0x%lx into the object search tree
> (overlaps existing)\n",
>       ptr);

Good catch. Although extremely unlikely, let's just avoid it by moving
the freeing after.

>
> > +
> >         /* Put the object into the quarantine, don't touch it for now. */
> >         if (kasan_slab_free(cachep, objp, _RET_IP_))
> >                 return;
