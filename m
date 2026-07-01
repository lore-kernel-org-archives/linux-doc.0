Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A943DB322
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 13:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911411; cv=none; b=PeNtNVlmAkttjEqr4WHic0LPc7dAo4hFcs2eDRxJqVEt20193+zo8q0Wwbh89ROyWLZuyH/AJ+uSJixtRR+6MyrGO6xd3/lkZkKmSj2sDC9FZNNEFIjpHzycantvX0+09P/PMpprOdc7WXeowjF3nt+TRx4aLS6Zyj4uhfGE034=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911411; c=relaxed/simple;
	bh=dz25e4niRTjlLBTCzRqCwxUDdk/P4R3keA9tFG8GiDM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e3JgnEgzHlu2RX7p5qIyqFsw8qLKEV8u9d3BGrxI6zV6YMePVzDzRSvy57tRegM7CC0D7VEAnd7wYVuTP4y/ZZK9dzR8F6mWwV/vE3u3jZH4FrbhJb2rTF185zmRd3/iuOBmqOjQWqzKwS0tJBlcnMng4wZ8FBzsTXSESZl4gWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EkmDP5iR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LkWy6OlC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EkmDP5iR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LkWy6OlC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782911408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uj8p9mOEpi1le29BugzJguH2/jwVpQA6SuiY+Jzqfpk=;
	b=EkmDP5iRKrZ+DwLbkFtCkGKzLDqnYC+pc8+U1fldtDGnZh8YcCAhqVYcPPc34dlFvAtDf9
	c819712/4rY/4x4PDzTZc9BOge9WG8k5QeW5qPl5IkTN7Qbem70dVxn3+QPmNPb3s656ti
	npb/UZQHsXRdyQsHwITQD2NG+MYGjvU=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-LjInI-D_PXGVCxicut5ukQ-1; Wed, 01 Jul 2026 09:10:06 -0400
X-MC-Unique: LjInI-D_PXGVCxicut5ukQ-1
X-Mimecast-MFC-AGG-ID: LjInI-D_PXGVCxicut5ukQ_1782911405
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-39b2a664e3eso2679291fa.3
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 06:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782911405; x=1783516205; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uj8p9mOEpi1le29BugzJguH2/jwVpQA6SuiY+Jzqfpk=;
        b=LkWy6OlCckaNhifXS9pGx4P5Rv75ICGAiUUrU/8cxGg7XiJi5YD+3500q8u88FEZJT
         N1OesSXXK6WP15JQKA13j68FV9dsxNIrM4x/2lRCKLxOxemF7HibpixlNSAxozfxTtkJ
         3GMxQirRPjWT7gVD431oWajqVGZ5bzOsaDbVnD/8Ad5c4HPowhd2xdacEQP/Kde+5ycj
         sjhVcDyriArQlPM0tK8DZgtccHyZY4xCYTYlFlFCesIjKvsV3n1AzQ+TYD9kiTn8eQq5
         3+CaT0U9oj0FpKF16ZCf5481d/sptc7z7lZsw7+UQc9ypjYJwzL49DmbcPl7RcDg8gzm
         CWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782911405; x=1783516205;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uj8p9mOEpi1le29BugzJguH2/jwVpQA6SuiY+Jzqfpk=;
        b=hn1a1VTNAstCBdo7nLJguXXmiQJgYDg2rPfoPG9mnj+vAtMSiTYAITelOfAwHcdneZ
         nAxUthdv1/dwE6Ov8CmPrG4PDUEeoqQWAIE7K4eynmn+T1NS1/eKp2woqhezYzh0atN1
         8m1cf4m/h2yBsnnNjo5m/i7vOgUDZC4Zk9aEHpw5igPmV4WvS6hzCHu1faBJuXTiE7x3
         BT/efICFg0HOB7atP8C8NAFBAi5NhMgKaIwNXa9fDCnEA2VTSrtsqYFQBRRlGRdqRGPi
         B066rKXcHVR+6rp+BLqt1/+OvcuLQNUg6nb9yZIg7uYdxIS0ZbuGMrSlRl5B9jcqHXBL
         J4gg==
X-Forwarded-Encrypted: i=1; AHgh+RpWwCcyGWlL53IBvYqNW0be0BtVCpv5AgsU5nk6Z4/84FiU/PJq8pvFvuT6MKqTPyWMHQ3V7rxDIec=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA4OpTyDunlHVXEodAPVEO5f69pxzsJe6O7z5waGmQ+iqmjcO+
	jFAuhyvpQ8Mzb0OPzXHCuFi4LskmlA+TqBGcszxnnC3iAH8Bfye/tI1dCNlNpkaSxNavFoLt8VA
	SUxN84nL5GhAnZIB3051vWei4dNjrnW6njApQ6tUOJlmoeVhrUAr5lWvwTwgPe5UCdoFiAU02
X-Gm-Gg: AfdE7ckgJJyFsq3o6ejD9wGoD9lwyt2yU36TxVMT6gQoIqb+p1+7CfLc416ARA60396
	V5vfU++3/KdOUHgW68HlHfJbyKnCIDFPAL81QdBDl5eUaoYGOlhhWL2yuOgWmmv2ZLalkqeCgkU
	bdRHN2skae3pi0qBL5Vg1mjxvjkPYXBEtOG41+iVSGCCenDeza8wa8qXYWwHQQWpIlc9jn15xfO
	K41xgUMz3H5Gep/1moAetAoKk9Kge4tE7MZDjtzYkbe2eKS1cOr8ZfZMKhGbwNNGujT80aLa8y1
	B6pbgaWFxHqkBMc46Wmz8q71QmVhcZTZagEfZTSNGhNbdZVVhlRiaWNVkPPepOtMiwLMdO4jfRU
	0Q/QskNEqEOkZqvgWcBmZXSOEH5JE6vT2yNKn1vbwig0TRtwFFOH49LRDjsWJbcw1M2hOGgj0Xx
	NucCQP
X-Received: by 2002:a05:6512:608f:b0:5ad:4cb6:fcf with SMTP id 2adb3069b0e04-5aec67a2aacmr416158e87.12.1782911404831;
        Wed, 01 Jul 2026 06:10:04 -0700 (PDT)
X-Received: by 2002:a05:600c:34d4:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-493c2b3a709mr26824805e9.2.1782910956927;
        Wed, 01 Jul 2026 06:02:36 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be810be8sm70747835e9.9.2026.07.01.06.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:02:36 -0700 (PDT)
Message-ID: <23cc72600e6ce9161f8fa375996dd572b4631552.camel@redhat.com>
Subject: Re: [PATCH v2 3/4] rv/rtapp/sleep: Stop monitoring kernel threads
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linux-trace-kernel@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Date: Wed, 01 Jul 2026 15:02:34 +0200
In-Reply-To: <eec2ca5224bcdacc45b8e1eb2f0e68109e1cae7a.1781852967.git.namcao@linutronix.de>
References: <cover.1781852967.git.namcao@linutronix.de>
	 <eec2ca5224bcdacc45b8e1eb2f0e68109e1cae7a.1781852967.git.namcao@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-06-19 at 09:21 +0200, Nam Cao wrote:
> The rtapp/sleep monitor's primary purpose is detecting common mistakes
> with user-space real-time design. Monitoring real-time issues with
> kernel threads is a bonus.
>=20
> However, accomodating kernel threads complicates the monitor due to
> the edge cases which is seen by the monitor as lower-priority task
> waking higher-priority task:
>=20
> =C2=A0 - kthread_stop() wakes up the task in order to stop it.
>=20
> =C2=A0 - The rcu thread and migration thread can be woken by any task.
>=20
> =C2=A0 - The ktimerd thread is woken near the end of irq_exit_rcu(), wher=
e
> =C2=A0=C2=A0=C2=A0 the preempt counter is "broken" and falsely says this =
is task
> =C2=A0=C2=A0=C2=A0 context. This requires the monitor to use the hardirq_=
context flag
> =C2=A0=C2=A0=C2=A0 instead of the preempt counter.
>=20
> Beside complicating the monitor, the final case also requires enabling
> CONFIG_TRACE_IRQFLAGS (so that "hardirq_context" can be used). This
> adds overhead to the kernel even when the monitor is not active. This
> may be an obstacle to enabling this monitor in distros' kernels.

Very good especially for this!

> Furthermore, kernel threads usually are started before the monitor is
> enabled. Consequently, the threads' states (i.o.w. the monitor's
> atomic propositions for the threads) are not fully known to the
> monitor. As a result, the kernel threads mostly cannot be monitored.
>=20
> Overall, the downsides of accomodating kernel threads outweights the
> benefits. Thus, exclude kernel threads to simplify the monitor.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

Thanks,
Gabriele

> ---
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> =C2=A0Documentation/trace/rv/monitor_rtapp.rst=C2=A0 |=C2=A0 22 ++---
> =C2=A0kernel/trace/rv/monitors/sleep/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 -
> =C2=A0kernel/trace/rv/monitors/sleep/sleep.c=C2=A0=C2=A0=C2=A0 |=C2=A0 39=
 +-------
> =C2=A0kernel/trace/rv/monitors/sleep/sleep.h=C2=A0=C2=A0=C2=A0 | 104 ++++=
+++++-------------
> =C2=A0tools/verification/models/rtapp/sleep.ltl |=C2=A0=C2=A0 7 +-
> =C2=A05 files changed, 54 insertions(+), 119 deletions(-)
>=20
> diff --git a/Documentation/trace/rv/monitor_rtapp.rst
> b/Documentation/trace/rv/monitor_rtapp.rst
> index 570be67a8f3b..502d3ea412eb 100644
> --- a/Documentation/trace/rv/monitor_rtapp.rst
> +++ b/Documentation/trace/rv/monitor_rtapp.rst
> @@ -93,9 +93,9 @@ assessment.
> =C2=A0
> =C2=A0The monitor's specification is::
> =C2=A0
> -=C2=A0 RULE =3D always ((RT and SLEEP) imply (RT_FRIENDLY_SLEEP or ALLOW=
LIST))
> +=C2=A0 RULE =3D always ((RT and SLEEP and USER_THREAD) imply (RT_FRIENDL=
Y_SLEEP or
> ALLOWLIST))
> =C2=A0
> -=C2=A0 RT_FRIENDLY_SLEEP =3D (RT_VALID_SLEEP_REASON or KERNEL_THREAD)
> +=C2=A0 RT_FRIENDLY_SLEEP =3D RT_VALID_SLEEP_REASON
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and ((not SCHEDULE_IN) until RT_FRIEND=
LY_WAKE)
> =C2=A0
> =C2=A0=C2=A0 RT_VALID_SLEEP_REASON =3D FUTEX_WAIT
> @@ -110,23 +110,13 @@ The monitor's specification is::
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or WOKEN_BY_HARDIRQ
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or WOKEN_BY_NMI
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or ABORT_SLEEP
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or KTHREAD_SHOULD_STOP
> =C2=A0
> =C2=A0=C2=A0 ALLOWLIST =3D BLOCK_ON_RT_MUTEX
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or FUT=
EX_LOCK_PI
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or TASK_IS_=
RCU
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or TASK_IS_=
MIGRATION
> -
> -Beside the scenarios described above, this specification also handle som=
e
> -special cases:
> -
> -=C2=A0 - `KERNEL_THREAD`: kernel tasks do not have any pattern that can =
be
> recognized
> -=C2=A0=C2=A0=C2=A0 as valid real-time sleeping reasons. Therefore sleepi=
ng reason is not
> -=C2=A0=C2=A0=C2=A0 checked for kernel tasks.
> -=C2=A0 - `KTHREAD_SHOULD_STOP`: a non-real-time thread may stop a real-t=
ime kernel
> -=C2=A0=C2=A0=C2=A0 thread by waking it and waiting for it to exit (`kthr=
ead_stop()`). This
> -=C2=A0=C2=A0=C2=A0 wakeup is safe for real-time.
> -=C2=A0 - `ALLOWLIST`: to handle known false positives with the kernel.
> +
> +Beside the scenarios described above, this specification also defines an
> allow list
> +to handle some special cases:
> +
> =C2=A0=C2=A0 - `BLOCK_ON_RT_MUTEX` is included in the allowlist due to it=
s
> implementation.
> =C2=A0=C2=A0=C2=A0=C2=A0 In the release path of rt_mutex, a boosted task =
is de-boosted before
> waking
> =C2=A0=C2=A0=C2=A0=C2=A0 the rt_mutex's waiter. Consequently, the monitor=
 may see a real-time-
> unsafe
> diff --git a/kernel/trace/rv/monitors/sleep/Kconfig
> b/kernel/trace/rv/monitors/sleep/Kconfig
> index 6b7a122e7b47..d6ec3e9a91b6 100644
> --- a/kernel/trace/rv/monitors/sleep/Kconfig
> +++ b/kernel/trace/rv/monitors/sleep/Kconfig
> @@ -5,7 +5,6 @@ config RV_MON_SLEEP
> =C2=A0	select RV_LTL_MONITOR
> =C2=A0	depends on HAVE_SYSCALL_TRACEPOINTS
> =C2=A0	depends on RV_MON_RTAPP
> -	select TRACE_IRQFLAGS
> =C2=A0	default y
> =C2=A0	select LTL_MON_EVENTS_ID
> =C2=A0	bool "sleep monitor"
> diff --git a/kernel/trace/rv/monitors/sleep/sleep.c
> b/kernel/trace/rv/monitors/sleep/sleep.c
> index 638be7d8747f..aa5a984853b5 100644
> --- a/kernel/trace/rv/monitors/sleep/sleep.c
> +++ b/kernel/trace/rv/monitors/sleep/sleep.c
> @@ -43,7 +43,6 @@ static void ltl_atoms_init(struct task_struct *task, st=
ruct
> ltl_monitor *mon, bo
> =C2=A0	ltl_atom_set(mon, LTL_WOKEN_BY_EQUAL_OR_HIGHER_PRIO, false);
> =C2=A0
> =C2=A0	if (task_creation) {
> -		ltl_atom_set(mon, LTL_KTHREAD_SHOULD_STOP, false);
> =C2=A0		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_REALTIME, false);
> =C2=A0		ltl_atom_set(mon, LTL_NANOSLEEP_TIMER_ABSTIME, false);
> =C2=A0		ltl_atom_set(mon, LTL_CLOCK_NANOSLEEP, false);
> @@ -53,33 +52,7 @@ static void ltl_atoms_init(struct task_struct *task, s=
truct
> ltl_monitor *mon, bo
> =C2=A0		ltl_atom_set(mon, LTL_BLOCK_ON_RT_MUTEX, false);
> =C2=A0	}
> =C2=A0
> -	if (task->flags & PF_KTHREAD) {
> -		ltl_atom_set(mon, LTL_KERNEL_THREAD, true);
> -
> -		/* kernel tasks do not do syscall */
> -		ltl_atom_set(mon, LTL_FUTEX_WAIT, false);
> -		ltl_atom_set(mon, LTL_FUTEX_LOCK_PI, false);
> -		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_REALTIME, false);
> -		ltl_atom_set(mon, LTL_NANOSLEEP_TIMER_ABSTIME, false);
> -		ltl_atom_set(mon, LTL_CLOCK_NANOSLEEP, false);
> -		ltl_atom_set(mon, LTL_EPOLL_WAIT, false);
> -
> -		if (strstarts(task->comm, "migration/"))
> -			ltl_atom_set(mon, LTL_TASK_IS_MIGRATION, true);
> -		else
> -			ltl_atom_set(mon, LTL_TASK_IS_MIGRATION, false);
> -
> -		if (strstarts(task->comm, "rcu"))
> -			ltl_atom_set(mon, LTL_TASK_IS_RCU, true);
> -		else
> -			ltl_atom_set(mon, LTL_TASK_IS_RCU, false);
> -	} else {
> -		ltl_atom_set(mon, LTL_KTHREAD_SHOULD_STOP, false);
> -		ltl_atom_set(mon, LTL_KERNEL_THREAD, false);
> -		ltl_atom_set(mon, LTL_TASK_IS_RCU, false);
> -		ltl_atom_set(mon, LTL_TASK_IS_MIGRATION, false);
> -	}
> -
> +	ltl_atom_set(mon, LTL_USER_THREAD, !(task->flags & PF_KTHREAD));
> =C2=A0}
> =C2=A0
> =C2=A0static void handle_sched_set_state(void *data, struct task_struct *=
task, int
> state)
> @@ -97,7 +70,7 @@ static void handle_sched_exit(void *data, bool is_switc=
h)
> =C2=A0
> =C2=A0static void handle_sched_waking(void *data, struct task_struct *tas=
k)
> =C2=A0{
> -	if (this_cpu_read(hardirq_context)) {
> +	if (in_hardirq()) {
> =C2=A0		ltl_atom_pulse(task, LTL_WOKEN_BY_HARDIRQ, true);
> =C2=A0	} else if (in_task()) {
> =C2=A0		if (current->prio <=3D task->prio)
> @@ -181,12 +154,6 @@ static void handle_sys_exit(void *data, struct pt_re=
gs
> *regs, long ret)
> =C2=A0	ltl_atom_update(current, LTL_CLOCK_NANOSLEEP, false);
> =C2=A0}
> =C2=A0
> -static void handle_kthread_stop(void *data, struct task_struct *task)
> -{
> -	/* FIXME: this could race with other tracepoint handlers */
> -	ltl_atom_update(task, LTL_KTHREAD_SHOULD_STOP, true);
> -}
> -
> =C2=A0static int enable_sleep(void)
> =C2=A0{
> =C2=A0	int retval;
> @@ -200,7 +167,6 @@ static int enable_sleep(void)
> =C2=A0	rv_attach_trace_probe("rtapp_sleep", sched_set_state_tp,
> handle_sched_set_state);
> =C2=A0	rv_attach_trace_probe("rtapp_sleep", contention_begin,
> handle_contention_begin);
> =C2=A0	rv_attach_trace_probe("rtapp_sleep", contention_end,
> handle_contention_end);
> -	rv_attach_trace_probe("rtapp_sleep", sched_kthread_stop,
> handle_kthread_stop);
> =C2=A0	rv_attach_trace_probe("rtapp_sleep", sys_enter, handle_sys_enter);
> =C2=A0	rv_attach_trace_probe("rtapp_sleep", sys_exit, handle_sys_exit);
> =C2=A0	return 0;
> @@ -213,7 +179,6 @@ static void disable_sleep(void)
> =C2=A0	rv_detach_trace_probe("rtapp_sleep", sched_set_state_tp,
> handle_sched_set_state);
> =C2=A0	rv_detach_trace_probe("rtapp_sleep", contention_begin,
> handle_contention_begin);
> =C2=A0	rv_detach_trace_probe("rtapp_sleep", contention_end,
> handle_contention_end);
> -	rv_detach_trace_probe("rtapp_sleep", sched_kthread_stop,
> handle_kthread_stop);
> =C2=A0	rv_detach_trace_probe("rtapp_sleep", sys_enter, handle_sys_enter);
> =C2=A0	rv_detach_trace_probe("rtapp_sleep", sys_exit, handle_sys_exit);
> =C2=A0
> diff --git a/kernel/trace/rv/monitors/sleep/sleep.h
> b/kernel/trace/rv/monitors/sleep/sleep.h
> index 2fe2ec7edae8..44e593f41e6a 100644
> --- a/kernel/trace/rv/monitors/sleep/sleep.h
> +++ b/kernel/trace/rv/monitors/sleep/sleep.h
> @@ -18,15 +18,12 @@ enum ltl_atom {
> =C2=A0	LTL_EPOLL_WAIT,
> =C2=A0	LTL_FUTEX_LOCK_PI,
> =C2=A0	LTL_FUTEX_WAIT,
> -	LTL_KERNEL_THREAD,
> -	LTL_KTHREAD_SHOULD_STOP,
> =C2=A0	LTL_NANOSLEEP_CLOCK_REALTIME,
> =C2=A0	LTL_NANOSLEEP_TIMER_ABSTIME,
> =C2=A0	LTL_RT,
> =C2=A0	LTL_SCHEDULE_IN,
> =C2=A0	LTL_SLEEP,
> -	LTL_TASK_IS_MIGRATION,
> -	LTL_TASK_IS_RCU,
> +	LTL_USER_THREAD,
> =C2=A0	LTL_WOKEN_BY_EQUAL_OR_HIGHER_PRIO,
> =C2=A0	LTL_WOKEN_BY_HARDIRQ,
> =C2=A0	LTL_WOKEN_BY_NMI,
> @@ -43,15 +40,12 @@ static const char *ltl_atom_str(enum ltl_atom atom)
> =C2=A0		"ep_wa",
> =C2=A0		"fu_lo_pi",
> =C2=A0		"fu_wa",
> -		"ker_th",
> -		"kth_sh_st",
> =C2=A0		"na_cl_re",
> =C2=A0		"na_ti_ab",
> =C2=A0		"rt",
> =C2=A0		"sch_in",
> =C2=A0		"sle",
> -		"ta_mi",
> -		"ta_rc",
> +		"us_th",
> =C2=A0		"wo_eq_hi_pr",
> =C2=A0		"wo_ha",
> =C2=A0		"wo_nm",
> @@ -79,46 +73,41 @@ static void ltl_start(struct task_struct *task, struc=
t
> ltl_monitor *mon)
> =C2=A0	bool woken_by_hardirq =3D test_bit(LTL_WOKEN_BY_HARDIRQ, mon->atom=
s);
> =C2=A0	bool woken_by_equal_or_higher_prio =3D
> test_bit(LTL_WOKEN_BY_EQUAL_OR_HIGHER_PRIO,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 mon->atoms);
> -	bool task_is_rcu =3D test_bit(LTL_TASK_IS_RCU, mon->atoms);
> -	bool task_is_migration =3D test_bit(LTL_TASK_IS_MIGRATION, mon->atoms);
> +	bool user_thread =3D test_bit(LTL_USER_THREAD, mon->atoms);
> =C2=A0	bool sleep =3D test_bit(LTL_SLEEP, mon->atoms);
> =C2=A0	bool schedule_in =3D test_bit(LTL_SCHEDULE_IN, mon->atoms);
> =C2=A0	bool rt =3D test_bit(LTL_RT, mon->atoms);
> =C2=A0	bool nanosleep_timer_abstime =3D test_bit(LTL_NANOSLEEP_TIMER_ABST=
IME,
> mon->atoms);
> =C2=A0	bool nanosleep_clock_realtime =3D
> test_bit(LTL_NANOSLEEP_CLOCK_REALTIME, mon->atoms);
> -	bool kthread_should_stop =3D test_bit(LTL_KTHREAD_SHOULD_STOP, mon-
> >atoms);
> -	bool kernel_thread =3D test_bit(LTL_KERNEL_THREAD, mon->atoms);
> =C2=A0	bool futex_wait =3D test_bit(LTL_FUTEX_WAIT, mon->atoms);
> =C2=A0	bool futex_lock_pi =3D test_bit(LTL_FUTEX_LOCK_PI, mon->atoms);
> =C2=A0	bool epoll_wait =3D test_bit(LTL_EPOLL_WAIT, mon->atoms);
> =C2=A0	bool clock_nanosleep =3D test_bit(LTL_CLOCK_NANOSLEEP, mon->atoms)=
;
> =C2=A0	bool block_on_rt_mutex =3D test_bit(LTL_BLOCK_ON_RT_MUTEX, mon->at=
oms);
> =C2=A0	bool abort_sleep =3D test_bit(LTL_ABORT_SLEEP, mon->atoms);
> -	bool val41 =3D task_is_rcu || task_is_migration;
> -	bool val42 =3D futex_lock_pi || val41;
> -	bool val5 =3D block_on_rt_mutex || val42;
> -	bool val33 =3D abort_sleep || kthread_should_stop;
> -	bool val34 =3D woken_by_nmi || val33;
> -	bool val35 =3D woken_by_hardirq || val34;
> -	bool val14 =3D woken_by_equal_or_higher_prio || val35;
> +	bool val7 =3D block_on_rt_mutex || futex_lock_pi;
> +	bool val32 =3D woken_by_nmi || abort_sleep;
> +	bool val33 =3D woken_by_hardirq || val32;
> +	bool val14 =3D woken_by_equal_or_higher_prio || val33;
> =C2=A0	bool val13 =3D !schedule_in;
> =C2=A0	bool val25 =3D !nanosleep_clock_realtime;
> =C2=A0	bool val26 =3D nanosleep_timer_abstime && val25;
> =C2=A0	bool val18 =3D clock_nanosleep && val26;
> =C2=A0	bool val20 =3D val18 || epoll_wait;
> -	bool val9 =3D futex_wait || val20;
> -	bool val11 =3D val9 || kernel_thread;
> +	bool val11 =3D futex_wait || val20;
> +	bool val3 =3D !user_thread;
> =C2=A0	bool val2 =3D !sleep;
> +	bool val4 =3D val2 || val3;
> =C2=A0	bool val1 =3D !rt;
> -	bool val3 =3D val1 || val2;
> +	bool val5 =3D val1 || val4;
> =C2=A0
> -	if (val3)
> +	if (val5)
> =C2=A0		__set_bit(S0, mon->states);
> =C2=A0	if (val11 && val13)
> =C2=A0		__set_bit(S1, mon->states);
> =C2=A0	if (val11 && val14)
> =C2=A0		__set_bit(S4, mon->states);
> -	if (val5)
> +	if (val7)
> =C2=A0		__set_bit(S5, mon->states);
> =C2=A0}
> =C2=A0
> @@ -129,130 +118,125 @@ ltl_possible_next_states(struct ltl_monitor *mon,
> unsigned int state, unsigned l
> =C2=A0	bool woken_by_hardirq =3D test_bit(LTL_WOKEN_BY_HARDIRQ, mon->atom=
s);
> =C2=A0	bool woken_by_equal_or_higher_prio =3D
> test_bit(LTL_WOKEN_BY_EQUAL_OR_HIGHER_PRIO,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 mon->atoms);
> -	bool task_is_rcu =3D test_bit(LTL_TASK_IS_RCU, mon->atoms);
> -	bool task_is_migration =3D test_bit(LTL_TASK_IS_MIGRATION, mon->atoms);
> +	bool user_thread =3D test_bit(LTL_USER_THREAD, mon->atoms);
> =C2=A0	bool sleep =3D test_bit(LTL_SLEEP, mon->atoms);
> =C2=A0	bool schedule_in =3D test_bit(LTL_SCHEDULE_IN, mon->atoms);
> =C2=A0	bool rt =3D test_bit(LTL_RT, mon->atoms);
> =C2=A0	bool nanosleep_timer_abstime =3D test_bit(LTL_NANOSLEEP_TIMER_ABST=
IME,
> mon->atoms);
> =C2=A0	bool nanosleep_clock_realtime =3D
> test_bit(LTL_NANOSLEEP_CLOCK_REALTIME, mon->atoms);
> -	bool kthread_should_stop =3D test_bit(LTL_KTHREAD_SHOULD_STOP, mon-
> >atoms);
> -	bool kernel_thread =3D test_bit(LTL_KERNEL_THREAD, mon->atoms);
> =C2=A0	bool futex_wait =3D test_bit(LTL_FUTEX_WAIT, mon->atoms);
> =C2=A0	bool futex_lock_pi =3D test_bit(LTL_FUTEX_LOCK_PI, mon->atoms);
> =C2=A0	bool epoll_wait =3D test_bit(LTL_EPOLL_WAIT, mon->atoms);
> =C2=A0	bool clock_nanosleep =3D test_bit(LTL_CLOCK_NANOSLEEP, mon->atoms)=
;
> =C2=A0	bool block_on_rt_mutex =3D test_bit(LTL_BLOCK_ON_RT_MUTEX, mon->at=
oms);
> =C2=A0	bool abort_sleep =3D test_bit(LTL_ABORT_SLEEP, mon->atoms);
> -	bool val41 =3D task_is_rcu || task_is_migration;
> -	bool val42 =3D futex_lock_pi || val41;
> -	bool val5 =3D block_on_rt_mutex || val42;
> -	bool val33 =3D abort_sleep || kthread_should_stop;
> -	bool val34 =3D woken_by_nmi || val33;
> -	bool val35 =3D woken_by_hardirq || val34;
> -	bool val14 =3D woken_by_equal_or_higher_prio || val35;
> +	bool val7 =3D block_on_rt_mutex || futex_lock_pi;
> +	bool val32 =3D woken_by_nmi || abort_sleep;
> +	bool val33 =3D woken_by_hardirq || val32;
> +	bool val14 =3D woken_by_equal_or_higher_prio || val33;
> =C2=A0	bool val13 =3D !schedule_in;
> =C2=A0	bool val25 =3D !nanosleep_clock_realtime;
> =C2=A0	bool val26 =3D nanosleep_timer_abstime && val25;
> =C2=A0	bool val18 =3D clock_nanosleep && val26;
> =C2=A0	bool val20 =3D val18 || epoll_wait;
> -	bool val9 =3D futex_wait || val20;
> -	bool val11 =3D val9 || kernel_thread;
> +	bool val11 =3D futex_wait || val20;
> +	bool val3 =3D !user_thread;
> =C2=A0	bool val2 =3D !sleep;
> +	bool val4 =3D val2 || val3;
> =C2=A0	bool val1 =3D !rt;
> -	bool val3 =3D val1 || val2;
> +	bool val5 =3D val1 || val4;
> =C2=A0
> =C2=A0	switch (state) {
> =C2=A0	case S0:
> -		if (val3)
> +		if (val5)
> =C2=A0			__set_bit(S0, next);
> =C2=A0		if (val11 && val13)
> =C2=A0			__set_bit(S1, next);
> =C2=A0		if (val11 && val14)
> =C2=A0			__set_bit(S4, next);
> -		if (val5)
> +		if (val7)
> =C2=A0			__set_bit(S5, next);
> =C2=A0		break;
> =C2=A0	case S1:
> =C2=A0		if (val11 && val13)
> =C2=A0			__set_bit(S1, next);
> -		if (val13 && val3)
> +		if (val13 && val5)
> =C2=A0			__set_bit(S2, next);
> -		if (val14 && val3)
> +		if (val14 && val5)
> =C2=A0			__set_bit(S3, next);
> =C2=A0		if (val11 && val14)
> =C2=A0			__set_bit(S4, next);
> -		if (val13 && val5)
> +		if (val13 && val7)
> =C2=A0			__set_bit(S6, next);
> -		if (val14 && val5)
> +		if (val14 && val7)
> =C2=A0			__set_bit(S7, next);
> =C2=A0		break;
> =C2=A0	case S2:
> =C2=A0		if (val11 && val13)
> =C2=A0			__set_bit(S1, next);
> -		if (val13 && val3)
> +		if (val13 && val5)
> =C2=A0			__set_bit(S2, next);
> -		if (val14 && val3)
> +		if (val14 && val5)
> =C2=A0			__set_bit(S3, next);
> =C2=A0		if (val11 && val14)
> =C2=A0			__set_bit(S4, next);
> -		if (val13 && val5)
> +		if (val13 && val7)
> =C2=A0			__set_bit(S6, next);
> -		if (val14 && val5)
> +		if (val14 && val7)
> =C2=A0			__set_bit(S7, next);
> =C2=A0		break;
> =C2=A0	case S3:
> -		if (val3)
> +		if (val5)
> =C2=A0			__set_bit(S0, next);
> =C2=A0		if (val11 && val13)
> =C2=A0			__set_bit(S1, next);
> =C2=A0		if (val11 && val14)
> =C2=A0			__set_bit(S4, next);
> -		if (val5)
> +		if (val7)
> =C2=A0			__set_bit(S5, next);
> =C2=A0		break;
> =C2=A0	case S4:
> -		if (val3)
> +		if (val5)
> =C2=A0			__set_bit(S0, next);
> =C2=A0		if (val11 && val13)
> =C2=A0			__set_bit(S1, next);
> =C2=A0		if (val11 && val14)
> =C2=A0			__set_bit(S4, next);
> -		if (val5)
> +		if (val7)
> =C2=A0			__set_bit(S5, next);
> =C2=A0		break;
> =C2=A0	case S5:
> -		if (val3)
> +		if (val5)
> =C2=A0			__set_bit(S0, next);
> =C2=A0		if (val11 && val13)
> =C2=A0			__set_bit(S1, next);
> =C2=A0		if (val11 && val14)
> =C2=A0			__set_bit(S4, next);
> -		if (val5)
> +		if (val7)
> =C2=A0			__set_bit(S5, next);
> =C2=A0		break;
> =C2=A0	case S6:
> =C2=A0		if (val11 && val13)
> =C2=A0			__set_bit(S1, next);
> -		if (val13 && val3)
> +		if (val13 && val5)
> =C2=A0			__set_bit(S2, next);
> -		if (val14 && val3)
> +		if (val14 && val5)
> =C2=A0			__set_bit(S3, next);
> =C2=A0		if (val11 && val14)
> =C2=A0			__set_bit(S4, next);
> -		if (val13 && val5)
> +		if (val13 && val7)
> =C2=A0			__set_bit(S6, next);
> -		if (val14 && val5)
> +		if (val14 && val7)
> =C2=A0			__set_bit(S7, next);
> =C2=A0		break;
> =C2=A0	case S7:
> -		if (val3)
> +		if (val5)
> =C2=A0			__set_bit(S0, next);
> =C2=A0		if (val11 && val13)
> =C2=A0			__set_bit(S1, next);
> =C2=A0		if (val11 && val14)
> =C2=A0			__set_bit(S4, next);
> -		if (val5)
> +		if (val7)
> =C2=A0			__set_bit(S5, next);
> =C2=A0		break;
> =C2=A0	}
> diff --git a/tools/verification/models/rtapp/sleep.ltl
> b/tools/verification/models/rtapp/sleep.ltl
> index 5923e58d7810..4d78fdd204c0 100644
> --- a/tools/verification/models/rtapp/sleep.ltl
> +++ b/tools/verification/models/rtapp/sleep.ltl
> @@ -1,6 +1,6 @@
> -RULE =3D always ((RT and SLEEP) imply (RT_FRIENDLY_SLEEP or ALLOWLIST))
> +RULE =3D always ((RT and SLEEP and USER_THREAD) imply (RT_FRIENDLY_SLEEP=
 or
> ALLOWLIST))
> =C2=A0
> -RT_FRIENDLY_SLEEP =3D (RT_VALID_SLEEP_REASON or KERNEL_THREAD)
> +RT_FRIENDLY_SLEEP =3D RT_VALID_SLEEP_REASON
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 and ((not SCHEDULE_IN) until RT_FRIENDLY_WAKE)
> =C2=A0
> =C2=A0RT_VALID_SLEEP_REASON =3D FUTEX_WAIT
> @@ -15,9 +15,6 @@ RT_FRIENDLY_WAKE =3D WOKEN_BY_EQUAL_OR_HIGHER_PRIO
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 or WOKEN_BY_HARDIRQ
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 or WOKEN_BY_NMI
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 or ABORT_SLEEP
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 or KTHREAD_SHOULD_STOP
> =C2=A0
> =C2=A0ALLOWLIST =3D BLOCK_ON_RT_MUTEX
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or FUTEX_LOCK_PI
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or TASK_IS_RCU
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or TASK_IS_MIGRATION

