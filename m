Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4AF3932D1
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 23:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781737306; cv=pass; b=UCAx2qdzFcmfj1MLIjbeJjoFojkShC5juKmTsI9uslD0B8uP7XH58omsYwwcZ+ptbu/RxPJvfPd8qhhcFx+4EidFlKyOEBIqymvkItghdwEFAy6Y8NR7ZtcURLCjgyQn/tYe9Zs8vSzDNo6fuDQJqij2NyeZ3V+ZHO+10q0pkfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781737306; c=relaxed/simple;
	bh=jiNviaiCxWcs56Q43u+usFJ+5sNBA41ShVDR3i7R3lU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ru0OMNnT/AGPTLn7GvrVz5lmW/KtnxDMcdvglAvDRUFMdRdbVhA0Tlt0FdnsUMftIYEjXo0VD9m+UPOheruNC40/jH6tf0YelV9lpn2h0P8NutwEOrsyNCzCDC8YHztunh3a3cPrazbij7GTc5yexJwwB5TprgtZKn2HLBt4wHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dOKZ8QYj; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dOKZ8QYj"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51765331535so56811cf.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 16:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781737303; cv=none;
        d=google.com; s=arc-20260327;
        b=DdsUZDtWLbFddwZdiFJIgu5zswh0dN+hPcLM+VbR+cqxHaDQjSwfuaE/pubKt/Imo0
         LHsaiftQEOeJXu/GaBAVk8hjOjdg25P9TRmZ1ZSZqeN11scYNUOuPJHBOBv4mu9mcf1w
         VfpArUqeU5Kjee87b182ITZmiVI1rxKFp+gLP6WX4TvosWIeG31Ffc9mhS7HVPGWkVJJ
         jKHJ+QxK/eEgoLeOcTa0b9kjToDnVVXUQU9A06H5n6gTMiFfs6NMIqWOE+ik7JRF+u8o
         vMmZTwFIAb1yM+Aj4ScEu3dVIxVU36DRRAaCwVr6eAj4CIfxAYNpe4ZK9V8FrjIF5v3o
         rBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=chYNIvg2aQfolPl8R3U0BIa/xTg9uDRD2CbTMiTfKAQ=;
        fh=pQHyoI0AcanKHxlrqvVMF+3ji43vPNdHyeSQlwKm4MI=;
        b=H3af5AfEmW3oOMEDJK8AvwmddoV0QTSTd+jnEKKlk4xWdWrqOVpYNh/Dd+VIq24ZMF
         A3cp47CH2xsuZFC8gYwIpWti9/JzYLO8NzdjbKAGUZretiZGfxomxJ9l2xiT1I0UftFt
         I2Tky25ZFAoPIu/8MiwzN73a8EX7mQZUUYPLiPSVLJ3v0A51hKmWEt3W9dNEcck3UkrI
         VCuxGsxz98d4nI84+rXHnOtJGtSwfJJS4EvFMq0EegMhDKFcdefQAR3ExkgCgq2hRzsu
         Wrx2MdYkX5Csu/fFKKu3cK7XF9J56b+PHoU9IBvSV2yuPKyrOjn8ew8zFAg+aFfbXDyh
         EOOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781737303; x=1782342103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=chYNIvg2aQfolPl8R3U0BIa/xTg9uDRD2CbTMiTfKAQ=;
        b=dOKZ8QYj/mSKchg3NQOb6CJKVuGPRL+2MTyUsRG+rMeHW/dF/BNtidGItl1lFdbcWj
         cdxQHJdlAZmRAU6BHxrbtdAVRcx9xHXxTC3THbVk5ex3Rn8BUs46snF2lugCL0KF7acO
         OOOh457uZLPqJBmyY9W0zpfkQ+nmRmyfmxP+o5WXu46lPq5OXaasZHhIfr/A6FDpP2nQ
         cSG6t2/vwfx0V2Uix4W91RlRUtWDVYkSmZp/sp8/ysYjL/YBz+ygfKuhbHCwH6uq9895
         tjFiWxd9azst+2LJzhkc/E1h8JgWByRqFAHY9y8s1xy+Vbq7NjkUZFwFTKhVkA+UGuuo
         XOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781737303; x=1782342103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=chYNIvg2aQfolPl8R3U0BIa/xTg9uDRD2CbTMiTfKAQ=;
        b=YDTZ5D2BrPwlP+bhroomfBMPQHOuga7TTS2AYdGYhYDc0pKd3md6vYMAt0ulcjWB/h
         h6fmRcpS6Oz0eWnLER+eXgWLSEka71TgBhTIfXP3AJiU7RtYMyFpQTdkHucs+hO83Qod
         gED16uUHyXCyRaTEG2ALpetgWQn3nmBoG0F5h71gG86kMzclwxswqjRRcnDTmVMHEYE5
         xMbipJYHQcNajVruZ4ExljQ1nwmoJPELf3UiqREDtlCtHmyveYDdB9QxKdB7H/7ygjJT
         UMxTWuMBthbCgBvIhGwmdVm6f0dtQ2dm/R1ZlgM+5OkLjfJNPU58D0yHfg1OssJYVrEu
         IoXg==
X-Forwarded-Encrypted: i=1; AFNElJ9AMNhwt39vkv2h0q85tlHMkZ8DYWiaoMzeiV3wziykyaqWxB/r232NbXUrb8OUwLahzJunuO4W6qc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwthSrJlGFKC11frAVbgKBahyg58zdeUTCgGb+7vAzZ+24YN81u
	iQMrtGnzlfq/GGTcSEjFVLdgnCvDY0o5R3epXEmNsnNu/Wy3+9uPFhLKkP2K9rjn8yD/ezoZtfO
	FUw2MF1EcYZLrqHRjaYHfExfjgo5PRTGU4gs04mVz
X-Gm-Gg: Acq92OFuB/XnG8gfDQvorC++sYofFCiqyt4anxthk/cbpXWvs2colEWzVBEqw/rGXxh
	jnDRJ38kNDviL0b+ZYc55D6DD0gWxo57oupAZYc/j7oCn5YNhQ6ONEOyctw8B/fhr31/0jLFbOI
	apKnpEQEvVaMTwXChY4hpcJmVOn1wKK9mRnf6QMKZGlSX9VUzHJkZfoiZzW20nn075xqwo4Oz9d
	ufMOEWm8XR6BN3/6tJhb9ZEbYoLYktCYqeAEQC+b64UxUA20WxN13EmdHHGTH7lzThFj6I=
X-Received: by 2002:a05:622a:1a9e:b0:516:3f51:81cb with SMTP id
 d75a77b69052e-519c973f6b0mr1597741cf.13.1781737302279; Wed, 17 Jun 2026
 16:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com>
 <7d98db60ab0fddab230b1a7a32140f3361ab42cf.1781564384.git.abhishekbapat@google.com>
 <CAJuCfpFbCKc7FR3tbeCzexCzyfiP+Ab2fJ7Vd1Q76MKTvqC2XA@mail.gmail.com>
 <CAL41Mv7=B7H1C3j5_Pva-kYsJs_1NpCqVhN6wn-WhqvquV6=2w@mail.gmail.com>
 <CAJuCfpGOrtk+3hvUVE7-6wpnsa3Nbr6kGq5CfHVdCzX+DYyjFQ@mail.gmail.com> <CAL41Mv6FZU5As+yKiM52axUMsR_FDrYQCK5STjUp-aG+xMD-EQ@mail.gmail.com>
In-Reply-To: <CAL41Mv6FZU5As+yKiM52axUMsR_FDrYQCK5STjUp-aG+xMD-EQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 17 Jun 2026 16:01:30 -0700
X-Gm-Features: AVVi8CdE35jTyLSitGqA0jYruECl2C0Lv-1lfszf7nB8jdkFfyY7E1mYiqZtbxo
Message-ID: <CAJuCfpFrgKBGFWoca=XuKh1p22vdfE_uSz_nt2Kj4UvnjvSUJQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] alloc_tag: add size-based filtering to ioctl
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 3:41=E2=80=AFPM Abhishek Bapat <abhishekbapat@googl=
e.com> wrote:
>
> On Wed, Jun 17, 2026 at 3:35=E2=80=AFPM Suren Baghdasaryan <surenb@google=
.com> wrote:
> >
> > On Wed, Jun 17, 2026 at 1:55=E2=80=AFPM Abhishek Bapat <abhishekbapat@g=
oogle.com> wrote:
> > >
> > > On Wed, Jun 17, 2026 at 9:29=E2=80=AFAM Suren Baghdasaryan <surenb@go=
ogle.com> wrote:
> > > >
> > > > On Mon, Jun 15, 2026 at 4:04=E2=80=AFPM Abhishek Bapat <abhishekbap=
at@google.com> wrote:
> > > > >
> > > > > Extend the allocinfo filtering mechanism to allow users to filter=
 tags
> > > > > based on the total number of bytes allocated [min_size, max_size]=
. The
> > > > > size range is inclusive.
> > > > >
> > > > > Filtering by size involves retrieving allocinfo per-CPU counters,=
 which
> > > > > is an expensive operation. Hence, the performance of size-based
> > > > > filtering will be worse than other filters.
> > > > >
> > > > > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > > > > Acked-by: Hao Ge <hao.ge@linux.dev>
> > > > > ---
> > > > >  include/uapi/linux/alloc_tag.h |  8 ++++-
> > > > >  lib/alloc_tag.c                | 63 ++++++++++++++++++++++++++++=
------
> > > > >  2 files changed, 59 insertions(+), 12 deletions(-)
> > > > >
> > > > > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/=
alloc_tag.h
> > > > > index 3b11877955b9..7f5acbb44c14 100644
> > > > > --- a/include/uapi/linux/alloc_tag.h
> > > > > +++ b/include/uapi/linux/alloc_tag.h
> > > > > @@ -45,13 +45,17 @@ enum {
> > > > >         ALLOCINFO_FILTER_FUNCTION,
> > > > >         ALLOCINFO_FILTER_FILENAME,
> > > > >         ALLOCINFO_FILTER_LINENO,
> > > > > -       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_LINENO
> > > > > +       ALLOCINFO_FILTER_MIN_SIZE,
> > > > > +       ALLOCINFO_FILTER_MAX_SIZE,
> > > > > +       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> > > > >  };
> > > > >
> > > > >  #define ALLOCINFO_FILTER_MASK_MODNAME          (1 << ALLOCINFO_F=
ILTER_MODNAME)
> > > > >  #define ALLOCINFO_FILTER_MASK_FUNCTION         (1 << ALLOCINFO_F=
ILTER_FUNCTION)
> > > > >  #define ALLOCINFO_FILTER_MASK_FILENAME         (1 << ALLOCINFO_F=
ILTER_FILENAME)
> > > > >  #define ALLOCINFO_FILTER_MASK_LINENO           (1 << ALLOCINFO_F=
ILTER_LINENO)
> > > > > +#define ALLOCINFO_FILTER_MASK_MIN_SIZE         (1 << ALLOCINFO_F=
ILTER_MIN_SIZE)
> > > > > +#define ALLOCINFO_FILTER_MASK_MAX_SIZE         (1 << ALLOCINFO_F=
ILTER_MAX_SIZE)
> > > > >
> > > > >  #define ALLOCINFO_FILTER_MASKS \
> > > > >         ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> > > > > @@ -59,6 +63,8 @@ enum {
> > > > >  struct allocinfo_filter {
> > > > >         __u64 mask; /* bitmask of the filter fields used */
> > > > >         struct allocinfo_tag fields;
> > > > > +       __u64 min_size;
> > > > > +       __u64 max_size;
> > > > >  };
> > > > >
> > > > >  struct allocinfo_get_at {
> > > > > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > > > > index 5feb61d9fb92..b3d21834b61e 100644
> > > > > --- a/lib/alloc_tag.c
> > > > > +++ b/lib/alloc_tag.c
> > > > > @@ -195,15 +195,26 @@ static int allocinfo_cmp_str(const char *st=
r, const char *template)
> > > > >         return strncmp(allocinfo_str(str), template, ALLOCINFO_ST=
R_SIZE);
> > > > >  }
> > > > >
> > > > > +/* Fetch the per-CPU counters */
> > > > > +static inline struct alloc_tag_counters allocinfo_prefetch_count=
ers(struct codetag *ct)
> > > > > +{
> > > > > +       return alloc_tag_read(ct_to_alloc_tag(ct));
> > > > > +}
> > > > > +
> > > > >  /*
> > > > >   * Populates the UAPI allocinfo_tag_data structure with active r=
untime
> > > > >   * profiling counters extracted from the given kernel codetag.
> > > > >   */
> > > > >  static void allocinfo_to_params(struct codetag *ct,
> > > > > -                               struct allocinfo_tag_data *data)
> > > > > +                               struct allocinfo_tag_data *data,
> > > > > +                               struct alloc_tag_counters *counte=
rs)
> > > > >  {
> > > > > -       struct alloc_tag *tag =3D ct_to_alloc_tag(ct);
> > > > > -       struct alloc_tag_counters counter =3D alloc_tag_read(tag)=
;
> > > > > +       struct alloc_tag_counters local_counters;
> > > > > +
> > > > > +       if (!counters) {
> > > > > +               local_counters =3D allocinfo_prefetch_counters(ct=
);
> > > > > +               counters =3D &local_counters;
> > > > > +       }
> > > > >
> > > > >         if (ct->modname)
> > > > >                 allocinfo_copy_str(data->tag.modname, ct->modname=
);
> > > > > @@ -212,9 +223,9 @@ static void allocinfo_to_params(struct codeta=
g *ct,
> > > > >         allocinfo_copy_str(data->tag.function, ct->function);
> > > > >         allocinfo_copy_str(data->tag.filename, ct->filename);
> > > > >         data->tag.lineno =3D ct->lineno;
> > > > > -       data->counter.bytes =3D counter.bytes;
> > > > > -       data->counter.calls =3D counter.calls;
> > > > > -       data->counter.accurate =3D !alloc_tag_is_inaccurate(tag);
> > > > > +       data->counter.bytes =3D counters->bytes;
> > > > > +       data->counter.calls =3D counters->calls;
> > > > > +       data->counter.accurate =3D !alloc_tag_is_inaccurate(ct_to=
_alloc_tag(ct));
> > > > >  }
> > > > >
> > > > >  /*
> > > > > @@ -238,7 +249,9 @@ static int allocinfo_ioctl_get_content_id(str=
uct seq_file *m, void __user *arg)
> > > > >   * Verifies whether a given codetag satisfies the active filteri=
ng criteria by
> > > > >   * matching its characteristics against the specified filter.
> > > > >   */
> > > > > -static bool matches_filter(struct codetag *ct, struct allocinfo_=
filter *filter)
> > > > > +static bool matches_filter(struct codetag *ct, struct allocinfo_=
filter *filter,
> > > > > +                          struct alloc_tag_counters *counters,
> > > > > +                          bool *fetched_counters)
> > > > >  {
> > > > >         if (!filter || !filter->mask)
> > > > >                 return true;
> > > > > @@ -265,6 +278,19 @@ static bool matches_filter(struct codetag *c=
t, struct allocinfo_filter *filter)
> > > > >             ct->lineno !=3D filter->fields.lineno)
> > > > >                 return false;
> > > > >
> > > > > +       if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLO=
CINFO_FILTER_MASK_MAX_SIZE)) {
> > > > > +               if (!*fetched_counters) {
> > > > > +                       *counters =3D allocinfo_prefetch_counters=
(ct);
> > > > > +                       *fetched_counters =3D true;
> > > > > +               }
> > > > > +               if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZ=
E) &&
> > > > > +                   counters->bytes < filter->min_size)
> > > > > +                       return false;
> > > > > +               if ((filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZ=
E) &&
> > > > > +                   counters->bytes > filter->max_size)
> > > > > +                       return false;
> > > > > +       }
> > > > > +
> > > > >         return true;
> > > > >  }
> > > > >
> > > > > @@ -278,6 +304,8 @@ static int allocinfo_ioctl_get_at(struct seq_=
file *m, void __user *arg)
> > > > >         struct codetag *ct;
> > > > >         struct allocinfo_get_at params =3D {0};
> > > > >         __u64 skip_count;
> > > > > +       struct alloc_tag_counters counters;
> > > > > +       bool fetched_counters;
> > > > >
> > > > >         if (copy_from_user(&params, arg, sizeof(params)))
> > > > >                 return -EFAULT;
> > > > > @@ -285,6 +313,11 @@ static int allocinfo_ioctl_get_at(struct seq=
_file *m, void __user *arg)
> > > > >         if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
> > > > >                 return -EINVAL;
> > > > >
> > > > > +       if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE)=
 &&
> > > > > +           (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE)=
 &&
> > > > > +           params.filter.min_size > params.filter.max_size)
> > > > > +               return -EINVAL;
> > > > > +
> > > > >         priv =3D m->private;
> > > > >
> > > > >         mutex_lock(&priv->ioctl_lock);
> > > > > @@ -308,7 +341,8 @@ static int allocinfo_ioctl_get_at(struct seq_=
file *m, void __user *arg)
> > > > >         ct =3D codetag_next_ct(&priv->ioctl_iter);
> > > > >
> > > > >         while (ct) {
> > > > > -               if (matches_filter(ct, &priv->filter)) {
> > > > > +               fetched_counters =3D false;
> > > > > +               if (matches_filter(ct, &priv->filter, &counters, =
&fetched_counters)) {
> > > >
> > > > Do we really need this "fetched_counters" parameter? Here are the
> > > > possible cases:
> > > > 1. If the filter does not include ALLOCINFO_FILTER_MASK_MIN_SIZE |
> > > > ALLOCINFO_FILTER_MASK_MAX_SIZE then counters would not be fetched.
> > > > 2. If the filter includes ALLOCINFO_FILTER_MASK_MIN_SIZE |
> > > > ALLOCINFO_FILTER_MASK_MAX_SIZE and
> > > > 2.1. matches_filter() returns true then we know counters were fetch=
ed
> > > > because they had to be validated.
> > > > 2.2. matches_filter() returns false then we don't care if the count=
ers
> > > > were fetched. We do not report that tag anyway.
> > > >
> > > > So, instead of passing fetched_counters to matches_filter() we coul=
d do this:
> > > >
> > > > bool filter_by_size =3D (params.filter.mask &
> > > > (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE)) =
!=3D
> > > > 0;
> > > > while (ct) {
> > > >            if (matches_filter(ct, &priv->filter, &counters)) {
> > > > ...
> > > > }
> > > > if (ct) {
> > > >            allocinfo_to_params(ct, &params.data, filter_by_size ?
> > > > &counters : NULL);
> > > > ...
> > > > }
> > > >
> > > > Wouldn't that work?
> > > >
> > >
> > > While we can deduce whether counters were fetched outside the
> > > matches_filter function, I think the current implementation is more
> > > intuitive from a readability perspective. I believe it  should be kep=
t
> > > as is for that reason. If we extract the logic, we'll first have to
> > > replicate the boolean logic at two places. Second, we'd need to add a
> > > comment explaining the boolean calculation, and the reader might have
> > > a higher cognitive load trying to determine which function populates
> > > the counters. The current implementation makes it easy for the reader
> > > to deduce the original intention. Let me know what you think.
> >
> > Ok, I guess you have a point.
> >
> > I was also thinking why we are passing NULL to allocinfo_to_params()
> > to fetch the counters into a local variable? Why can't we simply call
> > allocinfo_prefetch_counters() before calling allocinfo_to_params()
> > when fetched_counters=3D=3Dfalse? Basically:
> >
> > if (!fetched_counters)
> >     counters =3D allocinfo_prefetch_counters(ct);
> > allocinfo_to_params(ct, &params.data, &counters);
> >
> > This would simplify allocinfo_to_params() because counter will never
> > be NULL and it would not need local counters.
> >
>
> The only reason I did it that way was to avoid repeating the code at
> two places i.e. allocinfo_ioctl_get_at and allocinfo_ioctl_get_next.
> Either way, the per-CPU counters are assimilated only once. I can
> include this change if you still want me to, but personally I like the
> way it currently is implemented.

Yeah, I think repeating 2 lines is preferable to passing NULL and
fetching into a local variable. Please include that change.

>
> > >
> > > > >                         if (skip_count =3D=3D 0)
> > > > >                                 break;
> > > > >                         skip_count--;
> > > > > @@ -317,7 +351,7 @@ static int allocinfo_ioctl_get_at(struct seq_=
file *m, void __user *arg)
> > > > >         }
> > > > >
> > > > >         if (ct) {
> > > > > -               allocinfo_to_params(ct, &params.data);
> > > > > +               allocinfo_to_params(ct, &params.data, fetched_cou=
nters ? &counters : NULL);
> > > > >                 priv->positioned =3D true;
> > > > >         }
> > > > >
> > > > > @@ -343,6 +377,8 @@ static int allocinfo_ioctl_get_next(struct se=
q_file *m, void __user *arg)
> > > > >         struct codetag *ct;
> > > > >         struct allocinfo_tag_data params;
> > > > >         int ret =3D 0;
> > > > > +       struct alloc_tag_counters counters;
> > > > > +       bool fetched_counters;
> > > > >
> > > > >         memset(&params, 0, sizeof(params));
> > > > >         priv =3D m->private;
> > > > > @@ -356,10 +392,15 @@ static int allocinfo_ioctl_get_next(struct =
seq_file *m, void __user *arg)
> > > > >         }
> > > > >
> > > > >         ct =3D codetag_next_ct(&priv->ioctl_iter);
> > > > > -       while (ct && !matches_filter(ct, &priv->filter))
> > > > > +       while (ct) {
> > > > > +               fetched_counters =3D false;
> > > > > +               if (matches_filter(ct, &priv->filter, &counters, =
&fetched_counters))
> > > > > +                       break;
> > > > >                 ct =3D codetag_next_ct(&priv->ioctl_iter);
> > > > > +       }
> > > > > +
> > > > >         if (ct)
> > > > > -               allocinfo_to_params(ct, &params);
> > > > > +               allocinfo_to_params(ct, &params, fetched_counters=
 ? &counters : NULL);
> > > > >
> > > > >         if (!ct) {
> > > > >                 priv->positioned =3D false;
> > > > > --
> > > > > 2.54.0.1136.gdb2ca164c4-goog
> > > > >
