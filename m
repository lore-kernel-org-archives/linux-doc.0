Return-Path: <SRS0=TOdD=C6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0143C4347E
	for <linux-doc@archiver.kernel.org>; Mon, 21 Sep 2020 17:48:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9812B22262
	for <linux-doc@archiver.kernel.org>; Mon, 21 Sep 2020 17:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600710509;
	bh=+LrtWrB/YrmXALBTyY0f60jzeqjafAoXq/e/i/AT3Dw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:List-ID:
	 From;
	b=16Tf36FOLztFDPVaf+9oQw2dv4zzwC+jpkJpZxABLXmYzn9grR3C6cNa0PaLom4JT
	 14G+y1REU4ywitp9yHadzN+8IYj4nkEjJGnB8uvm0i3LvoUVYyG6jfXB1ObLMkFpKJ
	 L2a82bgYgSqNrxgvGj8RP8z4kUaj0G4lTFPjS8uU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgIURs3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Sep 2020 13:48:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:38376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726537AbgIURs3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 Sep 2020 13:48:29 -0400
Received: from paulmck-ThinkPad-P72.home (unknown [50.45.173.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 316392193E;
        Mon, 21 Sep 2020 17:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600710508;
        bh=+LrtWrB/YrmXALBTyY0f60jzeqjafAoXq/e/i/AT3Dw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=T4oPJpc3zGBvo6gaEbUhE7CZH2GIgVqggZVoxF++8x5XjrT0k0xFuBvmIsrCTCYnI
         suHtgCs8P9zaNvOk+9hXZPb/z4sljpAQXhUuosoTYmSaJ8IIZAooG/3yCPuEgMIfyw
         3I6gtpXwpyZhRq+GabN5WTDIqbSYrC3OseR72KBg=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id D2957352303A; Mon, 21 Sep 2020 10:48:27 -0700 (PDT)
Date:   Mon, 21 Sep 2020 10:48:27 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Marco Elver <elver@google.com>
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
        the arch/x86 maintainers <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v3 10/10] kfence: add test suite
Message-ID: <20200921174827.GG29330@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200921132611.1700350-1-elver@google.com>
 <20200921132611.1700350-11-elver@google.com>
 <20200921171325.GE29330@paulmck-ThinkPad-P72>
 <CANpmjNPiAvyn+oARU39yOx7zxMxV8JHiSS_41H+65D_-MKmk7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNPiAvyn+oARU39yOx7zxMxV8JHiSS_41H+65D_-MKmk7A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 21, 2020 at 07:37:13PM +0200, Marco Elver wrote:
> On Mon, 21 Sep 2020 at 19:13, Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Mon, Sep 21, 2020 at 03:26:11PM +0200, Marco Elver wrote:
> > > Add KFENCE test suite, testing various error detection scenarios. Makes
> > > use of KUnit for test organization. Since KFENCE's interface to obtain
> > > error reports is via the console, the test verifies that KFENCE outputs
> > > expected reports to the console.
> > >
> > > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > > Co-developed-by: Alexander Potapenko <glider@google.com>
> > > Signed-off-by: Alexander Potapenko <glider@google.com>
> > > Signed-off-by: Marco Elver <elver@google.com>
> >
> > [ . . . ]
> >
> > > +/* Test SLAB_TYPESAFE_BY_RCU works. */
> > > +static void test_memcache_typesafe_by_rcu(struct kunit *test)
> > > +{
> > > +     const size_t size = 32;
> > > +     struct expect_report expect = {
> > > +             .type = KFENCE_ERROR_UAF,
> > > +             .fn = test_memcache_typesafe_by_rcu,
> > > +     };
> > > +
> > > +     setup_test_cache(test, size, SLAB_TYPESAFE_BY_RCU, NULL);
> > > +     KUNIT_EXPECT_TRUE(test, test_cache); /* Want memcache. */
> > > +
> > > +     expect.addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
> > > +     *expect.addr = 42;
> > > +
> > > +     rcu_read_lock();
> > > +     test_free(expect.addr);
> > > +     KUNIT_EXPECT_EQ(test, *expect.addr, (char)42);
> > > +     rcu_read_unlock();
> >
> > It won't happen very often, but memory really could be freed at this point,
> > especially in CONFIG_RCU_STRICT_GRACE_PERIOD=y kernels ...
> 
> Ah, thanks for pointing it out.
> 
> > > +     /* No reports yet, memory should not have been freed on access. */
> > > +     KUNIT_EXPECT_FALSE(test, report_available());
> >
> > ... so the above statement needs to go before the rcu_read_unlock().
> 
> You mean the comment (and not the KUNIT_EXPECT_FALSE that no reports
> were generated), correct?
> 
> Admittedly, the whole comment is a bit imprecise, so I'll reword.

I freely confess that I did not research exactly what might generate
a report.  But if this KUNIT_EXPECT_FALSE() was just verifying that the
previous KUNIT_EXPECT_TRUE() did not trigger, then yes, the code is just
fine as it is.

							Thanx, Paul

> > > +     rcu_barrier(); /* Wait for free to happen. */
> >
> > But you are quite right that the memory is not -guaranteed- to be freed
> > until we get here.
> 
> Right, I'll update the comment.
> 
> Thanks,
> -- Marco
