Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319374963C7
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 12:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908966; cv=none; b=ljkukAKW+H+bCVbdsFdrSy0vp1COSNpzq6DSpYDwWw+zX/Dg25ozTzj79/CyoXXEmk4C45VV8o6Xnqr6XMvSj3JgjzM4cTzDALOPrWJXKqbPBUvk3tovhdnUoluK//s1KgJneACXbMEIKNlFxHCrizX5lnSH25RoX9ZNhb25u1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908966; c=relaxed/simple;
	bh=EsRgTGwn9/ciJwe1BkaH+LEHpHlf8QDoSBbMPs4cZVY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QmrDqT6HhRNx3SYxkQLh48Jl5t8JNnHtnjV/JSl12Lo22x3gTFQyfBv0k9geYqjvUQVu2ETk+tc3urenTSpdaKw4rbWGaUVsHKQDwePCVEStExdRbdqvoY07eA+YRDOeFm2vdhkTe91+B/IryEQp7WedOtJzC4x2naei0YdZPhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ANasSRQc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SL6mUymt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ANasSRQc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SL6mUymt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782908964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8QBml1wXQrKkB4Dbp2yh/EBSKR66LFRDhLUx+zmUXDw=;
	b=ANasSRQcTp4nNULF2ZmFfTR1J+7NLsWKo2VKs2jzZDJR4Shup+t2xq22coIT9dKd28jnDw
	YkIuUHztQ3pSmzVSWespUJV/HBXj2qdcEd+ntBdi3RW+fpc9qqTmdDf5moaOk+n/CDqB7/
	OxQtQU/zJ0JMNtSqAA8bLqiSLVZtdAA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-L52MIif1PKSFEL8l3nmyqA-1; Wed, 01 Jul 2026 08:29:23 -0400
X-MC-Unique: L52MIif1PKSFEL8l3nmyqA-1
X-Mimecast-MFC-AGG-ID: L52MIif1PKSFEL8l3nmyqA_1782908962
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-493b786d550so7128145e9.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 05:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782908962; x=1783513762; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8QBml1wXQrKkB4Dbp2yh/EBSKR66LFRDhLUx+zmUXDw=;
        b=SL6mUymt9O2j3NjXXcD4VjA8HECRahGlEVSS7X5Wgq/dv2QlAOk30Rwg6iOgRqEnFn
         uNCBD2QGci8iX8eMKrLiCHp+mLUP4hles+72Xiev7G6wcyciSAFbdaQYAPtNcRlSQkI2
         CfiObUKhfloDNX0z1v9LaghXHqXXYHS7A9xTEaGP94c2Ybp1+N7zc4FyJVH/kZNvvHx8
         RiYmcFsvHsZDfSgw7UrZE5yugdxqT5TN2uoIhPAhQM8Q6tWha8jVePVT5yDit53jLuRV
         +YEOREK0sx9eP1uzLpAA8TMXMnaP5dKGAwCICgPtmRK4obwefb9b9se7msduFanp1rRi
         5MNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782908962; x=1783513762;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8QBml1wXQrKkB4Dbp2yh/EBSKR66LFRDhLUx+zmUXDw=;
        b=USvxWNstuNqfrYLr+N7skysorye9Sbob7u+MHNAqs0IyE+lvhAYECD9gI3wraSwaVs
         aH+jtEKO8rFyLibMUitCfIkxMhnV8d3kqrPt8VoYBeZuv8ivC3IxZQcLjB5kkcqo3cD1
         WRp4sV0gy2denWvYjxHqedLIk7yEBcYmPpD5XgNU6/pty0G+es35XT5d9ZrEhWplMzzZ
         Q1vepoNU25wq+5KGwERBLjsZya8Jf0bO/1eSGxjP18kribrvbPYXZyF/THPwyEtASXu8
         N+vVd7kynaJVNWPHgLSq6fGkIWrk0g053N88FhN92IPZLZY/KVoPPBnYCPVKMaD5gA1E
         IwKw==
X-Forwarded-Encrypted: i=1; AFNElJ+jXd/UkCXVkyeNRXn5aLUwwSzgepVqgLd2b5nz8c64B+YMfcgrzFsF6pMW07JhqVs+X4dE6H2E91c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4gxM7Rj2NJB5Whzf3BidJFx1xmZwXciVk6p33Jbc7FUvcO6Zm
	nk/dqdDCEMcR8Z80X72s+drqY87Sdl/0rfbaWAUw5G3jzqJxKrgKK7ohMNLm7zsjGrv1Op5KAc7
	WTt7Ce/qKGi14/dQsJMHC8hxafs1dBJ8UucfgaFNxfoce5nWeUP4ioin02iBa+A==
X-Gm-Gg: AfdE7clo67itSebvhQ4T93Ry7sgcJctYsZF0Kt4iySfMjmzaZrCbsAvlkmO7+LCROsc
	AUa7y8kst1buUa9epbv1JxNR5kVSlJbMdgqL4J8F3vLAImNNmZwudvSMa1cu5quWpGZthNl8aCK
	1YY6kXLGkrLI45RdZFxLg5Cxf1w6N/Dagr0OFnX6q+P85IVRI53T1m0r7IwUboYLFNUY2FzD5iz
	Fo1gME8ufJirCYQmHNl/Yuqya6oZ1aLi3RDqs79eaL8IcKP7+0nZL+iZcnM1g8r60puAjsf7MON
	eO1Cnf5VyHaZw9FH4jVjEExaYs5wws+yNMzuwAhkq60F8uz4WP8FcM0eprvFQEK+nEJwmUy5Odf
	iMS21g38cU14v6GfZenzozWdqt57n+eJHrK3DSS/c1D0bNQ5v2K4Ga1UV58KpuIn4NgHrwSX81K
	BGwYNn
X-Received: by 2002:a05:600c:6792:b0:493:bd71:6084 with SMTP id 5b1f17b1804b1-493c2b96797mr22805655e9.31.1782908961645;
        Wed, 01 Jul 2026 05:29:21 -0700 (PDT)
X-Received: by 2002:a05:600c:6792:b0:493:bd71:6084 with SMTP id 5b1f17b1804b1-493c2b96797mr22805175e9.31.1782908961210;
        Wed, 01 Jul 2026 05:29:21 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be810c02sm79547145e9.11.2026.07.01.05.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:29:20 -0700 (PDT)
Message-ID: <72909c5431d8a6564aaab10056b9c59d5750d956.camel@redhat.com>
Subject: Re: [PATCH v2 2/4] rv/rtapp/sleep: Update nanosleep rule
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linux-trace-kernel@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 01 Jul 2026 14:29:19 +0200
In-Reply-To: <c7ceb5c6263ee8f43a2676acae669cf486b0d903.1781852967.git.namcao@linutronix.de>
References: <cover.1781852967.git.namcao@linutronix.de>
	 <c7ceb5c6263ee8f43a2676acae669cf486b0d903.1781852967.git.namcao@linutronix.de>
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
> CLOCK_REALTIME is the only clock that often is misused in real-time
> applications. The other clocks either are safe for real-time uses
> (CLOCK_TAI, CLOCK_MONOTONIC, CLOCK_BOOTTIME) or are unlikely to be misuse=
d
> (CLOCK_AUX, CLOCK_PROCESS_CPUTIME_ID).
>=20
> Update the monitor to only warn about CLOCK_REALTIME.
>=20
> While at it, update the out-of-sync documentation.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Looks good, thanks.

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

> ---
> =C2=A0Documentation/trace/rv/monitor_rtapp.rst=C2=A0 | 17 +++++---
> =C2=A0kernel/trace/rv/monitors/sleep/sleep.c=C2=A0=C2=A0=C2=A0 | 12 ++---=
-
> =C2=A0kernel/trace/rv/monitors/sleep/sleep.h=C2=A0=C2=A0=C2=A0 | 52 +++++=
++++++------------
> =C2=A0tools/verification/models/rtapp/sleep.ltl |=C2=A0 2 +-
> =C2=A04 files changed, 39 insertions(+), 44 deletions(-)
>=20
> diff --git a/Documentation/trace/rv/monitor_rtapp.rst
> b/Documentation/trace/rv/monitor_rtapp.rst
> index 01656bf7080a..570be67a8f3b 100644
> --- a/Documentation/trace/rv/monitor_rtapp.rst
> +++ b/Documentation/trace/rv/monitor_rtapp.rst
> @@ -51,12 +51,13 @@ The `sleep` monitor reports real-time threads sleepin=
g in
> a manner that may
> =C2=A0cause undesirable latency. Real-time applications should only put a=
 real-time
> =C2=A0thread to sleep for one of the following reasons:
> =C2=A0
> -=C2=A0 - Cyclic work: real-time thread sleeps waiting for the next cycle=
. For this
> -=C2=A0=C2=A0=C2=A0 case, only the `clock_nanosleep` syscall should be us=
ed with
> `TIMER_ABSTIME`
> -=C2=A0=C2=A0=C2=A0 (to avoid time drift) and `CLOCK_MONOTONIC` (to avoid=
 the clock being
> -=C2=A0=C2=A0=C2=A0 changed). No other method is safe for real-time. For =
example, threads
> -=C2=A0=C2=A0=C2=A0 waiting for timerfd can be woken by softirq which pro=
vides no real-time
> -=C2=A0=C2=A0=C2=A0 guarantee.
> +=C2=A0 - Cyclic work: real-time thread sleeps waiting for the next
> +=C2=A0=C2=A0=C2=A0 cycle. For this case, only the `clock_nanosleep` sysc=
all should be
> +=C2=A0=C2=A0=C2=A0 used with `TIMER_ABSTIME` (to avoid time drift). Addi=
tionally,
> +=C2=A0=C2=A0=C2=A0 `CLOCK_REALTIME` should not be used (to avoid the clo=
ck being
> +=C2=A0=C2=A0=C2=A0 changed). No other method is safe for real-time. For =
example,
> +=C2=A0=C2=A0=C2=A0 threads waiting for timerfd can be woken by softirq w=
hich provides
> +=C2=A0=C2=A0=C2=A0 no real-time guarantee.
> =C2=A0=C2=A0 - Real-time thread waiting for something to happen (e.g. ano=
ther thread
> =C2=A0=C2=A0=C2=A0=C2=A0 releasing shared resources, or a completion sign=
al from another thread).
> In
> =C2=A0=C2=A0=C2=A0=C2=A0 this case, only futexes (FUTEX_LOCK_PI, FUTEX_LO=
CK_PI2 or one of
> @@ -99,14 +100,16 @@ The monitor's specification is::
> =C2=A0
> =C2=A0=C2=A0 RT_VALID_SLEEP_REASON =3D FUTEX_WAIT
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or RT_FR=
IENDLY_NANOSLEEP
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or EPOLL_WAIT
> =C2=A0
> =C2=A0=C2=A0 RT_FRIENDLY_NANOSLEEP =3D CLOCK_NANOSLEEP
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and NANOSLEEP_=
TIMER_ABSTIME
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and NANOSLEEP_CLOCK_=
MONOTONIC
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and not NANOSLEEP_CL=
OCK_REALTIME
> =C2=A0
> =C2=A0=C2=A0 RT_FRIENDLY_WAKE =3D WOKEN_BY_EQUAL_OR_HIGHER_PRIO
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or WOKEN_BY_HARDIRQ
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or WOKEN_BY_NMI
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or ABORT_SLEEP
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or KTHREAD_SHOULD_STOP
> =C2=A0
> =C2=A0=C2=A0 ALLOWLIST =3D BLOCK_ON_RT_MUTEX
> diff --git a/kernel/trace/rv/monitors/sleep/sleep.c
> b/kernel/trace/rv/monitors/sleep/sleep.c
> index d6b677fab8f8..638be7d8747f 100644
> --- a/kernel/trace/rv/monitors/sleep/sleep.c
> +++ b/kernel/trace/rv/monitors/sleep/sleep.c
> @@ -44,8 +44,7 @@ static void ltl_atoms_init(struct task_struct *task, st=
ruct
> ltl_monitor *mon, bo
> =C2=A0
> =C2=A0	if (task_creation) {
> =C2=A0		ltl_atom_set(mon, LTL_KTHREAD_SHOULD_STOP, false);
> -		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_MONOTONIC, false);
> -		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_TAI, false);
> +		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_REALTIME, false);
> =C2=A0		ltl_atom_set(mon, LTL_NANOSLEEP_TIMER_ABSTIME, false);
> =C2=A0		ltl_atom_set(mon, LTL_CLOCK_NANOSLEEP, false);
> =C2=A0		ltl_atom_set(mon, LTL_FUTEX_WAIT, false);
> @@ -60,8 +59,7 @@ static void ltl_atoms_init(struct task_struct *task, st=
ruct
> ltl_monitor *mon, bo
> =C2=A0		/* kernel tasks do not do syscall */
> =C2=A0		ltl_atom_set(mon, LTL_FUTEX_WAIT, false);
> =C2=A0		ltl_atom_set(mon, LTL_FUTEX_LOCK_PI, false);
> -		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_MONOTONIC, false);
> -		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_TAI, false);
> +		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_REALTIME, false);
> =C2=A0		ltl_atom_set(mon, LTL_NANOSLEEP_TIMER_ABSTIME, false);
> =C2=A0		ltl_atom_set(mon, LTL_CLOCK_NANOSLEEP, false);
> =C2=A0		ltl_atom_set(mon, LTL_EPOLL_WAIT, false);
> @@ -136,8 +134,7 @@ static void handle_sys_enter(void *data, struct pt_re=
gs
> *regs, long id)
> =C2=A0	case __NR_clock_nanosleep_time64:
> =C2=A0#endif
> =C2=A0		syscall_get_arguments(current, regs, args);
> -		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_MONOTONIC, args[0] =3D=3D
> CLOCK_MONOTONIC);
> -		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_TAI, args[0] =3D=3D
> CLOCK_TAI);
> +		ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_REALTIME, args[0] =3D=3D
> CLOCK_REALTIME);
> =C2=A0		ltl_atom_set(mon, LTL_NANOSLEEP_TIMER_ABSTIME, args[1] =3D=3D
> TIMER_ABSTIME);
> =C2=A0		ltl_atom_update(current, LTL_CLOCK_NANOSLEEP, true);
> =C2=A0		break;
> @@ -178,8 +175,7 @@ static void handle_sys_exit(void *data, struct pt_reg=
s
> *regs, long ret)
> =C2=A0
> =C2=A0	ltl_atom_set(mon, LTL_FUTEX_LOCK_PI, false);
> =C2=A0	ltl_atom_set(mon, LTL_FUTEX_WAIT, false);
> -	ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_MONOTONIC, false);
> -	ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_TAI, false);
> +	ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_REALTIME, false);
> =C2=A0	ltl_atom_set(mon, LTL_NANOSLEEP_TIMER_ABSTIME, false);
> =C2=A0	ltl_atom_set(mon, LTL_EPOLL_WAIT, false);
> =C2=A0	ltl_atom_update(current, LTL_CLOCK_NANOSLEEP, false);
> diff --git a/kernel/trace/rv/monitors/sleep/sleep.h
> b/kernel/trace/rv/monitors/sleep/sleep.h
> index 403dc2852c52..2fe2ec7edae8 100644
> --- a/kernel/trace/rv/monitors/sleep/sleep.h
> +++ b/kernel/trace/rv/monitors/sleep/sleep.h
> @@ -20,8 +20,7 @@ enum ltl_atom {
> =C2=A0	LTL_FUTEX_WAIT,
> =C2=A0	LTL_KERNEL_THREAD,
> =C2=A0	LTL_KTHREAD_SHOULD_STOP,
> -	LTL_NANOSLEEP_CLOCK_MONOTONIC,
> -	LTL_NANOSLEEP_CLOCK_TAI,
> +	LTL_NANOSLEEP_CLOCK_REALTIME,
> =C2=A0	LTL_NANOSLEEP_TIMER_ABSTIME,
> =C2=A0	LTL_RT,
> =C2=A0	LTL_SCHEDULE_IN,
> @@ -46,8 +45,7 @@ static const char *ltl_atom_str(enum ltl_atom atom)
> =C2=A0		"fu_wa",
> =C2=A0		"ker_th",
> =C2=A0		"kth_sh_st",
> -		"na_cl_mo",
> -		"na_cl_ta",
> +		"na_cl_re",
> =C2=A0		"na_ti_ab",
> =C2=A0		"rt",
> =C2=A0		"sch_in",
> @@ -87,8 +85,7 @@ static void ltl_start(struct task_struct *task, struct
> ltl_monitor *mon)
> =C2=A0	bool schedule_in =3D test_bit(LTL_SCHEDULE_IN, mon->atoms);
> =C2=A0	bool rt =3D test_bit(LTL_RT, mon->atoms);
> =C2=A0	bool nanosleep_timer_abstime =3D test_bit(LTL_NANOSLEEP_TIMER_ABST=
IME,
> mon->atoms);
> -	bool nanosleep_clock_tai =3D test_bit(LTL_NANOSLEEP_CLOCK_TAI, mon-
> >atoms);
> -	bool nanosleep_clock_monotonic =3D
> test_bit(LTL_NANOSLEEP_CLOCK_MONOTONIC, mon->atoms);
> +	bool nanosleep_clock_realtime =3D
> test_bit(LTL_NANOSLEEP_CLOCK_REALTIME, mon->atoms);
> =C2=A0	bool kthread_should_stop =3D test_bit(LTL_KTHREAD_SHOULD_STOP, mon=
-
> >atoms);
> =C2=A0	bool kernel_thread =3D test_bit(LTL_KERNEL_THREAD, mon->atoms);
> =C2=A0	bool futex_wait =3D test_bit(LTL_FUTEX_WAIT, mon->atoms);
> @@ -97,17 +94,17 @@ static void ltl_start(struct task_struct *task, struc=
t
> ltl_monitor *mon)
> =C2=A0	bool clock_nanosleep =3D test_bit(LTL_CLOCK_NANOSLEEP, mon->atoms)=
;
> =C2=A0	bool block_on_rt_mutex =3D test_bit(LTL_BLOCK_ON_RT_MUTEX, mon->at=
oms);
> =C2=A0	bool abort_sleep =3D test_bit(LTL_ABORT_SLEEP, mon->atoms);
> -	bool val42 =3D task_is_rcu || task_is_migration;
> -	bool val43 =3D futex_lock_pi || val42;
> -	bool val5 =3D block_on_rt_mutex || val43;
> -	bool val34 =3D abort_sleep || kthread_should_stop;
> -	bool val35 =3D woken_by_nmi || val34;
> -	bool val36 =3D woken_by_hardirq || val35;
> -	bool val14 =3D woken_by_equal_or_higher_prio || val36;
> +	bool val41 =3D task_is_rcu || task_is_migration;
> +	bool val42 =3D futex_lock_pi || val41;
> +	bool val5 =3D block_on_rt_mutex || val42;
> +	bool val33 =3D abort_sleep || kthread_should_stop;
> +	bool val34 =3D woken_by_nmi || val33;
> +	bool val35 =3D woken_by_hardirq || val34;
> +	bool val14 =3D woken_by_equal_or_higher_prio || val35;
> =C2=A0	bool val13 =3D !schedule_in;
> -	bool val26 =3D nanosleep_clock_monotonic || nanosleep_clock_tai;
> -	bool val27 =3D nanosleep_timer_abstime && val26;
> -	bool val18 =3D clock_nanosleep && val27;
> +	bool val25 =3D !nanosleep_clock_realtime;
> +	bool val26 =3D nanosleep_timer_abstime && val25;
> +	bool val18 =3D clock_nanosleep && val26;
> =C2=A0	bool val20 =3D val18 || epoll_wait;
> =C2=A0	bool val9 =3D futex_wait || val20;
> =C2=A0	bool val11 =3D val9 || kernel_thread;
> @@ -138,8 +135,7 @@ ltl_possible_next_states(struct ltl_monitor *mon, uns=
igned
> int state, unsigned l
> =C2=A0	bool schedule_in =3D test_bit(LTL_SCHEDULE_IN, mon->atoms);
> =C2=A0	bool rt =3D test_bit(LTL_RT, mon->atoms);
> =C2=A0	bool nanosleep_timer_abstime =3D test_bit(LTL_NANOSLEEP_TIMER_ABST=
IME,
> mon->atoms);
> -	bool nanosleep_clock_tai =3D test_bit(LTL_NANOSLEEP_CLOCK_TAI, mon-
> >atoms);
> -	bool nanosleep_clock_monotonic =3D
> test_bit(LTL_NANOSLEEP_CLOCK_MONOTONIC, mon->atoms);
> +	bool nanosleep_clock_realtime =3D
> test_bit(LTL_NANOSLEEP_CLOCK_REALTIME, mon->atoms);
> =C2=A0	bool kthread_should_stop =3D test_bit(LTL_KTHREAD_SHOULD_STOP, mon=
-
> >atoms);
> =C2=A0	bool kernel_thread =3D test_bit(LTL_KERNEL_THREAD, mon->atoms);
> =C2=A0	bool futex_wait =3D test_bit(LTL_FUTEX_WAIT, mon->atoms);
> @@ -148,17 +144,17 @@ ltl_possible_next_states(struct ltl_monitor *mon,
> unsigned int state, unsigned l
> =C2=A0	bool clock_nanosleep =3D test_bit(LTL_CLOCK_NANOSLEEP, mon->atoms)=
;
> =C2=A0	bool block_on_rt_mutex =3D test_bit(LTL_BLOCK_ON_RT_MUTEX, mon->at=
oms);
> =C2=A0	bool abort_sleep =3D test_bit(LTL_ABORT_SLEEP, mon->atoms);
> -	bool val42 =3D task_is_rcu || task_is_migration;
> -	bool val43 =3D futex_lock_pi || val42;
> -	bool val5 =3D block_on_rt_mutex || val43;
> -	bool val34 =3D abort_sleep || kthread_should_stop;
> -	bool val35 =3D woken_by_nmi || val34;
> -	bool val36 =3D woken_by_hardirq || val35;
> -	bool val14 =3D woken_by_equal_or_higher_prio || val36;
> +	bool val41 =3D task_is_rcu || task_is_migration;
> +	bool val42 =3D futex_lock_pi || val41;
> +	bool val5 =3D block_on_rt_mutex || val42;
> +	bool val33 =3D abort_sleep || kthread_should_stop;
> +	bool val34 =3D woken_by_nmi || val33;
> +	bool val35 =3D woken_by_hardirq || val34;
> +	bool val14 =3D woken_by_equal_or_higher_prio || val35;
> =C2=A0	bool val13 =3D !schedule_in;
> -	bool val26 =3D nanosleep_clock_monotonic || nanosleep_clock_tai;
> -	bool val27 =3D nanosleep_timer_abstime && val26;
> -	bool val18 =3D clock_nanosleep && val27;
> +	bool val25 =3D !nanosleep_clock_realtime;
> +	bool val26 =3D nanosleep_timer_abstime && val25;
> +	bool val18 =3D clock_nanosleep && val26;
> =C2=A0	bool val20 =3D val18 || epoll_wait;
> =C2=A0	bool val9 =3D futex_wait || val20;
> =C2=A0	bool val11 =3D val9 || kernel_thread;
> diff --git a/tools/verification/models/rtapp/sleep.ltl
> b/tools/verification/models/rtapp/sleep.ltl
> index 464c84b9df87..5923e58d7810 100644
> --- a/tools/verification/models/rtapp/sleep.ltl
> +++ b/tools/verification/models/rtapp/sleep.ltl
> @@ -9,7 +9,7 @@ RT_VALID_SLEEP_REASON =3D FUTEX_WAIT
> =C2=A0
> =C2=A0RT_FRIENDLY_NANOSLEEP =3D CLOCK_NANOSLEEP
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and NANOSLEEP_TIMER_ABSTIM=
E
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and (NANOSLEEP_CLOCK_MONOTONIC o=
r NANOSLEEP_CLOCK_TAI)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and not NANOSLEEP_CLOCK_REALTIME
> =C2=A0
> =C2=A0RT_FRIENDLY_WAKE =3D WOKEN_BY_EQUAL_OR_HIGHER_PRIO
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 or WOKEN_BY_HARDIRQ

