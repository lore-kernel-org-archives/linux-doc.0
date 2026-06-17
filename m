Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC2538E8B6
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 22:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781735703; cv=pass; b=lSzJxT1kEdTWm6y3cwCW9IDpn9xl0eacBlSDuQXfPbADmqyCBb9MnUIaB/zoYT8d0TDJ4iwBpf0UfRTcS5NXHCK69q4NukMkp2Tw7st8g0pfwMPiHsW8VX9A4T+WKBQRgH4u3PKiRmXIKhKV95qqEF0KVJnZSrQzz7edlJ6O/WQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781735703; c=relaxed/simple;
	bh=uqFwlyMPYWQSu8OF1Ja2QBoKTZaSejZIJWpuR99WK3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSfHt+SvdLiZPnbl4nvyIkX3OohAvv1L8GzN8b6xH9XtjWMrGgQEk2t/6N0coJVvDeBIc/DmMYXZ76+WLZnCAgZRz8/rx3gYIHdP8jl4t9pLp8Aa4SQJAq29Ki6id6vAOMNobdndWG0fEHFk9pVzmArBGRXLN+SRDA3pjpXnSu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NiAR/TTX; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NiAR/TTX"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51765331535so52201cf.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 15:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781735700; cv=none;
        d=google.com; s=arc-20260327;
        b=B2QKNAMBtDB4uJU8OMRURUXvL7NfeDuGYn4vjzJof8ywbiv0kVoXYpE+FpUyFmCe9k
         Rl5RCUv5WYqbDmMZwvDQY2rKNY0DXFl73KAY0VsGc/2k/xL39PmTKbhMFbdWZTKuZT3Z
         EbJ6+GDZ/ZSZzyzyHynBYyZ5TQzBnXYLtDFD/3e5IXFvKUSdIfzHvMpXLESF8TT4uGza
         /SbsdCj4rhKz2jfgiOMZvpQsB6w/Ksv9l1nGs9ZuTF+k18mjRY2ie07M0AcknZ097mk8
         YgZ149OboC/oiAno8jZxMKjdEc0wvb6styVPfqPEonD7pSk2rf3pg88QPOCRrA/vO7XW
         xt6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pTVuAvURpFFqS1aELb7lH98BL2WHu/TfJPzOuY03hDY=;
        fh=oJv8hJuEOFJu5WjRo7Vmp9+i6DzeocMuAphsCTQjhlc=;
        b=Y35dljlNYC506mFUOjl/b8N329XkwI7RtNg+01UyOyXrKoNeTImBf5KmnTCXDbZv1I
         IcyGsrXy1yUNzVsAH5G2ZZujXdaUUCTZ0uk+W9kksoFkMjxGn7lpl5C7rKQLzqGx4xL8
         w1UtefhxkXSfUTO4ZkLUIcgUY6EeCmLE6BtyWp+6T76FPtdLHiRp43ixHcJZKRe44qDG
         txGrJ5R/CCv9n43t2XX4ulXPqaAS4WA480kR4rfONAvept4ov+c87xhUCwtE0zjhDq0Y
         XoOE8gi5CSjl1WgWSfYaBXmIlfoXjpJcNQv8bDfDmFf8gunHD+7p3upG0F1jENNpz88Z
         9PEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781735700; x=1782340500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pTVuAvURpFFqS1aELb7lH98BL2WHu/TfJPzOuY03hDY=;
        b=NiAR/TTXBK8d+ZDt/DC/JqlfSEEc6xFDdC45sJw4XS7mVKCLfkQbwu32pdQvGVUXlo
         1HMXImgcZK3N2SH7Pb/J05/kbyQGL2i83MrdWmxMMu7plcdOdr80Zi/Yre46PNOZRg3s
         K6Y5cqXQ/YIzhYSdsfPqqYK11v0EXB/ghdHPb68v6ovA/CGGAZQksvRzKd7noOUzu5K8
         0IoOiW5jx6FCG+v+WdjATCTNUvywmS0LGQn0764/rvOLD6Em0sx0MCmnkh45CKjrWW1R
         z7+wBwXL93Qcrgggk/V7bNwKaLJQluSO+wn5JYmxbZsBRgQty/w4QrXcR5jYGCWvYUpS
         Pn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781735700; x=1782340500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTVuAvURpFFqS1aELb7lH98BL2WHu/TfJPzOuY03hDY=;
        b=o9d5v83Vpx1WqsD/2sbcLSj2Cvo3TGx7sC1+j2xmNrWs6ak3re/LP7LeKlimTp+Q6W
         2Uj4c13ShDeBKxh7DzsoXmoeubPwpMVfTM+vzwCidw+xJt2SpMWgLh03s7A5comAkiHm
         x+wBTuSxtuVE7Ywt3pGv9J0x8srCQYqM+80ntP0kP8PP5a0XuJg3Ttc4HmKOmOW2v5ox
         WKeK1P3ly+Uv5ITNkTy1awfem7T8Mx6ocSCcNHwhi9KCPpwXiJlNDZNB4Jn7ixBNRa1V
         rieE5M17kxREEoizsFcf6HN1wpqeSXVHoBGEmhPqq6EngcsbL1Wt4d2YTL3PzqrNo1Mv
         ZicA==
X-Forwarded-Encrypted: i=1; AFNElJ8iCpi9uRDsfgcCBHvVDVxjzEx6S4FrooVZNRWI0wTLisy6Kt6VpxlXdajhWEyk4729HrVWzwKPE44=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLdeRofjh1dnkRJs68977P6Wl07TwdU1ZC1MEFO691h7MBzTCT
	Kyu/vZ5cetF4WM5L0BPiGsAGVj7yy2RFdfDafi+Sff2chHAD5ElzPp99p7ac4X5tmgJ9kqG38E1
	oxhoCH5P+JpxY7I7DeuydyyiOHMX7YEfFDAtXgSEI
X-Gm-Gg: Acq92OGZEMmgCXsW9JLhr5lZ9MMT/KYc5kkCnK5RQj1It2RCMlA+pbFuhGT24h/ckXz
	f2hNs/v1co39glKD3Sbr0o9eoaZtO2KOeYlmUb9gNPSaVdG/qJ0W4nieomp/lzysbjy9lFwEfp8
	no4ShJOXxmWBzdbVZB/I9e7DXSOJLJsH4Ezb7Bn/5134IOychtFeIGV8EgtmvQiSjWVhqkNSwtE
	mYgSjOdFSQqT45Hkjrr8lhBYaSuGiTb3MJ2Mc2692NV+T0HqxXB5KQwL4n3Xj1xEGzE9WJQ8Qnv
	bnoR5w==
X-Received: by 2002:a05:622a:2cb:b0:516:4f62:85ed with SMTP id
 d75a77b69052e-519c67370aemr3232591cf.18.1781735699254; Wed, 17 Jun 2026
 15:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com>
 <7d98db60ab0fddab230b1a7a32140f3361ab42cf.1781564384.git.abhishekbapat@google.com>
 <CAJuCfpFbCKc7FR3tbeCzexCzyfiP+Ab2fJ7Vd1Q76MKTvqC2XA@mail.gmail.com> <CAL41Mv7=B7H1C3j5_Pva-kYsJs_1NpCqVhN6wn-WhqvquV6=2w@mail.gmail.com>
In-Reply-To: <CAL41Mv7=B7H1C3j5_Pva-kYsJs_1NpCqVhN6wn-WhqvquV6=2w@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 17 Jun 2026 15:34:47 -0700
X-Gm-Features: AVVi8CcP352oaIub18lo0sw7Ja9sgom3LLOMahFEujS6dbTA61BAY_UC5ngYnGM
Message-ID: <CAJuCfpGOrtk+3hvUVE7-6wpnsa3Nbr6kGq5CfHVdCzX+DYyjFQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] alloc_tag: add size-based filtering to ioctl
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 1:55=E2=80=AFPM Abhishek Bapat <abhishekbapat@googl=
e.com> wrote:
>
> On Wed, Jun 17, 2026 at 9:29=E2=80=AFAM Suren Baghdasaryan <surenb@google=
.com> wrote:
> >
> > On Mon, Jun 15, 2026 at 4:04=E2=80=AFPM Abhishek Bapat <abhishekbapat@g=
oogle.com> wrote:
> > >
> > > Extend the allocinfo filtering mechanism to allow users to filter tag=
s
> > > based on the total number of bytes allocated [min_size, max_size]. Th=
e
> > > size range is inclusive.
> > >
> > > Filtering by size involves retrieving allocinfo per-CPU counters, whi=
ch
> > > is an expensive operation. Hence, the performance of size-based
> > > filtering will be worse than other filters.
> > >
> > > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > > Acked-by: Hao Ge <hao.ge@linux.dev>
> > > ---
> > >  include/uapi/linux/alloc_tag.h |  8 ++++-
> > >  lib/alloc_tag.c                | 63 ++++++++++++++++++++++++++++----=
--
> > >  2 files changed, 59 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/allo=
c_tag.h
> > > index 3b11877955b9..7f5acbb44c14 100644
> > > --- a/include/uapi/linux/alloc_tag.h
> > > +++ b/include/uapi/linux/alloc_tag.h
> > > @@ -45,13 +45,17 @@ enum {
> > >         ALLOCINFO_FILTER_FUNCTION,
> > >         ALLOCINFO_FILTER_FILENAME,
> > >         ALLOCINFO_FILTER_LINENO,
> > > -       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_LINENO
> > > +       ALLOCINFO_FILTER_MIN_SIZE,
> > > +       ALLOCINFO_FILTER_MAX_SIZE,
> > > +       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> > >  };
> > >
> > >  #define ALLOCINFO_FILTER_MASK_MODNAME          (1 << ALLOCINFO_FILTE=
R_MODNAME)
> > >  #define ALLOCINFO_FILTER_MASK_FUNCTION         (1 << ALLOCINFO_FILTE=
R_FUNCTION)
> > >  #define ALLOCINFO_FILTER_MASK_FILENAME         (1 << ALLOCINFO_FILTE=
R_FILENAME)
> > >  #define ALLOCINFO_FILTER_MASK_LINENO           (1 << ALLOCINFO_FILTE=
R_LINENO)
> > > +#define ALLOCINFO_FILTER_MASK_MIN_SIZE         (1 << ALLOCINFO_FILTE=
R_MIN_SIZE)
> > > +#define ALLOCINFO_FILTER_MASK_MAX_SIZE         (1 << ALLOCINFO_FILTE=
R_MAX_SIZE)
> > >
> > >  #define ALLOCINFO_FILTER_MASKS \
> > >         ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> > > @@ -59,6 +63,8 @@ enum {
> > >  struct allocinfo_filter {
> > >         __u64 mask; /* bitmask of the filter fields used */
> > >         struct allocinfo_tag fields;
> > > +       __u64 min_size;
> > > +       __u64 max_size;
> > >  };
> > >
> > >  struct allocinfo_get_at {
> > > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > > index 5feb61d9fb92..b3d21834b61e 100644
> > > --- a/lib/alloc_tag.c
> > > +++ b/lib/alloc_tag.c
> > > @@ -195,15 +195,26 @@ static int allocinfo_cmp_str(const char *str, c=
onst char *template)
> > >         return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SI=
ZE);
> > >  }
> > >
> > > +/* Fetch the per-CPU counters */
> > > +static inline struct alloc_tag_counters allocinfo_prefetch_counters(=
struct codetag *ct)
> > > +{
> > > +       return alloc_tag_read(ct_to_alloc_tag(ct));
> > > +}
> > > +
> > >  /*
> > >   * Populates the UAPI allocinfo_tag_data structure with active runti=
me
> > >   * profiling counters extracted from the given kernel codetag.
> > >   */
> > >  static void allocinfo_to_params(struct codetag *ct,
> > > -                               struct allocinfo_tag_data *data)
> > > +                               struct allocinfo_tag_data *data,
> > > +                               struct alloc_tag_counters *counters)
> > >  {
> > > -       struct alloc_tag *tag =3D ct_to_alloc_tag(ct);
> > > -       struct alloc_tag_counters counter =3D alloc_tag_read(tag);
> > > +       struct alloc_tag_counters local_counters;
> > > +
> > > +       if (!counters) {
> > > +               local_counters =3D allocinfo_prefetch_counters(ct);
> > > +               counters =3D &local_counters;
> > > +       }
> > >
> > >         if (ct->modname)
> > >                 allocinfo_copy_str(data->tag.modname, ct->modname);
> > > @@ -212,9 +223,9 @@ static void allocinfo_to_params(struct codetag *c=
t,
> > >         allocinfo_copy_str(data->tag.function, ct->function);
> > >         allocinfo_copy_str(data->tag.filename, ct->filename);
> > >         data->tag.lineno =3D ct->lineno;
> > > -       data->counter.bytes =3D counter.bytes;
> > > -       data->counter.calls =3D counter.calls;
> > > -       data->counter.accurate =3D !alloc_tag_is_inaccurate(tag);
> > > +       data->counter.bytes =3D counters->bytes;
> > > +       data->counter.calls =3D counters->calls;
> > > +       data->counter.accurate =3D !alloc_tag_is_inaccurate(ct_to_all=
oc_tag(ct));
> > >  }
> > >
> > >  /*
> > > @@ -238,7 +249,9 @@ static int allocinfo_ioctl_get_content_id(struct =
seq_file *m, void __user *arg)
> > >   * Verifies whether a given codetag satisfies the active filtering c=
riteria by
> > >   * matching its characteristics against the specified filter.
> > >   */
> > > -static bool matches_filter(struct codetag *ct, struct allocinfo_filt=
er *filter)
> > > +static bool matches_filter(struct codetag *ct, struct allocinfo_filt=
er *filter,
> > > +                          struct alloc_tag_counters *counters,
> > > +                          bool *fetched_counters)
> > >  {
> > >         if (!filter || !filter->mask)
> > >                 return true;
> > > @@ -265,6 +278,19 @@ static bool matches_filter(struct codetag *ct, s=
truct allocinfo_filter *filter)
> > >             ct->lineno !=3D filter->fields.lineno)
> > >                 return false;
> > >
> > > +       if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINF=
O_FILTER_MASK_MAX_SIZE)) {
> > > +               if (!*fetched_counters) {
> > > +                       *counters =3D allocinfo_prefetch_counters(ct)=
;
> > > +                       *fetched_counters =3D true;
> > > +               }
> > > +               if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &=
&
> > > +                   counters->bytes < filter->min_size)
> > > +                       return false;
> > > +               if ((filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &=
&
> > > +                   counters->bytes > filter->max_size)
> > > +                       return false;
> > > +       }
> > > +
> > >         return true;
> > >  }
> > >
> > > @@ -278,6 +304,8 @@ static int allocinfo_ioctl_get_at(struct seq_file=
 *m, void __user *arg)
> > >         struct codetag *ct;
> > >         struct allocinfo_get_at params =3D {0};
> > >         __u64 skip_count;
> > > +       struct alloc_tag_counters counters;
> > > +       bool fetched_counters;
> > >
> > >         if (copy_from_user(&params, arg, sizeof(params)))
> > >                 return -EFAULT;
> > > @@ -285,6 +313,11 @@ static int allocinfo_ioctl_get_at(struct seq_fil=
e *m, void __user *arg)
> > >         if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
> > >                 return -EINVAL;
> > >
> > > +       if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> > > +           (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> > > +           params.filter.min_size > params.filter.max_size)
> > > +               return -EINVAL;
> > > +
> > >         priv =3D m->private;
> > >
> > >         mutex_lock(&priv->ioctl_lock);
> > > @@ -308,7 +341,8 @@ static int allocinfo_ioctl_get_at(struct seq_file=
 *m, void __user *arg)
> > >         ct =3D codetag_next_ct(&priv->ioctl_iter);
> > >
> > >         while (ct) {
> > > -               if (matches_filter(ct, &priv->filter)) {
> > > +               fetched_counters =3D false;
> > > +               if (matches_filter(ct, &priv->filter, &counters, &fet=
ched_counters)) {
> >
> > Do we really need this "fetched_counters" parameter? Here are the
> > possible cases:
> > 1. If the filter does not include ALLOCINFO_FILTER_MASK_MIN_SIZE |
> > ALLOCINFO_FILTER_MASK_MAX_SIZE then counters would not be fetched.
> > 2. If the filter includes ALLOCINFO_FILTER_MASK_MIN_SIZE |
> > ALLOCINFO_FILTER_MASK_MAX_SIZE and
> > 2.1. matches_filter() returns true then we know counters were fetched
> > because they had to be validated.
> > 2.2. matches_filter() returns false then we don't care if the counters
> > were fetched. We do not report that tag anyway.
> >
> > So, instead of passing fetched_counters to matches_filter() we could do=
 this:
> >
> > bool filter_by_size =3D (params.filter.mask &
> > (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE)) !=3D
> > 0;
> > while (ct) {
> >            if (matches_filter(ct, &priv->filter, &counters)) {
> > ...
> > }
> > if (ct) {
> >            allocinfo_to_params(ct, &params.data, filter_by_size ?
> > &counters : NULL);
> > ...
> > }
> >
> > Wouldn't that work?
> >
>
> While we can deduce whether counters were fetched outside the
> matches_filter function, I think the current implementation is more
> intuitive from a readability perspective. I believe it  should be kept
> as is for that reason. If we extract the logic, we'll first have to
> replicate the boolean logic at two places. Second, we'd need to add a
> comment explaining the boolean calculation, and the reader might have
> a higher cognitive load trying to determine which function populates
> the counters. The current implementation makes it easy for the reader
> to deduce the original intention. Let me know what you think.

Ok, I guess you have a point.

I was also thinking why we are passing NULL to allocinfo_to_params()
to fetch the counters into a local variable? Why can't we simply call
allocinfo_prefetch_counters() before calling allocinfo_to_params()
when fetched_counters=3D=3Dfalse? Basically:

if (!fetched_counters)
    counters =3D allocinfo_prefetch_counters(ct);
allocinfo_to_params(ct, &params.data, &counters);

This would simplify allocinfo_to_params() because counter will never
be NULL and it would not need local counters.

>
> > >                         if (skip_count =3D=3D 0)
> > >                                 break;
> > >                         skip_count--;
> > > @@ -317,7 +351,7 @@ static int allocinfo_ioctl_get_at(struct seq_file=
 *m, void __user *arg)
> > >         }
> > >
> > >         if (ct) {
> > > -               allocinfo_to_params(ct, &params.data);
> > > +               allocinfo_to_params(ct, &params.data, fetched_counter=
s ? &counters : NULL);
> > >                 priv->positioned =3D true;
> > >         }
> > >
> > > @@ -343,6 +377,8 @@ static int allocinfo_ioctl_get_next(struct seq_fi=
le *m, void __user *arg)
> > >         struct codetag *ct;
> > >         struct allocinfo_tag_data params;
> > >         int ret =3D 0;
> > > +       struct alloc_tag_counters counters;
> > > +       bool fetched_counters;
> > >
> > >         memset(&params, 0, sizeof(params));
> > >         priv =3D m->private;
> > > @@ -356,10 +392,15 @@ static int allocinfo_ioctl_get_next(struct seq_=
file *m, void __user *arg)
> > >         }
> > >
> > >         ct =3D codetag_next_ct(&priv->ioctl_iter);
> > > -       while (ct && !matches_filter(ct, &priv->filter))
> > > +       while (ct) {
> > > +               fetched_counters =3D false;
> > > +               if (matches_filter(ct, &priv->filter, &counters, &fet=
ched_counters))
> > > +                       break;
> > >                 ct =3D codetag_next_ct(&priv->ioctl_iter);
> > > +       }
> > > +
> > >         if (ct)
> > > -               allocinfo_to_params(ct, &params);
> > > +               allocinfo_to_params(ct, &params, fetched_counters ? &=
counters : NULL);
> > >
> > >         if (!ct) {
> > >                 priv->positioned =3D false;
> > > --
> > > 2.54.0.1136.gdb2ca164c4-goog
> > >
