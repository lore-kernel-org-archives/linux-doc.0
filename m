Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1E035CBCB
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 20:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781729722; cv=pass; b=EEcGo0wtMPVr6wLXIiwQVOK/hLcPrIlsYR0Whp5EC6SaBqRIKeHxDw/8sq9x0eNUptIrSugJwqpCySGt0/IaLfBoyOZcrQm2q4Xi6yMf5GI52y08882UtqvWXwUtdIsekHNzptpPtNioP9XaK+JnrygutfKIleE2f4LguXRYaHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781729722; c=relaxed/simple;
	bh=e2Qed6cBwQmN8q63smrZvrx+tQ0mpH9cF0fKPBM49Pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/zSZBwepB4GCZDon7Pt71ojRhK5l+SI6PM30N5V3h+OrLnYqejmsB8fhOHWAdiiQHOUVCmX3Tq3IkqqVrAiMaChA7lqJ0P9T6jT2dTxZP5uoHYeAMJvQ63NtV3+LiKqr3rsCezu1fRvuCGuk97OeMT6k0cV/4J6sldNDj6HEXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y9HrVWQw; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y9HrVWQw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c6d3851e0aso5995ad.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 13:55:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781729720; cv=none;
        d=google.com; s=arc-20260327;
        b=QCbjLt3xJ64DTxOEyr6q0O6FDqdrmTjsC201YNxVJhzJWf1WQPWsmcyT++vogP73bg
         96ZdnxhQMe1IsX9eVd9AsmvewahXvz+zIfY3vtH6z5KR8YCrpemf/Sd42HRVeJ/flvzt
         thqtF/fiCiFk6kJ8SV0FqFqxvbfIVeLbJ2G2A1IO03epIiR7dMJ3h+o6Xr5kfieEgIRm
         RVAEQGsQWfQWIQpAb7KI1e+Md1K+CJQB0shvoQJP0OwqcAeyjEqSESn89q5948YvUna2
         Yd0o7IQrsx3vsmfHIvn1MTbFVZ/RJOW3x2OH+JvwU4XpMjGmY14wd/MblxRQqRXalDlG
         r31w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dh2PNt9Pk27TkoiAgCtWpGVeAzV02e+UeQ70XJQO/Nk=;
        fh=D6aVah8hV6H7osJQYu5CM3sYtSZj28lJBwqk53d8HJo=;
        b=C6UXtP2Y09tpCaMJNoYYxourvLPKuLBdPh5yFGs/8Fp5+04nhFqpR6mmobH7WWUurs
         RZoWUq4UhBUGGaG1KowGLY/it5MeXOUPBU9tzudYrgdCJIr9o4HScqVMWQx2vEmFIpxq
         W53F2z+Y2Tk/942OxAwIyInrIpSdZyBfl5IXO6jklawe6jpDz0DdbmYWna4nU18ZMYDO
         +b6gaKGdUJ79LwrkAarnI6iRok/5tit44D5DPCCnX22x8SO+bYX/41C/b9fvepbgU992
         CDYJ67erQWKA9alPRRaYCKDaRBqyeRGGBqEZAOHuo7EC5tM+MSYYVahNntHNePa5sj6K
         6P7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781729720; x=1782334520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dh2PNt9Pk27TkoiAgCtWpGVeAzV02e+UeQ70XJQO/Nk=;
        b=Y9HrVWQwj4rXbfcaLDSnyW/ncMcvH+aAYIyI9OKO2vm7YFMhq8alaiQyT5DmKvZfvh
         ijie3Gob32D0DOmyblNs++zic6Zeot/d5swDDXXBwGSLKtlLBz8GcaaUsLGPLaqhHQLR
         muzVV0WDkI0C0hk9Bjzya6dURBmHV2LiIgJiAxsHUA1oEqXcnEhG6vOAR4xwPFUoanlq
         mK6Ub7F6iWffIiddWk4WibvpyBJ4NMq7PUgk0wkFK0+ddlNZMMnOgt1h11QJSXB3Tvmp
         eWWE6PlWaqldvHucrgvO1BbvkgctwP0Wv4K+6P8vYnBaBaJfWu1xLtCdudVUUBxudy6A
         earA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781729720; x=1782334520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dh2PNt9Pk27TkoiAgCtWpGVeAzV02e+UeQ70XJQO/Nk=;
        b=hHjlZQthf+hDYmy7rjly8P2IalT0uibJCAeJ2ombsdAUtV5hA0YXrzR9zUl2PbsM3G
         BFYXHlFkMVLplkAXr9yw5370n1yZ9BXNU/6/VEiv51reAccJ/DTFGyHfa5ObZaioJ5sR
         qoYWUpmTw5vpIu7lED2Dg2tNgVx9d44OhKXzk383Odt128+Vil3FXIPOoEWqhv2PpQIT
         2YhLK4x80rBvoMFcF5Fx92HE0tOrJRLc+sECBgNnRIPcw6zXprLN/TckMVEnlhWbDY9v
         XclkiuSZfLW6NcfwkIF4+V8cxuJBYJFvOlFKDsRG+xe3/5sa8Rk2abuDLBBo7pW/kx5N
         IpWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+BeR41+SlnWZyDm8f6eOcwXTdkoIIzSnnekPzUU522Fwtid01MbNqtWPnIm3LleXOETBGYFPVaguc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz16yM8AO9LeUZxXHfI92HwX7WIMmwXRiZacc0SA/pNHzQTObFX
	1HDw97Ve7/ZKLyc7JVq+rtofkfnQFAfJ7t3esQjbGkYimci+YzR3G+MtIe9dkRauxAfqtqcruL4
	vA9/5JqbB3gYcMngEfKowlpqZd+EfBJCgfYo4MRm9
X-Gm-Gg: AfdE7cnd1ch/5GVuHtVuLmZXPrweyU4sW9jr7maWA+vV9HPNbVM4qe7LrwK/G3g/xpu
	WKt8e2o72w265yFXrNywAnuhOxm40UoCrlyxbapPo3s4slZcdLuxI7acPMKJm0cd54UwJFZ5Rcw
	u+7/CkHxKBSeVTdAZbFn1QQSKZMRU42PUq0Vs04Q1KRQ3rXdnBjgrlAllurjC3q6Cmtbn0M9mYc
	QzdBNslxXTjhbfOoPodxr4qPetbAj4mL5FRi0OXzI6VEVToFMqnIStMN0UGlyoqz3H/4bySLhH/
	DSkbPDi98pCmQLyG9fiWNzSMUPo=
X-Received: by 2002:a17:903:1d0:b0:2bf:139c:dcf3 with SMTP id
 d9443c01a7336-2c6e8699658mr193785ad.19.1781729719924; Wed, 17 Jun 2026
 13:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com>
 <7d98db60ab0fddab230b1a7a32140f3361ab42cf.1781564384.git.abhishekbapat@google.com>
 <CAJuCfpFbCKc7FR3tbeCzexCzyfiP+Ab2fJ7Vd1Q76MKTvqC2XA@mail.gmail.com>
In-Reply-To: <CAJuCfpFbCKc7FR3tbeCzexCzyfiP+Ab2fJ7Vd1Q76MKTvqC2XA@mail.gmail.com>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Wed, 17 Jun 2026 13:55:07 -0700
X-Gm-Features: AVVi8CfV0wfWYHPqAXkDdgLI2ySTrpqCpBwT5CcxwbykM434wWzYvUfUKrVD1-M
Message-ID: <CAL41Mv7=B7H1C3j5_Pva-kYsJs_1NpCqVhN6wn-WhqvquV6=2w@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] alloc_tag: add size-based filtering to ioctl
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 9:29=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Mon, Jun 15, 2026 at 4:04=E2=80=AFPM Abhishek Bapat <abhishekbapat@goo=
gle.com> wrote:
> >
> > Extend the allocinfo filtering mechanism to allow users to filter tags
> > based on the total number of bytes allocated [min_size, max_size]. The
> > size range is inclusive.
> >
> > Filtering by size involves retrieving allocinfo per-CPU counters, which
> > is an expensive operation. Hence, the performance of size-based
> > filtering will be worse than other filters.
> >
> > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > Acked-by: Hao Ge <hao.ge@linux.dev>
> > ---
> >  include/uapi/linux/alloc_tag.h |  8 ++++-
> >  lib/alloc_tag.c                | 63 ++++++++++++++++++++++++++++------
> >  2 files changed, 59 insertions(+), 12 deletions(-)
> >
> > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_=
tag.h
> > index 3b11877955b9..7f5acbb44c14 100644
> > --- a/include/uapi/linux/alloc_tag.h
> > +++ b/include/uapi/linux/alloc_tag.h
> > @@ -45,13 +45,17 @@ enum {
> >         ALLOCINFO_FILTER_FUNCTION,
> >         ALLOCINFO_FILTER_FILENAME,
> >         ALLOCINFO_FILTER_LINENO,
> > -       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_LINENO
> > +       ALLOCINFO_FILTER_MIN_SIZE,
> > +       ALLOCINFO_FILTER_MAX_SIZE,
> > +       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> >  };
> >
> >  #define ALLOCINFO_FILTER_MASK_MODNAME          (1 << ALLOCINFO_FILTER_=
MODNAME)
> >  #define ALLOCINFO_FILTER_MASK_FUNCTION         (1 << ALLOCINFO_FILTER_=
FUNCTION)
> >  #define ALLOCINFO_FILTER_MASK_FILENAME         (1 << ALLOCINFO_FILTER_=
FILENAME)
> >  #define ALLOCINFO_FILTER_MASK_LINENO           (1 << ALLOCINFO_FILTER_=
LINENO)
> > +#define ALLOCINFO_FILTER_MASK_MIN_SIZE         (1 << ALLOCINFO_FILTER_=
MIN_SIZE)
> > +#define ALLOCINFO_FILTER_MASK_MAX_SIZE         (1 << ALLOCINFO_FILTER_=
MAX_SIZE)
> >
> >  #define ALLOCINFO_FILTER_MASKS \
> >         ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> > @@ -59,6 +63,8 @@ enum {
> >  struct allocinfo_filter {
> >         __u64 mask; /* bitmask of the filter fields used */
> >         struct allocinfo_tag fields;
> > +       __u64 min_size;
> > +       __u64 max_size;
> >  };
> >
> >  struct allocinfo_get_at {
> > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > index 5feb61d9fb92..b3d21834b61e 100644
> > --- a/lib/alloc_tag.c
> > +++ b/lib/alloc_tag.c
> > @@ -195,15 +195,26 @@ static int allocinfo_cmp_str(const char *str, con=
st char *template)
> >         return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SIZE=
);
> >  }
> >
> > +/* Fetch the per-CPU counters */
> > +static inline struct alloc_tag_counters allocinfo_prefetch_counters(st=
ruct codetag *ct)
> > +{
> > +       return alloc_tag_read(ct_to_alloc_tag(ct));
> > +}
> > +
> >  /*
> >   * Populates the UAPI allocinfo_tag_data structure with active runtime
> >   * profiling counters extracted from the given kernel codetag.
> >   */
> >  static void allocinfo_to_params(struct codetag *ct,
> > -                               struct allocinfo_tag_data *data)
> > +                               struct allocinfo_tag_data *data,
> > +                               struct alloc_tag_counters *counters)
> >  {
> > -       struct alloc_tag *tag =3D ct_to_alloc_tag(ct);
> > -       struct alloc_tag_counters counter =3D alloc_tag_read(tag);
> > +       struct alloc_tag_counters local_counters;
> > +
> > +       if (!counters) {
> > +               local_counters =3D allocinfo_prefetch_counters(ct);
> > +               counters =3D &local_counters;
> > +       }
> >
> >         if (ct->modname)
> >                 allocinfo_copy_str(data->tag.modname, ct->modname);
> > @@ -212,9 +223,9 @@ static void allocinfo_to_params(struct codetag *ct,
> >         allocinfo_copy_str(data->tag.function, ct->function);
> >         allocinfo_copy_str(data->tag.filename, ct->filename);
> >         data->tag.lineno =3D ct->lineno;
> > -       data->counter.bytes =3D counter.bytes;
> > -       data->counter.calls =3D counter.calls;
> > -       data->counter.accurate =3D !alloc_tag_is_inaccurate(tag);
> > +       data->counter.bytes =3D counters->bytes;
> > +       data->counter.calls =3D counters->calls;
> > +       data->counter.accurate =3D !alloc_tag_is_inaccurate(ct_to_alloc=
_tag(ct));
> >  }
> >
> >  /*
> > @@ -238,7 +249,9 @@ static int allocinfo_ioctl_get_content_id(struct se=
q_file *m, void __user *arg)
> >   * Verifies whether a given codetag satisfies the active filtering cri=
teria by
> >   * matching its characteristics against the specified filter.
> >   */
> > -static bool matches_filter(struct codetag *ct, struct allocinfo_filter=
 *filter)
> > +static bool matches_filter(struct codetag *ct, struct allocinfo_filter=
 *filter,
> > +                          struct alloc_tag_counters *counters,
> > +                          bool *fetched_counters)
> >  {
> >         if (!filter || !filter->mask)
> >                 return true;
> > @@ -265,6 +278,19 @@ static bool matches_filter(struct codetag *ct, str=
uct allocinfo_filter *filter)
> >             ct->lineno !=3D filter->fields.lineno)
> >                 return false;
> >
> > +       if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_=
FILTER_MASK_MAX_SIZE)) {
> > +               if (!*fetched_counters) {
> > +                       *counters =3D allocinfo_prefetch_counters(ct);
> > +                       *fetched_counters =3D true;
> > +               }
> > +               if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> > +                   counters->bytes < filter->min_size)
> > +                       return false;
> > +               if ((filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> > +                   counters->bytes > filter->max_size)
> > +                       return false;
> > +       }
> > +
> >         return true;
> >  }
> >
> > @@ -278,6 +304,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *=
m, void __user *arg)
> >         struct codetag *ct;
> >         struct allocinfo_get_at params =3D {0};
> >         __u64 skip_count;
> > +       struct alloc_tag_counters counters;
> > +       bool fetched_counters;
> >
> >         if (copy_from_user(&params, arg, sizeof(params)))
> >                 return -EFAULT;
> > @@ -285,6 +313,11 @@ static int allocinfo_ioctl_get_at(struct seq_file =
*m, void __user *arg)
> >         if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
> >                 return -EINVAL;
> >
> > +       if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> > +           (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> > +           params.filter.min_size > params.filter.max_size)
> > +               return -EINVAL;
> > +
> >         priv =3D m->private;
> >
> >         mutex_lock(&priv->ioctl_lock);
> > @@ -308,7 +341,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *=
m, void __user *arg)
> >         ct =3D codetag_next_ct(&priv->ioctl_iter);
> >
> >         while (ct) {
> > -               if (matches_filter(ct, &priv->filter)) {
> > +               fetched_counters =3D false;
> > +               if (matches_filter(ct, &priv->filter, &counters, &fetch=
ed_counters)) {
>
> Do we really need this "fetched_counters" parameter? Here are the
> possible cases:
> 1. If the filter does not include ALLOCINFO_FILTER_MASK_MIN_SIZE |
> ALLOCINFO_FILTER_MASK_MAX_SIZE then counters would not be fetched.
> 2. If the filter includes ALLOCINFO_FILTER_MASK_MIN_SIZE |
> ALLOCINFO_FILTER_MASK_MAX_SIZE and
> 2.1. matches_filter() returns true then we know counters were fetched
> because they had to be validated.
> 2.2. matches_filter() returns false then we don't care if the counters
> were fetched. We do not report that tag anyway.
>
> So, instead of passing fetched_counters to matches_filter() we could do t=
his:
>
> bool filter_by_size =3D (params.filter.mask &
> (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE)) !=3D
> 0;
> while (ct) {
>            if (matches_filter(ct, &priv->filter, &counters)) {
> ...
> }
> if (ct) {
>            allocinfo_to_params(ct, &params.data, filter_by_size ?
> &counters : NULL);
> ...
> }
>
> Wouldn't that work?
>

While we can deduce whether counters were fetched outside the
matches_filter function, I think the current implementation is more
intuitive from a readability perspective. I believe it  should be kept
as is for that reason. If we extract the logic, we'll first have to
replicate the boolean logic at two places. Second, we'd need to add a
comment explaining the boolean calculation, and the reader might have
a higher cognitive load trying to determine which function populates
the counters. The current implementation makes it easy for the reader
to deduce the original intention. Let me know what you think.

> >                         if (skip_count =3D=3D 0)
> >                                 break;
> >                         skip_count--;
> > @@ -317,7 +351,7 @@ static int allocinfo_ioctl_get_at(struct seq_file *=
m, void __user *arg)
> >         }
> >
> >         if (ct) {
> > -               allocinfo_to_params(ct, &params.data);
> > +               allocinfo_to_params(ct, &params.data, fetched_counters =
? &counters : NULL);
> >                 priv->positioned =3D true;
> >         }
> >
> > @@ -343,6 +377,8 @@ static int allocinfo_ioctl_get_next(struct seq_file=
 *m, void __user *arg)
> >         struct codetag *ct;
> >         struct allocinfo_tag_data params;
> >         int ret =3D 0;
> > +       struct alloc_tag_counters counters;
> > +       bool fetched_counters;
> >
> >         memset(&params, 0, sizeof(params));
> >         priv =3D m->private;
> > @@ -356,10 +392,15 @@ static int allocinfo_ioctl_get_next(struct seq_fi=
le *m, void __user *arg)
> >         }
> >
> >         ct =3D codetag_next_ct(&priv->ioctl_iter);
> > -       while (ct && !matches_filter(ct, &priv->filter))
> > +       while (ct) {
> > +               fetched_counters =3D false;
> > +               if (matches_filter(ct, &priv->filter, &counters, &fetch=
ed_counters))
> > +                       break;
> >                 ct =3D codetag_next_ct(&priv->ioctl_iter);
> > +       }
> > +
> >         if (ct)
> > -               allocinfo_to_params(ct, &params);
> > +               allocinfo_to_params(ct, &params, fetched_counters ? &co=
unters : NULL);
> >
> >         if (!ct) {
> >                 priv->positioned =3D false;
> > --
> > 2.54.0.1136.gdb2ca164c4-goog
> >
