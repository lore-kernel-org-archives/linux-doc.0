Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792480679;
	b=NWqUzCyhSYd+O/mGk2UdAQ600oEmoAY6v9TgwiMCMxqxxLO14R03lZKwG+CKxLEA9f64
	 iJbzMhSoPfCPGbXJHL6luhAuRSxUg8mCgBWFU70kOvTV1s3bTxWxNmg0qLOhGfAbs5Cyg
	 p5GDVMiGTFuSgXTkK4S6cFm+aJ17U4/WBP/4UJobJJKInFeddMFoF0YrUOWlmFbT6ohTQ
	 60vvUERJ4KVtsOuGP/qurYDuFXPfs+BQKhgVDTWhCZKadx7Ayh1zFxZYQKyp2C+QKk7ei
	 0HQUFFPmlPsUgbSaSh4zfOVmDOsKaKm0YDkPEaJHrPHEkuxOxzOot+O614Wm0cfOCQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qot5Xi52FqwbssYZzmgms0YeUd/ghKWJhqgu1gdtdiM=;
	b=NM3pliVCHUsS9aYklpMoDQi5UTFMordpuDhqDpGnEd3zjF1bMdY8x8ui7CrLXu638Yba
	 7hr+GTqZx2QmeCO7JbCHHG/j2HHFVYFkCiUxmtcoX+kgBH1RC9qnCRVkZqNuhst1+ArqP
	 2fOfu1rcb6eZEiHXskvuGLc/UeH4icyzJhFcrmh2YNW0NPxH0Vbq5vefSoyBadX8jIXmN
	 ZK7ELTo6rfFN3OA9E0xFSRX65UW51/IgV9Iokl0bzPsClsITDrYEbAh+v/t+Cgb7JDguW
	 V13kVjam7lh9pKuwic5m6X8tCkXt414pDoTHkjAH1jb7CQtGw0sgA/dOokNQ+V9LEiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JsSYyUn1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527F6606A31D
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 07:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527F6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JsSYyUn1
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1819948a91.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 00:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792480679; cv=none;
        d=google.com; s=arc-20260327;
        b=cFTkIgxBJJdH8VvntqCKWvqygYFeObLHCgqMpDck1uZE1D4v7EIS5f3G64zzCtxwel
         xP4QWPYcsNrgoHT6rwjfUFvx/t4OzCGyVGvfVySphNEfdNezJizGitQoop1zb0mNRXsu
         4sf3k05Plv6DgClZTTHuSHW6xqOCFCvq6+Em32isgD6s1o4E6deIO+/83k2oPp4x2vnO
         PaKS1vLiDE3oUkwxRGwWJoIFgV6VrtPIP0/e8/Veh9c5nl9rvTmvRCgLZ57haVNir1/f
         ITWP28APWvkW0Crtu0ejYtQ4V6ilNTXBNbajpRD56QlfLHUnzHHwMmmg2KKYyNyGwUDI
         OC3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qot5Xi52FqwbssYZzmgms0YeUd/ghKWJhqgu1gdtdiM=;
        fh=g8HA7Vp3Gv0V7M1v3wur8fccgKbPL5XA6U9HWHIOG1E=;
        b=SF6nxx4jCv01qEAnIOrA/FZieRajSOpZdtQ9bwTkaBPkIdVrKfsBmSHAfvX9IB+jpd
         AfWOUVXbw684AtEGBXGxSjeoPUSCVakD8OjiXHdxcbwjjxnMM7hNYGbQa/sCMXlxNesT
         FcS6OzR5DUc3QqdDUyONEXWyFMo/vvtWIhq0rtDP9bfdjFJpVe+z2SKg3Z2fvua60Yv2
         hFKgv3f8N6JlS4Mo2lSg3NQS2mSsx4eIUUUvJpfXzjIqU52I65+1XRGLyTPAqQB8uBMp
         YcXTrbzaH5A/KPOjOkOCsdADYuEKfU9FOdPlWNfAPIP74ZJlOwLOENs90EWxKn8Gzq9A
         z89g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792480679; x=1793085479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qot5Xi52FqwbssYZzmgms0YeUd/ghKWJhqgu1gdtdiM=;
        b=JsSYyUn16QLQ9rMxYaGPhAPwh3bI93l3zg16zLkArlDUeTJ90Uhbn7BkQ9vKin3m/u
         XKGAnGs0LptUbybYfQFHvyJjOrCKTi8KQmJl3RR8eM03Tu09Av3eaZKvoJoqnXPVhPXH
         ripWGB6A5ZJtFT0KKqKHPME1DgMub3UEDfNYT5zIJ2Z/Mvj068ncLHn88qQnU5Un6/J2
         NDqxalBPyzRtPm4yXY/9ix/ZeNPI+nhKt9pCZT+a/rt3bZT1GJcnCE83nm1mDywiC170
         jwghC6fWGOSbhtor7VZfgUuDL+VzggkAfXHH+wr6WkgyjQKE3E2oLKwRopVmXyA/mALL
         bLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480679; x=1793085479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qot5Xi52FqwbssYZzmgms0YeUd/ghKWJhqgu1gdtdiM=;
        b=wAegEa5KmBlU83Um8fQjqUF8LkSDTEHYVGrMB69t/NqQvLXL6o2In19YOZnK//Spvh
         zWYV8GjgqtYTnuOv+bGB6CHmHNA3RQnRK4estMMf2172OKkMLkP+/HuwJWsqWEKhC6cu
         A6C6coimbFBkGDUCxAfaCdvNcM8ck/t6gz7eEMg4R/uaMEV4M0gbSzi5bb95QCLjTkUh
         wDsDrAKqFcNyU0B7v7vGBd8D8FI8AMlT4/7BI5iafKQmVHGoI4Y0vfJ5B0anx3/zdVTv
         Fmi0pPSgPfC+kWYN6rP45M38SAanQpK0M5R5WReoJJ2bJ/qcnAtSxvV9RWPvIR2IajO0
         zdkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEfRNM4Q2Wtw/rbx9+htN4vZJpVUwa1wJPSCWpVrC6MIRFVYO69Vned3pnkHDoKxthGoNIyPUioyo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4tS/RkNdyHLTHkNv67zZAAICsbsaSIhsUmomZdbSpfqGOKBPq
	t++mJ2GXAUcw1pcghSZAX1cd1yoF+J2uuirpO4wTI7JBfwFWD3i+xooxhD6Ry7MBbjpaNdM+tu5
	wyVJadP9R1ubDE+PBUpu+2h3Nv1pJ2y8=
X-Gm-Gg: AYBFou00AnJrT/TcsMA5g0Y6xKai3Rrez/Cq26L+qyG9KHgdvXdz2KmcUFt/99UtSS2
	5RutgRRpH5dAIY3XB2L9fF60P9z2TQkkhRr9fEzENPgHRoE15WugQBk9Vkci6Zv8+OMQ/ZFDnLP
	XBRuWBZ/iOkwZGoY8KEODxBgtZDYC8nlN2cAWqcOdtgvC/gDWLPlgJvn4R4cDHB1N0TXT6kbGbU
	gO4r3D5h5V4INuqpeHnYq9ooYb/6VmpWHqRnCfdoXAjbSVyzxVjALiih91H4tnwvaYm5aoP0JPA
	6VUBDpmAPurGKdfdq0eFM9aGwU4iV6ZCSeFrw5nNi2GOtuo9scQpuA==
X-Received: by 2002:a17:90b:48c5:b0:3a0:d265:3647 with SMTP id
 98e67ed59e1d1-3acee296684mr7813491a91.8.1792480678528; Tue, 20 Oct 2026
 00:17:58 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019055301.3234571-1-shengjiu.wang@oss.nxp.com>
In-Reply-To: <20261019055301.3234571-1-shengjiu.wang@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 20 Oct 2026 15:17:40 +0800
X-Gm-Features: AclHuK_XHrEgWqjN8oT4VWaPu36n9bSXdgGUKzEM5PM0DLukz-LNO1f5F_U9a7s
Message-ID: <CAA+D8APDSYbzX3S9RuLinoPiuqPHEX+L+-ZcSg-RtxxaWyvrJA@mail.gmail.com>
Subject: Re: [PATCH V2] reset: core: Serialize concurrent deassert/reset of
 shared resets
To: shengjiu.wang@oss.nxp.com
Cc: p.zabel@pengutronix.de, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, hansg@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, broonie@kernel.org, alvin.sipraga@analog.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp

On Mon, Oct 19, 2026 at 1:52=E2=80=AFPM <shengjiu.wang@oss.nxp.com> wrote:
>
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> reset_control_deassert() and reset_control_reset() guarantee that the
> reset line is deasserted / a reset pulse has been issued once they return=
.
> For a shared reset only the first caller runs the hardware op; others jus=
t
> bump the refcount and return early, so a concurrent caller can return
> before the first caller's (possibly sleeping) op has finished.
>
> Serialize the shared refcount update and the hardware op under the
> existing per-control rstc->lock, taken before the SRCU section to match
> reset_control_acquire()'s mutex->srcu order. The lock is taken only on th=
e
> shared path and only for may-sleep callers (reset_control_reset() and
> reset_control_deassert()); the exclusive path stays lockless. Callers in
> atomic context must use the new lockless reset_control_reset_atomic() and
> reset_control_deassert_atomic() variants, which skip the mutex and so
> carry no completion guarantee.
>
> The op is now called with rstc->lock held on the shared path, so it must
> not re-enter reset_control_reset()/deassert()/acquire() on the same
> control; a lockdep_assert_not_held() at each lock site catches that.
>
> reset_control_assert() is unchanged: a shared assert makes no guarantee
> about the line state, so there is nothing to serialize.
>
> Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")
> Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
> Assisted-by: Anthropic:claude-opus-4-8
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> Changes in v2:
> - Serialize only the shared may-sleep path under rstc->lock (taken before
>   SRCU to match reset_control_acquire()'s order); exclusive path stays
>   lockless, and reset_control_assert() is left unchanged.
> - Add lockless reset_control_reset_atomic()/reset_control_deassert_atomic=
()
>   for atomic callers; gate the mutex on can_sleep so no shared consumer i=
s
>   regressed and so it works on all configs.
> - Factor the body into __reset_control_*()/__reset_control_*_locked()
>   helpers, and lockdep_assert_not_held() at each lock site to catch a
>   controller op re-entering the API on the same control.
> - Declare the new variants and stubs in reset.h, and document the sleepin=
g
>   vs atomic variants in the kerneldoc and reset.rst.
>
>  Documentation/driver-api/reset.rst |  10 ++
>  drivers/reset/core.c               | 204 ++++++++++++++++++++++-------
>  include/linux/reset.h              |  12 ++
>  3 files changed, 177 insertions(+), 49 deletions(-)
>
> diff --git a/Documentation/driver-api/reset.rst b/Documentation/driver-ap=
i/reset.rst
> index 932699c57d1e..0fbc1ba92dd8 100644
> --- a/Documentation/driver-api/reset.rst
> +++ b/Documentation/driver-api/reset.rst
> @@ -185,13 +185,23 @@ Given the reset control, consumers can call reset_c=
ontrol_assert() and
>  reset_control_deassert(), trigger a reset pulse using reset_control_rese=
t(), or
>  query the reset line status using reset_control_status().
>
> +For shared reset controls, reset_control_reset() and reset_control_deass=
ert()
> +may sleep and must be called from process context. Consumers that need t=
o
> +operate a reset line from atomic context can use reset_control_reset_ato=
mic()
> +or reset_control_deassert_atomic(); these never sleep, but do not serial=
ize
> +concurrent shared callers and so do not provide the completion guarantee=
 of
> +their sleeping counterparts. The underlying reset controller's ops must =
not
> +sleep when the atomic variants are used.

On second thought, this change lets reset_control_deassert() sleep, so
any driver
that currently calls it from atomic context would now block. The new
_atomic() variants
let those callers opt out, but I can't tell how many drivers would
need updating, and any
one we miss is a silent risk.

Do you have another idea to fix the concurrent deassert() problem on
shared resets
without this risk?  Or should we go back to the original proposal?
https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/T/#m66615477929b38f=
788d6d22a2c0bb9ca62173e89

Best regards
Shengjiu Wang

> +
>  .. kernel-doc:: include/linux/reset.h
>     :internal:
>
>  .. kernel-doc:: drivers/reset/core.c
>     :functions: reset_control_reset
> +               reset_control_reset_atomic
>                 reset_control_assert
>                 reset_control_deassert
> +               reset_control_deassert_atomic
>                 reset_control_status
>                 reset_control_acquire
>                 reset_control_release
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 38e189d04d09..d477935e37ea 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -51,7 +51,8 @@ static DEFINE_IDA(reset_gpio_ida);
>   * @triggered_count: Number of times this reset line has been reset. Cur=
rently
>   *                   only used for shared resets, which means that the v=
alue
>   *                   will be either 0 or 1.
> - * @lock: serializes the internals of reset_control_acquire()
> + * @lock: serializes the internals of reset_control_acquire() and the
> + *        shared deassert/reset refcount update and hardware op
>   */
>  struct reset_control {
>         struct reset_controller_dev __rcu *rcdev;
> @@ -240,12 +241,16 @@ rstc_to_array(struct reset_control *rstc) {
>         return container_of(rstc, struct reset_control_array, base);
>  }
>
> -static int reset_control_array_reset(struct reset_control_array *resets)
> +static int __reset_control_reset(struct reset_control *rstc, bool can_sl=
eep);
> +static int __reset_control_deassert(struct reset_control *rstc, bool can=
_sleep);
> +
> +static int reset_control_array_reset(struct reset_control_array *resets,
> +                                    bool can_sleep)
>  {
>         int ret, i;
>
>         for (i =3D 0; i < resets->num_rstcs; i++) {
> -               ret =3D reset_control_reset(resets->rstc[i]);
> +               ret =3D __reset_control_reset(resets->rstc[i], can_sleep)=
;
>                 if (ret)
>                         return ret;
>         }
> @@ -304,12 +309,13 @@ static int reset_control_array_assert(struct reset_=
control_array *resets)
>         return ret;
>  }
>
> -static int reset_control_array_deassert(struct reset_control_array *rese=
ts)
> +static int reset_control_array_deassert(struct reset_control_array *rese=
ts,
> +                                       bool can_sleep)
>  {
>         int ret, i;
>
>         for (i =3D 0; i < resets->num_rstcs; i++) {
> -               ret =3D reset_control_deassert(resets->rstc[i]);
> +               ret =3D __reset_control_deassert(resets->rstc[i], can_sle=
ep);
>                 if (ret)
>                         goto err;
>         }
> @@ -355,33 +361,11 @@ static inline bool reset_control_is_array(struct re=
set_control *rstc)
>         return rstc->array;
>  }
>
> -/**
> - * reset_control_reset - reset the controlled device
> - * @rstc: reset controller
> - *
> - * On a shared reset line the actual reset pulse is only triggered once =
for the
> - * lifetime of the reset_control instance: for all but the first caller =
this is
> - * a no-op.
> - * Consumers must not use reset_control_(de)assert on shared reset lines=
 when
> - * reset_control_reset has been used.
> - *
> - * If rstc is NULL it is an optional reset and the function will just
> - * return 0.
> - */
> -int reset_control_reset(struct reset_control *rstc)
> +static int __reset_control_reset_locked(struct reset_control *rstc)
>  {
>         struct reset_controller_dev *rcdev;
>         int ret;
>
> -       if (!rstc)
> -               return 0;
> -
> -       if (WARN_ON(IS_ERR(rstc)))
> -               return -EINVAL;
> -
> -       if (reset_control_is_array(rstc))
> -               return reset_control_array_reset(rstc_to_array(rstc));
> -
>         guard(srcu)(&rstc->srcu);
>
>         rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
> @@ -408,8 +392,83 @@ int reset_control_reset(struct reset_control *rstc)
>
>         return ret;
>  }
> +
> +static int __reset_control_reset(struct reset_control *rstc, bool can_sl=
eep)
> +{
> +       if (!rstc)
> +               return 0;
> +
> +       if (WARN_ON(IS_ERR(rstc)))
> +               return -EINVAL;
> +
> +       if (reset_control_is_array(rstc))
> +               return reset_control_array_reset(rstc_to_array(rstc), can=
_sleep);
> +
> +       /*
> +        * Serialize only the shared may-sleep path: holding rstc->lock a=
cross
> +        * the refcount update and the controller .reset() op stops a
> +        * concurrent caller from returning before this caller's not-yet-
> +        * finished reset pulse has been issued. can_sleep is false only =
for
> +        * reset_control_reset_atomic() callers, which cannot take the mu=
tex
> +        * and so get no completion guarantee. The lock is taken before t=
he
> +        * SRCU section (in __reset_control_reset_locked()) to match the
> +        * mutex->srcu order used by reset_control_acquire(). rstc->share=
d is
> +        * set at creation and is safe to read without the lock.
> +        */
> +       if (!(can_sleep && rstc->shared))
> +               return __reset_control_reset_locked(rstc);
> +
> +       might_sleep();
> +       lockdep_assert_not_held(&rstc->lock);
> +       guard(mutex)(&rstc->lock);
> +       return __reset_control_reset_locked(rstc);
> +}
> +
> +/**
> + * reset_control_reset - reset the controlled device
> + * @rstc: reset controller
> + *
> + * On a shared reset line the actual reset pulse is only triggered once =
for the
> + * lifetime of the reset_control instance: for all but the first caller =
this is
> + * a no-op.
> + * After calling this function, the reset is guaranteed to have seen a r=
eset
> + * pulse at any point in the past, not necessarily during the function c=
all.
> + * Consumers must not use reset_control_(de)assert on shared reset lines=
 when
> + * reset_control_reset has been used.
> + *
> + * This function may sleep when called on a shared reset control; use
> + * reset_control_reset_atomic() if the caller cannot sleep.
> + *
> + * If rstc is NULL it is an optional reset and the function will just
> + * return 0.
> + */
> +int reset_control_reset(struct reset_control *rstc)
> +{
> +       return __reset_control_reset(rstc, true);
> +}
>  EXPORT_SYMBOL_GPL(reset_control_reset);
>
> +/**
> + * reset_control_reset_atomic - reset the controlled device, usable in a=
tomic
> + *                              context
> + * @rstc: reset controller
> + *
> + * Same as reset_control_reset() but does not sleep and does not seriali=
ze
> + * concurrent callers on a shared reset line. Because no lock is taken, =
a
> + * concurrent reset_control_reset()/_atomic() may still be in progress w=
hen
> + * this returns; the completion-ordering guarantee of reset_control_rese=
t()
> + * does not apply. The underlying reset controller's .reset() op must no=
t
> + * sleep.
> + *
> + * If rstc is NULL it is an optional reset and the function will just
> + * return 0.
> + */
> +int reset_control_reset_atomic(struct reset_control *rstc)
> +{
> +       return __reset_control_reset(rstc, false);
> +}
> +EXPORT_SYMBOL_GPL(reset_control_reset_atomic);
> +
>  /**
>   * reset_control_bulk_reset - reset the controlled devices in order
>   * @num_rstcs: number of entries in rstcs array
> @@ -575,30 +634,10 @@ int reset_control_bulk_assert(int num_rstcs,
>  }
>  EXPORT_SYMBOL_GPL(reset_control_bulk_assert);
>
> -/**
> - * reset_control_deassert - deasserts the reset line
> - * @rstc: reset controller
> - *
> - * After calling this function, the reset is guaranteed to be deasserted=
.
> - * Consumers must not use reset_control_reset on shared reset lines when
> - * reset_control_(de)assert has been used.
> - *
> - * If rstc is NULL it is an optional reset and the function will just
> - * return 0.
> - */
> -int reset_control_deassert(struct reset_control *rstc)
> +static int __reset_control_deassert_locked(struct reset_control *rstc)
>  {
>         struct reset_controller_dev *rcdev;
>
> -       if (!rstc)
> -               return 0;
> -
> -       if (WARN_ON(IS_ERR(rstc)))
> -               return -EINVAL;
> -
> -       if (reset_control_is_array(rstc))
> -               return reset_control_array_deassert(rstc_to_array(rstc));
> -
>         guard(srcu)(&rstc->srcu);
>
>         rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
> @@ -631,8 +670,74 @@ int reset_control_deassert(struct reset_control *rst=
c)
>
>         return rcdev->ops->deassert(rcdev, rstc->id);
>  }
> +
> +static int __reset_control_deassert(struct reset_control *rstc, bool can=
_sleep)
> +{
> +       if (!rstc)
> +               return 0;
> +
> +       if (WARN_ON(IS_ERR(rstc)))
> +               return -EINVAL;
> +
> +       if (reset_control_is_array(rstc))
> +               return reset_control_array_deassert(rstc_to_array(rstc), =
can_sleep);
> +
> +       /*
> +        * See __reset_control_reset(): serialize only the shared may-sle=
ep
> +        * path. can_sleep is false only for reset_control_deassert_atomi=
c()
> +        * callers, which cannot take the mutex and get no completion
> +        * guarantee. The lock is taken before the SRCU section (in
> +        * __reset_control_deassert_locked()) to match the mutex->srcu or=
der
> +        * used by reset_control_acquire().
> +        */
> +       if (!(can_sleep && rstc->shared))
> +               return __reset_control_deassert_locked(rstc);
> +
> +       might_sleep();
> +       lockdep_assert_not_held(&rstc->lock);
> +       guard(mutex)(&rstc->lock);
> +       return __reset_control_deassert_locked(rstc);
> +}
> +
> +/**
> + * reset_control_deassert - deasserts the reset line
> + * @rstc: reset controller
> + *
> + * After calling this function, the reset is guaranteed to be deasserted=
.
> + * Consumers must not use reset_control_reset on shared reset lines when
> + * reset_control_(de)assert has been used.
> + *
> + * This function may sleep when called on a shared reset control; use
> + * reset_control_deassert_atomic() if the caller cannot sleep.
> + *
> + * If rstc is NULL it is an optional reset and the function will just
> + * return 0.
> + */
> +int reset_control_deassert(struct reset_control *rstc)
> +{
> +       return __reset_control_deassert(rstc, true);
> +}
>  EXPORT_SYMBOL_GPL(reset_control_deassert);
>
> +/**
> + * reset_control_deassert_atomic - deasserts the reset line, usable in a=
tomic
> + *                                 context
> + * @rstc: reset controller
> + *
> + * Same as reset_control_deassert() but does not sleep and does not seri=
alize
> + * concurrent callers on a shared reset line, so the deassert-completion
> + * guarantee of reset_control_deassert() does not apply. The underlying =
reset
> + * controller's .deassert() op must not sleep.
> + *
> + * If rstc is NULL it is an optional reset and the function will just
> + * return 0.
> + */
> +int reset_control_deassert_atomic(struct reset_control *rstc)
> +{
> +       return __reset_control_deassert(rstc, false);
> +}
> +EXPORT_SYMBOL_GPL(reset_control_deassert_atomic);
> +
>  /**
>   * reset_control_bulk_deassert - deasserts the reset lines in reverse or=
der
>   * @num_rstcs: number of entries in rstcs array
> @@ -726,6 +831,7 @@ int reset_control_acquire(struct reset_control *rstc)
>         if (reset_control_is_array(rstc))
>                 return reset_control_array_acquire(rstc_to_array(rstc));
>
> +       lockdep_assert_not_held(&rstc->lock);
>         guard(mutex)(&rstc->lock);
>
>         if (rstc->acquired)
> diff --git a/include/linux/reset.h b/include/linux/reset.h
> index 9c391cf0c822..ab697193dbe9 100644
> --- a/include/linux/reset.h
> +++ b/include/linux/reset.h
> @@ -73,9 +73,11 @@ enum reset_control_flags {
>  #ifdef CONFIG_RESET_CONTROLLER
>
>  int reset_control_reset(struct reset_control *rstc);
> +int reset_control_reset_atomic(struct reset_control *rstc);
>  int reset_control_rearm(struct reset_control *rstc);
>  int reset_control_assert(struct reset_control *rstc);
>  int reset_control_deassert(struct reset_control *rstc);
> +int reset_control_deassert_atomic(struct reset_control *rstc);
>  int reset_control_status(struct reset_control *rstc);
>  int reset_control_acquire(struct reset_control *rstc);
>  void reset_control_release(struct reset_control *rstc);
> @@ -117,6 +119,11 @@ static inline int reset_control_reset(struct reset_c=
ontrol *rstc)
>         return 0;
>  }
>
> +static inline int reset_control_reset_atomic(struct reset_control *rstc)
> +{
> +       return 0;
> +}
> +
>  static inline int reset_control_rearm(struct reset_control *rstc)
>  {
>         return 0;
> @@ -132,6 +139,11 @@ static inline int reset_control_deassert(struct rese=
t_control *rstc)
>         return 0;
>  }
>
> +static inline int reset_control_deassert_atomic(struct reset_control *rs=
tc)
> +{
> +       return 0;
> +}
> +
>  static inline int reset_control_status(struct reset_control *rstc)
>  {
>         return 0;
> --
> 2.34.1
>
>
