Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502CE38E8B6
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 22:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781736074; cv=pass; b=hcHwj444EFaQpiG2oDNYui8Svta1Ae6AbbTRfrFd0y65s8DkOBTcLHY07lmNwJ+TAzKLyjwRx8m2aFVS209goqQEpaa8kgwEBZs8MIya3nVpxyMjJeoLYFFZFLDqoJgHB/tJVJTNdkXcY0P+LkmilWHi0INLZrvAoIoTvRvEUm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781736074; c=relaxed/simple;
	bh=Y6mmpkSIfOlHmDcrqGqkk9+BoYIda+JiYvrEVSI88Bc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z2djNveHM88gUt2obN2Ay3qxiU5rmC0CAgMBIhLHnoFXjrKsWxTjJ5U7yn9xS88TLFznlCv2snPGVexorTHb7rHQclnwhS3qn+tYbY1PhMUODsifHM1BVWv6s8OvQxui0P0qX+ZJlOYHI5X8k2EdbjoSwfRiwnLRCyWbHDy+p/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lhivtsIK; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lhivtsIK"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c6d3851e0aso9905ad.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 15:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781736072; cv=none;
        d=google.com; s=arc-20260327;
        b=Iwliq1SdQkE3gSfnjm+CpSn3cI0KHTU8bZ5Bvbc0cTn1vPU18/Dz/oHDmZSlzPUUpu
         wWiBrkeDO0XXujka1kVHStO2+aWMzvomyy5jfmY3mcnkciebx2Mk/59kZhYK1Xdt2nTK
         fPIkpWONaP9jMvOvlzkdln5GWpBAR60g8dPjbqVbxyKoBN95o/iLXYutEMNQFJQ6MGbX
         poOHC4MWOIx109MvWUJf+WUYfYDwSQPZSvFii2vhLIY/hRHata8SJw3qZ92SYnc/hRKq
         uiCTAVHnHTlOymxT9DXertuM6cCpmHosgg5s51/9iTsj9lvJ8s3Py1S82GfAqO3FniZm
         oQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gH4dbwYpQtVmkxDqEyULaiA0pAkeR8kFfXWefeo0Joc=;
        fh=ywDRqzHs8N+s8YTgPLyzsbEoofeotGmWE4QLpbHFtNw=;
        b=cqeSGdhphQwgZQkHH/DjLrMTPbD5h/KBXKXWt5cHmSNVVrY9ZSVhvfESEhMKihRo2T
         z9aiTDdV50yEuzZIPB9abp2aw4mm1WjTBQk27qmIM4rdD8PUpGJ0PBAnBlzOFi2yH+SX
         PE11sNRrnqF4V9kBFYnTm/AvvYUeg1f2vbv2bT24ldKCLHygIdmBaEzhfD4OrsoH6nNf
         0JKD8zA85iHQM5KwAoSf4b3IbYA6Zlt1eZ2XR8v6vMLFKR0xCUa1fTcwXRMcaFIeDYZO
         394hOj6QPmC64BguNNk34F8tgXVL/uZPE4BhKgrzIZtpGOJDiBXz2S4ihJqi3UXg/trM
         UJfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781736072; x=1782340872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gH4dbwYpQtVmkxDqEyULaiA0pAkeR8kFfXWefeo0Joc=;
        b=lhivtsIKkx4O5MzcBBvIfElwPuR3s8aVNCFa2Vq8B3/s59Tgp2MrqHhVh/MUVLQv01
         gd0oEn1Oaih7llvF6po0b6VZHL1Js89N2DwK7ZIEu7FX/YETBrLZmSGU3X3SFgje774+
         1I84F6SmHjjitqgppgBK8bL75MUcaY6n3FarT4dri+JtpSBFVqasFPt5QNpR56xlKH/o
         InUYp7eLc/iPp4FMFnkHJ/i/x8WWmBHQIAaoGX39zRlmn+fimQMJSUtvw4oxJKjZsswn
         xeBknZxV8uOV0DiPHpAss7EW5/WEvZgP5OCmtmmebW4pVoTtHYlxklKgAmMCUbhiggOg
         egxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781736072; x=1782340872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gH4dbwYpQtVmkxDqEyULaiA0pAkeR8kFfXWefeo0Joc=;
        b=KIOJSd2kiXD6uNMTrinQuswows/J0xdUSfmsSFYGP248JW0/1+sZzTzNALg+yC6MXj
         zGIybDwrlB/1FyKcWZyWUCHFpfSK1FLUSxeOj+HaTYkCRRTZlvQUl8wcLjXd96NlT++W
         zxNFe8wkPnaZfk9DyzwxWrNhSF4VOxY+wU1/B+7ggGVx3QUROSaKe3ck4c6uEHrfWDd9
         LUv0cHz9s0wTXUeGXxfxeZQ4QYOpQJKWfLTM59Hp2OSxm3hi+6b6kdF0hQsB1AlDmhP/
         ys+JHYfRjOaA3VwMpKu/uH1Lzf1FBTOCNCC/PKJEoTMLbl6dDtlSynjIM7INsHFIal0l
         zVmA==
X-Forwarded-Encrypted: i=1; AFNElJ/pFJyQSuirkh7GPqUqTtYE+IcPvIq9ozKtoSqKeMXWV8vRyQ68AXMYYbivegm1ExggTo5oeIn6xec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWFe4Tt6XR+QS6eprgYJkHKcj2vbwuKyrQjAB4GvCmR8jQVX1v
	H7Qx1VIdjTn3DQ+Pm6V/RXVFJbosRjDsQw0oqejBCQJjOKH49+wB9HdtRCQ8+snqf2rcGbANR8K
	x2wDfYcq7k1iTm1JcJDY/ayOQ9/kJ8Ncuk25xnmN6
X-Gm-Gg: AfdE7cn1dvY3lZFvf27O6zkqbb58DoYhOayovZ6bkbM6uRc/slU7HIOHbYqz0Suwg/4
	NmaGLYjIstC7KVrChHCfK8K6yMWYrySjbOzDh3Ib85xezGKqw9hlEpwHWNpbuxV1D5gD1un/IVp
	bBe+VcmNwkG16S3Vi6Y5RzRYKZWDPavqdamgs1o3WDK9KiP+yi/y1S8uWfMP5MCJKiP+HDk5rhK
	Wsn2jmDOCOMk4fWYrv/i88nHci5cGL+r2oqD1Vr62y+IKBAo7+UWxUVSK88N9X6XeGAiLAEDaMn
	PZ/DihjfGcoigSJMhmT5rhs7LoM=
X-Received: by 2002:a17:902:da8b:b0:2bd:7bec:f0e6 with SMTP id
 d9443c01a7336-2c6e85ea5b1mr478005ad.1.1781736071082; Wed, 17 Jun 2026
 15:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com>
 <7d98db60ab0fddab230b1a7a32140f3361ab42cf.1781564384.git.abhishekbapat@google.com>
 <CAJuCfpFbCKc7FR3tbeCzexCzyfiP+Ab2fJ7Vd1Q76MKTvqC2XA@mail.gmail.com>
 <CAL41Mv7=B7H1C3j5_Pva-kYsJs_1NpCqVhN6wn-WhqvquV6=2w@mail.gmail.com> <CAJuCfpGOrtk+3hvUVE7-6wpnsa3Nbr6kGq5CfHVdCzX+DYyjFQ@mail.gmail.com>
In-Reply-To: <CAJuCfpGOrtk+3hvUVE7-6wpnsa3Nbr6kGq5CfHVdCzX+DYyjFQ@mail.gmail.com>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Wed, 17 Jun 2026 15:40:59 -0700
X-Gm-Features: AVVi8Cc05jQrK4Vkogw4VRzZQLXEYGsCqHDLSwcfG_aywCHd2_HMuPrbZCdRc9E
Message-ID: <CAL41Mv6FZU5As+yKiM52axUMsR_FDrYQCK5STjUp-aG+xMD-EQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] alloc_tag: add size-based filtering to ioctl
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 3:35=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Wed, Jun 17, 2026 at 1:55=E2=80=AFPM Abhishek Bapat <abhishekbapat@goo=
gle.com> wrote:
> >
> > On Wed, Jun 17, 2026 at 9:29=E2=80=AFAM Suren Baghdasaryan <surenb@goog=
le.com> wrote:
> > >
> > > On Mon, Jun 15, 2026 at 4:04=E2=80=AFPM Abhishek Bapat <abhishekbapat=
@google.com> wrote:
> > > >
> > > > Extend the allocinfo filtering mechanism to allow users to filter t=
ags
> > > > based on the total number of bytes allocated [min_size, max_size]. =
The
> > > > size range is inclusive.
> > > >
> > > > Filtering by size involves retrieving allocinfo per-CPU counters, w=
hich
> > > > is an expensive operation. Hence, the performance of size-based
> > > > filtering will be worse than other filters.
> > > >
> > > > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > > > Acked-by: Hao Ge <hao.ge@linux.dev>
> > > > ---
> > > >  include/uapi/linux/alloc_tag.h |  8 ++++-
> > > >  lib/alloc_tag.c                | 63 ++++++++++++++++++++++++++++--=
----
> > > >  2 files changed, 59 insertions(+), 12 deletions(-)
> > > >
> > > > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/al=
loc_tag.h
> > > > index 3b11877955b9..7f5acbb44c14 100644
> > > > --- a/include/uapi/linux/alloc_tag.h
> > > > +++ b/include/uapi/linux/alloc_tag.h
> > > > @@ -45,13 +45,17 @@ enum {
> > > >         ALLOCINFO_FILTER_FUNCTION,
> > > >         ALLOCINFO_FILTER_FILENAME,
> > > >         ALLOCINFO_FILTER_LINENO,
> > > > -       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_LINENO
> > > > +       ALLOCINFO_FILTER_MIN_SIZE,
> > > > +       ALLOCINFO_FILTER_MAX_SIZE,
> > > > +       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> > > >  };
> > > >
> > > >  #define ALLOCINFO_FILTER_MASK_MODNAME          (1 << ALLOCINFO_FIL=
TER_MODNAME)
> > > >  #define ALLOCINFO_FILTER_MASK_FUNCTION         (1 << ALLOCINFO_FIL=
TER_FUNCTION)
> > > >  #define ALLOCINFO_FILTER_MASK_FILENAME         (1 << ALLOCINFO_FIL=
TER_FILENAME)
> > > >  #define ALLOCINFO_FILTER_MASK_LINENO           (1 << ALLOCINFO_FIL=
TER_LINENO)
> > > > +#define ALLOCINFO_FILTER_MASK_MIN_SIZE         (1 << ALLOCINFO_FIL=
TER_MIN_SIZE)
> > > > +#define ALLOCINFO_FILTER_MASK_MAX_SIZE         (1 << ALLOCINFO_FIL=
TER_MAX_SIZE)
> > > >
> > > >  #define ALLOCINFO_FILTER_MASKS \
> > > >         ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> > > > @@ -59,6 +63,8 @@ enum {
> > > >  struct allocinfo_filter {
> > > >         __u64 mask; /* bitmask of the filter fields used */
> > > >         struct allocinfo_tag fields;
> > > > +       __u64 min_size;
> > > > +       __u64 max_size;
> > > >  };
> > > >
> > > >  struct allocinfo_get_at {
> > > > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > > > index 5feb61d9fb92..b3d21834b61e 100644
> > > > --- a/lib/alloc_tag.c
> > > > +++ b/lib/alloc_tag.c
> > > > @@ -195,15 +195,26 @@ static int allocinfo_cmp_str(const char *str,=
 const char *template)
> > > >         return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_=
SIZE);
> > > >  }
> > > >
> > > > +/* Fetch the per-CPU counters */
> > > > +static inline struct alloc_tag_counters allocinfo_prefetch_counter=
s(struct codetag *ct)
> > > > +{
> > > > +       return alloc_tag_read(ct_to_alloc_tag(ct));
> > > > +}
> > > > +
> > > >  /*
> > > >   * Populates the UAPI allocinfo_tag_data structure with active run=
time
> > > >   * profiling counters extracted from the given kernel codetag.
> > > >   */
> > > >  static void allocinfo_to_params(struct codetag *ct,
> > > > -                               struct allocinfo_tag_data *data)
> > > > +                               struct allocinfo_tag_data *data,
> > > > +                               struct alloc_tag_counters *counters=
)
> > > >  {
> > > > -       struct alloc_tag *tag =3D ct_to_alloc_tag(ct);
> > > > -       struct alloc_tag_counters counter =3D alloc_tag_read(tag);
> > > > +       struct alloc_tag_counters local_counters;
> > > > +
> > > > +       if (!counters) {
> > > > +               local_counters =3D allocinfo_prefetch_counters(ct);
> > > > +               counters =3D &local_counters;
> > > > +       }
> > > >
> > > >         if (ct->modname)
> > > >                 allocinfo_copy_str(data->tag.modname, ct->modname);
> > > > @@ -212,9 +223,9 @@ static void allocinfo_to_params(struct codetag =
*ct,
> > > >         allocinfo_copy_str(data->tag.function, ct->function);
> > > >         allocinfo_copy_str(data->tag.filename, ct->filename);
> > > >         data->tag.lineno =3D ct->lineno;
> > > > -       data->counter.bytes =3D counter.bytes;
> > > > -       data->counter.calls =3D counter.calls;
> > > > -       data->counter.accurate =3D !alloc_tag_is_inaccurate(tag);
> > > > +       data->counter.bytes =3D counters->bytes;
> > > > +       data->counter.calls =3D counters->calls;
> > > > +       data->counter.accurate =3D !alloc_tag_is_inaccurate(ct_to_a=
lloc_tag(ct));
> > > >  }
> > > >
> > > >  /*
> > > > @@ -238,7 +249,9 @@ static int allocinfo_ioctl_get_content_id(struc=
t seq_file *m, void __user *arg)
> > > >   * Verifies whether a given codetag satisfies the active filtering=
 criteria by
> > > >   * matching its characteristics against the specified filter.
> > > >   */
> > > > -static bool matches_filter(struct codetag *ct, struct allocinfo_fi=
lter *filter)
> > > > +static bool matches_filter(struct codetag *ct, struct allocinfo_fi=
lter *filter,
> > > > +                          struct alloc_tag_counters *counters,
> > > > +                          bool *fetched_counters)
> > > >  {
> > > >         if (!filter || !filter->mask)
> > > >                 return true;
> > > > @@ -265,6 +278,19 @@ static bool matches_filter(struct codetag *ct,=
 struct allocinfo_filter *filter)
> > > >             ct->lineno !=3D filter->fields.lineno)
> > > >                 return false;
> > > >
> > > > +       if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCI=
NFO_FILTER_MASK_MAX_SIZE)) {
> > > > +               if (!*fetched_counters) {
> > > > +                       *counters =3D allocinfo_prefetch_counters(c=
t);
> > > > +                       *fetched_counters =3D true;
> > > > +               }
> > > > +               if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE)=
 &&
> > > > +                   counters->bytes < filter->min_size)
> > > > +                       return false;
> > > > +               if ((filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE)=
 &&
> > > > +                   counters->bytes > filter->max_size)
> > > > +                       return false;
> > > > +       }
> > > > +
> > > >         return true;
> > > >  }
> > > >
> > > > @@ -278,6 +304,8 @@ static int allocinfo_ioctl_get_at(struct seq_fi=
le *m, void __user *arg)
> > > >         struct codetag *ct;
> > > >         struct allocinfo_get_at params =3D {0};
> > > >         __u64 skip_count;
> > > > +       struct alloc_tag_counters counters;
> > > > +       bool fetched_counters;
> > > >
> > > >         if (copy_from_user(&params, arg, sizeof(params)))
> > > >                 return -EFAULT;
> > > > @@ -285,6 +313,11 @@ static int allocinfo_ioctl_get_at(struct seq_f=
ile *m, void __user *arg)
> > > >         if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
> > > >                 return -EINVAL;
> > > >
> > > > +       if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &=
&
> > > > +           (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &=
&
> > > > +           params.filter.min_size > params.filter.max_size)
> > > > +               return -EINVAL;
> > > > +
> > > >         priv =3D m->private;
> > > >
> > > >         mutex_lock(&priv->ioctl_lock);
> > > > @@ -308,7 +341,8 @@ static int allocinfo_ioctl_get_at(struct seq_fi=
le *m, void __user *arg)
> > > >         ct =3D codetag_next_ct(&priv->ioctl_iter);
> > > >
> > > >         while (ct) {
> > > > -               if (matches_filter(ct, &priv->filter)) {
> > > > +               fetched_counters =3D false;
> > > > +               if (matches_filter(ct, &priv->filter, &counters, &f=
etched_counters)) {
> > >
> > > Do we really need this "fetched_counters" parameter? Here are the
> > > possible cases:
> > > 1. If the filter does not include ALLOCINFO_FILTER_MASK_MIN_SIZE |
> > > ALLOCINFO_FILTER_MASK_MAX_SIZE then counters would not be fetched.
> > > 2. If the filter includes ALLOCINFO_FILTER_MASK_MIN_SIZE |
> > > ALLOCINFO_FILTER_MASK_MAX_SIZE and
> > > 2.1. matches_filter() returns true then we know counters were fetched
> > > because they had to be validated.
> > > 2.2. matches_filter() returns false then we don't care if the counter=
s
> > > were fetched. We do not report that tag anyway.
> > >
> > > So, instead of passing fetched_counters to matches_filter() we could =
do this:
> > >
> > > bool filter_by_size =3D (params.filter.mask &
> > > (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE)) !=
=3D
> > > 0;
> > > while (ct) {
> > >            if (matches_filter(ct, &priv->filter, &counters)) {
> > > ...
> > > }
> > > if (ct) {
> > >            allocinfo_to_params(ct, &params.data, filter_by_size ?
> > > &counters : NULL);
> > > ...
> > > }
> > >
> > > Wouldn't that work?
> > >
> >
> > While we can deduce whether counters were fetched outside the
> > matches_filter function, I think the current implementation is more
> > intuitive from a readability perspective. I believe it  should be kept
> > as is for that reason. If we extract the logic, we'll first have to
> > replicate the boolean logic at two places. Second, we'd need to add a
> > comment explaining the boolean calculation, and the reader might have
> > a higher cognitive load trying to determine which function populates
> > the counters. The current implementation makes it easy for the reader
> > to deduce the original intention. Let me know what you think.
>
> Ok, I guess you have a point.
>
> I was also thinking why we are passing NULL to allocinfo_to_params()
> to fetch the counters into a local variable? Why can't we simply call
> allocinfo_prefetch_counters() before calling allocinfo_to_params()
> when fetched_counters=3D=3Dfalse? Basically:
>
> if (!fetched_counters)
>     counters =3D allocinfo_prefetch_counters(ct);
> allocinfo_to_params(ct, &params.data, &counters);
>
> This would simplify allocinfo_to_params() because counter will never
> be NULL and it would not need local counters.
>

The only reason I did it that way was to avoid repeating the code at
two places i.e. allocinfo_ioctl_get_at and allocinfo_ioctl_get_next.
Either way, the per-CPU counters are assimilated only once. I can
include this change if you still want me to, but personally I like the
way it currently is implemented.

> >
> > > >                         if (skip_count =3D=3D 0)
> > > >                                 break;
> > > >                         skip_count--;
> > > > @@ -317,7 +351,7 @@ static int allocinfo_ioctl_get_at(struct seq_fi=
le *m, void __user *arg)
> > > >         }
> > > >
> > > >         if (ct) {
> > > > -               allocinfo_to_params(ct, &params.data);
> > > > +               allocinfo_to_params(ct, &params.data, fetched_count=
ers ? &counters : NULL);
> > > >                 priv->positioned =3D true;
> > > >         }
> > > >
> > > > @@ -343,6 +377,8 @@ static int allocinfo_ioctl_get_next(struct seq_=
file *m, void __user *arg)
> > > >         struct codetag *ct;
> > > >         struct allocinfo_tag_data params;
> > > >         int ret =3D 0;
> > > > +       struct alloc_tag_counters counters;
> > > > +       bool fetched_counters;
> > > >
> > > >         memset(&params, 0, sizeof(params));
> > > >         priv =3D m->private;
> > > > @@ -356,10 +392,15 @@ static int allocinfo_ioctl_get_next(struct se=
q_file *m, void __user *arg)
> > > >         }
> > > >
> > > >         ct =3D codetag_next_ct(&priv->ioctl_iter);
> > > > -       while (ct && !matches_filter(ct, &priv->filter))
> > > > +       while (ct) {
> > > > +               fetched_counters =3D false;
> > > > +               if (matches_filter(ct, &priv->filter, &counters, &f=
etched_counters))
> > > > +                       break;
> > > >                 ct =3D codetag_next_ct(&priv->ioctl_iter);
> > > > +       }
> > > > +
> > > >         if (ct)
> > > > -               allocinfo_to_params(ct, &params);
> > > > +               allocinfo_to_params(ct, &params, fetched_counters ?=
 &counters : NULL);
> > > >
> > > >         if (!ct) {
> > > >                 priv->positioned =3D false;
> > > > --
> > > > 2.54.0.1136.gdb2ca164c4-goog
> > > >
