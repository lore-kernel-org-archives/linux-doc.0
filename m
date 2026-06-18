Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252CD2FB965
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 16:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781800709; cv=pass; b=gEBn0rHX29/6uX5QIGpeSevyf+JZmK9B/wlfJ2lYxMPa+/idDqYSF5Lnp5mRVSIwag9JVorCaHP6T6KP0GxTwsng88pfb7owwKj7NZTKXqeAFQ/t1Yir7Wi1HrWyVvRGcpxNifNn6eS/Dg1TGbw3XMBKcLN1XL5aHwyD9HRgBoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781800709; c=relaxed/simple;
	bh=sWuk2K4Q93hSdnP4gNjLDRzHJImCQ+/C8b16U5PeZpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUQjtJ45MkUx07Bwa4ddXDHAPN1aTj1sh90wlaKrf0/vrMgKtbUIw3Ai7SsNcoNdoL7kDjGVG324d74i5PFKtMPMkPQFXfC/RfTSs2OMPRzo/VdDAPQhYY2NvuwG/X4GoOJO/2KEQYW2G+v2zAIXXfQWc56m+q8/DggCEFNQrCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jgrmlX1D; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jgrmlX1D"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c69fa0b1f8so1125ad.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 09:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781800707; cv=none;
        d=google.com; s=arc-20260327;
        b=M+ah77YkuykxaQKRehVpsi+Bi3uXA027kHwnbQzCBAeOwSzVe2THCjbTu1tXAZbepx
         c6EbUxq9DmQ1SX/WFK5+lf9tp8LW3xlR/VDfeUxKRGhLuio5jCx62rg6KnE9U3XePQ6z
         A6wWUA5XinKcMLIvtELPNlMTldnpfpIN1htH3oXvn+vfv9F7EycJ2qRNcoh1wzaxXpPX
         dpbFqy3q+qiRmfZBj0XfjCu6Y1RA4E0wspGgo8X7XZ2YgUB0kAsn3MR1T/RyCnhWta8C
         Z1lOkDySKFQXZFmqHQaamAY08PPEVu7CG43hMsBZ4CQZzrIW2fHhkIRWqaWSNOEVOZ2P
         LlBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o2sp8BQwLMMxoa0twTBGCTMJeSc68yYCgpIAukpWf14=;
        fh=zSeWgIMwYDSlUBik2ncvZM+euJmsf+OlyNKZVBKQAcM=;
        b=YorqJExYN/c0HXigLftzhuRcIR4u0CcKekhPMm74QjV9F+Y4AEgASewW71pRWZ6aTk
         AwHRavakGQJ5lCETL04cwPE56vin5NjWlzAj0cP9pnPNOPOQE9icTh4f5qkrjuS0LJY5
         6TO/SEKTq5aVbTyqNSFPng8pmLT/uR6B7yxkrnN8cYgpnAISBtyUUl7B/ZC7Y1qzAMzl
         TdLdv9VKTPf/eCmXmg2n0fLWgqxEXY0RkjpIYTRKv9J4vXjs9j0bo9QT3YAODSXGmw4W
         Fy3RcHFKzVYS6wPdaB2MapE92WHO3eVYp8+NvoIQzyxJjL68bcXGsWNcGpkJNR91jgZa
         cmhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781800707; x=1782405507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o2sp8BQwLMMxoa0twTBGCTMJeSc68yYCgpIAukpWf14=;
        b=jgrmlX1D/QII8b/AQOexs9Z9OzrzWzYBp9tTkMKrx2478dwlLTU4L3TNwhmebivHAO
         13IUaExsUzBbpjF6sQqMUdkydt7EeTsjZFHVUL2nItJ6E89STdX+JolxSM/a5vdFyS+C
         jSGWW1hMFMJZOx+523tQeKW0cuSocIF4IKAfk9a0QweFQ3LEchbKHDR94iaGfP5rTXrv
         rgOpUhJRaqUXbmhuMLYdlpIDM6BqK+vxZBic31Jlxmy0SsOlbWCupPD8cckCnTcIiJIw
         nOB67WlPDgdFsuaB66o7vwkXsMhPtoEeKB4Zeyvbk4+7I2C0j5on9RbEdkrmC6N0SfUE
         P96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781800707; x=1782405507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2sp8BQwLMMxoa0twTBGCTMJeSc68yYCgpIAukpWf14=;
        b=kZir3A3xsddcUi+d/52BrbluyAYb8vg7Kc2xh0kRLbd1g7281E35EntL4C4k9uWLfX
         LMaMU2j+bk2B+VnvjSKUsWNpj0SeRSzFVGf7qSuQWRUIoIO9Sh0gUZp8F4PMGZ3/HPZD
         uGONApC+IY2kBWpEYMxR16RGCpPYHBMmj0KPHMnnE0MfkXDpRU3bjCrT9IoO/awKBrad
         mO5P1bjmeBmip2DvEL14t06AnBZyEVfncOClXN67gFMeteYKslPbG/j9x089LNzmAuRl
         anbHmIdcQn4SEM9zQbxjxIT/JMGlam8pB2AgX11EVA4IcQEiLYnNlrRQ4tfCSHN0OSoP
         qziA==
X-Forwarded-Encrypted: i=1; AFNElJ9yBOTXtpFa0K20m4bPoDA9RZMJy99/tDe5zsjkmz/AUbXYJLTTfDe03oY+OnE66gesPt2Ep8Cfbpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuLA0zXMeFM1aV0evjH4wBL8v57K5Ng3LthrZP1eC9FX0LZBhl
	RMERV7qQHssXjIfVG0SGdaAkDaRAwDNq99ZTq+kIYXaojPlnoBKzCLxXgZOwpBSVQiHjFIl2Leo
	L9GubDZpk/KKzmq7vbUtXQ5DzDwOY5aKTjfDoiUpu
X-Gm-Gg: AfdE7cnZaBHIWrTl1tc5OiBzhjr6ON1lu5xRuzG+1XtY+j+f9YpPdmLdPqRY9B+isfp
	MimNrQjtekENye/7GPsUYIPMwazaOJs/SUXmPYl+269xyr8BFRxLNN0Y35sOKZ65mv081GXMGPE
	8K0OFKMADIv1OtJZbU0nNrIBd71ELIDvxebV+UO6Fs3XuOqZFTCcNxeb5KhD0OIPAhXZ7iyZsZz
	Ig8pzxD0P2ODElGqsyt16MzyhoiQJzAbQIV+VONPp9et8XtZwQaChc3ywT92UlLf8FU4HKp/uFV
	ekQ0QSl/EXRS4/7KlqEqVMViQxNeLTomS3Y4XLaj
X-Received: by 2002:a17:903:1746:b0:2b7:b03d:9dce with SMTP id
 d9443c01a7336-2c6e221cfecmr2748785ad.18.1781800706953; Thu, 18 Jun 2026
 09:38:26 -0700 (PDT)
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
 <CAJuCfpGOrtk+3hvUVE7-6wpnsa3Nbr6kGq5CfHVdCzX+DYyjFQ@mail.gmail.com>
 <CAL41Mv6FZU5As+yKiM52axUMsR_FDrYQCK5STjUp-aG+xMD-EQ@mail.gmail.com> <CAJuCfpFrgKBGFWoca=XuKh1p22vdfE_uSz_nt2Kj4UvnjvSUJQ@mail.gmail.com>
In-Reply-To: <CAJuCfpFrgKBGFWoca=XuKh1p22vdfE_uSz_nt2Kj4UvnjvSUJQ@mail.gmail.com>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Thu, 18 Jun 2026 09:38:14 -0700
X-Gm-Features: AVVi8Cdr5snt4_U1THYDJbxafqi5nb-C3H-GI3Uu0Lkdo0uC1dYMvahVWMYDltA
Message-ID: <CAL41Mv7u0zt4rG9bb73cRj8p48+58DVdJmv3U87bes4fP_NoUg@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] alloc_tag: add size-based filtering to ioctl
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 4:01=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Wed, Jun 17, 2026 at 3:41=E2=80=AFPM Abhishek Bapat <abhishekbapat@goo=
gle.com> wrote:
> >
> > On Wed, Jun 17, 2026 at 3:35=E2=80=AFPM Suren Baghdasaryan <surenb@goog=
le.com> wrote:
> > >
> > > On Wed, Jun 17, 2026 at 1:55=E2=80=AFPM Abhishek Bapat <abhishekbapat=
@google.com> wrote:
> > > >
> > > > On Wed, Jun 17, 2026 at 9:29=E2=80=AFAM Suren Baghdasaryan <surenb@=
google.com> wrote:
> > > > >
> > > > > On Mon, Jun 15, 2026 at 4:04=E2=80=AFPM Abhishek Bapat <abhishekb=
apat@google.com> wrote:
> > > > > >
> > > > > > Extend the allocinfo filtering mechanism to allow users to filt=
er tags
> > > > > > based on the total number of bytes allocated [min_size, max_siz=
e]. The
> > > > > > size range is inclusive.
> > > > > >
> > > > > > Filtering by size involves retrieving allocinfo per-CPU counter=
s, which
> > > > > > is an expensive operation. Hence, the performance of size-based
> > > > > > filtering will be worse than other filters.
> > > > > >
> > > > > > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > > > > > Acked-by: Hao Ge <hao.ge@linux.dev>
> > > > > > ---
> > > > > >  include/uapi/linux/alloc_tag.h |  8 ++++-
> > > > > >  lib/alloc_tag.c                | 63 ++++++++++++++++++++++++++=
++------
> > > > > >  2 files changed, 59 insertions(+), 12 deletions(-)
> > > > > >
> > > > > > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linu=
x/alloc_tag.h
> > > > > > index 3b11877955b9..7f5acbb44c14 100644
> > > > > > --- a/include/uapi/linux/alloc_tag.h
> > > > > > +++ b/include/uapi/linux/alloc_tag.h
> > > > > > @@ -45,13 +45,17 @@ enum {
> > > > > >         ALLOCINFO_FILTER_FUNCTION,
> > > > > >         ALLOCINFO_FILTER_FILENAME,
> > > > > >         ALLOCINFO_FILTER_LINENO,
> > > > > > -       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_LINENO
> > > > > > +       ALLOCINFO_FILTER_MIN_SIZE,
> > > > > > +       ALLOCINFO_FILTER_MAX_SIZE,
> > > > > > +       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> > > > > >  };
> > > > > >
> > > > > >  #define ALLOCINFO_FILTER_MASK_MODNAME          (1 << ALLOCINFO=
_FILTER_MODNAME)
> > > > > >  #define ALLOCINFO_FILTER_MASK_FUNCTION         (1 << ALLOCINFO=
_FILTER_FUNCTION)
> > > > > >  #define ALLOCINFO_FILTER_MASK_FILENAME         (1 << ALLOCINFO=
_FILTER_FILENAME)
> > > > > >  #define ALLOCINFO_FILTER_MASK_LINENO           (1 << ALLOCINFO=
_FILTER_LINENO)
> > > > > > +#define ALLOCINFO_FILTER_MASK_MIN_SIZE         (1 << ALLOCINFO=
_FILTER_MIN_SIZE)
> > > > > > +#define ALLOCINFO_FILTER_MASK_MAX_SIZE         (1 << ALLOCINFO=
_FILTER_MAX_SIZE)
> > > > > >
> > > > > >  #define ALLOCINFO_FILTER_MASKS \
> > > > > >         ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> > > > > > @@ -59,6 +63,8 @@ enum {
> > > > > >  struct allocinfo_filter {
> > > > > >         __u64 mask; /* bitmask of the filter fields used */
> > > > > >         struct allocinfo_tag fields;
> > > > > > +       __u64 min_size;
> > > > > > +       __u64 max_size;
> > > > > >  };
> > > > > >
> > > > > >  struct allocinfo_get_at {
> > > > > > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > > > > > index 5feb61d9fb92..b3d21834b61e 100644
> > > > > > --- a/lib/alloc_tag.c
> > > > > > +++ b/lib/alloc_tag.c
> > > > > > @@ -195,15 +195,26 @@ static int allocinfo_cmp_str(const char *=
str, const char *template)
> > > > > >         return strncmp(allocinfo_str(str), template, ALLOCINFO_=
STR_SIZE);
> > > > > >  }
> > > > > >
> > > > > > +/* Fetch the per-CPU counters */
> > > > > > +static inline struct alloc_tag_counters allocinfo_prefetch_cou=
nters(struct codetag *ct)
> > > > > > +{
> > > > > > +       return alloc_tag_read(ct_to_alloc_tag(ct));
> > > > > > +}
> > > > > > +
> > > > > >  /*
> > > > > >   * Populates the UAPI allocinfo_tag_data structure with active=
 runtime
> > > > > >   * profiling counters extracted from the given kernel codetag.
> > > > > >   */
> > > > > >  static void allocinfo_to_params(struct codetag *ct,
> > > > > > -                               struct allocinfo_tag_data *data=
)
> > > > > > +                               struct allocinfo_tag_data *data=
,
> > > > > > +                               struct alloc_tag_counters *coun=
ters)
> > > > > >  {
> > > > > > -       struct alloc_tag *tag =3D ct_to_alloc_tag(ct);
> > > > > > -       struct alloc_tag_counters counter =3D alloc_tag_read(ta=
g);
> > > > > > +       struct alloc_tag_counters local_counters;
> > > > > > +
> > > > > > +       if (!counters) {
> > > > > > +               local_counters =3D allocinfo_prefetch_counters(=
ct);
> > > > > > +               counters =3D &local_counters;
> > > > > > +       }
> > > > > >
> > > > > >         if (ct->modname)
> > > > > >                 allocinfo_copy_str(data->tag.modname, ct->modna=
me);
> > > > > > @@ -212,9 +223,9 @@ static void allocinfo_to_params(struct code=
tag *ct,
> > > > > >         allocinfo_copy_str(data->tag.function, ct->function);
> > > > > >         allocinfo_copy_str(data->tag.filename, ct->filename);
> > > > > >         data->tag.lineno =3D ct->lineno;
> > > > > > -       data->counter.bytes =3D counter.bytes;
> > > > > > -       data->counter.calls =3D counter.calls;
> > > > > > -       data->counter.accurate =3D !alloc_tag_is_inaccurate(tag=
);
> > > > > > +       data->counter.bytes =3D counters->bytes;
> > > > > > +       data->counter.calls =3D counters->calls;
> > > > > > +       data->counter.accurate =3D !alloc_tag_is_inaccurate(ct_=
to_alloc_tag(ct));
> > > > > >  }
> > > > > >
> > > > > >  /*
> > > > > > @@ -238,7 +249,9 @@ static int allocinfo_ioctl_get_content_id(s=
truct seq_file *m, void __user *arg)
> > > > > >   * Verifies whether a given codetag satisfies the active filte=
ring criteria by
> > > > > >   * matching its characteristics against the specified filter.
> > > > > >   */
> > > > > > -static bool matches_filter(struct codetag *ct, struct allocinf=
o_filter *filter)
> > > > > > +static bool matches_filter(struct codetag *ct, struct allocinf=
o_filter *filter,
> > > > > > +                          struct alloc_tag_counters *counters,
> > > > > > +                          bool *fetched_counters)
> > > > > >  {
> > > > > >         if (!filter || !filter->mask)
> > > > > >                 return true;
> > > > > > @@ -265,6 +278,19 @@ static bool matches_filter(struct codetag =
*ct, struct allocinfo_filter *filter)
> > > > > >             ct->lineno !=3D filter->fields.lineno)
> > > > > >                 return false;
> > > > > >
> > > > > > +       if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | AL=
LOCINFO_FILTER_MASK_MAX_SIZE)) {
> > > > > > +               if (!*fetched_counters) {
> > > > > > +                       *counters =3D allocinfo_prefetch_counte=
rs(ct);
> > > > > > +                       *fetched_counters =3D true;
> > > > > > +               }
> > > > > > +               if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_S=
IZE) &&
> > > > > > +                   counters->bytes < filter->min_size)
> > > > > > +                       return false;
> > > > > > +               if ((filter->mask & ALLOCINFO_FILTER_MASK_MAX_S=
IZE) &&
> > > > > > +                   counters->bytes > filter->max_size)
> > > > > > +                       return false;
> > > > > > +       }
> > > > > > +
> > > > > >         return true;
> > > > > >  }
> > > > > >
> > > > > > @@ -278,6 +304,8 @@ static int allocinfo_ioctl_get_at(struct se=
q_file *m, void __user *arg)
> > > > > >         struct codetag *ct;
> > > > > >         struct allocinfo_get_at params =3D {0};
> > > > > >         __u64 skip_count;
> > > > > > +       struct alloc_tag_counters counters;
> > > > > > +       bool fetched_counters;
> > > > > >
> > > > > >         if (copy_from_user(&params, arg, sizeof(params)))
> > > > > >                 return -EFAULT;
> > > > > > @@ -285,6 +313,11 @@ static int allocinfo_ioctl_get_at(struct s=
eq_file *m, void __user *arg)
> > > > > >         if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
> > > > > >                 return -EINVAL;
> > > > > >
> > > > > > +       if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZ=
E) &&
> > > > > > +           (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZ=
E) &&
> > > > > > +           params.filter.min_size > params.filter.max_size)
> > > > > > +               return -EINVAL;
> > > > > > +
> > > > > >         priv =3D m->private;
> > > > > >
> > > > > >         mutex_lock(&priv->ioctl_lock);
> > > > > > @@ -308,7 +341,8 @@ static int allocinfo_ioctl_get_at(struct se=
q_file *m, void __user *arg)
> > > > > >         ct =3D codetag_next_ct(&priv->ioctl_iter);
> > > > > >
> > > > > >         while (ct) {
> > > > > > -               if (matches_filter(ct, &priv->filter)) {
> > > > > > +               fetched_counters =3D false;
> > > > > > +               if (matches_filter(ct, &priv->filter, &counters=
, &fetched_counters)) {
> > > > >
> > > > > Do we really need this "fetched_counters" parameter? Here are the
> > > > > possible cases:
> > > > > 1. If the filter does not include ALLOCINFO_FILTER_MASK_MIN_SIZE =
|
> > > > > ALLOCINFO_FILTER_MASK_MAX_SIZE then counters would not be fetched=
.
> > > > > 2. If the filter includes ALLOCINFO_FILTER_MASK_MIN_SIZE |
> > > > > ALLOCINFO_FILTER_MASK_MAX_SIZE and
> > > > > 2.1. matches_filter() returns true then we know counters were fet=
ched
> > > > > because they had to be validated.
> > > > > 2.2. matches_filter() returns false then we don't care if the cou=
nters
> > > > > were fetched. We do not report that tag anyway.
> > > > >
> > > > > So, instead of passing fetched_counters to matches_filter() we co=
uld do this:
> > > > >
> > > > > bool filter_by_size =3D (params.filter.mask &
> > > > > (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE)=
) !=3D
> > > > > 0;
> > > > > while (ct) {
> > > > >            if (matches_filter(ct, &priv->filter, &counters)) {
> > > > > ...
> > > > > }
> > > > > if (ct) {
> > > > >            allocinfo_to_params(ct, &params.data, filter_by_size ?
> > > > > &counters : NULL);
> > > > > ...
> > > > > }
> > > > >
> > > > > Wouldn't that work?
> > > > >
> > > >
> > > > While we can deduce whether counters were fetched outside the
> > > > matches_filter function, I think the current implementation is more
> > > > intuitive from a readability perspective. I believe it  should be k=
ept
> > > > as is for that reason. If we extract the logic, we'll first have to
> > > > replicate the boolean logic at two places. Second, we'd need to add=
 a
> > > > comment explaining the boolean calculation, and the reader might ha=
ve
> > > > a higher cognitive load trying to determine which function populate=
s
> > > > the counters. The current implementation makes it easy for the read=
er
> > > > to deduce the original intention. Let me know what you think.
> > >
> > > Ok, I guess you have a point.
> > >
> > > I was also thinking why we are passing NULL to allocinfo_to_params()
> > > to fetch the counters into a local variable? Why can't we simply call
> > > allocinfo_prefetch_counters() before calling allocinfo_to_params()
> > > when fetched_counters=3D=3Dfalse? Basically:
> > >
> > > if (!fetched_counters)
> > >     counters =3D allocinfo_prefetch_counters(ct);
> > > allocinfo_to_params(ct, &params.data, &counters);
> > >
> > > This would simplify allocinfo_to_params() because counter will never
> > > be NULL and it would not need local counters.
> > >
> >
> > The only reason I did it that way was to avoid repeating the code at
> > two places i.e. allocinfo_ioctl_get_at and allocinfo_ioctl_get_next.
> > Either way, the per-CPU counters are assimilated only once. I can
> > include this change if you still want me to, but personally I like the
> > way it currently is implemented.
>
> Yeah, I think repeating 2 lines is preferable to passing NULL and
> fetching into a local variable. Please include that change.
>

Ack, I will change this in the next patchset version.

> >
> > > >
> > > > > >                         if (skip_count =3D=3D 0)
> > > > > >                                 break;
> > > > > >                         skip_count--;
> > > > > > @@ -317,7 +351,7 @@ static int allocinfo_ioctl_get_at(struct se=
q_file *m, void __user *arg)
> > > > > >         }
> > > > > >
> > > > > >         if (ct) {
> > > > > > -               allocinfo_to_params(ct, &params.data);
> > > > > > +               allocinfo_to_params(ct, &params.data, fetched_c=
ounters ? &counters : NULL);
> > > > > >                 priv->positioned =3D true;
> > > > > >         }
> > > > > >
> > > > > > @@ -343,6 +377,8 @@ static int allocinfo_ioctl_get_next(struct =
seq_file *m, void __user *arg)
> > > > > >         struct codetag *ct;
> > > > > >         struct allocinfo_tag_data params;
> > > > > >         int ret =3D 0;
> > > > > > +       struct alloc_tag_counters counters;
> > > > > > +       bool fetched_counters;
> > > > > >
> > > > > >         memset(&params, 0, sizeof(params));
> > > > > >         priv =3D m->private;
> > > > > > @@ -356,10 +392,15 @@ static int allocinfo_ioctl_get_next(struc=
t seq_file *m, void __user *arg)
> > > > > >         }
> > > > > >
> > > > > >         ct =3D codetag_next_ct(&priv->ioctl_iter);
> > > > > > -       while (ct && !matches_filter(ct, &priv->filter))
> > > > > > +       while (ct) {
> > > > > > +               fetched_counters =3D false;
> > > > > > +               if (matches_filter(ct, &priv->filter, &counters=
, &fetched_counters))
> > > > > > +                       break;
> > > > > >                 ct =3D codetag_next_ct(&priv->ioctl_iter);
> > > > > > +       }
> > > > > > +
> > > > > >         if (ct)
> > > > > > -               allocinfo_to_params(ct, &params);
> > > > > > +               allocinfo_to_params(ct, &params, fetched_counte=
rs ? &counters : NULL);
> > > > > >
> > > > > >         if (!ct) {
> > > > > >                 priv->positioned =3D false;
> > > > > > --
> > > > > > 2.54.0.1136.gdb2ca164c4-goog
> > > > > >
