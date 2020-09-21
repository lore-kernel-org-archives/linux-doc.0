Return-Path: <SRS0=TOdD=C6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D39C4347E
	for <linux-doc@archiver.kernel.org>; Mon, 21 Sep 2020 17:37:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5D542151B
	for <linux-doc@archiver.kernel.org>; Mon, 21 Sep 2020 17:37:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pamzCqMF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgIURh0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Sep 2020 13:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbgIURhZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Sep 2020 13:37:25 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AEB6C0613CF
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2020 10:37:25 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id w16so17855132oia.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2020 10:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SSZ5KD0dn5jNkyMg9eCMzr2gsc7k3aZ4lV6MBn/HzxM=;
        b=pamzCqMFvLxyB5CpBGbPG7bal5m7ItNuXjTj8pGae/ftLVAUC9Bg/FS/A8URLMlfMZ
         v2hnX2ZiM5g+TmrpgLFmX5dspappl51u7l1LCJ/npH4P7y2d8PWGiHoeKFxbKCCmzYAA
         oq+Dfknz4oBZh1CSWxrSzt7fevC4E+ZUEYf9W75Itjt2/Bb3W1dOloFHulv6qpuJ77Iv
         6pGCKmLfRlit/7xrESXwIqWaLEtuLil1p1IxWo78xjv2ztZVlx3nK1W+gbUI3Djje/uH
         Rfey8oUk8KDSI3TO5wkqPrR52MyHKkNTF30i8jxkCbC8d2rE7iPyHVDjYQIvHPalvuch
         JiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SSZ5KD0dn5jNkyMg9eCMzr2gsc7k3aZ4lV6MBn/HzxM=;
        b=q6eS+88ebihZZapvXEaEE8cR8C3lSqsnbX3whdkJ8Uq7CH5wiZFa2rzETavVQPrjwG
         vGcXnntMzjTGRQeZviRe4B995KMknczm2GooAfEyRNorFPNQJfDtJ6mm8Nl7zYADBvuk
         rC5Ra2mEYcDCERSbDRNPpQDmUwCSXFy7AGZJ9zHGR9jxYnNULbs1+hK2NCiSfVHobJI9
         Rr+ixJtWbt2Xqe/0nJLUu9OTTZI0T6m7Hplwhlx/e2ccawxr1kfzvpN3BfXX0yfpN7hH
         OT2F9GEbCohVv68AjZXAbw+Fu47D4Tu/n1Yg2DeqzdqK4RP/WPWZ6xggpF/kbSm0gqG6
         xlrQ==
X-Gm-Message-State: AOAM533c1DRGZX4QKQBEgQzUVQuLeUyJ12hV/WuKP0Fv+aHNgvgqAqGj
        ENu8Y0FnQyobxxcHC29aha7A54Rigjd+R4s6W+3Oiw==
X-Google-Smtp-Source: ABdhPJy20vPuOn/xg/yLOqvqr+k3gT/RowlyliM3IYwweuAlnymXHBeynnmaqK/ExV2lh0t/6GAyPWsl92e/++ZSr1U=
X-Received: by 2002:aca:5158:: with SMTP id f85mr303275oib.121.1600709844512;
 Mon, 21 Sep 2020 10:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com> <20200921132611.1700350-11-elver@google.com>
 <20200921171325.GE29330@paulmck-ThinkPad-P72>
In-Reply-To: <20200921171325.GE29330@paulmck-ThinkPad-P72>
From:   Marco Elver <elver@google.com>
Date:   Mon, 21 Sep 2020 19:37:13 +0200
Message-ID: <CANpmjNPiAvyn+oARU39yOx7zxMxV8JHiSS_41H+65D_-MKmk7A@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] kfence: add test suite
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Potapenko <glider@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
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
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
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
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 21 Sep 2020 at 19:13, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Mon, Sep 21, 2020 at 03:26:11PM +0200, Marco Elver wrote:
> > Add KFENCE test suite, testing various error detection scenarios. Makes
> > use of KUnit for test organization. Since KFENCE's interface to obtain
> > error reports is via the console, the test verifies that KFENCE outputs
> > expected reports to the console.
> >
> > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > Co-developed-by: Alexander Potapenko <glider@google.com>
> > Signed-off-by: Alexander Potapenko <glider@google.com>
> > Signed-off-by: Marco Elver <elver@google.com>
>
> [ . . . ]
>
> > +/* Test SLAB_TYPESAFE_BY_RCU works. */
> > +static void test_memcache_typesafe_by_rcu(struct kunit *test)
> > +{
> > +     const size_t size = 32;
> > +     struct expect_report expect = {
> > +             .type = KFENCE_ERROR_UAF,
> > +             .fn = test_memcache_typesafe_by_rcu,
> > +     };
> > +
> > +     setup_test_cache(test, size, SLAB_TYPESAFE_BY_RCU, NULL);
> > +     KUNIT_EXPECT_TRUE(test, test_cache); /* Want memcache. */
> > +
> > +     expect.addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
> > +     *expect.addr = 42;
> > +
> > +     rcu_read_lock();
> > +     test_free(expect.addr);
> > +     KUNIT_EXPECT_EQ(test, *expect.addr, (char)42);
> > +     rcu_read_unlock();
>
> It won't happen very often, but memory really could be freed at this point,
> especially in CONFIG_RCU_STRICT_GRACE_PERIOD=y kernels ...

Ah, thanks for pointing it out.

> > +     /* No reports yet, memory should not have been freed on access. */
> > +     KUNIT_EXPECT_FALSE(test, report_available());
>
> ... so the above statement needs to go before the rcu_read_unlock().

You mean the comment (and not the KUNIT_EXPECT_FALSE that no reports
were generated), correct?

Admittedly, the whole comment is a bit imprecise, so I'll reword.

> > +     rcu_barrier(); /* Wait for free to happen. */
>
> But you are quite right that the memory is not -guaranteed- to be freed
> until we get here.

Right, I'll update the comment.

Thanks,
-- Marco
