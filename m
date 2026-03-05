Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBF91DF970
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 00:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772672337; cv=none; b=f9pavXc3YB+LGqAyPO8e7FHsGuN9JI2dRb6VRhFND/41zOYkK4NVWPsUpU1Lm+ehYb0AMENw7/2xU7bStvla9/dLNm1kCVWivWLe6MEml6pTfhBJVF3GdpzPS5LKHeDtW45sPVSsBzQIUWlIG/r7LAv+T07PXPM7WTQkU5g+jt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772672337; c=relaxed/simple;
	bh=BvfXOotTS69bp9xb0WuWV5tPg7oCr6KiRnynTPemEFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d28O9G2xSqgLHr8w5iaxyHZ59IID8erv7aFVxeSSoNnpTeWm/3dWvJtckDL8wl6FVUv5zH4wGG8Vfeq31vzyoGnNUUyxaipA15t2C9DmQUym4wPDdBV8sc4p5WBuQ9hiu8kuTaQ0YJE28CshIEdhhNr5raEeBNkJjAT0f/R1MD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nukyfQFj; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nukyfQFj"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so1007906966b.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 16:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772672330; x=1773277130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wk4aZ372gXNfN7PBIXsMHyTobOktS3UkiI+Fu8/4ipU=;
        b=nukyfQFjOvcvhqtgfjhV2rC5FkTpbZ3dXd572Me2cWLVge3BTB8glDts1LWUyabIeD
         Ax4zkkgi9ndtOWicMfj5D88VZD4D0ffQfzqGx1WONDu4R1OCuinuSHTkAsfsG7XGLxGQ
         WA9Sf4Ki6SPlbobtpQ2euZa528z0lP6tzZRbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772672330; x=1773277130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wk4aZ372gXNfN7PBIXsMHyTobOktS3UkiI+Fu8/4ipU=;
        b=qJDSqS56g36Fq5mNDKkSNh2h/Nn4aO1jwLNx7OiyYXIz67696yWuu8v7dTSqmi5h7A
         7555+tz86vvwOs1mjD5sXtfD3fqhWkMLNE1W+IERyQV9fR1DzrsAPnONoPdzRJyn99Rl
         iHsnw26QcQwl2WcNNb5iwp5OdE3KtuHI0jTprFbmH3P/a0SJjdHYLfqv245VznHJ8tTS
         8QqGHcvuNB3IR0HAk3UAHtQ0lifpx6wH1Torxlz102td5yQfOEqwzt5z1qR63aCD1lX3
         bplsHqofynCu5ivIVx9y6zSqfShU6IXOgg0aGjtuIkvb/tZ3nYkXYR5jpoOLk/5ggWCX
         PezQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF3dL1oPXY0dkoVqd3dPCYHfTIxz7rtoflUUuD9uWFWiv0TWPc4D6B+P3udmpdIijHQHOctEsv7mw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAz6uvmaqhGOvSEB1fZP4wy+C+u140jB7+YyikcubVHCp/JJZO
	pTA98Qh5frBql5jPbfYFZVtqsA+uQ+zS76bwDr9Ewqaw+UwfWA/d1iAVYuFuCMMpc56n6cc3nwx
	nG7aH4Q==
X-Gm-Gg: ATEYQzxeH6suPXLNbjfVJfPA6HnIeU0CFQ9Cd8WN1IX717KAYRYXNRA9Ms7SjMDX30H
	mgcH8bJgzc608aaFNx4KXqz8i/PS6p9KwVTAJzCeC0wmIJSg6GlhkK2oZ44WaN/1XFZuBz0q3FT
	h+K8ATXf2JYj/REl6tqY0ebDZETYyd1v6XQ7kHNoEcn9hMnoR2TRLWSqCqcNijC2RyqBkCEWbd6
	KaWyTFoj6IkcPXB8B0FwElSjajnxcSIVevpM5rvToPJaNeNb/XT1wiIvCcqXLxgZjaRVvEXXDJa
	7CnGAdg5bM4SNOZ9hgOsrAESde9f8wf+V5Wj2TvOtbdtxKJb4S89MbgBb/sce91cdkZkiUve0T8
	zmOG+Z3BMqp+PJlVGlSCjUQyJuJ3nk+H8zKnIx+K3oj2QX9nvIlrp+Ixbql/LxFebuswrCJxRxq
	yGlOJen8/P3XHVUD9nEjnJPLZM+pnjMzWBjnscoKGH5nrZyb8qv3lfOgbANanNlw==
X-Received: by 2002:a17:907:3f9d:b0:b73:1634:6d71 with SMTP id a640c23a62f3a-b93f139a117mr264564166b.26.1772672329506;
        Wed, 04 Mar 2026 16:58:49 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660a4d337f1sm2174918a12.10.2026.03.04.16.58.47
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 16:58:49 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439ac15f35fso4336579f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 16:58:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcJ1rIxjdvPrnhceorERZnptStfKp0yhluwxjAQTM0YBJc1j4ygYB2V8IIxou5cpmE1v7YGj2sJlY=@vger.kernel.org
X-Received: by 2002:a05:6000:2381:b0:439:b3c5:ea20 with SMTP id
 ffacd0b85a97d-439c7f64c41mr6829735f8f.5.1772672327028; Wed, 04 Mar 2026
 16:58:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
 <20260212-hardlockup-watchdog-fixes-v1-1-745f1dce04c3@google.com> <aahFQaHxNFsoaxEb@pathway.suse.cz>
In-Reply-To: <aahFQaHxNFsoaxEb@pathway.suse.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Mar 2026 16:58:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vw7EQd1dDFx0Q0rHNgxRZfJCURRvysz=H9Vg+E-ae1Dg@mail.gmail.com>
X-Gm-Features: AaiRm51hyvLSboO_uzISiJEg61pCsnmnA0W92wisNcsBjaRkMrn-aN4tUPBPPT0
Message-ID: <CAD=FV=Vw7EQd1dDFx0Q0rHNgxRZfJCURRvysz=H9Vg+E-ae1Dg@mail.gmail.com>
Subject: Re: [PATCH 1/4] watchdog/hardlockup: Always update saved interrupts
 during check
To: Petr Mladek <pmladek@suse.com>
Cc: mrungta@google.com, Jonathan Corbet <corbet@lwn.net>, 
	Jinchao Wang <wangjinchao600@gmail.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Stephane Eranian <eranian@google.com>, Ian Rogers <irogers@google.com>, 
	Li Huafei <lihuafei1@huawei.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Max Kellermann <max.kellermann@ionos.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 4, 2026 at 6:44=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrote=
:
>
> On Thu 2026-02-12 14:12:10, Mayank Rungta via B4 Relay wrote:
> > From: Mayank Rungta <mrungta@google.com>
> >
> > Currently, arch_touch_nmi_watchdog() causes an early return that
> > skips updating hrtimer_interrupts_saved. This leads to stale
> > comparisons and delayed lockup detection.
> >
> > Update the saved interrupt count before checking the touched flag
> > to ensure detection timeliness.
>
> IMHO, it is not that easy, see below.
>
> So I am curious. Have you found this when debugging a particular
> problem or just by reading the code, please?

As I understand it, Mayank found this because the watchdog was
reacting significantly more slowly than he expected. In his caes, he
tracked it down to the fact that 8250 console driver has several calls
to touch_nmi_watchdog(), including on every call to console_write().
This caused the watchdog to take _much_ longer to fire.

On devices that fairly chatty w/ their output to the serial console,
the console_write() is called almost constantly. That means that the
watchdog is being touched constantly. If I remember Mayank tracked it
down as:

* watchdog_hardlockup_check() called and saves counter (1000)
* timer runs and updates the timer (1000 -> 1001)
* touch_nmi_watchdog() is called
* CPU locks up
* 10 seconds pass
* watchdog_hardlockup_check() called and saves counter (1001)
* 10 seconds pass
* watchdog_hardlockup_check() called and notices touch
* 10 seconds pass
* watchdog_hardlockup_check() called and finally detects lockup

...so we detect the lockup after 30 seconds, which is pretty bad. With
his new scheme, we'd detect the lockup in 20 seconds.


> > @@ -186,7 +186,21 @@ static void watchdog_hardlockup_kick(void)
> >
> >  void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
> >  {
> > +     bool is_hl;
> >       int hardlockup_all_cpu_backtrace;
> > +     /*
> > +      * Check for a hardlockup by making sure the CPU's timer
> > +      * interrupt is incrementing. The timer interrupt should have
> > +      * fired multiple times before we overflow'd. If it hasn't
> > +      * then this is a good indication the cpu is stuck
> > +      *
> > +      * Purposely check this _before_ checking watchdog_hardlockup_tou=
ched
> > +      * so we make sure we still update the saved value of the interru=
pts.
> > +      * Without that we'll take an extra round through this function b=
efore
> > +      * we can detect a lockup.
> > +      */
> > +
> > +     is_hl =3D is_hardlockup(cpu);
> >
> >       if (per_cpu(watchdog_hardlockup_touched, cpu)) {
> >               per_cpu(watchdog_hardlockup_touched, cpu) =3D false;
>
> Hmm, this does not look correct to me.
>
> 1. First, let's agree on the meaning of "watchdog_hardlockup_touched".
>
>    My understanding is that arch_touch_nmi_watchdog() is called by code
>    which might block interrupts (timers) for a long time and wants to
>    hide it.
>
>    Blocking interrupts for too long is _bad_. In the ideal word,
>    nobody should call arch_touch_nmi_watchdog() because we want
>    to know about all sinners.
>
>    In the real world, we allow to hide some sinners because
>    they might produce "false" positives, see touch_nmi_watchdog()
>    callers:
>
>      + Most callers are printk() related.
>
>        We might argue whether it is a false positive or not.
>
>        The argument for "touching the watchdog" is that slow serial
>        consoles might block IRQs for a long time. But they work as
>        expected and can't do better.
>
>        Also the stall is kind of expected in this case. We could
>        confuse users and/or hide the original problem if the stall
>        was reported.
>
>        Note that there is a bigger problem with the legacy console
>        drivers. printk() tries to emit them immediately. And the
>        current console_lock() owner become responsible for flushing
>        new messages added by other CPUs in parallel.
>
>        It is better with the new NBCON console drivers which are
>        offloaded to a kthread. Here, printk() tries to flush them directl=
y
>        only when called in an emergency mode (WARN, stall report)
>        or in panic().
>
>      + There are some other callers, for example, multi_stop_cpu(),
>        or hv_do_rep_hypercall_ex(). IMHO, they create stalls on
>        purpose.

I guess the problem is that these sinners tend to touch the watchdog
because they _might_ end up blocking too long. ...and they touch the
watchdog constantly. Essentially:

while (something_might_be_slow()) {
  touch_nmi_watchdog();
  do_something();
}

Even if the operation is _usually_ not slow (like console write), if
the code has a chance of being slow then it will have the touch.


> 2. Let's look at is_hardlockup() in detail:
>
>     static bool is_hardlockup(unsigned int cpu)
>     {
>         int hrint =3D atomic_read(&per_cpu(hrtimer_interrupts, cpu));
>
>         if (per_cpu(hrtimer_interrupts_saved, cpu) =3D=3D hrint) {
>                 per_cpu(hrtimer_interrupts_missed, cpu)++;
>                 if (per_cpu(hrtimer_interrupts_missed, cpu) >=3D watchdog=
_hardlockup_miss_thresh)
>                         return true;
>
>                 return false;
>         }
>
>         per_cpu(hrtimer_interrupts_saved, cpu) =3D hrint;
>         per_cpu(hrtimer_interrupts_missed, cpu) =3D 0;
>
>         return false;
>     }
>
>     If we call it when the watchdog was touched then
>     (per_cpu(hrtimer_interrupts_saved, cpu) =3D=3D hrint)
>
>         =3D>  per_cpu(hrtimer_interrupts_missed, cpu)++;
>
>     is called even when watchdog was touched.
>
>     As a result, we might report stall which should have been hidden,
>     for example:
>
> CPU0                               CPU1
>
>  <NMI>
>    watchdog_hardlockup_check() # passes
>      is_hardlockup() # no
>        hr_int_saved =3D hr_int;
>        hr_int_missed =3D 0;
>  </NMI>
>
>   local_irq_save()
>     printk()
>       console_trylock()
>       console_unlock()
>         console_flush_all()
>
>            touch_nmi_watchdog()
>
>                                    // Other CPUs print many messages,
>                                    // e.g. during boot when initializing =
a lot of HW
>                                    for (i=3D0; i<1000; i++) do
>                                        printk();
>
>       <NMI>
>         watchdog_hardlockup_check()
>           is_hardlockup() # yes
>             hr_int_missed++  # 1
>
>           # skip because touched
>       </NMI>
>
>          touch_nmi_watchdog()
>
>       <NMI>
>         watchdog_hardlockup_check()
>           is_hardlockup() # yes
>             hr_int_missed++  # 2
>
>           # skip because touched
>       </NMI>
>
>     ... repeat many times ...
>
>   local_irq_restore()
>
>     # this might normally trigger handling of pending IRQs
>     # including the timers. But IMHO, it can be offloaded
>     # to a kthread (at least on RT)
>
>       <NMI>
>         watchdog_hardlockup_check()
>           is_hardlockup() # yes
>             hr_int_missed++  # might be already 3, 4,...
>
>           Report hardlockup even when all the "hr_int_missed"
>           values should have been ignored because of
>           touch_watchdog.
>
>       </NMI>
>
>
> A solution might be clearing "hrtimer_interrupts_missed"
> when the watchdog was touched.

Great catch! When I was thinking about Mayank's patches, I thought
about them independently. ...and I believe that independently, each
patch is fine. The problem is that together they have exactly the
problem you indicated.

Clearing "hrtimer_interrupts_missed" seems like the right solution in
Mayank's patch #3.


> But honestly, I am not sure if this is worth the complexity.
>
>
> Higher level look:
> ------------------
>
> My understanding is that this patch has an effect only when
> touch_nmi_watchdog() is called as frequently as
> watchdog_hardlockup_check().
>
> The original code gives the system more time to recover after
> a known stall (touch_nmi_watchdog() called).
>
> The new code is more eager to report a stall. It might be more prone
> to report "false" positives.
>
> IMHO, the root of the problem is that touch_nmi_watchdog() is
> called too frequently. And this patch is rather dancing around
> then fixing it.

I don't think it's really any more likely to report false positives
after the bug you pointed out is fixed. The old watchdog was just too
conservative. With Mayank's proposal I think calling
touch_nmi_watchdog() should reset the watchdog the same amount as
letting the hrtimer run once and that seems like a very reasonable
interpretation.


> Alternative:
> ------------
>
> An alternative solution might to detect and report when too many
> watchdog_hardlockup_check() calls are ignored because of
> touch_nmi_watchdog().
>
> It might help to find a mis-use of touch_nmi_watchdog(). The question
> is what details should be reported in this case.
>
> It should be optional because touch_nmi_watchdog() is supposed
> to hide "well-known" sinners after all.

Hmmmm. I certainly support trying to reduce the number of places that
call touch_nmi_watchdog(), but at the same time I don't think Mayank's
patch is "dancing around" the problem. IMO considering the
touch_nmi_watchdog() to be "pretend a timer interrupt fired" is the
intuitive way one would think the call should work. The fact that the
code gave an entire extra 10 seconds before the watchdog could be
caught just feels like a bug that should be fixed.

For the 8250 driver in particular, it looks like the
touch_nmi_watchdog() was removed from serial8250_console_write() as
part of nbcon, but then that got reverted. That would still leave two
other touch_nmi_watchdog() calls in that driver...

-Doug
