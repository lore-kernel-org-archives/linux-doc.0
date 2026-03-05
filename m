Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B223370D6F
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 11:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772710065; cv=none; b=exWGg5ygeGzCRdogz1KbDtbZNvD3b/uvWAWWg4/t+/Yvc9l1UIj35TIrp9S1Bkm+o1h22ouvA+BrbO5jIGvJ51DXf/1OvQZ+z56ahN73I3xj4EI7X1b5M1XrXloqYnnbTsXNedvY/eRA7KCL4OffA6Gy6LLJX4y02V10+UIBI+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772710065; c=relaxed/simple;
	bh=3963Gj/BlpHAutA5dNnz+RgAmj+jgV9O15M14i+syws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPHPLrOaHOZGVnugMm3cN4zjz2EY3MsCieP7ZrW0xVY4SDc05R+uo2BMuaDEFjcTalFK9KsOqASg7oJ8ugp157kypi9Xc+rgrweE8KJTKYc8U/z/g2OUMd1qGqlSMMVVastt2684MW1nNGhzcr2E1P8sKc/8Gk/erdHhuLhnIsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RqjV0rJM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RqjV0rJM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4807068eacbso66368195e9.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 03:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772710062; x=1773314862; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nZiz6kIqLrN6jdBdjk58Z5vPFIMuWArGbD6lmMCBacM=;
        b=RqjV0rJMgCKOWpPF/UtPywmhCUCtnxT35kH7a9GIaWpDS6s/LJU6GV7ACGl4z3EmxR
         yfOninE3iiNhUUH2EaYoq/AsbnR08Qogdw8XHCzwRtnSZhSHivYsPqPEA/Hf5E3GvFQT
         JJSA+VOqHTZ92tobWilOz6f5cFuG0zs4MrKdSHwy53NXxc7/t73qnVEWGEl/SXbTzORP
         jI+v9ykhGtNdukfRqukLHedrVAbacTFH9YC8J68FOer44ZaLymjwaMr5hUbNDWGla0gp
         F+CAOe+YHYZaBaWtuDLigrzI0xrRnBJVx03d5XCZ7H2QRoI0JCtyPGYY9oHhPLtukBb5
         kaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772710062; x=1773314862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZiz6kIqLrN6jdBdjk58Z5vPFIMuWArGbD6lmMCBacM=;
        b=mwTCl1qku0CI+mZcr807AcuheIKb8VxokQjrfh8O/CBPBWBLFoq8ufcidw/ERoEP5Q
         Af/On+AIETzIjGB2ilSFeEjIq0Pwm4UpAvF/yH74wKvO5HjDGQ+yzJ+4DdzRxsNmZLOd
         6w+qVnVccK1fyO6K7uzNdop7HRxAiAXRflF+2qb+P2iNEP8F8iivI2sj6LrYYaVKK7vx
         s3wuKMkPcwgKUSp2owgE66Owc/gzNtRPz6on/gInMhfSjDbJyLGs8rdGD3d0OdCDnDVS
         Kmqkhpc7HduPqp+vMEmRGKxpr0UwtD2Z7NSOxFht7XEaOUJI77yM+nhy4C9mJU4Upf7x
         ivug==
X-Forwarded-Encrypted: i=1; AJvYcCV0fXCOz0sRGl71DB6AqQf4GkZjuqYH16+Rg6IzRjklJf/C/kT7vsYE7DqkE/qiq+m73BmfJxP+hn8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+it2PWOxBOTxZX+roZvDbXcgqtquzNiUwwMk5qPe2SjS387zh
	Jhxzbk9NpW51lSYaNo1i2axqFOIsO8vdCIJvndsCHcglXgangMB1M1Kb7/+IiCtQyOE=
X-Gm-Gg: ATEYQzwcX833Q5/WoAr8oiv5DeRm6n18YHJZd2wDjSeH6OPTIAmwD4otFJvauicfzeH
	CfLALn9JTtzuLjACv9dQHwK+awYmTvEjPIvHs/qjq5tTBWIg2/m7VjPyi7X0MnOGehD66du0rFU
	4h1uJ+bhnwbX5skDdY5JZpGxk9bM3E22JJ8AzeWEsjC0XeHri5dGAxpB5rDgmNNkYNO7tcm3pQD
	bhceCqN1Y3vnr2o/7KVvDPqBahPnnPh7e/1WnyenxfEr9faOOiIKYZcT84EtPWrabTGlCXNmnqf
	BGv+8yGH3h44Xl/Q1UvBzPNRqf24LXSbgXZzVY9r6vM+scQk0lHSF72PT0tT5v9kzcp91h3vPlI
	zOY5EgVGKClFHkOMsAXA9RgbfrgHteTGaMLW45MoFi8Nq+lXzHVgRiOzdKPhjTJdROKN6jUgS77
	zn68byPyHPMIZTqTh0ahfkVNK8ew==
X-Received: by 2002:a05:600c:4ed0:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-485198a8b41mr82817835e9.24.1772710061556;
        Thu, 05 Mar 2026 03:27:41 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ae3f31dbsm37011930f8f.1.2026.03.05.03.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:27:41 -0800 (PST)
Date: Thu, 5 Mar 2026 12:27:38 +0100
From: Petr Mladek <pmladek@suse.com>
To: Doug Anderson <dianders@chromium.org>
Cc: mrungta@google.com, Jonathan Corbet <corbet@lwn.net>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Stephane Eranian <eranian@google.com>,
	Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/4] watchdog/hardlockup: Always update saved interrupts
 during check
Message-ID: <aaloqnsgdVp75xcV@pathway.suse.cz>
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
 <20260212-hardlockup-watchdog-fixes-v1-1-745f1dce04c3@google.com>
 <aahFQaHxNFsoaxEb@pathway.suse.cz>
 <CAD=FV=Vw7EQd1dDFx0Q0rHNgxRZfJCURRvysz=H9Vg+E-ae1Dg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Vw7EQd1dDFx0Q0rHNgxRZfJCURRvysz=H9Vg+E-ae1Dg@mail.gmail.com>

On Wed 2026-03-04 16:58:35, Doug Anderson wrote:
> Hi,
> 
> On Wed, Mar 4, 2026 at 6:44 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Thu 2026-02-12 14:12:10, Mayank Rungta via B4 Relay wrote:
> > > From: Mayank Rungta <mrungta@google.com>
> > >
> > > Currently, arch_touch_nmi_watchdog() causes an early return that
> > > skips updating hrtimer_interrupts_saved. This leads to stale
> > > comparisons and delayed lockup detection.
> > >
> > > Update the saved interrupt count before checking the touched flag
> > > to ensure detection timeliness.
> >
> > IMHO, it is not that easy, see below.
> >
> > So I am curious. Have you found this when debugging a particular
> > problem or just by reading the code, please?
> 
> As I understand it, Mayank found this because the watchdog was
> reacting significantly more slowly than he expected. In his caes, he
> tracked it down to the fact that 8250 console driver has several calls
> to touch_nmi_watchdog(), including on every call to console_write().
> This caused the watchdog to take _much_ longer to fire.
> 
> On devices that fairly chatty w/ their output to the serial console,
> the console_write() is called almost constantly. That means that the
> watchdog is being touched constantly. If I remember Mayank tracked it
> down as:
> 
> * watchdog_hardlockup_check() called and saves counter (1000)
> * timer runs and updates the timer (1000 -> 1001)
> * touch_nmi_watchdog() is called
> * CPU locks up
> * 10 seconds pass
> * watchdog_hardlockup_check() called and saves counter (1001)
> * 10 seconds pass
> * watchdog_hardlockup_check() called and notices touch

Great visualization!

Nit: It seems to be actually the other way around:

 * 10 seconds pass
 * watchdog_hardlockup_check() called and notices touch and skips updating counters
 * 10 seconds pass
 * watchdog_hardlockup_check() called and saves counter (1001)

> * 10 seconds pass
> * watchdog_hardlockup_check() called and finally detects lockup
> 
> ...so we detect the lockup after 30 seconds, which is pretty bad. With
> his new scheme, we'd detect the lockup in 20 seconds.

Fair enough.

> > > @@ -186,7 +186,21 @@ static void watchdog_hardlockup_kick(void)
> > >
> > >  void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
> > >  {
> > > +     bool is_hl;
> > >       int hardlockup_all_cpu_backtrace;
> > > +     /*
> > > +      * Check for a hardlockup by making sure the CPU's timer
> > > +      * interrupt is incrementing. The timer interrupt should have
> > > +      * fired multiple times before we overflow'd. If it hasn't
> > > +      * then this is a good indication the cpu is stuck
> > > +      *
> > > +      * Purposely check this _before_ checking watchdog_hardlockup_touched
> > > +      * so we make sure we still update the saved value of the interrupts.
> > > +      * Without that we'll take an extra round through this function before
> > > +      * we can detect a lockup.
> > > +      */
> > > +
> > > +     is_hl = is_hardlockup(cpu);
> > >
> > >       if (per_cpu(watchdog_hardlockup_touched, cpu)) {
> > >               per_cpu(watchdog_hardlockup_touched, cpu) = false;
> >
> > Hmm, this does not look correct to me.
> >
> > 2. Let's look at is_hardlockup() in detail:
> >
> >     static bool is_hardlockup(unsigned int cpu)
> >     {
> >         int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> >
> >         if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint) {
> >                 per_cpu(hrtimer_interrupts_missed, cpu)++;
> >                 if (per_cpu(hrtimer_interrupts_missed, cpu) >= watchdog_hardlockup_miss_thresh)
> >                         return true;
> >
> >                 return false;
> >         }
> >
> >         per_cpu(hrtimer_interrupts_saved, cpu) = hrint;
> >         per_cpu(hrtimer_interrupts_missed, cpu) = 0;
> >
> >         return false;
> >     }
> >
> >     If we call it when the watchdog was touched then
> >     (per_cpu(hrtimer_interrupts_saved, cpu) == hrint)
> >
> >         =>  per_cpu(hrtimer_interrupts_missed, cpu)++;
> >
> >     is called even when watchdog was touched.
> >
> >     As a result, we might report stall which should have been hidden,
> >     for example:
> >
> > CPU0                               CPU1
> >
> >  <NMI>
> >    watchdog_hardlockup_check() # passes
> >      is_hardlockup() # no
> >        hr_int_saved = hr_int;
> >        hr_int_missed = 0;
> >  </NMI>
> >
> >   local_irq_save()
> >     printk()
> >       console_trylock()
> >       console_unlock()
> >         console_flush_all()
> >
> >            touch_nmi_watchdog()
> >
> >                                    // Other CPUs print many messages,
> >                                    // e.g. during boot when initializing a lot of HW
> >                                    for (i=0; i<1000; i++) do
> >                                        printk();
> >
> >       <NMI>
> >         watchdog_hardlockup_check()
> >           is_hardlockup() # yes
> >             hr_int_missed++  # 1
> >
> >           # skip because touched
> >       </NMI>
> >
> >          touch_nmi_watchdog()
> >
> >       <NMI>
> >         watchdog_hardlockup_check()
> >           is_hardlockup() # yes
> >             hr_int_missed++  # 2
> >
> >           # skip because touched
> >       </NMI>
> >
> >     ... repeat many times ...
> >
> >   local_irq_restore()
> >
> >     # this might normally trigger handling of pending IRQs
> >     # including the timers. But IMHO, it can be offloaded
> >     # to a kthread (at least on RT)
> >
> >       <NMI>
> >         watchdog_hardlockup_check()
> >           is_hardlockup() # yes
> >             hr_int_missed++  # might be already 3, 4,...
> >
> >           Report hardlockup even when all the "hr_int_missed"
> >           values should have been ignored because of
> >           touch_watchdog.
> >
> >       </NMI>
> >
> >
> > A solution might be clearing "hrtimer_interrupts_missed"
> > when the watchdog was touched.
> 
> Great catch! When I was thinking about Mayank's patches, I thought
> about them independently. ...and I believe that independently, each
> patch is fine. The problem is that together they have exactly the
> problem you indicated.

Heh, I was not aware that "hrtimer_interrupts_missed" was added by
the 3rd patch. I looked at the final code with all patches applied ;-)

> Clearing "hrtimer_interrupts_missed" seems like the right solution in
> Mayank's patch #3.

OK, this 1st patch moves "is_hardlockup()" up because it has some
"side effects". It adds a 4-line comment to explain it.
But it still causes problems in the 3rd patch.

A better solution might be to separate the check and update/reset
of the values. Something like (on top of this patchset, just
compilation tested):

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 30199eaeb5d7..4d0851f0f412 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -167,18 +167,10 @@ void watchdog_hardlockup_touch_cpu(unsigned int cpu)
 	per_cpu(watchdog_hardlockup_touched, cpu) = true;
 }
 
-static bool is_hardlockup(unsigned int cpu)
+static void watchdog_hardlockup_update_reset(unsigned int cpu)
 {
 	int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
 
-	if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint) {
-		per_cpu(hrtimer_interrupts_missed, cpu)++;
-		if (per_cpu(hrtimer_interrupts_missed, cpu) >= watchdog_hardlockup_miss_thresh)
-			return true;
-
-		return false;
-	}
-
 	/*
 	 * NOTE: we don't need any fancy atomic_t or READ_ONCE/WRITE_ONCE
 	 * for hrtimer_interrupts_saved. hrtimer_interrupts_saved is
@@ -186,8 +178,20 @@ static bool is_hardlockup(unsigned int cpu)
 	 */
 	per_cpu(hrtimer_interrupts_saved, cpu) = hrint;
 	per_cpu(hrtimer_interrupts_missed, cpu) = 0;
+}
 
-	return false;
+static bool is_hardlockup(unsigned int cpu)
+{
+	int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
+
+	if (per_cpu(hrtimer_interrupts_saved, cpu) != hrint)
+		return false;
+
+	per_cpu(hrtimer_interrupts_missed, cpu)++;
+	if (per_cpu(hrtimer_interrupts_missed, cpu) < watchdog_hardlockup_miss_thresh)
+		return false;
+
+	return true;
 }
 
 static void watchdog_hardlockup_kick(void)
@@ -200,23 +204,10 @@ static void watchdog_hardlockup_kick(void)
 
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 {
-	bool is_hl;
 	int hardlockup_all_cpu_backtrace;
-	/*
-	 * Check for a hardlockup by making sure the CPU's timer
-	 * interrupt is incrementing. The timer interrupt should have
-	 * fired multiple times before we overflow'd. If it hasn't
-	 * then this is a good indication the cpu is stuck
-	 *
-	 * Purposely check this _before_ checking watchdog_hardlockup_touched
-	 * so we make sure we still update the saved value of the interrupts.
-	 * Without that we'll take an extra round through this function before
-	 * we can detect a lockup.
-	 */
-
-	is_hl = is_hardlockup(cpu);
 
 	if (per_cpu(watchdog_hardlockup_touched, cpu)) {
+		watchdog_hardlockup_update_reset(cpu);
 		per_cpu(watchdog_hardlockup_touched, cpu) = false;
 		return;
 	}
@@ -224,7 +215,13 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 	hardlockup_all_cpu_backtrace = (hardlockup_si_mask & SYS_INFO_ALL_BT) ?
 					1 : sysctl_hardlockup_all_cpu_backtrace;
 
-	if (is_hl) {
+	/*
+	 * Check for a hardlockup by making sure the CPU's timer
+	 * interrupt is incrementing. The timer interrupt should have
+	 * fired multiple times before we overflow'd. If it hasn't
+	 * then this is a good indication the cpu is stuck
+	 */
+	if (is_hardlockup(cpu)) {
 		unsigned int this_cpu = smp_processor_id();
 		unsigned long flags;
 
@@ -290,6 +287,7 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 
 		per_cpu(watchdog_hardlockup_warned, cpu) = true;
 	} else {
+		watchdog_hardlockup_update_reset(cpu);
 		per_cpu(watchdog_hardlockup_warned, cpu) = false;
 	}
 }

> > But honestly, I am not sure if this is worth the complexity.
> >
> >
> > Higher level look:
> > ------------------
> >
> > My understanding is that this patch has an effect only when
> > touch_nmi_watchdog() is called as frequently as
> > watchdog_hardlockup_check().
> >
> > The original code gives the system more time to recover after
> > a known stall (touch_nmi_watchdog() called).
> >
> > The new code is more eager to report a stall. It might be more prone
> > to report "false" positives.
> >
> > IMHO, the root of the problem is that touch_nmi_watchdog() is
> > called too frequently. And this patch is rather dancing around
> > then fixing it.
> 
> I don't think it's really any more likely to report false positives
> after the bug you pointed out is fixed. The old watchdog was just too
> conservative. With Mayank's proposal I think calling
> touch_nmi_watchdog() should reset the watchdog the same amount as
> letting the hrtimer run once and that seems like a very reasonable
> interpretation.

Fair enough.

> > Alternative:
> > ------------
> >
> > An alternative solution might to detect and report when too many
> > watchdog_hardlockup_check() calls are ignored because of
> > touch_nmi_watchdog().
> >
> > It might help to find a mis-use of touch_nmi_watchdog(). The question
> > is what details should be reported in this case.
> >
> > It should be optional because touch_nmi_watchdog() is supposed
> > to hide "well-known" sinners after all.
> 
> Hmmmm. I certainly support trying to reduce the number of places that
> call touch_nmi_watchdog(), but at the same time I don't think Mayank's
> patch is "dancing around" the problem. IMO considering the
> touch_nmi_watchdog() to be "pretend a timer interrupt fired" is the
> intuitive way one would think the call should work. The fact that the
> code gave an entire extra 10 seconds before the watchdog could be
> caught just feels like a bug that should be fixed.
> 
> For the 8250 driver in particular, it looks like the
> touch_nmi_watchdog() was removed from serial8250_console_write() as
> part of nbcon, but then that got reverted. That would still leave two
> other touch_nmi_watchdog() calls in that driver...

Sigh, it seems that touch_nmi_watchdog() can't be removed easily.

Best Regards,
Petr
