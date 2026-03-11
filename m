Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCFC359A71
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237413; cv=none; b=vGJpQh6ZQBt33KizrdRPY4dLrayRWNNRf562AMzFGVGBB9dQP5n2WfLkqyLs54DuRvpUzn7BdzqGWum6Yp9B9EavaKEegAql1clC2ChH0HzrUfRGH3/1S+N5wDxtN9fx1fWeQd53qWI3DiglcLuAB+vlWjwbWTom2k6+PLFaLEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237413; c=relaxed/simple;
	bh=BHvcGrAaFKStQ5QQHJVnl/VH4dbWpYG6jdsdSlM+NAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjpvWF4wqfD815quEk7GrlVfzQ3unSPtzT7E3p7U6A7ETMmyZZRSRPp64SEeERqWxAHbCy9JPm0x/4HP+Kvde/PBC/CuVKzitWR1kKRz/SCE76dW2NgS7HsEEThJxcKwpKcYEuYwqswwN3tnDypaFUV/mrZVi3DZbRFVpTd6TMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ebRa5FNj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ebRa5FNj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so34243735e9.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773237408; x=1773842208; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mYEQOxWK4ehJ98+jlC/2DkEw9OT69d2P5txxSPo74Uk=;
        b=ebRa5FNjp8+oMy4zs05T4fAU8ATWCReqKiX4M0S9wwz+nDU2+6mPw+hGixpLhHIWWU
         7GCoz7X0A1zCIKlDB2jJeLlHCFT0HWKbA5/6Zci5S6Xv9K9U+h/xe7gSzdNRIYHAJm39
         6b3F5D31n3wrWlS49pNEGhNiEDxd9NBsYMX+lXrNnueyVrcl8cflI/VbLyBfOX3ENHiO
         IRGthIPhfSvuKmOxaWOb8GXxXPRYrBfwXnZ79hvx3FaDlBZOASDweJsixtNF/Lj1pzsh
         eUhGK93JWIbVaIzmB65WT8xEu09OqWHGiOfCMP56ZkSKWDu1nN6egYqdrnI/jYe7WLHm
         j9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773237408; x=1773842208;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mYEQOxWK4ehJ98+jlC/2DkEw9OT69d2P5txxSPo74Uk=;
        b=Olhx2XkEqohARb840ekTJFXEgrUJAnTGVwjFUwAgp6RxqFS+tCyaGQ/eo+lP2k5j+R
         tC7w6yzvj5VCSKyxFtb0YkFQP61I+fOIME+1JHh/cS0DW5mTy5O1VLx2Oofduh/I/uZa
         fOq4mayY/brOt8q0ysvAFUj3k+5uDf7V6OPB8M5RfHSJcTk01UDhIaYaXXkuZstqDa1q
         M9MJ3+8kgznty8kvbH0HVCGuHU+HEn8Fd6GcTrnjjAr2VQBoZ8hjUnPD/IBTYPSUrS7L
         rE3tSek63YJU22Adt3wgiu8HxJ5ZBjRr/RkaR4nbEw/bHqvuk3UvXGmWWFE842+8HLJf
         pDTA==
X-Forwarded-Encrypted: i=1; AJvYcCUXFyRINDOxmqPPnm9oTligshz8aQJrOygJ0gRLBBgiaXqTX2vcjIb3GaQRjrsLkIP7RCNxCjZwJQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya6ZTCfIl+keRzdHhfh2pAZdeyaBKKQJ6nFBbrjCmJcYE5oUSk
	zh7LNm4PnKjQo0/n4Ip2NZsJUWgbFTxnVpVvP8Wdw8Mx8Ra+QQzu/ZSOAaF17xy4hGuR66Hp7HI
	stBpF
X-Gm-Gg: ATEYQzz6VzFVNySyYYwOUCr5C4Vj5yhbqSO4Z7uZYm7F29qbiAMNnjj2jOXvF3jTC5Y
	GwhZ91viFpshWSvI2Zj6gAcBTMIUB76PPZKBrMBjVL0jiV5E+37EPQ4Ao/ShuAuUjlOE5l7q8Se
	clVZd5iYH/eWaKPqJjfkxCP2kL/leIg7+4sLg3EuTtn7UFpZaEzylDXD+TW5Q/oCUT34WXpO4SS
	kpi1//uCgFFZXaW1jlcCMthmEIp9+LI1MJ73G+aLHfp2Xwkzvf6BKW3CZd+H+V2Oimo0sdLm3uF
	Phq4/rq7vxEgXgCMliBy05PVm0ehJ45HJIV4WlPFJfXGyWVK8yi85ie5s7f4iDnWYlOQcCGUXsA
	CaWW2jxRETXF9feImixbN0OaV/ues3QA5lgQiHkI4+s3D3HlpDzAvizOePT7ByY6TEy6XzahmSY
	OB+VdvCZUYJv1jj859hGd9ES8+Gw==
X-Received: by 2002:a05:600c:1f10:b0:485:3d00:efd with SMTP id 5b1f17b1804b1-4854b0a4a87mr49876525e9.7.1773237407801;
        Wed, 11 Mar 2026 06:56:47 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a2d0e9dsm40934985e9.1.2026.03.11.06.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 06:56:47 -0700 (PDT)
Date: Wed, 11 Mar 2026 14:56:45 +0100
From: Petr Mladek <pmladek@suse.com>
To: Mayank Rungta <mrungta@google.com>
Cc: Doug Anderson <dianders@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
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
Message-ID: <abF0naZb9lnFeiid@pathway.suse.cz>
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
 <20260212-hardlockup-watchdog-fixes-v1-1-745f1dce04c3@google.com>
 <aahFQaHxNFsoaxEb@pathway.suse.cz>
 <CAD=FV=Vw7EQd1dDFx0Q0rHNgxRZfJCURRvysz=H9Vg+E-ae1Dg@mail.gmail.com>
 <aaloqnsgdVp75xcV@pathway.suse.cz>
 <CAD=FV=WVPmR4-QNp-_pFoSfRXDWq_Mv+hWNZVjtvu+GUHCmT+A@mail.gmail.com>
 <aa7MMCuJcIafi-gM@pathway.suse.cz>
 <CABz7rdA+kYq1VMasBemp7iNsk8O4+eAJdb57d+dTZLjJmazv0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABz7rdA+kYq1VMasBemp7iNsk8O4+eAJdb57d+dTZLjJmazv0Q@mail.gmail.com>

On Tue 2026-03-10 19:51:21, Mayank Rungta wrote:
> > On Mon, Mar 9, 2026 at 6:33 AM Petr Mladek <pmladek@suse.com> wrote:
> > On Thu 2026-03-05 08:13:39, Doug Anderson wrote:
> > > On Thu, Mar 5, 2026 at 3:27 AM Petr Mladek <pmladek@suse.com> wrote:
> > > > A better solution might be to separate the check and update/reset
> > > > of the values. Something like (on top of this patchset, just
> > > > compilation tested):
> > > >
> > > > diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> > > > index 30199eaeb5d7..4d0851f0f412 100644
> > > > --- a/kernel/watchdog.c
> > > > +++ b/kernel/watchdog.c
> > > > @@ -167,18 +167,10 @@ void watchdog_hardlockup_touch_cpu(unsigned int cpu)
> > > >         per_cpu(watchdog_hardlockup_touched, cpu) = true;
> > > >  }
> > > >
> > > > -static bool is_hardlockup(unsigned int cpu)
> > > > +static void watchdog_hardlockup_update_reset(unsigned int cpu)
> > > >  {
> > > >         int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> > > >
> > > > -       if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint) {
> > > > -               per_cpu(hrtimer_interrupts_missed, cpu)++;
> > > > -               if (per_cpu(hrtimer_interrupts_missed, cpu) >= watchdog_hardlockup_miss_thresh)
> > > > -                       return true;
> > > > -
> > > > -               return false;
> > > > -       }
> > > > -
> > > >         /*
> > > >          * NOTE: we don't need any fancy atomic_t or READ_ONCE/WRITE_ONCE
> > > >          * for hrtimer_interrupts_saved. hrtimer_interrupts_saved is
> > > > @@ -186,8 +178,20 @@ static bool is_hardlockup(unsigned int cpu)
> > > >          */
> > > >         per_cpu(hrtimer_interrupts_saved, cpu) = hrint;
> > > >         per_cpu(hrtimer_interrupts_missed, cpu) = 0;
> > > > +}
> > > >
> > > > -       return false;
> > > > +static bool is_hardlockup(unsigned int cpu)
> > > > +{
> > > > +       int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> > > > +
> > > > +       if (per_cpu(hrtimer_interrupts_saved, cpu) != hrint)
> > > > +               return false;
> > > > +
> > > > +       per_cpu(hrtimer_interrupts_missed, cpu)++;
> > > > +       if (per_cpu(hrtimer_interrupts_missed, cpu) < watchdog_hardlockup_miss_thresh)
> > > > +               return false;
> > > > +
> > > > +       return true;
> > > >  }
> > > >
> > > >  static void watchdog_hardlockup_kick(void)
> > > > @@ -200,23 +204,10 @@ static void watchdog_hardlockup_kick(void)
> > > >
> > > >  void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
> > > >  {
> > > > -       bool is_hl;
> > > >         int hardlockup_all_cpu_backtrace;
> > > > -       /*
> > > > -        * Check for a hardlockup by making sure the CPU's timer
> > > > -        * interrupt is incrementing. The timer interrupt should have
> > > > -        * fired multiple times before we overflow'd. If it hasn't
> > > > -        * then this is a good indication the cpu is stuck
> > > > -        *
> > > > -        * Purposely check this _before_ checking watchdog_hardlockup_touched
> > > > -        * so we make sure we still update the saved value of the interrupts.
> > > > -        * Without that we'll take an extra round through this function before
> > > > -        * we can detect a lockup.
> > > > -        */
> > > > -
> > > > -       is_hl = is_hardlockup(cpu);
> > > >
> > > >         if (per_cpu(watchdog_hardlockup_touched, cpu)) {
> > > > +               watchdog_hardlockup_update_reset(cpu);
> > > >                 per_cpu(watchdog_hardlockup_touched, cpu) = false;
> > > >                 return;
> > > >         }
> > > > @@ -224,7 +215,13 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
> > > >         hardlockup_all_cpu_backtrace = (hardlockup_si_mask & SYS_INFO_ALL_BT) ?
> > > >                                         1 : sysctl_hardlockup_all_cpu_backtrace;
> > > >
> > > > -       if (is_hl) {
> > > > +       /*
> > > > +        * Check for a hardlockup by making sure the CPU's timer
> > > > +        * interrupt is incrementing. The timer interrupt should have
> > > > +        * fired multiple times before we overflow'd. If it hasn't
> > > > +        * then this is a good indication the cpu is stuck
> > > > +        */
> > > > +       if (is_hardlockup(cpu)) {
> > > >                 unsigned int this_cpu = smp_processor_id();
> > > >                 unsigned long flags;
> > > >
> > > > @@ -290,6 +287,7 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
> > > >
> > > >                 per_cpu(watchdog_hardlockup_warned, cpu) = true;
> > > >         } else {
> > > > +               watchdog_hardlockup_update_reset(cpu);
> > > >                 per_cpu(watchdog_hardlockup_warned, cpu) = false;
> > > >         }
> > > >  }
> > >
> > > I haven't tested it, but that actually looks like a pretty nice final
> > > result to me. Mayank: What do you think? You'd have to figure out how
> > > to rework your two patches to incorporate Petr's ideas.
> > >
> 
> Thanks for your suggestion, this is pretty close, but we cannot call
> watchdog_hardlockup_update_reset(cpu) in a general else block. If we
> did, the hrtimer_interrupts_missed count would be reset on every check
> that isn't a hardlockup; even when no progress was actually made and
> we would never hit the watchdog_threshold.

Great catch!

> I’ve moved the update/reset inside the "progress detected" path within
> is_hardlockup() instead:
> 
> static bool is_hardlockup(unsigned int cpu)
> {
>         int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> 
>         if (per_cpu(hrtimer_interrupts_saved, cpu) != hrint) {
>                 watchdog_hardlockup_update_reset(cpu);
>                 return false;
>         }
> 
>         per_cpu(hrtimer_interrupts_missed, cpu)++;
>         if (per_cpu(hrtimer_interrupts_missed, cpu) <
> watchdog_hardlockup_miss_thresh)
>                 return false;
> 
>         return true;
> }

Looks good to me.

> I still went ahead and flipped the `is_hardlockup` test in the main
> check function to keep the indentation clean

Great.

Best Regards,
Petr
