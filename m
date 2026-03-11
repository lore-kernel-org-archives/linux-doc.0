Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7A71F5847
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 02:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773197495; cv=pass; b=Dzse7T1SMbbqLRYiyevbQ5XxkeE6szIfGcEc3sZsrJLZvfpwmg29pa7TmdLVZpA2uWRAWY0UML0sEeqQFnFLFd0Jva2I7Pkyoi3x2EAGbnZoO5jqCv6J9cdjX0xoZW2sj4vGFwBdlLGCgoZAj4nUIG0cYC1FrHoukbw1nuyEf+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773197495; c=relaxed/simple;
	bh=i40d9E7k8ffIIHoaCZRDU6qrbKP9diqifmAbWPsqSs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r2dC5fjdUB6SgXqeQd+ET7r0j270/jHlGUkoiPJ/75h7a6xbXr0RNHqj2HZCuXEZZod9cPqItsnstqERgH6o48XNOL9oIlaYyJl3yz1IcrTxlUJqUxmbJS/u5Kaup2WbNlDyTHazoVR5qkzbRauSKhxmU0AqVXex3w0nNPN22Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2Y76Nbof; arc=pass smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Y76Nbof"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-466ec4c6852so2443135b6e.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 19:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773197493; cv=none;
        d=google.com; s=arc-20240605;
        b=RGNifDk81dhb9pdvRCHmD+9ZUpXcAvDDCzj/6A56P0l63Vih4ePL2UhTNgkeXAHabK
         9TvPOKMJY/HC/5iPfrxBQdnyafpMKHNasyKWRS+Vi4BTixOJ3GGA4M62yw5sANv1sO5h
         p4rBSz8Lwjej04kSPfALgL03qeiuP4dx+lbQMt8qLMIixXVt8K6Znt8WOMTtcVTzwCBQ
         jfr7d7c/J00WfBIXxTMq7XWWg/01pIMgXDGRw3I6dQb/pfZG8vgJ1/KycWm5nx97QSJJ
         ndudn83J0ZFYLxJOOJdFBU5zeKWepq3+2hb8M+/uyFK7rwoRSuKcdJbQt8fMcAxEOz5f
         zP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TSqSgycKdv70e/XMoKgcigFIvSKpjYskq3xK8W8Sfa4=;
        fh=h+UGbxJ8DtxAlvtAFg2eJtCkHjPIHsHFXbsZdOpNPXo=;
        b=jNtI+G5qHDvxLsguFf9QxIEFOo2kgP0L3O4EZ8e0KZwrwFKLAnyTxJqZCLt0vV1rC/
         nPrwj7siCRjDMq271EMJDjR9XjhyJXzs0OqX/YX+MmQUsxpwd3bmrLCesukmxqurXsV0
         wvUjGhQ+Zk+Lp4I/78AizD/xbUqRHMNU9c8LumjxiO8VsrsjPEgJszn2Otg5WfIVelJ8
         mQs3bI0+bSMp/aXJ8VX6sC9ppKNy/sZXW10dS7LQMB8g4MtcUyV++EKoIvk8ucPC2r3x
         ywtbxkmIJ/sPC7UCwJgJCt2HBNXoN9MpFYPYk5XSu39Y5o6k6JqUKjSbVgNLcBBqwffR
         I4VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773197493; x=1773802293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSqSgycKdv70e/XMoKgcigFIvSKpjYskq3xK8W8Sfa4=;
        b=2Y76NbofpQ4kIcyEePknEua5I7/sa4bGa7MlAFsPvA12OBc38EGvxiwanq2zhJ3YB2
         V3q7QMx6u7ZcngLhINQPtOxYDh0OQLFyj61GgR+tOLIP4Lqs5heRqUFFJuDzmKZA0Q3S
         yq0kEJIEXyvKA6tugkIxDO0HLvrgvXtX+G1jILLurnvJF1bPWoPGdVrIaL6PYepiXKRX
         HzhH2ZylT9siJ+jbBQiiOyqt2k6ChyWF+/ud0dTypDQsb4mFIEuRXVNOWZlcDGv79nen
         hAVF37LoRNpwMVZ5LtLiZc/alquirizobKIb4wIWz5725upBcp0/zKZ+Sl6jN8y8T7up
         j4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773197493; x=1773802293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TSqSgycKdv70e/XMoKgcigFIvSKpjYskq3xK8W8Sfa4=;
        b=iMXtqynDC3SSBRZyj8EEIQxcfF7XW+hTfuODU2G2HvIYXut54g8kZH3mX8zmYsOpsX
         BvcXEG00N4jlacbqpSxKRIJTTQAre5W9BDJGutneV+kUvbbEx39LZgDd9pk/yi9gpY1G
         f4ZXs/O0LEhfEJuoUkNbbp0SGzceCar9AW0vx0AYS9nT922qpXCLT6jZKVes9UUwYjrw
         34PkpoDvcjH+bH3saAmXIxtzGsDveHIAaCsENlJaXS0XFejlHZwM8TeVOCZmgzWAf5Mk
         pzNwPy2m/RnpRD+n7mpERgJehBG4hClsYbKWRb8tuw0S6hq02mFLubxPY7bv9MhKIeSs
         2obA==
X-Forwarded-Encrypted: i=1; AJvYcCVeUtzXqZn+8lBGfg192r56hHKXtsEwwu7T1HI4O082d2T9rpf05W+zewdy27B32JvSlgTGA5tH/lc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlBIndNvA43a0IUeh2g3qIo7AN1KQNYkR+i+m4d2WVVW5LR/H4
	GF/UmiwVlOlu+bGFZKe9z/GiIZ3Snwz5UuPomD1IMhUANgvbagPKmMfeT+mbUsj6kK4ESq2xPdx
	V/Or2BK+L3nKOrqI9Sv4m28zfHQ+MYDKGuNwJozha
X-Gm-Gg: ATEYQzzL42ZJxymmLJL80m3qdqYlYa137a+KMe0gKLEjA6eWlJuPpFr5O8TTxYQlcwH
	WfuSYmZ0oHrfUGc9OqmPQfPR8H4o2BtU1z+uC7E5vbzYEWzX4x2Zpokp0qUocobUsooWqrT93Yn
	cSeqL43zlHblGPc0Kj7WYr44Oa8tGJMJPXuJUCoFxGkOtAdMouCUll2Am9X0gIc0bg1FDEnQapY
	zXP9oa34umUE5l4iQxVD+0PO0+xJIb4tqS0ToquRqplaAmaSuImlNJo1DTIIjj3DRzbXxG0+ZVz
	6Om3qnh0gIHvfLo0qvQPGC7PYrhbA/+TUtysg4Wl
X-Received: by 2002:a05:6808:4fc8:b0:467:155f:8c34 with SMTP id
 5614622812f47-4673359ce2bmr608753b6e.48.1773197492438; Tue, 10 Mar 2026
 19:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
 <20260212-hardlockup-watchdog-fixes-v1-1-745f1dce04c3@google.com>
 <aahFQaHxNFsoaxEb@pathway.suse.cz> <CAD=FV=Vw7EQd1dDFx0Q0rHNgxRZfJCURRvysz=H9Vg+E-ae1Dg@mail.gmail.com>
 <aaloqnsgdVp75xcV@pathway.suse.cz> <CAD=FV=WVPmR4-QNp-_pFoSfRXDWq_Mv+hWNZVjtvu+GUHCmT+A@mail.gmail.com>
 <aa7MMCuJcIafi-gM@pathway.suse.cz>
In-Reply-To: <aa7MMCuJcIafi-gM@pathway.suse.cz>
From: Mayank Rungta <mrungta@google.com>
Date: Tue, 10 Mar 2026 19:51:21 -0700
X-Gm-Features: AaiRm53tfT4XfxrlTz86i9Vao4HCdzngvIZoKi4D8evSy53Y6BtY4oVYekaqiQ8
Message-ID: <CABz7rdA+kYq1VMasBemp7iNsk8O4+eAJdb57d+dTZLjJmazv0Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] watchdog/hardlockup: Always update saved interrupts
 during check
To: Petr Mladek <pmladek@suse.com>
Cc: Doug Anderson <dianders@chromium.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jinchao Wang <wangjinchao600@gmail.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Stephane Eranian <eranian@google.com>, Ian Rogers <irogers@google.com>, 
	Li Huafei <lihuafei1@huawei.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Max Kellermann <max.kellermann@ionos.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks guys for ironing out the details. I tried to implement the
ideas mentioned in this thread

> On Mon, Mar 9, 2026 at 6:33=E2=80=AFAM Petr Mladek <pmladek@suse.com> wro=
te:
>
> On Thu 2026-03-05 08:13:39, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Mar 5, 2026 at 3:27=E2=80=AFAM Petr Mladek <pmladek@suse.com> w=
rote:
> > >
> > > > * watchdog_hardlockup_check() called and saves counter (1000)
> > > > * timer runs and updates the timer (1000 -> 1001)
> > > > * touch_nmi_watchdog() is called
> > > > * CPU locks up
> > > > * 10 seconds pass
> > > > * watchdog_hardlockup_check() called and saves counter (1001)
> > > > * 10 seconds pass
> > > > * watchdog_hardlockup_check() called and notices touch
> > >
> > > Great visualization!
> > >
> > > Nit: It seems to be actually the other way around:
> > >
> > >  * 10 seconds pass
> > >  * watchdog_hardlockup_check() called and notices touch and skips upd=
ating counters
> > >  * 10 seconds pass
> > >  * watchdog_hardlockup_check() called and saves counter (1001)
> >
> > Oops, right! :-) Mayank: it's probably worth adding some form of the
> > (corrected) example here to the commit message. Also, you could
> > mention in the commit message that you were seeing real problems
> > because of the 8250 console prints with the general rule that if
> > someone asks a question during the a review it's worth including that
> > info in the next version of the commit message. ;-)
> >

That's a good idea, sure I will add this to the commit message for V2.

> >
> > > A better solution might be to separate the check and update/reset
> > > of the values. Something like (on top of this patchset, just
> > > compilation tested):
> > >
> > > diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> > > index 30199eaeb5d7..4d0851f0f412 100644
> > > --- a/kernel/watchdog.c
> > > +++ b/kernel/watchdog.c
> > > @@ -167,18 +167,10 @@ void watchdog_hardlockup_touch_cpu(unsigned int=
 cpu)
> > >         per_cpu(watchdog_hardlockup_touched, cpu) =3D true;
> > >  }
> > >
> > > -static bool is_hardlockup(unsigned int cpu)
> > > +static void watchdog_hardlockup_update_reset(unsigned int cpu)
> > >  {
> > >         int hrint =3D atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> > >
> > > -       if (per_cpu(hrtimer_interrupts_saved, cpu) =3D=3D hrint) {
> > > -               per_cpu(hrtimer_interrupts_missed, cpu)++;
> > > -               if (per_cpu(hrtimer_interrupts_missed, cpu) >=3D watc=
hdog_hardlockup_miss_thresh)
> > > -                       return true;
> > > -
> > > -               return false;
> > > -       }
> > > -
> > >         /*
> > >          * NOTE: we don't need any fancy atomic_t or READ_ONCE/WRITE_=
ONCE
> > >          * for hrtimer_interrupts_saved. hrtimer_interrupts_saved is
> > > @@ -186,8 +178,20 @@ static bool is_hardlockup(unsigned int cpu)
> > >          */
> > >         per_cpu(hrtimer_interrupts_saved, cpu) =3D hrint;
> > >         per_cpu(hrtimer_interrupts_missed, cpu) =3D 0;
> > > +}
> > >
> > > -       return false;
> > > +static bool is_hardlockup(unsigned int cpu)
> > > +{
> > > +       int hrint =3D atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> > > +
> > > +       if (per_cpu(hrtimer_interrupts_saved, cpu) !=3D hrint)
> > > +               return false;
> > > +
> > > +       per_cpu(hrtimer_interrupts_missed, cpu)++;
> > > +       if (per_cpu(hrtimer_interrupts_missed, cpu) < watchdog_hardlo=
ckup_miss_thresh)
> > > +               return false;
> > > +
> > > +       return true;
> > >  }
> > >
> > >  static void watchdog_hardlockup_kick(void)
> > > @@ -200,23 +204,10 @@ static void watchdog_hardlockup_kick(void)
> > >
> > >  void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *reg=
s)
> > >  {
> > > -       bool is_hl;
> > >         int hardlockup_all_cpu_backtrace;
> > > -       /*
> > > -        * Check for a hardlockup by making sure the CPU's timer
> > > -        * interrupt is incrementing. The timer interrupt should have
> > > -        * fired multiple times before we overflow'd. If it hasn't
> > > -        * then this is a good indication the cpu is stuck
> > > -        *
> > > -        * Purposely check this _before_ checking watchdog_hardlockup=
_touched
> > > -        * so we make sure we still update the saved value of the int=
errupts.
> > > -        * Without that we'll take an extra round through this functi=
on before
> > > -        * we can detect a lockup.
> > > -        */
> > > -
> > > -       is_hl =3D is_hardlockup(cpu);
> > >
> > >         if (per_cpu(watchdog_hardlockup_touched, cpu)) {
> > > +               watchdog_hardlockup_update_reset(cpu);
> > >                 per_cpu(watchdog_hardlockup_touched, cpu) =3D false;
> > >                 return;
> > >         }
> > > @@ -224,7 +215,13 @@ void watchdog_hardlockup_check(unsigned int cpu,=
 struct pt_regs *regs)
> > >         hardlockup_all_cpu_backtrace =3D (hardlockup_si_mask & SYS_IN=
FO_ALL_BT) ?
> > >                                         1 : sysctl_hardlockup_all_cpu=
_backtrace;
> > >
> > > -       if (is_hl) {
> > > +       /*
> > > +        * Check for a hardlockup by making sure the CPU's timer
> > > +        * interrupt is incrementing. The timer interrupt should have
> > > +        * fired multiple times before we overflow'd. If it hasn't
> > > +        * then this is a good indication the cpu is stuck
> > > +        */
> > > +       if (is_hardlockup(cpu)) {
> > >                 unsigned int this_cpu =3D smp_processor_id();
> > >                 unsigned long flags;
> > >
> > > @@ -290,6 +287,7 @@ void watchdog_hardlockup_check(unsigned int cpu, =
struct pt_regs *regs)
> > >
> > >                 per_cpu(watchdog_hardlockup_warned, cpu) =3D true;
> > >         } else {
> > > +               watchdog_hardlockup_update_reset(cpu);
> > >                 per_cpu(watchdog_hardlockup_warned, cpu) =3D false;
> > >         }
> > >  }
> >
> > I haven't tested it, but that actually looks like a pretty nice final
> > result to me. Mayank: What do you think? You'd have to figure out how
> > to rework your two patches to incorporate Petr's ideas.
> >

Thanks for your suggestion, this is pretty close, but we cannot call
watchdog_hardlockup_update_reset(cpu) in a general else block. If we
did, the hrtimer_interrupts_missed count would be reset on every check
that isn't a hardlockup; even when no progress was actually made and
we would never hit the watchdog_threshold.

I=E2=80=99ve moved the update/reset inside the "progress detected" path wit=
hin
is_hardlockup() instead:

static bool is_hardlockup(unsigned int cpu)
{
        int hrint =3D atomic_read(&per_cpu(hrtimer_interrupts, cpu));

        if (per_cpu(hrtimer_interrupts_saved, cpu) !=3D hrint) {
                watchdog_hardlockup_update_reset(cpu);
                return false;
        }

        per_cpu(hrtimer_interrupts_missed, cpu)++;
        if (per_cpu(hrtimer_interrupts_missed, cpu) <
watchdog_hardlockup_miss_thresh)
                return false;

        return true;
}

> > Petr: Since you gave your ideas as a diff, what are you thinking in
> > terms of tags on Mayank's v2? You didn't provide a Signed-off-by on
> > your diff, so I guess you're expecting Mayank not to incorprate it
> > directly but take it as a "suggestion" for improving his patches (AKA
> > not add any of your tags to his v2).
>
> I expected that Mayank could rework his patchset using ideas from the
> diff. Feel free to use the changes as they are and copy&paste them
> from my diff. It is just a refactoring.
>
> > One nit: in the final result, it might be nice to invert the
> > "is_hardlockup()" test so we can return early and get rid of a level
> > of indentation. AKA:
> >
> > if (!is_hardlockup(cpu)) {
> >   watchdog_hardlockup_update_reset(cpu);
> >   per_cpu(watchdog_hardlockup_warned, cpu) =3D false;
> >   return;
> > }
> >
> > Not only does it reduce indentation, but it also keeps the two calls
> > to watchdog_hardlockup_update_reset() closer to each other.
>
> Yeah, that would be great. I actually wanted to do it in my diff
> as well. But I did not do it to keep the diff simple.
>
> It might be better to invert the logic as a separate preparation
> patch so that we do not hide other changes in the reshuffling.
>
> Best Regards,
> Petr

I still went ahead and flipped the `is_hardlockup` test in the main
check function to keep the indentation clean
