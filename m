Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D8C33A6E0
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 23:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779147795; cv=pass; b=rEUL61QNkxYuY+GRsyoBn0gIrjz7z5jum+S3vb99pN6DpS22Vpk5JsBxZDRSyNRcay8N2l+lcIPUn1qI9wneGHHIfE5RjbMIt8J0oNrtwhd3yoirNMStltbjZ3hLMYsBJ9MNdUoWQX3l9Sr45wfUCpy4UUJke85bzfgzH61vZ+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779147795; c=relaxed/simple;
	bh=T641v0lVlIvtYZVuN7mHHFsbttygl003nuuuk9dY57Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oM4+9WIRd+sMdHweStTU7YZsr6MB7u3UpWjUTk1elQRjefBnjlArbbr//z6u96u5od0z+Bkyy26CeJMbS53RZqD/S3rEQusiRzIMRDWU5cENkBC2BVsCMi0Ur1G/NFIB5o3a5jNG6iKY7K2mDAYjME7aIX+1RcNQgnlh9IP5Kkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pm/27Dmw; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pm/27Dmw"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ba180a022dso1155ad.1
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 16:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779147791; cv=none;
        d=google.com; s=arc-20240605;
        b=O/hLNlIJodeOolSOlVUzw90kVZ36fQi/pY0NyyeGNvFHBPc+J0AWjsO5z1oeWW39C6
         4foQJaW+XWjRp/ukrPlqiujkTJy00Rh/fbfc/UJsYHwgEbrstkWQSRZnClMJnG7QyT21
         ZNszO3GIaHyRILPxtakABcdc8RjdPeae7fU2UzYs1u9DFBHOPs6thcmoC+XOk4hic7kR
         u1d8I9CkbSMPwBeZgHsC4OScwmvdR9UuTvcXlzwOZxrBt8VeGikO1Ro3M+MvoR5MdCuS
         zs/amaNLFoKcLTGk3qnIBvvUTMUlqZQeshgZ/24vh0xDHp/Yrnt0QVW9uteER2uxLZRx
         WXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tIQAWxEmdM/RrKGZCNpzQANMh1bWzdys4gzz0aFMA0g=;
        fh=gP+wOhk2kqxdh0/tWvJ/vgdpPzmxQL+hJUkKnHASNWk=;
        b=gLhj3F/mJTQWD9bbDZnjy1ihTRwN3jxXti6SZsJwbFrYdGHiJv9/ER93nUyZIGRk5J
         rEo4I+UQNEWc28JCYeN6hi4vKIhK6lmD83IbFJvEASBK1Zz7aNwC8FElcu7DRCXKj49H
         tmFyJWV3E6BHx9IwET/PK15WvtuwQ1AaZQApJCNlFXwL8lQx0cQIkZLAYN14zBfd+Ad5
         fQNoI2nERdChdO/hxKtTABIlryQW36aploWAWMZigcBGgeN0nE0nTRiQncZt+qhGgaCp
         2Wl2yLa+/rzY4CcpnGjQywPlyg/5z+TXXoT566lLs1xG2kmCf2LrpYgtB+mDtU8f9Dt7
         SLPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779147791; x=1779752591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIQAWxEmdM/RrKGZCNpzQANMh1bWzdys4gzz0aFMA0g=;
        b=Pm/27DmwefzrBwRLJufKAuBNWBF/s3CLg15wL1+JLvjbSFhGM8w6tjZZL/e0EFxiK4
         p253bORuwpM5HKXBqwyUz0I5NF9Es8Xw6xWNO7pK9wJql20uKJvAREHvu2b1LAmQcQnz
         Kn4DPQbCttdKXOESUvunfLHscwEHacQSUYTlr+sv+XvJbBG/tzggkC3dGDzd7f7aTVmR
         mfZprqFdlVnTuK8BjA3f3rMd5uXBh6Qo1NRCVjGH9QfZ9t2M736iTCH8H9XUmpEY13Kq
         eQUeG+hKYZjoqoQCgr1Aru7gg1D62OVOtpxbLsV7B+KJSffpqhzP8qojyjTDa9d0gQ97
         ka+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779147791; x=1779752591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tIQAWxEmdM/RrKGZCNpzQANMh1bWzdys4gzz0aFMA0g=;
        b=kK8/SCfNKwe6g1q5kEbse/oBOV5OgpQsHqCLHIJQAF3Q66/98QF65ZnnOcH9I4fWAy
         pzbNqmZ0ilZUKS35VbQ5HM8c1HbAvTWPZMFZzhvKx7YFIg69zha5C0+G6DgqoE44JwQk
         NpoB6dPNcsjUzehs63tbkk6O08rRa4SEjJTRsqbDKuGpn68KU7G0L+MjlXh3KoUrnx85
         hdl6Z4NUISq9a403/fmVz/tuXwwTOeuCKnKHDODH4GJgMQ3eeachV5r9xb3ZM+oePrND
         Bv64j3slpxf4aOMGw06pb46Y7U07FtqQkWW78qesWHMZQaeiSiLWlWYwHkenrFLqI9Gz
         lGdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WsiJLnQPLoG8Mmz8U2HpKJ8xGswfD4qfU4AD3AJ2hudJWtSSRPyJ8HI01RBadOYRyN1DiB1C3qUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz76rBMLLqvNj/+DFXAcFRLnohoYff+xxgUl9/49/K/SsNnlIu6
	n0B1duchWOfiHYhLg6KV87+mLogaH00u/+cXz8YxoM2RKF7WIbnrrnxSKYPjQxnKlFVWjlQsIDd
	cq38WyfwJZ7pB0i1fbPcZtfZUBw0WxgHbHd9wcSEg
X-Gm-Gg: Acq92OGU2OPv44w1VE1ph67kesHEo2y5PhOUSIelbQjAbCbqz5spyakwvgSmcHqzk5Y
	LB1+BB3k1BMFFwSPzkC5s9gFmx+MejsGKMkVHTlqT91fexhUWCvymVbWJ/DzQ80/sD9KYqH57Sk
	xL5mCZZHNDbtxDrbHCsH21HNkijbrfrDjRvzUWdVRycbRuMNLI9wKD+K3sOX6976mv+xP4wfd1q
	G9xaNLDfO00wQcSFHj/3WLwycy4M5/IDCTN7A8rsEHYyR3YVpNF2Iq/SnzJ6JO14tzzglxiqr2F
	1cjf+8pxQnwNHwWUV0/Qfss3y0P8dS9u+BsYC96JA2D59+N9
X-Received: by 2002:a17:902:ffcb:b0:2bd:6dad:7ccc with SMTP id
 d9443c01a7336-2bdb0416634mr4524725ad.24.1779147790769; Mon, 18 May 2026
 16:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777936301.git.abhishekbapat@google.com>
 <2d1cbd93b987198d9569ff54b7fee4ae6aad5ff6.1777936301.git.abhishekbapat@google.com>
 <7e4881af-3fca-474a-abb7-daa75986e3ad@linux.dev>
In-Reply-To: <7e4881af-3fca-474a-abb7-daa75986e3ad@linux.dev>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Mon, 18 May 2026 16:42:57 -0700
X-Gm-Features: AVHnY4ICS2Wy3i3Nmz4pvA_CeAv8fx1_nlprwGLEcpakt3R2q4lzl0AtWVkwJzI
Message-ID: <CAL41Mv50-jqm5Zmd9Ko-yqB5y7P4kHzweuxFH3Q8W6jr=fPGUA@mail.gmail.com>
Subject: Re: [PATCH 2/6] alloc_tag: add ioctl filters to /proc/allocinfo
To: Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 11:15=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Abhishek
>
> On 2026/5/5 07:36, Abhishek Bapat wrote:
> > Extend the capability of the IOCTL mechanism to filter allocations base=
d
> > on tag's module name, function name, file name and line number.
> >
> > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > ---
> >   include/uapi/linux/alloc_tag.h | 26 +++++++++++++++-
> >   lib/alloc_tag.c                | 55 ++++++++++++++++++++++++++++++++-=
-
> >   2 files changed, 77 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_=
tag.h
> > index e9a5b55fcc7a..0cc9db5298c6 100644
> > --- a/include/uapi/linux/alloc_tag.h
> > +++ b/include/uapi/linux/alloc_tag.h
> > @@ -34,8 +34,32 @@ struct allocinfo_tag_data {
> >       struct allocinfo_counter counter;
> >   };
> >
> > +enum {
> > +     ALLOCINFO_FILTER_MODNAME,
> > +     ALLOCINFO_FILTER_FUNCTION,
> > +     ALLOCINFO_FILTER_FILENAME,
> > +     ALLOCINFO_FILTER_LINENO,
> > +     __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_LINENO
> > +};
> > +
> > +#define ALLOCINFO_FILTER_MASK_MODNAME                (1 << ALLOCINFO_F=
ILTER_MODNAME)
> > +#define ALLOCINFO_FILTER_MASK_FUNCTION               (1 << ALLOCINFO_F=
ILTER_FUNCTION)
> > +#define ALLOCINFO_FILTER_MASK_FILENAME               (1 << ALLOCINFO_F=
ILTER_FILENAME)
> > +#define ALLOCINFO_FILTER_MASK_LINENO         (1 << ALLOCINFO_FILTER_LI=
NENO)
> > +
> > +#define ALLOCINFO_FILTER_MASKS \
> > +     ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> > +
> > +struct allocinfo_filter {
> > +     __u64 mask; /* bitmask of the filter fields used */
> > +     struct allocinfo_tag fields;
> > +};
> > +
> >   struct allocinfo_get_at {
> > -     __u64 pos;      /* input */
> > +     /* inputs */
> > +     __u64 pos;
> > +     struct allocinfo_filter filter;
> > +     /* output */
> >       struct allocinfo_tag_data data;
> >   };
> >
> > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > index 5c24d2f954d4..7ff936e15e97 100644
> > --- a/lib/alloc_tag.c
> > +++ b/lib/alloc_tag.c
> > @@ -47,6 +47,7 @@ int alloc_tag_ref_offs;
> >   struct allocinfo_private {
> >       struct codetag_iterator iter;
> >       bool print_header;
> > +     struct allocinfo_filter filter;
> >       /* ioctl uses a separate iterator not to interfere with reads */
> >       struct codetag_iterator ioctl_iter;
> >       bool positioned; /* seq_open_private() sets to 0 */
> > @@ -156,6 +157,11 @@ static void allocinfo_copy_str(char *dest, const c=
har *src)
> >       strscpy(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE);
> >   }
> >
> > +static int allocinfo_cmp_str(const char *str, const char *template)
> > +{
> > +     return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SIZE);
> > +}
> > +
> >   static void allocinfo_to_params(struct codetag *ct,
> >                               struct allocinfo_tag_data *data)
> >   {
> > @@ -187,26 +193,67 @@ static int allocinfo_ioctl_get_content_id(struct =
seq_file *m, void __user *arg)
> >       return 0;
> >   }
> >
> > +static bool matches_filter(struct codetag *ct, struct allocinfo_filter=
 *filter)
> > +{
> > +     if (!ct || !filter || !filter->mask)
> > +             return true;
> > +
>
> Minor: in matches_filter(), returning true when ct is NULL seems
>
> semantically odd since both callers already check for ct !=3D NULL
>
> before calling this function. Not a real issue though.
>
> > +     if ((filter->mask & ALLOCINFO_FILTER_MASK_MODNAME) &&
> > +         ct->modname && (allocinfo_cmp_str(ct->modname, filter->fields=
.modname)))
> > +             return false;
> > +
>
> In matches_filter(), when ct->modname is NULL (built-in kernel code),
>
> the modname filter is skipped due to
>
> ct->modname && (allocinfo_cmp_str(...))
>
> This means built-in allocations always pass the modname filter. Since
>
> built-in code doesn't belong to any module, maybe it should not match
>
> when a modname filter is set:
>
> if (filter->mask & ALLOCINFO_FILTER_MASK_MODNAME) {
>
>      if (!ct->modname)
>
>          return false;
>
> if (allocinfo_cmp_str(ct->modname, filter->fields.modname))
>
>      return false;
>
> }
>
> Thanks
>
> Best Regards
>
> Hao
>
Ack, will include in v2.

> > +     if ((filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) &&
> > +         ct->function && (allocinfo_cmp_str(ct->function, filter->fiel=
ds.function)))
> > +             return false;
> > +
> > +     if ((filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) &&
> > +         ct->filename && (allocinfo_cmp_str(ct->filename, filter->fiel=
ds.filename)))
> > +             return false;
> > +
> > +     if ((filter->mask & ALLOCINFO_FILTER_MASK_LINENO) &&
> > +         ct->lineno !=3D filter->fields.lineno)
> > +             return false;
> > +
> > +     return true;
> > +}
> > +
> >   static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *ar=
g)
> >   {
> >       struct allocinfo_private *priv;
> >       struct codetag *ct;
> > -     __u64 pos;
> >       struct allocinfo_get_at params =3D {0};
> > +     __u64 skip_count;
> >
> >       if (copy_from_user(&params, arg, sizeof(params)))
> >               return -EFAULT;
> >
> > +     if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
> > +             return -EINVAL;
> > +
> >       priv =3D (struct allocinfo_private *)m->private;
> > -     pos =3D params.pos;
> > +
> > +     skip_count =3D params.pos;
> >
> >       codetag_lock_module_list(alloc_tag_cttype, true);
> >
> > +     if (params.filter.mask)
> > +             priv->filter =3D params.filter;
> > +     else
> > +             priv->filter.mask =3D 0;
> > +
> >       /* Find the codetag */
> >       priv->ioctl_iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> >       ct =3D codetag_next_ct(&priv->ioctl_iter);
> > -     while (ct && pos--)
> > +
> > +     while (ct) {
> > +             if (matches_filter(ct, &priv->filter)) {
> > +                     if (skip_count =3D=3D 0)
> > +                             break;
> > +                     skip_count--;
> > +             }
> >               ct =3D codetag_next_ct(&priv->ioctl_iter);
> > +     }
> > +
> >       if (ct) {
> >               allocinfo_to_params(ct, &params.data);
> >               priv->positioned =3D true;
> > @@ -240,6 +287,8 @@ static int allocinfo_ioctl_get_next(struct seq_file=
 *m, void __user *arg)
> >       }
> >
> >       ct =3D codetag_next_ct(&priv->ioctl_iter);
> > +     while (ct && !matches_filter(ct, &priv->filter))
> > +             ct =3D codetag_next_ct(&priv->ioctl_iter);
> >       if (ct)
> >               allocinfo_to_params(ct, &params);
> >
