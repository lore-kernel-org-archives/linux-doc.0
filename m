Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AF9246768
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 01:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777251617; cv=pass; b=VkJQgxrbj5uPLB9y2S3FOGuOEfJpgPpj3xBIipO0DWe2sye2QS6Q7Zg1LQqk5Tp2p8KK2/2ttqCwAAU48tqZDC6R81crsnoY7d7w0K5OJYapwY7XZowahpZQ0MQL+GHJ1jNPy/OKvaQUpMkmn42eLWac7gLMwep2axdNrguVyPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777251617; c=relaxed/simple;
	bh=+rvuH7OYXV1HsVqgeQnLsJzCNwEWaX2a9ffgwvQ+wgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYiyCJoE7Gm2H9C2cX8J+/dFdbyCdZlFVcneCkgwctNGytg7/Cjre1Fry3m6VDNypOEIY0IZ6S8B0LEN7ZUCrJtgHPW20LdqzAgBTrgg71AB9ykSPKoKgTHgrxQeX/hqSr5Gh9xaqtEDfwEZz8cDCv5UicvrB7rpWIhGtH8d6oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ux4hmDQJ; arc=pass smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ux4hmDQJ"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2b6b0500e06so14807593eec.1
        for <linux-doc@vger.kernel.org>; Sun, 26 Apr 2026 18:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777251615; cv=none;
        d=google.com; s=arc-20240605;
        b=baZdRijPrCKCwI/ed9s8DSsLkdd1uVL4byu8a7JUNihL3WM8wfk//HsvhHQvVBiLEl
         h5dL51FluNJ61+ljT87VAjKbUbYMmR9SerlO2EYNh+aph3BXxNikipdfkAKjsbSGpqPo
         u4bEaVLvfwVMpKmq+hOTZKz4hWQVHlujni7G/wXXA2p+fds9D1867zX+91477jT46wbC
         YDqaf15H7KbDZOBBOz6gRlbGUBRjEyGVu+X0iB6g2YXcgScVYCc1FC0cFHgkxMuz1exP
         7lwtfFR3E2dYG9q1ZAqYpxaUHFUeHcORkKxSpzxCkkvgHbQh9dalfz+/ROcJCkrxoprj
         bOSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EQvew2h5y7t1/a2E3iAG88nYAgpOqyYgpLhdQGfHFKc=;
        fh=ULo4MhlEAAJWZ83n5C+hDrVhq+2UvNfQfX9+1XqMxns=;
        b=lnxrMC7kAhTNbpv1kR9ZIYnP3gNzoYNyXa3TOPXGE5PcGQCQkaWdvZMqNeoUBoAaTz
         PD2qCgZ5YHICOiosqP7tkOx1v/+321pDCECQaTtUkKcfcPM3WEoVnA4RTipIUXkqwwQ/
         YMnBRYwBTfDSlAZXClPFqJcfEFt84lJAHDmScU+fIGi3JHK34XtpIjgkP8dwPEouKea0
         di8xFth70jj94Ya1vo/H08jBdXybTGANY1V5DUUMkWZbB6NsmwINX4gv0FwwNZNakBOy
         8iJo+9BWKcIiDZhR6pkVceSCe83mP/MjTx4SfIynTdGablV3rRwOkW8OIZRnvkxkAd2v
         +MqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777251615; x=1777856415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQvew2h5y7t1/a2E3iAG88nYAgpOqyYgpLhdQGfHFKc=;
        b=Ux4hmDQJiGvY/VOV12+Et6irM6h4Ash+8rt2tv1I/un32p78oySbZTGMmAZWlj7wC6
         AUFcOdI4LSSpLmi5sg0S6Ho0rB4BNwjwXPm1XaIt1qDP3hts0QKsVdOTM6BOX5zV2LhZ
         5UnehM5vWVXEknkQc6CQJndICPV1WmunIO5yE7kajep1Z5LK7A2EIYS+UI78+rQBsl8x
         PHPmJhjCw3dBaXefHHHHsv/MhwHj7e+vtBa6lGHf4O4tDJsXMkZ1x6hb7laNaEZNLSjC
         X13B6vcvW/Zvtr075qsN+dV6MHe8kvczvxopgoOo5wgD4lpvapmY+c3+maOZ5uvEz2pS
         QwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777251615; x=1777856415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EQvew2h5y7t1/a2E3iAG88nYAgpOqyYgpLhdQGfHFKc=;
        b=ZFcesii+weKfzFUrBS8ubs93K6ocA+6u2+vgEC9+ibhONYipM6RImwGPnw2rYvp54w
         bdx09JIWQjpE+tcqWiZN4e4au3FkHnsMWr19uEWMfW7U2BQNQBQwx/2qL9DmedJ98ucN
         jZzoE+67X9hEjjD/Blvgy/dstc5CCNlGCJbR5n62bsxxNrKwD5lrdCSb/1oUpzhVubNv
         vROth0xal5OaSoUp8W/4Cc/wTh3F017gc/gab+vHJzws6J4vmSg5i9v9pfRmbKpsxUjY
         4gZkbt9QS4q4+7p54FjRUydQDLpbmkkvXjvbzCe5BKx2VmZloKR3bm5SEHTczQ1VzN3/
         Slaw==
X-Forwarded-Encrypted: i=1; AFNElJ8BRHVBoUhm7BY9NiKKh/PnpNgJ+XsdC+lbTA88UiTy5NDGIFaRjeOVPaPoso8U0SF1I2B+vQ1hwrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbNnNWtCgEQWlyUs553JRKDfAMzaT9H7cbXkSxX/xgFbQy6wg7
	rhSYVXFhrR57DlN77P4dC16bEA9NmryoGLQNFsCZYnN/e4Hvk1fO0+n7UxAGL3FRzuQ+J4WjzV7
	WaDuLeVQlmRwNDJvP5juXdmVrwmABDg==
X-Gm-Gg: AeBDietG45Pn4VH+L8g2NCI7QXyYGS0YQdkSafA8bkd+hrLUC7o5PThQER9IvbpmPUu
	BTva7KJTLVddGGAGXiJIrHgsah17ecrb7Kv5Hjh5SGZMVqywFdG4v0iWzo0TJdwAnWy4euQKj1B
	32TXK7hT7GVOt/PTok7/ncyEv/NCF+BPA9PYBIS87Df4pdXkCJrKcWpexVcVJzWa/iCw8mc8bOO
	X/6FmWjfxP4ywH13o8y0xyBfh1neGSeR7U+ZT+O5BZSfP0j2JYenEHyXbAylXmratdmwr2fSrxE
	UBCbNfr1oWHKJ5X/bLa8P/NSbAv+PD2aD7IAqkQBAACrqChqAwM=
X-Received: by 2002:a05:7300:214e:b0:2c4:dd55:ffc1 with SMTP id
 5a478bee46e88-2e464ea4fffmr21053974eec.2.1777251610424; Sun, 26 Apr 2026
 18:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260426213859.1835-1-ravis.opensrc@gmail.com> <20260426230322.106206-1-sj@kernel.org>
In-Reply-To: <20260426230322.106206-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Sun, 26 Apr 2026 17:59:59 -0700
X-Gm-Features: AQROBzBShFgxvF3itryuUFMs9fmnj3RfnDehxrQhBcHZWpM_2mY0hlkDGF3if1Y
Message-ID: <CALa+Y16Y1rY7Pde1b-qbkn0H2_KmTCqAEkemwuW4xe1K01c2XQ@mail.gmail.com>
Subject: Re: [PATCH v9] mm/damon: add node_eligible_mem_bp goal metric
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 4:03=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote=
:
>
> [...]
> > Changes since v8:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > https://lore.kernel.org/linux-mm/20260426003245.2687-1-ravis.opensrc@gm=
ail.com/
> >
> > - Removed unnecessary casts in mult_frac() call to fix potential
> >   divide-by-zero on 32-bit PAE systems (Sashiko/SJ review)
> > - Kept original parameter name 'ctx' in damos_set_effective_quota()
> >   to avoid unnecessary diff (SJ review)
> [...]
> > +static unsigned long damos_get_node_eligible_mem_bp(struct damon_ctx *=
c,
> > +             struct damos *s, int nid)
> > +{
> > +     phys_addr_t total_eligible =3D 0;
> > +     phys_addr_t node_eligible;
> > +
> > +     if (c->ops.id !=3D DAMON_OPS_PADDR)
> > +             return 0;
> > +
> > +     if (nid < 0 || nid >=3D MAX_NUMNODES || !node_online(nid))
> > +             return 0;
> > +
> > +     node_eligible =3D damos_calc_eligible_bytes(c, s, nid, &total_eli=
gible);
> > +
> > +     if (!total_eligible)
> > +             return 0;
> > +
> > +     return mult_frac(node_eligible, 10000, total_eligible);
> > +}
>
> Sashiko found [1] this can cause __udivdi3 linking issue on 32bit machine=
 with
> CONFIG_PHYS_ADDR_T_64BIT.  Seems that is correct to me.  I believe below
> attaching fixup can fix it?
>
> Ravi, if my fixup looks good to you, could you please post another versio=
n
> (say, v9.1) for another Sashiko review round?
>

Makes sense SJ. will send v9.1 shortly with the fixup.

> [1] https://lore.kernel.org/20260426220409.95B26C2BCAF@smtp.kernel.org
>
>
> Thanks,
> SJ
>
> [...]
>
> =3D=3D=3D >8 =3D=3D=3D
> From 828ddfdfa3a996efc4620919a3cc77d55088c466 Mon Sep 17 00:00:00 2001
> From: SeongJae Park <sj@kernel.org>
> Date: Sun, 26 Apr 2026 15:54:48 -0700
> Subject: [PATCH] mm/damon/core: avoid __udivdi3 linking issue
>
> On 32bit machines having PHYS_ADDR_T_64BIT, mult_frac() with phys_addr_t
> will cause __udivdi3 linking issue.  Cast values to 'unsigned long'
> before calling mult_frac().  This could cause divide-by-zero if the
> denominator becomes zero by casting.  Avoid it by checking the zero case
> with the casted value.
>
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  mm/damon/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index 0ea747d487465..aec43314fc4a9 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -2921,10 +2921,11 @@ static unsigned long damos_get_node_eligible_mem_=
bp(struct damon_ctx *c,
>
>         node_eligible =3D damos_calc_eligible_bytes(c, s, nid, &total_eli=
gible);
>
> -       if (!total_eligible)
> +       if (!(unsigned long)total_eligible)
>                 return 0;
>
> -       return mult_frac(node_eligible, 10000, total_eligible);
> +       return mult_frac((unsigned long)node_eligible, 10000,
> +                       (unsigned long)total_eligible);
>  }
>  #else /* CONFIG_DAMON_PADDR */
>  static unsigned long damos_get_node_eligible_mem_bp(struct damon_ctx *c,
> --
> 2.47.3
>
