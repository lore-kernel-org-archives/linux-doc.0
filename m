Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795067159;
	b=eXeqL15Rn7M+G2p/BkwH5vVHoVJ90puj+GP780iV0GJYPlMbbBPSGMgy7Wh1o87Y9HEu
	 tRqM28Yj3FtjxswzhiForvIdFrA7n+4PRGkRq+8iGtEkpAfdQpB39KhTCUpIKPq0DU77t
	 nq07zd5LyEQhwNywaTEWkaFT5ymUdhVahLG2oRGgzW5h6934t5TiAr0SWNOrxkS8Gbetp
	 9J2vmjLooQO1zyUC68K49qsXDLy0qlGeb4g+ljJl24TxpOHZNzfsLMb7VpciKiUrAhHiA
	 dFfFa733sQosXDkKyapkI3mrNlpA1YChsjmkkpMVqZSwDu1kWm5yDMO/xPdhrVt0tPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
	b=1G4A2qbMJr8Lskz+j3nh176tennS81GyE3aKpT80mRHbA/LFk9or3mXL69/2nodOfd+w
	 dLktF+dSbQGlgVvl1tQAEIfeGE2t5EwgvLdqRFiBlhejGqgZNd89mlhRWXnqiTwS/DWSR
	 f4LAZDXlI3mKklHh4FMjGlefLpCEwKvlAJym6YqisFURDoy/MuH8a290ymWuD1WeTe74g
	 kO6aO6WpoYc0nFH/5NdJ2Ca4LVzOEdNCHnhMSN1sqFtFcvrkqW+4c9kK23qWhXCPK4rrH
	 YutialTwtjLcNwKqdtZk7lONTKU/7W6tv7W1lXOKPQkX6GFWqvj/JEtceCchdCN2xOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G9sTcZLh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237DF60A260C
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 05:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 237DF60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G9sTcZLh
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55be673e029so117291cf.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 21:45:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795067158; cv=none;
        d=google.com; s=arc-20260327;
        b=JDEDW2AOimTOyOUdEQs+qm/U8LPukijxS79VlySBCTE8We++uG6hNYItQteCx9aYoS
         KDCzWlBvZpRa22ybaB68lyY+1O9Xs7+57uXQvHsq+jyhkh9m08Pn0SwFlg9HfTgRc7H2
         pUsOW5uF1Y4u/xY6uKa788Lo1L6e6ejO8qiNlcE9xB/arNpzDt2MO1gESJECm9BXE637
         uCR8OxCEt1z/HFAfr2GsftKucHd8i9e2zp4hqs0+QbAwAl7eOjmDuZcpBwlG220NQNiA
         dPVmLEOEhAB2omPdEqMuW6SH6KiGpaUaRW9TUMwcRglzsfmWWlSsbKw96RFyiLn3jcaE
         M7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        fh=4qTTQZNqNMLNBoEdUlCoNV/a10P5YhRlyxYKcX8ga9Y=;
        b=ntiJ/UxbZ8kawwgBmaCFTujj0ZTUpa6XP2LxvLSpkcMSUoVk3c/dPfOsyoNlJNPKDT
         i81AjaADOiGyr+LrND30w1ZIXN3+0dLWJJ+3LPGy2Mlu3uUv8a78K1ElHuFs+0cPaRIy
         36rLqaWv3TUff3Aw4kt0voW5AmtyB1xhSEuKxqBsOq8Z8fL9DaVUFBA8rQ5x1VWbd++c
         r6svs2qtWJoRyXFIxpYM5vooE+9MwOgs/3m6vrH/CCUq4JNgOw72af2aeHg/zbxIJPib
         J2O4UUHgya4XDtT4vahmW6uMevzO+RK16DwYa2WWJ5itoxjSTkERxNZyFVGfuwx0M5gH
         PN2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795067158; x=1795671958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        b=G9sTcZLhDZovHsgCx5Yv7CDMxJM8G5FDawL5JBd36y8NAy88YZsvFaSPGxL2OJDQWl
         D8l1zhaslplXpC+LH5CUyVM6fiya54hKkm3044CoRWwH6cYkMSxwEs9IE4R9vJJik3G9
         PaGymfho5RIhVhS+d5TUg18WON8Y60WBZxMM5gYyXKhy/KCwkwn+iT9No3gldijeO5tx
         xp5Gg8oePFUL/bdSJWKKtm4OA3cKKfEuUGn9FzCr/u57K1nN+6BjTy/XuUfYpf49AuBU
         GF3mrNTIV4ZWpGu4KegbuhUlLkOSriAaKH7KHmdnomUVdJlrrfe8QiZH1hsMd7fqVOCf
         HQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067158; x=1795671958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        b=gEV7K5j1m53tbals2SXArpoxspDFaIxdnMOPQHbJ0+/J0xURdEMhv61VTkavt36kHl
         RdMOtfzs/Cqb1cZ3/0ZEeLkWVdP3zmCkv9Gu6iwyM1Ma59aDPvER/LEE6Hb9+xX+Irja
         Loo+TQ/CfdGiosF7LFSxTWenNaQmgPtr0USjqk3A/49xfWAeJgG8BHboCXGb3krU1/C7
         oTI/xzHqlR2xD/FtQMtE40ZuegaaxIw+Y7xaboL9YETuyAyheBHjT4S8K2efmMBnKTOW
         1CmgTvoB+lqjeATkZ/Xuyu76Vg2U8saqxNHbPp8Zmyk+ISh5RvdtpAvLTZX+tD/c18cS
         lFJA==
X-Forwarded-Encrypted: i=1; AL+hErGIacTvVLXatFlsTXIwPLVqukXxQ4C1etA+bNScxOiz0R6HpKXdfFE9BkX5VecYD47IZruYzSLoop8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6mnu+Kymhz+uUMDqraeuwB3nGvBIW8JN9/zSsUCK8QZdjR4RW
	5Tm3bJnvFiljyw/v2tz+Ci8TmYXrqW/BXXT7PFuz6gHFBsgr+h2I3dobSsv6EDdxQpfhLS+2MeE
	afFbJfrKKDwOKVwoqpITGWFRQv3UOIggOCtGigV3D
X-Gm-Gg: AYBFou3ZA6m1IamjZVW6nT8aK+KETxBnpM6Cm053bBATurRQ24LlJILA7xPQqDzkN3h
	lPsjex7b5FgLI5hmodMJwr2sbPRxnrOXzgFmWP5vOryaxdE3vAFxp3xebFlBAeFxibY0ixkV+eB
	lMZv4PAEu6xiyYbkluH6qj1ggZyQeTzp9xR762qRsVVYxZzHarp+yIX1A7QhWdBNbfWcxb+3j2q
	4hbGaVT0sXmWbUSgEtcrk/RfY1O1cdNyfhICOzP6qk52oXrAkZIPvHJOGW8btxHvAG0unoFQ3uJ
	dS4zUzyGQ1nMVjxZKeY48Ue9P2NQcQjLQCNY/ZKexsLlXYHsTbfwtCxTT3L94HA6DE3GQb0R5Ea
	WF30uo5zr9erYHUBdf6am9CdXCozBtd04TmMk
X-Received: by 2002:a05:622a:4808:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-55d6c7995f9mr6557911cf.2.1795067157461; Wed, 18 Nov 2026
 21:45:57 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-10-irogers@google.com>
 <DMYN979QJFNV.LM3T6O68OHW6@kernel.org>
In-Reply-To: <DMYN979QJFNV.LM3T6O68OHW6@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 18 Nov 2026 21:45:45 -0800
X-Gm-Features: Aa3M54p8GzPfKDPQ_HJcPbdLHGq3vwK7n9VGnVvnVB1ODjbFHeHwrlgOfVCaaEo
Message-ID: <CAP-5=fXrMyfLFXq6CiqwWMSbtYVRNESxuDo-ddqNwDmq5Nm4SA@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] kobject: Require explicit initialization of struct kobj_type::release
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 1:11=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sun Nov 8, 2026 at 11:39 PM CET, Ian Rogers wrote:
> >  static const struct kobj_type cpuregs_kobj_type =3D {
> > +     /*
> > +      * Pre-existing: info->kobj is embedded in per-CPU cpu_data;
> > +      * cpuid_cpu_offline() only calls kobject_del().
> > +      */
>
> All of these comments carry a =E2=80=9CPre-existing:=E2=80=9D prefix, but=
 that doesn=E2=80=99t
> distinguish cases with broken lifetime management from those where the st=
orage
> remains valid despite the API misuse.
>
> For example:
>
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_xcp.c
> > index ab14079d1c42..0847134a1391 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> > @@ -797,6 +797,11 @@ static const struct sysfs_ops xcp_cfg_res_sysfs_op=
s =3D {
> >  };
> >
> >  static const struct kobj_type xcp_cfg_res_sysfs_ktype =3D {
> > +     /*
> > +      * Pre-existing: xcp_res is embedded in struct amdgpu_xcp_cfg
> > +      * rather than freed individually by kobject_put().
> > +      */
> > +     .release =3D NULL,
>
> Being embedded in another structure doesn't explain what guarantees that =
the
> enclosing allocation outlives the kobject=E2=80=99s final cleanup.
>
> Could you please drop the =E2=80=9CPre-existing:=E2=80=9D prefix and make=
 that distinction
> explicit? For broken cases, describe the lifetime problem and mark it as =
needing
> a follow-up fix. For cases where the lifetime is safe, explain what guara=
ntees
> that safety, while acknowledging that omitting release() still violates t=
he
> documented API contract.
>
> Also, do you plan to follow up on those cases?

Makes complete sense, thanks Danilo!

Auditing all 17 files in patch 9 with that distinction in mind:
- Only 3 built-in sites (arm64 cpuinfo, ACPI hotplug profiles, and
s390 sclp_mem) have backing storage that genuinely remains valid for
the lifetime of the kernel.
- The other 14 files either free/zero an enclosing dynamic or devm
allocation without waiting for final kobject cleanup, or are tristate
modules that unregister static kobjects/ksets on module_exit and can
unmap module memory before delayed cleanup finishes.

I've dropped the "Pre-existing:" prefix, documented the specific
guarantee or FIXME lifetime hazard at each site in v4, and yes, I plan
to send follow-up fixes to the respective subsystems once __must_init
is in place.

Thanks,
Ian

> Thanks,
> Danilo
>
