Return-Path: <SRS0=YNrp=DQ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F37C433E7
	for <linux-doc@archiver.kernel.org>; Fri,  9 Oct 2020 17:41:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFB4D2227E
	for <linux-doc@archiver.kernel.org>; Fri,  9 Oct 2020 17:41:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="teg3EY+1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732041AbgJIRlG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Oct 2020 13:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387655AbgJIRk3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Oct 2020 13:40:29 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD51C0613D5
        for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2020 10:40:29 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id v12so10629171wmh.3
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2020 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jlGJz5/Gwof+W4rud68ka3SNYNEZKejaW6R1zlgBIpo=;
        b=teg3EY+1daVLL0UdvTTQTJ0cy289r3xD9FwLsKpXsFfjHK/YF7s1tBVchWh/5qS/jo
         Ux3Ag+UmrWT0xiVPy1R/AMi2+O0LtwiooU7LdxZtDro4PEX/5quBf8iitVVyCxMClNnQ
         DDEwvbh0F1iAJheGaGxNqzmIerDKwPEwrjOlMpeodZXGdXVgI1mtzmA+rZ1WO6zvHim0
         4ouzfObX9uOCK/Emr+TXtMBQvx29tXWw0Hvxl+4nhB/cDJyyMG0rF30602bDJcL7COBl
         QbUxsr2C4nFQj2MApHkMIgURwGIK9nFW5/GEuzeXib+A3QBW/LMC1kE7v8dTAlaBu5aX
         vp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jlGJz5/Gwof+W4rud68ka3SNYNEZKejaW6R1zlgBIpo=;
        b=Q1Aa9VDE5exUIDUSN7Ahc2gLCJScL9r3kFhysBIHzSsNtU/h94WbhHVSs9Y4yWELBE
         mza9GG8f2gm/EJ3dDGpZkRoG72GmSF/aaOu/lVhj7m8TzmSLfNnY9yQYxe9ccTHlD5Gq
         V0DAhaY97L4IyNuiIbfCEF/OSVY9pEgnAdTbFuFqbf08Vqxy7Y8gYPvUN/5T4D2g/M58
         OjXlJDTYG0kZV2iWLclI8VEjwGIThF5v37e1ybi31tb1PSBUUNf/bd/q4CjD1CNBnZOR
         Ym1cIOZhmRaaLiVrqM4jfaEufQr/XMX0yxQv94Jtyi1M0ZDSuDkF2DvpQAK4YFYq7avS
         jz4Q==
X-Gm-Message-State: AOAM5337PNJOtjiz0ghWR6fZ2MQ5kC89AdtD91VNiqoNPreePkKvmToJ
        sZYkh+iNp5ClE5TunQR9OG7m8w==
X-Google-Smtp-Source: ABdhPJyVg356+1RWEQY7Mynabzoo2cJm6jwNSIHCdWOgWgbdGifWNPtV/sTRf4yAdVbyrUaeL6Q8yQ==
X-Received: by 2002:a1c:c28a:: with SMTP id s132mr16271717wmf.13.1602265227336;
        Fri, 09 Oct 2020 10:40:27 -0700 (PDT)
Received: from elver.google.com ([100.105.32.75])
        by smtp.gmail.com with ESMTPSA id n9sm12465852wrq.72.2020.10.09.10.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 10:40:26 -0700 (PDT)
Date:   Fri, 9 Oct 2020 19:40:20 +0200
From:   Marco Elver <elver@google.com>
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
Subject: Re: [PATCH v4 02/11] x86, kfence: enable KFENCE for x86
Message-ID: <20201009174020.GA2263081@elver.google.com>
References: <20200929133814.2834621-1-elver@google.com>
 <20200929133814.2834621-3-elver@google.com>
 <CAG48ez3OKj5Y8BURmqU9BAYWFJH8E8B5Dj9c0=UHutqf7r3hhg@mail.gmail.com>
 <CANpmjNP6mukCZ931_aW9dDqbkOyv=a2zbS7MuEMkE+unb7nYeg@mail.gmail.com>
 <CAG48ez0sYZof_PDdNrqPUnNOCz1wcauma+zWJbF+VdUuO6x31w@mail.gmail.com>
 <CANpmjNOZtkFcyL8FTRTZ6j2yqCOb2Hgsy8eF8n5zgd7mDYezkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNOZtkFcyL8FTRTZ6j2yqCOb2Hgsy8eF8n5zgd7mDYezkw@mail.gmail.com>
User-Agent: Mutt/1.14.5 (2020-06-23)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 07, 2020 at 04:41PM +0200, Marco Elver wrote:
> On Wed, 7 Oct 2020 at 16:15, Jann Horn <jannh@google.com> wrote:
[...]
> > > > > +               return false;
> > > > > +
> > > > > +       if (protect)
> > > > > +               set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_PRESENT));
> > > > > +       else
> > > > > +               set_pte(pte, __pte(pte_val(*pte) | _PAGE_PRESENT));
> > > >
> > > > Hmm... do we have this helper (instead of using the existing helpers
> > > > for modifying memory permissions) to work around the allocation out of
> > > > the data section?
> > >
> > > I just played around with using the set_memory.c functions, to remind
> > > myself why this didn't work. I experimented with using
> > > set_memory_{np,p}() functions; set_memory_p() isn't implemented, but
> > > is easily added (which I did for below experiment). However, this
> > > didn't quite work:
> > [...]
> > > For one, smp_call_function_many_cond() doesn't want to be called with
> > > interrupts disabled, and we may very well get a KFENCE allocation or
> > > page fault with interrupts disabled / within interrupts.
> > >
> > > Therefore, to be safe, we should avoid IPIs.
> >
> > set_direct_map_invalid_noflush() does that, too, I think? And that's
> > already implemented for both arm64 and x86.
> 
> Sure, that works.
> 
> We still want the flush_tlb_one_kernel(), at least so the local CPU's
> TLB is flushed.

Nope, sorry, set_direct_map_invalid_noflush() does not work -- this
results in potential deadlock.

	================================
	WARNING: inconsistent lock state
	5.9.0-rc4+ #2 Not tainted
	--------------------------------
	inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
	ksoftirqd/1/16 [HC0[0]:SC1[1]:HE1:SE0] takes:
	ffffffff89fcf9b8 (cpa_lock){+.?.}-{2:2}, at: spin_lock include/linux/spinlock.h:354 [inline]
	ffffffff89fcf9b8 (cpa_lock){+.?.}-{2:2}, at: __change_page_attr_set_clr+0x1b0/0x2510 arch/x86/mm/pat/set_memory.c:1658
	{SOFTIRQ-ON-W} state was registered at:
	  lock_acquire+0x1f3/0xae0 kernel/locking/lockdep.c:5006
	  __raw_spin_lock include/linux/spinlock_api_smp.h:142 [inline]
	  _raw_spin_lock+0x2a/0x40 kernel/locking/spinlock.c:151
	  spin_lock include/linux/spinlock.h:354 [inline]
	  __change_page_attr_set_clr+0x1b0/0x2510 arch/x86/mm/pat/set_memory.c:1658
	  change_page_attr_set_clr+0x333/0x500 arch/x86/mm/pat/set_memory.c:1752
	  change_page_attr_set arch/x86/mm/pat/set_memory.c:1782 [inline]
	  set_memory_nx+0xb2/0x110 arch/x86/mm/pat/set_memory.c:1930
	  free_init_pages+0x73/0xc0 arch/x86/mm/init.c:876
	  alternative_instructions+0x155/0x1a4 arch/x86/kernel/alternative.c:738
	  check_bugs+0x1bd0/0x1c77 arch/x86/kernel/cpu/bugs.c:140
	  start_kernel+0x486/0x4b6 init/main.c:1042
	  secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:243
	irq event stamp: 14564
	hardirqs last  enabled at (14564): [<ffffffff8828cadf>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:160 [inline]
	hardirqs last  enabled at (14564): [<ffffffff8828cadf>] _raw_spin_unlock_irqrestore+0x6f/0x90 kernel/locking/spinlock.c:191
	hardirqs last disabled at (14563): [<ffffffff8828d239>] __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:108 [inline]
	hardirqs last disabled at (14563): [<ffffffff8828d239>] _raw_spin_lock_irqsave+0xa9/0xce kernel/locking/spinlock.c:159
	softirqs last  enabled at (14486): [<ffffffff8147fcff>] run_ksoftirqd kernel/softirq.c:652 [inline]
	softirqs last  enabled at (14486): [<ffffffff8147fcff>] run_ksoftirqd+0xcf/0x170 kernel/softirq.c:644
	softirqs last disabled at (14491): [<ffffffff8147fcff>] run_ksoftirqd kernel/softirq.c:652 [inline]
	softirqs last disabled at (14491): [<ffffffff8147fcff>] run_ksoftirqd+0xcf/0x170 kernel/softirq.c:644

	other info that might help us debug this:
	 Possible unsafe locking scenario:

	       CPU0
	       ----
	  lock(cpa_lock);
	  <Interrupt>
	    lock(cpa_lock);

	 *** DEADLOCK ***

	1 lock held by ksoftirqd/1/16:
	 #0: ffffffff8a067e20 (rcu_callback){....}-{0:0}, at: rcu_do_batch kernel/rcu/tree.c:2418 [inline]
	 #0: ffffffff8a067e20 (rcu_callback){....}-{0:0}, at: rcu_core+0x55d/0x1130 kernel/rcu/tree.c:2656

	stack backtrace:
	CPU: 1 PID: 16 Comm: ksoftirqd/1 Not tainted 5.9.0-rc4+ #2
	Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1 04/01/2014
	Call Trace:
	 __dump_stack lib/dump_stack.c:77 [inline]
	 dump_stack+0x198/0x1fd lib/dump_stack.c:118
	 print_usage_bug kernel/locking/lockdep.c:3350 [inline]
	 valid_state kernel/locking/lockdep.c:3361 [inline]
	 mark_lock_irq kernel/locking/lockdep.c:3575 [inline]
	 mark_lock.cold+0x12/0x17 kernel/locking/lockdep.c:4006
	 mark_usage kernel/locking/lockdep.c:3905 [inline]
	 __lock_acquire+0x1159/0x5780 kernel/locking/lockdep.c:4380
	 lock_acquire+0x1f3/0xae0 kernel/locking/lockdep.c:5006
	 __raw_spin_lock include/linux/spinlock_api_smp.h:142 [inline]
	 _raw_spin_lock+0x2a/0x40 kernel/locking/spinlock.c:151
	 spin_lock include/linux/spinlock.h:354 [inline]
	 __change_page_attr_set_clr+0x1b0/0x2510 arch/x86/mm/pat/set_memory.c:1658
	 __set_pages_np arch/x86/mm/pat/set_memory.c:2184 [inline]
	 set_direct_map_invalid_noflush+0xd2/0x110 arch/x86/mm/pat/set_memory.c:2189
	 kfence_protect_page arch/x86/include/asm/kfence.h:62 [inline]
	 kfence_protect+0x10e/0x120 mm/kfence/core.c:124
	 kfence_guarded_free+0x380/0x880 mm/kfence/core.c:375
	 rcu_do_batch kernel/rcu/tree.c:2428 [inline]
	 rcu_core+0x5ca/0x1130 kernel/rcu/tree.c:2656
	 __do_softirq+0x1f8/0xb23 kernel/softirq.c:298
	 run_ksoftirqd kernel/softirq.c:652 [inline]
	 run_ksoftirqd+0xcf/0x170 kernel/softirq.c:644
	 smpboot_thread_fn+0x655/0x9e0 kernel/smpboot.c:165
	 kthread+0x3b5/0x4a0 kernel/kthread.c:292
	 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294


