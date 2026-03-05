Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A585337B41F
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 16:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772727240; cv=none; b=pQUbu5YzilTMR7OIpa0uuM76KJ8OhestMn3rSbjy0iVYZcu9ZS885DSORYiYeCfnBYZB9wGs+T7MfvveGCYTxclZRlgRbIOmGhpISCvg5d+J3p3q5riXSZFhcYFJfm/02WFORzP6PnBDl+3rvmVaJlCm0CTYZtfB2nY53FPIYSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772727240; c=relaxed/simple;
	bh=zb5B7pdpPqKlcByHTVI5+b9QqMiPhGrmz1+9Vflw4gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXOZh3AzCk+Ujgr4qwvDr0TWxrs297gi1Zx/SiQELhM7gpkyPdaLMOrRBNnD1W6LT8Qde1PcVY6ZDMRJDLEKPsYPyVWJYkJLmeBTwUU0r3UrFYiB7OBhqRnXG0TyYqK+hLUMJtzMcS0l7wYgxeNwklzYtNSSrhTK8rogBi4F8xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZouWYEFc; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZouWYEFc"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6611d20c026so2713790a12.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 08:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772727233; x=1773332033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viRRv1cQ/1TqMT/lnR1bupoxVubqkBtVU8arIncysQ8=;
        b=ZouWYEFc/nHXgEPnmkU7HcG/p/J577ZY/chT2uTBjLIzrNdpzlcBS4E2NM+l2yYRZs
         PRmkE01RDI7vUUYZVG5A6bDR1LmmUQJVSCorx7dpxYXSX0M3gu2UmI098u1LvJ3VdzEN
         drdvgikNGtoaPrstgyEDsopBOn7KENeaofZBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772727233; x=1773332033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=viRRv1cQ/1TqMT/lnR1bupoxVubqkBtVU8arIncysQ8=;
        b=Z2o6VyKABuXsYB0va6QXcAilMadLVedZ+rGjmr5m9ITp3j4jFspQMNQ56z0hAjBDXl
         aVSV86aIiVUsraa3crDHuJwvg51cQA2T5SnSBLyH9wHmInpqyXRa+TYiyA4f6X2K99xR
         kPbjwyxtMwSmjwHesnNyaf7/7xGoG2Dmk66tEQikMNWtf1l592EPkJmXe8tXtaDDVSVZ
         s7K3xvp5T01K2THxB1qxUAsK3Km6bJdyTXgDrTVJ/jsHzNkjZpTfWgb7PNm2DTAV9D9c
         MY+qVONxEfxMsDF4IMIf3BrJ/+8xgPhDOUDnOJPLMAP01CQLsIZ9HCBjIvYXf/ybp7DZ
         pQMg==
X-Forwarded-Encrypted: i=1; AJvYcCXO99nKXPlTKQVWK0rfffe9NOKoYdQ9XInYmKx2ugVNIb0gdv/aIPmEdGn+UsavPBukjcMIIg4nguI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJI1y+RYOgb/metYtbb8gtmy8JEPDas/fEtWOTTiaGpWvmf3zO
	+rmgkOILcUGHr1r49x1XOEKw4XG/W4j4GNDWBj678rWblErtOLi8BDyU+DU3mVNJFf5hRHOQmiW
	ea0la0uGC
X-Gm-Gg: ATEYQzxDpibhsyzLqsuYupkcCNj6JPRLjkou/3d0s3mvcJBx9N9L5LFXT/DGwaE+aje
	UopLLfNq1HMmB/ml7RDoP+vFZoqfykPA8mg4h/ODRVnn/Nu+wDFKBBc42GMVwb6BsUTgHSO96rl
	zrujaV1nccIWvPNHJFRel3iNaIKVS/3dKCTqrtobbIKKFT9ZrE/9pMT25In3i+noyROlr60ZcrR
	iePNRUK3dy1Y+gbKfJIX9id4aB7EmcbnR6KPXRuzcqqcSgU19z9zoMnPDQg2gWYUMQ2q5B0xq0S
	BQ+4NucQSBXkf+J8u88slAJJaKJ6nKodiw8z4XeFDUm5b+skTh8U6mY6kgCQEBFAoORb/CeGXN7
	FZW1Lom1c6EUEiavq5q3IP7Zm7jYt4bm04Y7NG1oz7LZmEWkBVGrnDFv5iPmH9Qw3wcqaKua4pa
	Xe4ni/pCiivtOX+4y0QZM8HeX+rckd5sxsaDKqHPTf90dLGWOaKbW37xKBnpqS8A==
X-Received: by 2002:a17:907:9611:b0:b93:8995:8f3a with SMTP id a640c23a62f3a-b93f10f83a8mr473161066b.3.1772727233190;
        Thu, 05 Mar 2026 08:13:53 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b940d35aa45sm117213266b.16.2026.03.05.08.13.51
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 08:13:51 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b78b638eso4941640f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 08:13:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXNwcogf+j9dCZ9wnwcDBCJU4Ceniy2B7P9wTISzLA6lqWHS5IRthFf8SWywMVxfGsZsP80+3Gv/p8=@vger.kernel.org
X-Received: by 2002:a05:6000:228a:b0:439:c69f:503a with SMTP id
 ffacd0b85a97d-439c7fd38c0mr12138845f8f.27.1772727230612; Thu, 05 Mar 2026
 08:13:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
 <20260212-hardlockup-watchdog-fixes-v1-1-745f1dce04c3@google.com>
 <aahFQaHxNFsoaxEb@pathway.suse.cz> <CAD=FV=Vw7EQd1dDFx0Q0rHNgxRZfJCURRvysz=H9Vg+E-ae1Dg@mail.gmail.com>
 <aaloqnsgdVp75xcV@pathway.suse.cz>
In-Reply-To: <aaloqnsgdVp75xcV@pathway.suse.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Mar 2026 08:13:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WVPmR4-QNp-_pFoSfRXDWq_Mv+hWNZVjtvu+GUHCmT+A@mail.gmail.com>
X-Gm-Features: AaiRm5120H5DItJwhhpF8-RhqNi9TJzODU9qx7mcsXlNztMSWBc_3ydWJpMGWhw
Message-ID: <CAD=FV=WVPmR4-QNp-_pFoSfRXDWq_Mv+hWNZVjtvu+GUHCmT+A@mail.gmail.com>
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

On Thu, Mar 5, 2026 at 3:27=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrote=
:
>
> > * watchdog_hardlockup_check() called and saves counter (1000)
> > * timer runs and updates the timer (1000 -> 1001)
> > * touch_nmi_watchdog() is called
> > * CPU locks up
> > * 10 seconds pass
> > * watchdog_hardlockup_check() called and saves counter (1001)
> > * 10 seconds pass
> > * watchdog_hardlockup_check() called and notices touch
>
> Great visualization!
>
> Nit: It seems to be actually the other way around:
>
>  * 10 seconds pass
>  * watchdog_hardlockup_check() called and notices touch and skips updatin=
g counters
>  * 10 seconds pass
>  * watchdog_hardlockup_check() called and saves counter (1001)

Oops, right! :-) Mayank: it's probably worth adding some form of the
(corrected) example here to the commit message. Also, you could
mention in the commit message that you were seeing real problems
because of the 8250 console prints with the general rule that if
someone asks a question during the a review it's worth including that
info in the next version of the commit message. ;-)


> A better solution might be to separate the check and update/reset
> of the values. Something like (on top of this patchset, just
> compilation tested):
>
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 30199eaeb5d7..4d0851f0f412 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -167,18 +167,10 @@ void watchdog_hardlockup_touch_cpu(unsigned int cpu=
)
>         per_cpu(watchdog_hardlockup_touched, cpu) =3D true;
>  }
>
> -static bool is_hardlockup(unsigned int cpu)
> +static void watchdog_hardlockup_update_reset(unsigned int cpu)
>  {
>         int hrint =3D atomic_read(&per_cpu(hrtimer_interrupts, cpu));
>
> -       if (per_cpu(hrtimer_interrupts_saved, cpu) =3D=3D hrint) {
> -               per_cpu(hrtimer_interrupts_missed, cpu)++;
> -               if (per_cpu(hrtimer_interrupts_missed, cpu) >=3D watchdog=
_hardlockup_miss_thresh)
> -                       return true;
> -
> -               return false;
> -       }
> -
>         /*
>          * NOTE: we don't need any fancy atomic_t or READ_ONCE/WRITE_ONCE
>          * for hrtimer_interrupts_saved. hrtimer_interrupts_saved is
> @@ -186,8 +178,20 @@ static bool is_hardlockup(unsigned int cpu)
>          */
>         per_cpu(hrtimer_interrupts_saved, cpu) =3D hrint;
>         per_cpu(hrtimer_interrupts_missed, cpu) =3D 0;
> +}
>
> -       return false;
> +static bool is_hardlockup(unsigned int cpu)
> +{
> +       int hrint =3D atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> +
> +       if (per_cpu(hrtimer_interrupts_saved, cpu) !=3D hrint)
> +               return false;
> +
> +       per_cpu(hrtimer_interrupts_missed, cpu)++;
> +       if (per_cpu(hrtimer_interrupts_missed, cpu) < watchdog_hardlockup=
_miss_thresh)
> +               return false;
> +
> +       return true;
>  }
>
>  static void watchdog_hardlockup_kick(void)
> @@ -200,23 +204,10 @@ static void watchdog_hardlockup_kick(void)
>
>  void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
>  {
> -       bool is_hl;
>         int hardlockup_all_cpu_backtrace;
> -       /*
> -        * Check for a hardlockup by making sure the CPU's timer
> -        * interrupt is incrementing. The timer interrupt should have
> -        * fired multiple times before we overflow'd. If it hasn't
> -        * then this is a good indication the cpu is stuck
> -        *
> -        * Purposely check this _before_ checking watchdog_hardlockup_tou=
ched
> -        * so we make sure we still update the saved value of the interru=
pts.
> -        * Without that we'll take an extra round through this function b=
efore
> -        * we can detect a lockup.
> -        */
> -
> -       is_hl =3D is_hardlockup(cpu);
>
>         if (per_cpu(watchdog_hardlockup_touched, cpu)) {
> +               watchdog_hardlockup_update_reset(cpu);
>                 per_cpu(watchdog_hardlockup_touched, cpu) =3D false;
>                 return;
>         }
> @@ -224,7 +215,13 @@ void watchdog_hardlockup_check(unsigned int cpu, str=
uct pt_regs *regs)
>         hardlockup_all_cpu_backtrace =3D (hardlockup_si_mask & SYS_INFO_A=
LL_BT) ?
>                                         1 : sysctl_hardlockup_all_cpu_bac=
ktrace;
>
> -       if (is_hl) {
> +       /*
> +        * Check for a hardlockup by making sure the CPU's timer
> +        * interrupt is incrementing. The timer interrupt should have
> +        * fired multiple times before we overflow'd. If it hasn't
> +        * then this is a good indication the cpu is stuck
> +        */
> +       if (is_hardlockup(cpu)) {
>                 unsigned int this_cpu =3D smp_processor_id();
>                 unsigned long flags;
>
> @@ -290,6 +287,7 @@ void watchdog_hardlockup_check(unsigned int cpu, stru=
ct pt_regs *regs)
>
>                 per_cpu(watchdog_hardlockup_warned, cpu) =3D true;
>         } else {
> +               watchdog_hardlockup_update_reset(cpu);
>                 per_cpu(watchdog_hardlockup_warned, cpu) =3D false;
>         }
>  }

I haven't tested it, but that actually looks like a pretty nice final
result to me. Mayank: What do you think? You'd have to figure out how
to rework your two patches to incorporate Petr's ideas.

Petr: Since you gave your ideas as a diff, what are you thinking in
terms of tags on Mayank's v2? You didn't provide a Signed-off-by on
your diff, so I guess you're expecting Mayank not to incorprate it
directly but take it as a "suggestion" for improving his patches (AKA
not add any of your tags to his v2).

One nit: in the final result, it might be nice to invert the
"is_hardlockup()" test so we can return early and get rid of a level
of indentation. AKA:

if (!is_hardlockup(cpu)) {
  watchdog_hardlockup_update_reset(cpu);
  per_cpu(watchdog_hardlockup_warned, cpu) =3D false;
  return;
}

Not only does it reduce indentation, but it also keeps the two calls
to watchdog_hardlockup_update_reset() closer to each other.

 -Doug
