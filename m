Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2FA35C19B
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773063227; cv=none; b=CZyMHV+i/XVOYT2XNkb796+U+UCXFSKLqUAXIK6Be4MtvbBW+JiTt/9u88GULeASno8Ry+zwqENQUmZEx5x54l7yTLiVT+m8BzSZFykBabZOcrrs2EVUZXTP+CQCDF/a8qRAotHaM66IQ23Oxdtwl9kdyGBaWuPMWftKdA+d25w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773063227; c=relaxed/simple;
	bh=QV9unmu/JbSt0W3UEjEKtBW4h0lK7J25iOHwQaBHMpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYpbCKYot5UWm+6FO7DaOYiKv+Eb0eIAutncjzEu2SqqQoGh+e7bYM+R/gbUGUTyreGLfGkx8IlBrofkSAgEnh2QAXMmxtGGsEWK1mHxCrKECtzcd2yygMliw8xeEJrgCaW0M2e5BswzdypFODkRgoRJslKT2n9bN7vOHIxPNP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JgkCBgsM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JgkCBgsM"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439ac15f35fso8254347f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 06:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773063224; x=1773668024; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8B4Xrt6+BfS01eanjDjOVVDl7qSU9t+mARqpWJnEl3s=;
        b=JgkCBgsMME86mWRDNNZMJt9/mxZ/v5dTPTKgfzOjkxALL4EbIg+SiMzzhSTPlIRspK
         0+BOKzzaj4LpiuubExJLce5l6yoYnXjaNWWRtn9ecjOfbe/sW/H6RxkKscFhZlqP60Qb
         E723tAJ/C/HAaxI4ZiEbKv1j94EJjMA0gs3YAMmg5vz56IKyoq+Uta73CTKVk83U8Uua
         j6HQk0/dhj2sRN2Lr+b4Smb4g5It1eqxc9SFqdkY4SN+sG3Ca3GNPzWJQnrI5YGdGsL3
         BLHB5TfKeXLoWlCw/xUcTZnuLUWSFLw+xgD+K+64QHXLDBSdFtf5LSdG24Aw6KCCPjb1
         fTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773063224; x=1773668024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8B4Xrt6+BfS01eanjDjOVVDl7qSU9t+mARqpWJnEl3s=;
        b=KiNYudgb99G6IDNqRrJKU0cjmLUPXjlG+atWjgg6iNSBZT+nFoLkWV6q86mW6/0xjC
         K3QpKKS037kRoGGGSVcJDtAvyp09AiZZs0KP6ci/x1WTTNIIToV5MzTiLYx1wmnVpTQ3
         a0v46ZLm3di31R4pDPj/jlMjR80+LzQ1mSsUtkS42zdHUatG37YJ7FU//hycBlykfziO
         wP6II6HBrD2rw0l3g6aIJCEgyIp8pl6z8aZt3ouSD2o8ItylPeNtgf+V2+az/oR+Xk6o
         RQrHANqvrailzKRPZjPc12wo0aBQinkWm2kaYDXnUX81G6hToZ9rD+ZDvU/vO0NzzWxF
         nWew==
X-Forwarded-Encrypted: i=1; AJvYcCVrucaQ2ghi4RTyOoasYeDAQuDBVIGQ8aaVd7AM8S8h4r2qiqZo6WUB6mQCKgC+gue9f8qbW9G93rs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgukfSaS2Go4GZe//ubdvwv6VYEgWy50aNwELizoEDorTi+7OA
	OZQtBn+bXHpvd5MT40OIQ1h/sUn47rHJ6z/pHniNgsKjb0ei1CwRBDzvfdaTzXsUZYY=
X-Gm-Gg: ATEYQzy1Ze5mpW63fj6cTkRe8/8jbq0f4gL5tlh30wRFcNWV7zLPexNKdUC5KytU3ak
	ZX/YJWWl9EuDKDK0n4Xma+QeHZJxg/jaL7lOY9GlRvn7k7m/AtdyOay6f0tITwgmAuGqhqVxbxU
	5eKLYmQh0Navd7PYD/2GpxU65xUKsWiSUbZhuUzlEHUlLHU8sNE0+oMD1ifDClLDri8ofSoa69w
	RibVprNtX0apsKh4clkd8fDK3XlFT9ghAugtrfmhTcp3myJdEeSTIK9Qe2MLmjlX5JBR5PVKGKJ
	H96DwgG44DMhG9LBL793xES3La6G5UVlit0bedvpVPxBkr/Sdqj0iwqeh2VzSZzNNACtrpT3lNu
	2ubJfDYLl5yRcP/52ZazlNq+GsDvE/ExAbGX1d54zwo67uJ03lvLMQ30VR7ntNOmbFRcYOuIPNc
	biCiyHZeOttFrtavSKtGga30/eWg==
X-Received: by 2002:a05:6000:24c7:b0:439:bcb8:54b7 with SMTP id ffacd0b85a97d-439da3306bbmr18087775f8f.15.1773063223688;
        Mon, 09 Mar 2026 06:33:43 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadac2a7sm26839455f8f.15.2026.03.09.06.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:33:43 -0700 (PDT)
Date: Mon, 9 Mar 2026 14:33:36 +0100
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
Message-ID: <aa7MMCuJcIafi-gM@pathway.suse.cz>
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
 <20260212-hardlockup-watchdog-fixes-v1-1-745f1dce04c3@google.com>
 <aahFQaHxNFsoaxEb@pathway.suse.cz>
 <CAD=FV=Vw7EQd1dDFx0Q0rHNgxRZfJCURRvysz=H9Vg+E-ae1Dg@mail.gmail.com>
 <aaloqnsgdVp75xcV@pathway.suse.cz>
 <CAD=FV=WVPmR4-QNp-_pFoSfRXDWq_Mv+hWNZVjtvu+GUHCmT+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WVPmR4-QNp-_pFoSfRXDWq_Mv+hWNZVjtvu+GUHCmT+A@mail.gmail.com>

On Thu 2026-03-05 08:13:39, Doug Anderson wrote:
> Hi,
> 
> On Thu, Mar 5, 2026 at 3:27 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > > * watchdog_hardlockup_check() called and saves counter (1000)
> > > * timer runs and updates the timer (1000 -> 1001)
> > > * touch_nmi_watchdog() is called
> > > * CPU locks up
> > > * 10 seconds pass
> > > * watchdog_hardlockup_check() called and saves counter (1001)
> > > * 10 seconds pass
> > > * watchdog_hardlockup_check() called and notices touch
> >
> > Great visualization!
> >
> > Nit: It seems to be actually the other way around:
> >
> >  * 10 seconds pass
> >  * watchdog_hardlockup_check() called and notices touch and skips updating counters
> >  * 10 seconds pass
> >  * watchdog_hardlockup_check() called and saves counter (1001)
> 
> Oops, right! :-) Mayank: it's probably worth adding some form of the
> (corrected) example here to the commit message. Also, you could
> mention in the commit message that you were seeing real problems
> because of the 8250 console prints with the general rule that if
> someone asks a question during the a review it's worth including that
> info in the next version of the commit message. ;-)
> 
> 
> > A better solution might be to separate the check and update/reset
> > of the values. Something like (on top of this patchset, just
> > compilation tested):
> >
> > diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> > index 30199eaeb5d7..4d0851f0f412 100644
> > --- a/kernel/watchdog.c
> > +++ b/kernel/watchdog.c
> > @@ -167,18 +167,10 @@ void watchdog_hardlockup_touch_cpu(unsigned int cpu)
> >         per_cpu(watchdog_hardlockup_touched, cpu) = true;
> >  }
> >
> > -static bool is_hardlockup(unsigned int cpu)
> > +static void watchdog_hardlockup_update_reset(unsigned int cpu)
> >  {
> >         int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> >
> > -       if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint) {
> > -               per_cpu(hrtimer_interrupts_missed, cpu)++;
> > -               if (per_cpu(hrtimer_interrupts_missed, cpu) >= watchdog_hardlockup_miss_thresh)
> > -                       return true;
> > -
> > -               return false;
> > -       }
> > -
> >         /*
> >          * NOTE: we don't need any fancy atomic_t or READ_ONCE/WRITE_ONCE
> >          * for hrtimer_interrupts_saved. hrtimer_interrupts_saved is
> > @@ -186,8 +178,20 @@ static bool is_hardlockup(unsigned int cpu)
> >          */
> >         per_cpu(hrtimer_interrupts_saved, cpu) = hrint;
> >         per_cpu(hrtimer_interrupts_missed, cpu) = 0;
> > +}
> >
> > -       return false;
> > +static bool is_hardlockup(unsigned int cpu)
> > +{
> > +       int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> > +
> > +       if (per_cpu(hrtimer_interrupts_saved, cpu) != hrint)
> > +               return false;
> > +
> > +       per_cpu(hrtimer_interrupts_missed, cpu)++;
> > +       if (per_cpu(hrtimer_interrupts_missed, cpu) < watchdog_hardlockup_miss_thresh)
> > +               return false;
> > +
> > +       return true;
> >  }
> >
> >  static void watchdog_hardlockup_kick(void)
> > @@ -200,23 +204,10 @@ static void watchdog_hardlockup_kick(void)
> >
> >  void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
> >  {
> > -       bool is_hl;
> >         int hardlockup_all_cpu_backtrace;
> > -       /*
> > -        * Check for a hardlockup by making sure the CPU's timer
> > -        * interrupt is incrementing. The timer interrupt should have
> > -        * fired multiple times before we overflow'd. If it hasn't
> > -        * then this is a good indication the cpu is stuck
> > -        *
> > -        * Purposely check this _before_ checking watchdog_hardlockup_touched
> > -        * so we make sure we still update the saved value of the interrupts.
> > -        * Without that we'll take an extra round through this function before
> > -        * we can detect a lockup.
> > -        */
> > -
> > -       is_hl = is_hardlockup(cpu);
> >
> >         if (per_cpu(watchdog_hardlockup_touched, cpu)) {
> > +               watchdog_hardlockup_update_reset(cpu);
> >                 per_cpu(watchdog_hardlockup_touched, cpu) = false;
> >                 return;
> >         }
> > @@ -224,7 +215,13 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
> >         hardlockup_all_cpu_backtrace = (hardlockup_si_mask & SYS_INFO_ALL_BT) ?
> >                                         1 : sysctl_hardlockup_all_cpu_backtrace;
> >
> > -       if (is_hl) {
> > +       /*
> > +        * Check for a hardlockup by making sure the CPU's timer
> > +        * interrupt is incrementing. The timer interrupt should have
> > +        * fired multiple times before we overflow'd. If it hasn't
> > +        * then this is a good indication the cpu is stuck
> > +        */
> > +       if (is_hardlockup(cpu)) {
> >                 unsigned int this_cpu = smp_processor_id();
> >                 unsigned long flags;
> >
> > @@ -290,6 +287,7 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
> >
> >                 per_cpu(watchdog_hardlockup_warned, cpu) = true;
> >         } else {
> > +               watchdog_hardlockup_update_reset(cpu);
> >                 per_cpu(watchdog_hardlockup_warned, cpu) = false;
> >         }
> >  }
> 
> I haven't tested it, but that actually looks like a pretty nice final
> result to me. Mayank: What do you think? You'd have to figure out how
> to rework your two patches to incorporate Petr's ideas.
> 
> Petr: Since you gave your ideas as a diff, what are you thinking in
> terms of tags on Mayank's v2? You didn't provide a Signed-off-by on
> your diff, so I guess you're expecting Mayank not to incorprate it
> directly but take it as a "suggestion" for improving his patches (AKA
> not add any of your tags to his v2).

I expected that Mayank could rework his patchset using ideas from the
diff. Feel free to use the changes as they are and copy&paste them
from my diff. It is just a refactoring.

> One nit: in the final result, it might be nice to invert the
> "is_hardlockup()" test so we can return early and get rid of a level
> of indentation. AKA:
> 
> if (!is_hardlockup(cpu)) {
>   watchdog_hardlockup_update_reset(cpu);
>   per_cpu(watchdog_hardlockup_warned, cpu) = false;
>   return;
> }
> 
> Not only does it reduce indentation, but it also keeps the two calls
> to watchdog_hardlockup_update_reset() closer to each other.

Yeah, that would be great. I actually wanted to do it in my diff
as well. But I did not do it to keep the diff simple.

It might be better to invert the logic as a separate preparation
patch so that we do not hide other changes in the reshuffling.

Best Regards,
Petr
