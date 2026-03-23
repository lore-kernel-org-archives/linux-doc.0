Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2042383C6F
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 22:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305926; cv=none; b=a8x1lUAQevPNn5SJ58L2gPl0zC8Qyv5ndzRBbjxrBowQPStgMrWQU8q9p8g0PARgBmgmgUX3NpOlfVgvBCn0t/iRfSAhkglkfHlPoc8fpxdsi2jpgg9idKPD0VBA7QRwkhKexwcZpoggEOeBvjo4+0YdclppdAflokJMH/XEHSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305926; c=relaxed/simple;
	bh=2kzu9QAS8nq/rWccuNU8yORG+G8Zz82R9sasi+YwJb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvYPxjb2Zfg8+eKAmZ8ggejTADLvgPUibFAtPBMrhqLGlFFqP0GfULSuEjolup4KcnTil3s0koZIMI9mgvpsM0ydyQ72sNoMfFD1nIcDww0C/EOSWrLeMmah+/1xIBvIDdowMxvNZUMKxnOUD1lxmv0WtZnGcq8hgaYS+c48X0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bCUdNBUP; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bCUdNBUP"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9831ed36d4so487782566b.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774305919; x=1774910719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c32OW1kHdsnT8w2YL8DHro/JExX0+zDl978uxGueykc=;
        b=bCUdNBUPmtJagxJqaShQ5uTRih63RmwKTgksnx9JUrSBaQmB5N/TCvpPIi0SXKrpgx
         h2XJqLJwMJMPV4rEgibJPx1zXjoKlJbGpSJ+x1Zr4T4u1T+JLC7qHDPE1S010ljr4DsF
         Em8b5etnhBrU6NsFUlx2kYDZWg2uJUrOpFdMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305919; x=1774910719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c32OW1kHdsnT8w2YL8DHro/JExX0+zDl978uxGueykc=;
        b=LOWLL2zMtHjQgZSEc5izZga/VyRF8GqzIo/YfFTIPJCVo4lkdpHIapDYH1gsjdCS9U
         6ooVKaB0ak9t9bv7iJMhiSPH78EV/02DoPYps0FAW4PCe9iCf/h3Hvg5tyqnAKzLgYdo
         V6ZCpjTMVXDSz+6KOprlenax4C52gN9lUeh0zzJ6kUUfYBCv+3lpdlgkjDzVErWPl+Cb
         mP9G03EkNOQjsvGY6n2nm0Z1MrrTTTSzfbci++zo8xgIak5vW1SkMbxddooTiTBm3Wwe
         5s7PsPO5ZVouvZRbtg2AayyGtGxiv6b+Vnx1Rl6KS4rdex3hYOq+uLzzhEXi7JL70O3J
         tjZg==
X-Forwarded-Encrypted: i=1; AJvYcCUTWfaZGSAVy41+LrOXOPmYBopFCIixCHPf4dGT/b4V+t6PH8i0bETXCrz1urHE7lc1P+S3nieq9PI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGHxyPC91g0wBbqV4fzyup2Yg3/BaRBlA7zxPqaHTQ5/dZAqn/
	qPfairZKg+tP+rQB4g7kul3bOJrmQLFbo4CWIk65Fht8tNl91vVzDAgbL85p5Wt8jZbhMh/Bzbb
	1nWDmJtNe
X-Gm-Gg: ATEYQzw1H0u2OTwDMh5mZvA1rPSffzBZp4LVDXnZzFmYkUy33l/MU5LguzRopaYQGDW
	wpjIulw6Cpxh8a8cezGl1bT6ZMj+BM0toDgxoRdZ7SwGX1Irr25EjY2i34TabNvqjwVtsi8oqvG
	exsg9aXJNBU91rdb03XwMauh7QP7YnhSATJYjjNAoKrjh4VG+yD2IoJ1DtayLVXsRIREyoWEOXY
	4ooSjrsYQ+y6hV357SX/+CrISuIxtgxQjjjRGjsPNS/tTTVe/Y96C7IUEi9SgT3rzajbIkkj/ZG
	UswzmzXESULXcgfEqcDZrf20hEPimZKCGL46mqZLlDbk8mHyxm6e8TUamcn28kp79XjLajZji/m
	SLLmCtiTcGtwy3AU6MnLZRsTJSitWJeYoX3jqUxEv96/UDYRvTXfMnlIrRVTiX08gU7ETanmN/5
	oit+EKurTfs0P1kzCheqVILZk03zVf8tYzojkW88khZkLeI5vICUae5KmvlEY4I5upi+ryEIKK
X-Received: by 2002:a17:907:c281:b0:b98:a49:a237 with SMTP id a640c23a62f3a-b982f0c0082mr953025466b.6.1774305919242;
        Mon, 23 Mar 2026 15:45:19 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f439d1sm554531966b.13.2026.03.23.15.45.17
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 15:45:17 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso3543096f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:45:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQv9NqoYB0RYgLgVYbjJcwihJU+jY85c2gj+rfUQTW1iTr8va555jnVCygv6+1BXGTgG4bx6bhJWs=@vger.kernel.org
X-Received: by 2002:a05:6000:2011:b0:43b:3c05:d7fb with SMTP id
 ffacd0b85a97d-43b6427d66dmr21380349f8f.54.1774305917248; Mon, 23 Mar 2026
 15:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312-hardlockup-watchdog-fixes-v2-0-45bd8a0cc7ed@google.com>
 <20260312-hardlockup-watchdog-fixes-v2-5-45bd8a0cc7ed@google.com> <acF3tXBxSr0KOP9b@pathway.suse.cz>
In-Reply-To: <acF3tXBxSr0KOP9b@pathway.suse.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Mar 2026 15:45:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VWcEnmKvVKRY24a7sPq-Y3Oa6dSDqAUdV68oc_z8U4Aw@mail.gmail.com>
X-Gm-Features: AQROBzA1gqGckllUFmr_E4I0wr1AMi1GxakThognUpVQgrReaZ8OfkssaQC5qnE
Message-ID: <CAD=FV=VWcEnmKvVKRY24a7sPq-Y3Oa6dSDqAUdV68oc_z8U4Aw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] doc: watchdog: Document buddy detector
To: Petr Mladek <pmladek@suse.com>
Cc: mrungta@google.com, Jinchao Wang <wangjinchao600@gmail.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Stephane Eranian <eranian@google.com>, 
	Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>, 
	Feng Tang <feng.tang@linux.alibaba.com>, Max Kellermann <max.kellermann@ionos.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Florian Delizy <fdelizy@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 23, 2026 at 10:26=E2=80=AFAM Petr Mladek <pmladek@suse.com> wro=
te:
>
> From f1cfdc330cfbc68568dfe6bf2513bde9373c89d7 Mon Sep 17 00:00:00 2001
> From: Petr Mladek <pmladek@suse.com>
> Date: Mon, 23 Mar 2026 18:21:38 +0100
> Subject: [PATCH] doc: watchdog: Futher improvements
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---
>  .../admin-guide/lockup-watchdogs.rst          | 44 ++++++++++---------
>  1 file changed, 24 insertions(+), 20 deletions(-)
>
> diff --git a/Documentation/admin-guide/lockup-watchdogs.rst b/Documentati=
on/admin-guide/lockup-watchdogs.rst
> index 7ae7ce3abd2c..d0773edf3396 100644
> --- a/Documentation/admin-guide/lockup-watchdogs.rst
> +++ b/Documentation/admin-guide/lockup-watchdogs.rst
> @@ -41,31 +41,35 @@ is a trade-off between fast response to lockups and d=
etection overhead.
>  Implementation
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> -The soft lockup detector is built on top of the hrtimer subsystem.
> -The hard lockup detector is built on top of the perf subsystem
> -(on architectures that support it) or uses an SMP "buddy" system.
> -
> -Softlockup Detector
> --------------------
> -
> -The watchdog job runs in a stop scheduling thread that updates a
> -timestamp every time it is scheduled. If that timestamp is not updated
> -for 2*watchdog_thresh seconds (the softlockup threshold) the
> -'softlockup detector' (coded inside the hrtimer callback function)
> -will dump useful debug information to the system log, after which it
> -will call panic if it was instructed to do so or resume execution of
> -other kernel code.
> +The soft and hard lockup detectors are built around a hrtimer.
> +In addition, the softlockup detector regularly schedules a job, and
> +the hard lockup detector might use Perf/NMI events on architectures
> +that support it.
>
>  Frequency and Heartbeats
>  ------------------------
>
> -The hrtimer used by the softlockup detector serves a dual purpose:
> -it detects softlockups, and it also generates the interrupts
> -(heartbeats) that the hardlockup detectors use to verify CPU liveness.
> +The core of the detectors in a hrtimer. It servers multiple purpose:
>
> -The period of this hrtimer is 2*watchdog_thresh/5. This means the
> -hrtimer has two or three chances to generate an interrupt before the
> -NMI hardlockup detector kicks in.
> +- schedules watchdog job for the softlockup detector
> +- bumps the interrupt counter for hardlockup detectors (heartbeat)
> +- detects softlockups
> +- detects hardlockups in Buddy mode
> +
> +The period of this hrtimer is 2*watchdog_thresh/5, which is 4 seconds
> +by default. The hrtimer has two or three chances to generate an interrup=
t
> +(heartbeat) before the hardlockup detector kicks in.
> +
> +Softlockup Detector
> +-------------------
> +
> +The watchdog job is scheduled by the hrtimer and runs in a stop scheduli=
ng
> +thread. It updates a timestamp every time it is scheduled. If that times=
tamp
> +is not updated for 2*watchdog_thresh seconds (the softlockup threshold) =
the
> +'softlockup detector' (coded inside the hrtimer callback function)
> +will dump useful debug information to the system log, after which it
> +will call panic if it was instructed to do so or resume execution of
> +other kernel code.

I'm happy with Petr's further improvements.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I think Andrew can just pick it up atop Mayank's. Andrew: If you need
any reposting, please yell.

Petr: thank you very much for your review of these patches! I'm super
happy you found the bug in Mayank's V1 that I missed and I think
things look nice now. :-)

-Doug
