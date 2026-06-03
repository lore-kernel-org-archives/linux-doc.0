Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636833FF8AA
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 20:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519265; cv=pass; b=OY1F4BR82juRLvQG6sQ8IfoGMWwt+2O6epI3MEOx5gV6TEeyBbGs2XOAKtpNf1XUkmgu9lBMZYtbaeMeJnQLll7xtWUIfHKQdttKIlpuTViJY81rXOPAPTyhOwTJkEkgJEBNkh2dmdlMralP6t3nQ2sdiG//7um1pFLrKg6txdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519265; c=relaxed/simple;
	bh=9Wef481k4JxMxPXEKVTJmSI4Qt5EsqeiqFJkCwzqKfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gu0xNidfUbGTmW1mHOkxbRLJfSCgHpclvjQJLjCr/BmZP/45tsSeE2YVDGN2BptKsuQzBzM+tbucpTty+VhRiB7ZKQmjVlBaKYJP7ZrKDcnGlWjWec/G+VbSleVzbxqskbtiHBbpLwKTOBIbIQQw6fqgNHTRvg/Dv655+szLuAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jpiriJQT; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jpiriJQT"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5175d339e8bso153231cf.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 13:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780519262; cv=none;
        d=google.com; s=arc-20240605;
        b=NuZW7Smk8e9O99ewj+mFzEw6LZpwGik4LRAhM9RILW+uyozL2vYDpKnVyo0ElDnd/H
         xSFZnuhs6Z7ObhqRfjrMgjRLp/muFaK65PN/Za5+5eq9OrmjIH64f+7woy8QZOABOWJW
         +mbH3YIuTNhO643QUipFI8UKjdUYpRdC54s/y6H1nBYK6YJTnZNpEBxuHrDRMO9DjY2h
         EXkQJbv3vepQNrnwKI8hAv8qZXR7IeX8khyKQ1i0H1nzKHe5u0e1Em/a4RYCmAKYXG44
         efOBLth1sbV1aqJSx5lInm8snh+9ADxmJwpWubDAwNHa6rkho2rJXWtvudOgAp74F65x
         lZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kgy0q+soH6ra9WOGTCpqCZxx4OBCCpEK1MDQ6EDcR7I=;
        fh=cE+gJ6Y6coVFO7kVWPYTWRnzv877lo9nBUzkTFSc95M=;
        b=R/v3USQ016y64JQ1K/yLkkPuT4WI5ADUOKeTYJ1sL4GMdBgsGF3YJVhr6nWjjVefFH
         suXtuCe2nYpN45ybwZLsCDcQb3YOFZE3TGfyda8YUgltXnAEzlJv1PqQkh8f0fIVu8Xo
         mFDNFm++c26hsa0KeHqcLOV+tZcej4UQbPALr0+rx2uXyCppgpcBilttYNxVLprmEsIV
         igqvMQFOL0MyEgkwk9lXa1Mnzxjaon6MSy2UvAZIdTcYEjXrsHoeFpdrNSAiJ/NP2oJF
         lLIcmeQmh7HJYB1TQeH63131gqyQRXm25xQsqYe51PgUC/hBiu+UwKYDCQ8E8F0/z9Yc
         gIpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780519262; x=1781124062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgy0q+soH6ra9WOGTCpqCZxx4OBCCpEK1MDQ6EDcR7I=;
        b=jpiriJQTIeV7J6TxSf9NfCdeN3OLSXp5osq+EmJ74xHWEWWUgaeiZQHOFh4SnYt20C
         lW9B9JvZviXRp7tjoVzG/IDFHnwUHLMziF06Ksn5OMn3ebo2BI9TqaBDuapI5qcijqFS
         lptPIH52rkmZEwugxVCpWDeUWXQG1WER5Ivopp0kQmfKqOCdPgNm6x+31AOfCaurhN7c
         cwW17wl8sL9ZTQ9X/UX0g23y2Al8L1R3lJa7VfdSEP+ZAJW0KSwCG0Zzw5i2hgcp3q9N
         hCF69ArRF0B40gwBmdIg/A1Cvk7Sf9MU+Gx+5C+BYko4xAiZ3MSDVU9CgBW0fS01QepH
         MG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519262; x=1781124062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgy0q+soH6ra9WOGTCpqCZxx4OBCCpEK1MDQ6EDcR7I=;
        b=rLf2PDmxwwL0tYfEXhOdRg/m/4uydk3dSkGVp+j4fcB0jn4fzw8ibyydI5SfjghFAo
         4IKE0I6xdDh9FessQ/qSPj3evgyZzuFo/59IqnhJFJCdnlsHnIXhrX7ORkBFsFC8w+IS
         CQnGpDbAdoH0l9IcMh6HOsc3T4bJVZldtbRTR4wFraPdO9oMtJrOlPMx2i8aNbNyV9sN
         CL/JqMloGZMCO7Bggp3fUHw2s59XDvzw4FA0SCTntNr8PkbQsaRA0DaJe+Nrj8lrJpcl
         IQiVDD5Q5236cpvr/uOu22Pp+agDwxhUY3lvo/0R+kaLP1s+lTGuwvEhP8UvDVzeFl9w
         G0hA==
X-Forwarded-Encrypted: i=1; AFNElJ9e4i0B/6V4CK/yq48Ihg5RKnCQSwwsAMFoZhp3OxJrs+06s7twix7j9BuJZIpVlGOsAykgCbA9Izc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9b2tBjidwcBJ/33XG65UQM7glEd4Gviw8h7u4HEjUmEU0H7Ee
	eaXIW114ti2iyIUO4pXAOhRd9jbYC2cZ8bNYTKwa7mBnmChlD5xo/4xKWU3jjc3ZZhbe05T8nW2
	ayHUq7Zwb6LXX8rv0hfCEfwtLEE8uyCebb1L/1l/Z
X-Gm-Gg: Acq92OFRsw3tvXSOYvF7JeExHuI8ZN5S1hLgGrE7KNthmTf7dDRPC9yVKfSjZpguoQc
	vOB53j8ixggrZHOpeqELAzaXyeY59arvJk8MpONS+RHCEYMfPabOoUaNcgB92MVse0EbtJ1ZnxV
	WogBsKD7q8zbRBe7hP8HhF8hTN0MamVtlBCv/E9yMKSm9oWSGaN7QTYH3aud4ivPSigxXe3i2IN
	7JxSuYMiIDzN4u01M+jC1mK6IFJYVJPkr3nBSZD6FmgxKLUweVUhhgsnlnSq1GzhxinMGJNC+Ne
	NBOfBByf2cj0OnwpssC+YDqCAZgpaMCA3Stk7sbNgdZp/ZHb
X-Received: by 2002:a05:622a:42:b0:50f:ce97:3b84 with SMTP id
 d75a77b69052e-51787999ce5mr2671201cf.6.1780519261443; Wed, 03 Jun 2026
 13:41:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779471082.git.abhishekbapat@google.com>
 <c4b425d1f9192caca3cad830f322aa048ed26d45.1779471082.git.abhishekbapat@google.com>
 <de0f2984-44ea-4098-9d19-c63ee035cdaf@linux.dev>
In-Reply-To: <de0f2984-44ea-4098-9d19-c63ee035cdaf@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 3 Jun 2026 13:40:49 -0700
X-Gm-Features: AVHnY4JBte4PDDimU7o18M62S6t5FNbXE805byzWiOJZ2j9yZL0qusMtWj91VMs
Message-ID: <CAJuCfpFb1qEMN9t34un5BAPyFd4m9o7NY8w5DwQnzYrNqpK_Eg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] alloc_tag: add size-based filtering to ioctl
To: Hao Ge <hao.ge@linux.dev>
Cc: Abhishek Bapat <abhishekbapat@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 8:12=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Abhishek
>
>
> On 2026/5/23 01:45, Abhishek Bapat wrote:
> > Extend the allocinfo filtering mechanism to allow users to filter tags
> > based on the total number of bytes allocated [min_size, max_size]. The
> > size range is inclusive.
> >
> > Filtering by size involves retrieving allocinfo per-CPU counters, which
> > is an expensive operation. Hence, the performance of size-based
> > filtering will be worse than other filters.
> >
> > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > ---
> >   include/uapi/linux/alloc_tag.h |  8 +++-
> >   lib/alloc_tag.c                | 72 ++++++++++++++++++++++++++++-----=
-
> >   2 files changed, 68 insertions(+), 12 deletions(-)
> >
> > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_=
tag.h
> > index 0cc9db5298c6..45f158bee0a6 100644
> > --- a/include/uapi/linux/alloc_tag.h
> > +++ b/include/uapi/linux/alloc_tag.h
> > @@ -39,13 +39,17 @@ enum {
> >       ALLOCINFO_FILTER_FUNCTION,
> >       ALLOCINFO_FILTER_FILENAME,
> >       ALLOCINFO_FILTER_LINENO,
> > -     __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_LINENO
> > +     ALLOCINFO_FILTER_MIN_SIZE,
> > +     ALLOCINFO_FILTER_MAX_SIZE,
> > +     __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> >   };
> >
> >   #define ALLOCINFO_FILTER_MASK_MODNAME               (1 << ALLOCINFO_F=
ILTER_MODNAME)
> >   #define ALLOCINFO_FILTER_MASK_FUNCTION              (1 << ALLOCINFO_F=
ILTER_FUNCTION)
> >   #define ALLOCINFO_FILTER_MASK_FILENAME              (1 << ALLOCINFO_F=
ILTER_FILENAME)
> >   #define ALLOCINFO_FILTER_MASK_LINENO                (1 << ALLOCINFO_F=
ILTER_LINENO)
> > +#define ALLOCINFO_FILTER_MASK_MIN_SIZE               (1 << ALLOCINFO_F=
ILTER_MIN_SIZE)
> > +#define ALLOCINFO_FILTER_MASK_MAX_SIZE               (1 << ALLOCINFO_F=
ILTER_MAX_SIZE)
> >
> >   #define ALLOCINFO_FILTER_MASKS \
> >       ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> > @@ -53,6 +57,8 @@ enum {
> >   struct allocinfo_filter {
> >       __u64 mask; /* bitmask of the filter fields used */
> >       struct allocinfo_tag fields;
> > +     __u64 min_size;
> > +     __u64 max_size;
> >   };
> >
> >   struct allocinfo_get_at {
> > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > index 56c394ef721f..6c8743eead2d 100644
> > --- a/lib/alloc_tag.c
> > +++ b/lib/alloc_tag.c
> > @@ -173,11 +173,21 @@ static int allocinfo_cmp_str(const char *str, con=
st char *template)
> >       return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SIZE);
> >   }
> >
> > +static inline struct alloc_tag_counters allocinfo_prefetch_counters(st=
ruct codetag *ct)
> > +{
> > +     return alloc_tag_read(ct_to_alloc_tag(ct));
> > +}
> > +
> >   static void allocinfo_to_params(struct codetag *ct,
> > -                             struct allocinfo_tag_data *data)
> > +                             struct allocinfo_tag_data *data,
> > +                             struct alloc_tag_counters *counters)
> >   {
> > -     struct alloc_tag *tag =3D ct_to_alloc_tag(ct);
> > -     struct alloc_tag_counters counter =3D alloc_tag_read(tag);
> > +     struct alloc_tag_counters local_counters;
> > +
> > +     if (!counters) {
> > +             local_counters =3D allocinfo_prefetch_counters(ct);
> > +             counters =3D &local_counters;
> > +     }
> >
> >       if (ct->modname)
> >               allocinfo_copy_str(data->tag.modname, ct->modname);
> > @@ -186,9 +196,9 @@ static void allocinfo_to_params(struct codetag *ct,
> >       allocinfo_copy_str(data->tag.function, ct->function);
> >       allocinfo_copy_str(data->tag.filename, ct->filename);
> >       data->tag.lineno =3D ct->lineno;
> > -     data->counter.bytes =3D counter.bytes;
> > -     data->counter.calls =3D counter.calls;
> > -     data->counter.accurate =3D !alloc_tag_is_inaccurate(tag);
> > +     data->counter.bytes =3D counters->bytes;
> > +     data->counter.calls =3D counters->calls;
> > +     data->counter.accurate =3D !alloc_tag_is_inaccurate(ct_to_alloc_t=
ag(ct));
> >   }
> >
> >   static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __=
user *arg)
> > @@ -204,7 +214,8 @@ static int allocinfo_ioctl_get_content_id(struct se=
q_file *m, void __user *arg)
> >       return 0;
> >   }
> >
> > -static bool matches_filter(struct codetag *ct, struct allocinfo_filter=
 *filter)
> > +static bool matches_filter(struct codetag *ct, struct allocinfo_filter=
 *filter,
> > +                        struct alloc_tag_counters *counters)
> >   {
> >       if (!filter || !filter->mask)
> >               return true;
> > @@ -228,6 +239,17 @@ static bool matches_filter(struct codetag *ct, str=
uct allocinfo_filter *filter)
> >           ct->lineno !=3D filter->fields.lineno)
> >               return false;
> >
> > +     if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) ||
> > +         (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
> > +             /* We assume counters is not NULL here as per caller logi=
c */
> > +             if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> > +                 counters->bytes < filter->min_size)
> > +                     return false;
> > +             if ((filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> > +                 counters->bytes > filter->max_size)
> > +                     return false;
> > +     }
> > +
> >       return true;
> >   }
> >
> > @@ -237,6 +259,9 @@ static int allocinfo_ioctl_get_at(struct seq_file *=
m, void __user *arg)
> >       struct codetag *ct;
> >       struct allocinfo_get_at params =3D {0};
> >       __u64 skip_count;
> > +     bool sizes_set;
> > +     struct alloc_tag_counters counters;
> > +     struct alloc_tag_counters *counters_ptr =3D NULL;
> >
> >       if (copy_from_user(&params, arg, sizeof(params)))
> >               return -EFAULT;
> > @@ -244,9 +269,16 @@ static int allocinfo_ioctl_get_at(struct seq_file =
*m, void __user *arg)
> >       if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
> >               return -EINVAL;
> >
> > +     if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> > +         (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> > +         params.filter.min_size > params.filter.max_size)
> > +             return -EINVAL;
> > +
> >       priv =3D (struct allocinfo_private *)m->private;
> >
> >       skip_count =3D params.pos;
> > +     sizes_set =3D (params.filter.mask &
> > +                  (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_M=
ASK_MAX_SIZE));
> >
> >       mutex_lock(&priv->ioctl_lock);
> >       codetag_lock_module_list(alloc_tag_cttype, true);
> > @@ -261,7 +293,11 @@ static int allocinfo_ioctl_get_at(struct seq_file =
*m, void __user *arg)
> >       ct =3D codetag_next_ct(&priv->ioctl_iter);
> >
> >       while (ct) {
> > -             if (matches_filter(ct, &priv->filter)) {
> > +             if (sizes_set) {
> > +                     counters =3D allocinfo_prefetch_counters(ct);
> > +                     counters_ptr =3D &counters;
> > +             }
> > +             if (matches_filter(ct, &priv->filter, counters_ptr)) {
>
> alloc_tag_read() walks all per-CPU counters which is not cheap, but here
>
> it's called for every codetag unconditionally when sizes_set is true,
>
> even when the tag would be rejected by modname/function/filename checks
>
> that are plain string comparisons.
>
> For example, say the user filters with MODNAME | MIN_SIZE on a system
>
> with 10000 tags, 100 of which belong to the target module. Today the
>
> code would call alloc_tag_read() 10000 times (once per tag), but only
>
> 100 of those tags pass the modname check =E2=80=94 the other 9900 per-CPU=
 walks
>
> are wasted.
>
> Would it make sense to split the filter check so that per-CPU counter rea=
ds
>
> only happen after tag-based checks pass? Something like:
>
> static bool allocinfo_match_tag(struct codetag *ct,
>
>                          struct allocinfo_filter *filter) { ... }
>
> static bool allocinfo_match_size(struct alloc_tag_counters *counters,
>
>                                     struct allocinfo_filter *filter) { ..=
. }
>
> And in the caller:
>
> bool match =3D allocinfo_match_tag(ct, &priv->filter);
>
> /* Add comments to help subsequent developers understand the purpose of
> this modification. */
>
> if (match && sizes_set) {
>
>             counters =3D allocinfo_prefetch_counters(ct);
>
>             counters_ptr =3D &counters;
>
>              match =3D allocinfo_match_size(counters_ptr, &priv->filter);
>
> }
>
> You may find a more elegant approach to resolve this issue.

That's a good point. The counters should be fetched only after all
other filters have passed their checks. Otherwise you lose most of the
performance benefits.

>
> Thanks
>
> Best Regards
>
> Hao
>
> >                       if (skip_count =3D=3D 0)
> >                               break;
> >                       skip_count--;
> > @@ -270,7 +306,7 @@ static int allocinfo_ioctl_get_at(struct seq_file *=
m, void __user *arg)
> >       }
> >
> >       if (ct) {
> > -             allocinfo_to_params(ct, &params.data);
> > +             allocinfo_to_params(ct, &params.data, counters_ptr);
> >               priv->positioned =3D true;
> >       }
> >
> > @@ -292,9 +328,15 @@ static int allocinfo_ioctl_get_next(struct seq_fil=
e *m, void __user *arg)
> >       struct codetag *ct;
> >       struct allocinfo_tag_data params =3D {0};
> >       int ret =3D 0;
> > +     bool sizes_set;
> > +     struct alloc_tag_counters counters;
> > +     struct alloc_tag_counters *counters_ptr =3D NULL;
> >
> >       priv =3D (struct allocinfo_private *)m->private;
> >
> > +     sizes_set =3D (priv->filter.mask &
> > +                  (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_M=
ASK_MAX_SIZE));
> > +
> >       mutex_lock(&priv->ioctl_lock);
> >       codetag_lock_module_list(alloc_tag_cttype, true);
> >
> > @@ -304,10 +346,18 @@ static int allocinfo_ioctl_get_next(struct seq_fi=
le *m, void __user *arg)
> >       }
> >
> >       ct =3D codetag_next_ct(&priv->ioctl_iter);
> > -     while (ct && !matches_filter(ct, &priv->filter))
> > +     while (ct) {
> > +             if (sizes_set) {
> > +                     counters =3D allocinfo_prefetch_counters(ct);
> > +                     counters_ptr =3D &counters;
> > +             }
> > +             if (matches_filter(ct, &priv->filter, counters_ptr))
> > +                     break;
> >               ct =3D codetag_next_ct(&priv->ioctl_iter);
> > +     }
> > +
> >       if (ct)
> > -             allocinfo_to_params(ct, &params);
> > +             allocinfo_to_params(ct, &params, counters_ptr);
> >
> >       if (!ct) {
> >               priv->positioned =3D false;
