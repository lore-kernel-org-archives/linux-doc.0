Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793201766;
	b=MxMuulyxbmFM/LfZMNV1dCSVX0X2PrfrxnOg8Y2p8B+etbBO9WT5wukpIwCjKzNJcaV4
	 nkUmGVC3hvr/fgWVXRR7xCMYKtRpxRfieLR3gXi44qRjVtSodOceeOxG+R3NGdLGTz0S5
	 XuCZpjkb4yZi8bATeHh/h7hplkEVbLwH009fBNEywQ95vGJEfhe/Vzdi4U+jO5hdm8h6V
	 v+Rl8D19uQHIM/ZC55INRyknab+y4/PABWJYyy+IceLG8ELIW6ICvzQjr0QG+JpJl8ZsN
	 YxP8GnVFTHzY0Ie6RonIsu/Dgvo+LwzAlIGGw443Aq6Zat9UCN0O3lcY+9L4hGxE3pA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
	b=5MY7KfbpXCJttLCJyuHVF8CrB+8l7aomMRPXGataaeC9IhgGh+A6oBuhul/pn5tfFN78
	 bE8S08yfGslTrarVhMgM4vjv8aw3NzF7TPAGNHBA01nsaGz5tpT2ykZwIkI0334psxijf
	 2GA5L5no1alIqsQjc/ahMmZbSt152JokgFiTN0ybqLCgHvDhSEIU5BThZDneoBNL1UwWe
	 KI41pxCDKqWV1vfuGWDjB3rkagLqIwyGTP8omvogv/XSymd9ztwM5+7L7QR7k1+fDe1bC
	 vRQwvqxqj0jcfw0WEIlPdiUo/TfT5e7NWuTc4DKvpdXv91b9uIpIv7Zw3KHMWR96mJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nek8Nqx7;
	arc=fail smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18A8606A32E
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 15:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A18A8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nek8Nqx7
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-533202fe429so405361cf.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 08:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793201765; cv=none;
        d=google.com; s=arc-20260327;
        b=DQvUHUZ5OyAA4faimXb/k1+ppL7oIsi7mJMHdoY9mOvSEd9mvMHBNV+7+thMXM2VvU
         tj+4KQZnbALxaoiGtTGruAUjOrHd4d7deh/G9dtFqIF0CuIyKe7FgX5PJgy3AgMjuzsq
         6Q/8twyiKFkiiuagbKm2BWRk3fMaVvi80rKGnR2NsXh8Xid+nRrKv0i1fFEblNDFIuKm
         0N91L2vzQtq6Ic4AMQxx+Gzmz8t/XTY1CMCsmHHAvPzdj8W9XY4vJe11OwizLTzAMmTe
         oly1Oy2dURu99etAxTyDZRX40ODfRGo3SX86C55hI2vn2JybmpzYc4Fns/oNtj7SRovF
         jzRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
        fh=voRLRx6yhoU9JUTV7x7fkNNEMCBcNAQCOQWyVeIDWO0=;
        b=rMdte91+Ma6YNOgeiRajjvv9q4eUKZLAYr0SeZklH17WLZmJno6mAFtGntyte0wqkw
         dpLv52tFPERSdpipFJ/Ljm/FYCjMMFZ1f5JlPExN6OPGjH25civwPxIiUaIuNRePBAP9
         +lY7IUGznTUAnenpNR+TfnROy4SD1qNE+gVflo8VQkx+kELlY38shLqQPkf3whMtlGr/
         RFBk+dEQSL39wkosHjppo+u9y6mwfKc1di7MAD5T7m3FqXFK1oBg8lJ+/nwV4S7r4qTP
         iz25dHXOe4sP0+htLIeYYxa962vCbvfRaafv89KuRwIT5LOgbK4C4+VhsknkeHgqAX2h
         YLtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793201765; x=1793806565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
        b=nek8Nqx7d91OXZD7qWDvJpTMT7lowI69bPRP4zceMjAHm41xVpEzL1BgH5vON4e36j
         5cupyHhbLDw6ON8nWoBBJZRqDZ3S005GTvmgG3G0PtukPozM+2/LQ6a2MbkxzKZS39DP
         bzt/9gF0lI0l85/qa7WC7RdZ4Q0VkZkptogZtDuCXlakBdrYLGSggMJHiY7LR3KsJOtq
         1Gs4DN3Qtb9EZhFCO/4J0qmcKYuf+7C8fYPhDx+V95CDLxirmdfGb4XEO5yTc9zBxZGZ
         yh6Zudv8FzVB3adSvO7fw4oKhhxqCMD/35RpDFJe+zEhfhlT3Ry+hqRJH1ZgZUluJuF9
         /m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201765; x=1793806565;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
        b=O0l+UCyjuJOLdANGU/uS1ym+qLoB5Y7s3kkdYgnwhwMvzt+CFvHD4BnW0xgCj012Om
         acF6zvUQkzd0ZYwsizwfvCmySapI7Am7CnuV6ZGJVnD69ZlKdEE/zbzUvKq82PqngEK5
         JG6DKEvBk7gavFKB8hAwk7G2MG1dEsUujwg3oN/GjzQ9ukM1tpUykJ70UVc9cDIXkReF
         I1gX4WXVQI/3HAhXpuwmFp1AkAzheyoucowl33YmNATQ2aQtWxrgA/F+kAyaFSlhwLCv
         RZpfGhNVXo0hzg+QQ8f8XivPCAZnybBhYBnFZZYrEqKYy9P1TMqVMqmUWLFccVuwVO8W
         Ty0Q==
X-Forwarded-Encrypted: i=1; AKwUvBygjZfGzjqR8ItwEDbwAHlWm9qqeP/RifY0zWiEw8vuK2ItPLp5olRFXLPOrp/0ixqzdHNsu/zLHfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXFcTLq6CVoNrskEa0vCuLYUifX6NKodtlXl52zgQsHiLYvxu3
	EmfMMy5v5um1wAiyyQG2rKqVC28b48DSnAtbgBVCiza3o9fztgO5A0zqxQuBiR8k/2ZftOtEUC4
	8n/uJsaGYWZugR5RGIKOyEgAPnPKbiT3HNB0MjUL9
X-Gm-Gg: AYBFou24rTXU03iB4xY8tlKtnEd2oqOYIFfDCTN4oxivmqwEcUDu0JSYgGKo2qoOJ/j
	aALjGwquQWnQvk3VbXQEuFyhCPTfCOCOC91rGHzHLbD86vsIC/+4YUKVZnwjAa6S0QO77+4DH6b
	tfpnO3irLXch4o/TM6vtkZBZcUVgdSG4onSo42J/bQxoPBBtqw8UOx40125Nk3v5SyLo6dCr4Uw
	Eb1sOYxICJknis9wInjchBa4LplfDqbfEF9gspfdsGZ16UKRcOnPV743v0q8UmK4Z0UuKMCg/aH
	T49rDtOjPtWkpxkoAoF63zxO7PdZ142F5JgbkYkPJdpxisgVz+/b2XY6kz3EK6RPBUqosR3qwhm
	dEPjIcBo/8cLCLA82kBfFUwWU0TBnGf/mym4H1SKy83KmaE6C1xh5ExDiEc8=
X-Received: by 2002:a05:622a:22a9:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-53fc2aa1fa2mr21345071cf.4.1793201763129; Wed, 28 Oct 2026
 08:36:03 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com> <20261027223847.652884-5-irogers@google.com>
 <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
In-Reply-To: <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 Oct 2026 08:35:50 -0700
X-Gm-Features: AclHuK8Z1SdNi4k8-UQceLsnqDJD6d9aTo0cl8IQ7vlO1Fmucv2n8goL0VFX4iw
Message-ID: <CAP-5=fWVZ=7-qDRODiEQzRzhpQqribv9Morj=OoAXW_6uaW2dA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 4:39=E2=80=AFAM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Tue, Oct 27, 2026 at 11:39=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> >
> > Export cpufreq_dbs_data_release() and set .kobj_type.release statically
> > in the ondemand and conservative governors so their gov_attr_set
> > kobjects have a valid release callback statically initialized, matching
> > cpufreq_governor_dbs. Remove the redundant runtime assignment in
> > cpufreq_dbs_governor_init().
> >
> > This prepares for annotating struct kobj_type::release with
> > __must_init.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> Do you want stuff to be picked up by maintainers, or do you want to
> route it yourself?

Hi Rafael,

Just a quick note: I agree with Zhongqiu's feedback and the commit
message needs a fix.

Regarding merging the patches, the issue with maintainers picking up
fixes is that the series will break the clang/llvm build without them.
So the maintainers need to either merge the patches (and the series be
rebased on top of them) or merge the series as a unit. Perhaps since
the patches align, merge conflicts won't happen, so maintainers
merging and landing the series is okay. I don't have the experience to
know.

Thanks,
Ian

> > ---
> >  drivers/cpufreq/cpufreq_conservative.c | 5 ++++-
> >  drivers/cpufreq/cpufreq_governor.c     | 4 ++--
> >  drivers/cpufreq/cpufreq_governor.h     | 1 +
> >  drivers/cpufreq/cpufreq_ondemand.c     | 5 ++++-
> >  4 files changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/c=
pufreq_conservative.c
> > index 02bfd46543e9..146a2353b1a2 100644
> > --- a/drivers/cpufreq/cpufreq_conservative.c
> > +++ b/drivers/cpufreq/cpufreq_conservative.c
> > @@ -318,7 +318,10 @@ static void cs_limits(struct cpufreq_policy *polic=
y)
> >
> >  static struct dbs_governor cs_governor =3D {
> >         .gov =3D CPUFREQ_DBS_GOVERNOR_INITIALIZER("conservative"),
> > -       .kobj_type =3D { .default_groups =3D cs_groups },
> > +       .kobj_type =3D {
> > +               .release =3D cpufreq_dbs_data_release,
> > +               .default_groups =3D cs_groups,
> > +       },
> >         .gov_dbs_update =3D cs_dbs_update,
> >         .alloc =3D cs_alloc,
> >         .free =3D cs_free,
> > diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufr=
eq_governor.c
> > index f3bd3dbe7c41..f8b5aca09b6b 100644
> > --- a/drivers/cpufreq/cpufreq_governor.c
> > +++ b/drivers/cpufreq/cpufreq_governor.c
> > @@ -419,7 +419,7 @@ static void free_policy_dbs_info(struct policy_dbs_=
info *policy_dbs,
> >         gov->free(policy_dbs);
> >  }
> >
> > -static void cpufreq_dbs_data_release(struct kobject *kobj)
> > +void cpufreq_dbs_data_release(struct kobject *kobj)
> >  {
> >         struct dbs_data *dbs_data =3D to_dbs_data(to_gov_attr_set(kobj)=
);
> >         struct dbs_governor *gov =3D dbs_data->gov;
> > @@ -427,6 +427,7 @@ static void cpufreq_dbs_data_release(struct kobject=
 *kobj)
> >         gov->exit(dbs_data);
> >         kfree(dbs_data);
> >  }
> > +EXPORT_SYMBOL_GPL(cpufreq_dbs_data_release);
> >
> >  int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
> >  {
> > @@ -488,7 +489,6 @@ int cpufreq_dbs_governor_init(struct cpufreq_policy=
 *policy)
> >         policy->governor_data =3D policy_dbs;
> >
> >         gov->kobj_type.sysfs_ops =3D &governor_sysfs_ops;
> > -       gov->kobj_type.release =3D cpufreq_dbs_data_release;
> >         ret =3D kobject_init_and_add(&dbs_data->attr_set.kobj, &gov->ko=
bj_type,
> >                                    get_governor_parent_kobj(policy),
> >                                    "%s", gov->gov.name);
> > diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufr=
eq_governor.h
> > index 806d8fb4dff1..1026712bb79b 100644
> > --- a/drivers/cpufreq/cpufreq_governor.h
> > +++ b/drivers/cpufreq/cpufreq_governor.h
> > @@ -150,6 +150,7 @@ static inline struct dbs_governor *dbs_governor_of(=
struct cpufreq_policy *policy
> >  }
> >
> >  /* Governor callback routines */
> > +void cpufreq_dbs_data_release(struct kobject *kobj);
> >  int cpufreq_dbs_governor_init(struct cpufreq_policy *policy);
> >  void cpufreq_dbs_governor_exit(struct cpufreq_policy *policy);
> >  int cpufreq_dbs_governor_start(struct cpufreq_policy *policy);
> > diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufr=
eq_ondemand.c
> > index 9942dbb38dae..7386d043c665 100644
> > --- a/drivers/cpufreq/cpufreq_ondemand.c
> > +++ b/drivers/cpufreq/cpufreq_ondemand.c
> > @@ -374,7 +374,10 @@ static struct od_ops od_ops =3D {
> >
> >  static struct dbs_governor od_dbs_gov =3D {
> >         .gov =3D CPUFREQ_DBS_GOVERNOR_INITIALIZER("ondemand"),
> > -       .kobj_type =3D { .default_groups =3D od_groups },
> > +       .kobj_type =3D {
> > +               .release =3D cpufreq_dbs_data_release,
> > +               .default_groups =3D od_groups,
> > +       },
> >         .gov_dbs_update =3D od_dbs_update,
> >         .alloc =3D od_alloc,
> >         .free =3D od_free,
> > --
> > 2.56.0.313.g2479322e68-goog
> >
> >
