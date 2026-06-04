Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B781D37C925
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 23:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780617204; cv=pass; b=Gt+VK7yMT+gkdCnX0VwoV1uDA327oeSDJ+ugWLLf2LUEpUofH7jTvBI6TuAZU31gc/uEBCR3yg1eUlB8H26E8rZaSXhZToZcha+8Vc55kTgxpqQb9S9tU5XBApuzirjAoII4KqI7J0b5J2rdKVHkGRUU9+oQepQfpiLZQOLZCFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780617204; c=relaxed/simple;
	bh=2Q77Ton4JA3XTBwdLcdvqJ6O/ExRWuIoZAbP8SFmvnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/jjnRkATu5g/LBGytYQovZE5O/lqEBmN4D7/SQlxxz9IsUayk9W4PomOtITdxfdhfsOlOMjosoPqtSTOQiq4EYzMIYlawWogkOmOTTdOqJj96g1qWXnHppMNHX4pEVU8K06NxvDq0rsFWMJ6lP70ihc7NJ7jIzJuiKyuLE5Hu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EXHWmCeO; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EXHWmCeO"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf2d865383so30405ad.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 16:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780617202; cv=none;
        d=google.com; s=arc-20240605;
        b=FgzqLSDChPYJa55ey97wpsLwYoqPgZ3MDb7mRQWfhx8i45j5h2Ios41cMlIUHTSsc7
         GZcq+rZ2axy+arVaLVJlGhpLZuJZqIR9rLdvlh5+6wB7orHmpOQT/7YDIbvi/PXMmxDg
         mMtIt5/h89eSdEIyDc7Eijb4ry162YufWrBbP0ehmLU6qUPs11w7XCSmyX3xyDlo/FD2
         xwcBO+2eMZ7sN3pyBfYfuis7XOgka7fc/170M0CECW8e11d/xEu/On3TknQHqEHAJamh
         Nm93jabF0L/BYhxGMu9RyyN7o/0FQY7i0H+/7hxwrHxMZ0B777YS6BjSyiQghGP/qneJ
         k1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1sayKnAkcvjh5O6e9c0QpImq/vePww6nkOl9CjIY9+Y=;
        fh=97LKzbGGfvm3K5BBdove/jvpnSx4gIqSRhMY6bWJgUI=;
        b=ElEHSIoqCaO27S85mcd5PCuHdWXfGmD7Vhnc5YXfYLtVMvIlBsYsni2iNxZ7YSlliR
         khjbECyNpnwCYhyKDOjXEl+m8c8ReG7siZoLq4M1u/daZVKe/gV5w9B6j+9fAcOugNtK
         dIFlwT2QFZ5Coqvw/qxhiSi0tHw1QdhdkI1iEwH2Rni8RDnrt0QzCxQATMx5esPMJuNz
         dC5f05Jup0b2JtcF9RgXj4ziLRr97skSLtrpkYt5i46aRsEdd20WtltwmIJUWYrYSX6p
         ILPFWxJ4mRawHQIoLv0cBVjQsS2f+JXhXTb0NZHl9dUQXw1AXRe2u57Fl9MCvc/zclPJ
         XQSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780617202; x=1781222002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sayKnAkcvjh5O6e9c0QpImq/vePww6nkOl9CjIY9+Y=;
        b=EXHWmCeOBMnaPi/3DunH1wHXfo2H+PsG1djsjOprkKNGgjE6dd4reVeD5M+zP/Fu92
         nUOitM2wjkgvWjS929MByi1IYWmi9SE5GvP47L5hJ3Xvck86KIq2NlNEFNlVXZkovHeR
         kixGuUUSkK+Xucru0wNgfFTwHhU0bQEUW7HAGhKrvJi3O9py2pUzhsuP5PMEGVZbAhkf
         IEIqEtKTJoAD5LAWy4QNQEY5fsmFw8kxrRCe6jm5+//5bZZYmUyXcwF1/uHAK3/q6zrI
         ySaJcP9k6aWdBqXtgk3JjFPuye8aZtXKiIs6zXQh5ntghhNYWf6Hmq5038JTDovpPhkU
         BEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780617202; x=1781222002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1sayKnAkcvjh5O6e9c0QpImq/vePww6nkOl9CjIY9+Y=;
        b=IOYzn3VAJcXm7iQQUr0R9fenV98uGIUi75iks2kjyUYJftSV0Y3GJiLu7Z3OibffmX
         T5BBC8uTFRiag9RxGcsnGFY8F/GG7+jj/bZZIvsZ39vRr+IrKLDm3SNlONakOXaOTSlb
         U6AzhPBqMhtNEwH+qx4ihH2o6SL6qmdsXGTuMVSOFU03LQsPdcMa/5DndsSu0c77cZ7a
         9WZrChK5CUCwYuBsTT2ZqZmUXxwu0xXkCm/32STOY4H9wyxUuB3Qt2iogEXaJ29ogdPi
         n/fCszr/qbqlNzqELwhYhlXzyYCEM2h9JKH/4qaW+gGqcwEe0tkz2Ex6BGsUIrLnxzuL
         yELw==
X-Forwarded-Encrypted: i=1; AFNElJ+aZ4M20eNVodQJ3b+/wx80ARMV883YXfow6SaFonGntkji2/89vTbGjKheIu41pWaVDPnc+fvAGZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbnsQxr26Xs4c3naTuyaCP+TAS7kVwvgbt87JyRt4fU5nHAD2i
	CjGKc7FvkOu8T39iePCSbYd+v87iIgE50eOC41tHepiJFPnAZQ82apcJkCToNVXrgCy+XuX+oNT
	3G+g6NExRUey6srGp+61q8o9hJyrLkqzsdvJdcaE+
X-Gm-Gg: Acq92OH4AS3yuB3NbrNZlFteBeStsQ+uZsFpUIAnMfyM9CkzdiifAwRyR4WK+prsTGo
	MaPaL6gKyZ0acz1mUXA37A2YDm61iwMzwmkb0z3jBUsn9vK8k8yOScIGicRn8wh5F4jytcmwpy7
	nX7eDZ2WxLU8X+wLksBnBMf3Etivm84By04b/zdLdV4g2Y0kXqvvW8ZZFslt62qfDU6A4wgIslA
	88zoAC0R/pIGM2ABCeKyVuS3qD+IVRG5guTcnae/rpNojCqdUiM3k8llnEC/S8aiwhERCfd5GTD
	dqSErD+AY8pmmEHu/0QUZBUqL0SQE2byqS8LLx66NiPwACMp
X-Received: by 2002:a17:903:3807:b0:2b7:b03d:9dce with SMTP id
 d9443c01a7336-2c1ebeb5fa8mr261515ad.18.1780617201343; Thu, 04 Jun 2026
 16:53:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779471082.git.abhishekbapat@google.com>
 <f177efebdfda5c2a179d7cd6768e0c6f37efb9c4.1779471082.git.abhishekbapat@google.com>
 <aba73999-dc29-45c1-b6cd-54a7c1b824fa@linux.dev>
In-Reply-To: <aba73999-dc29-45c1-b6cd-54a7c1b824fa@linux.dev>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Thu, 4 Jun 2026 16:53:10 -0700
X-Gm-Features: AVHnY4KyqsDiHrH7JcfoQPZjpkORjY20gfnuwslf8qqI9Nu431iLe4LIAgxAv_o
Message-ID: <CAL41Mv4fkK-t55GuDNTe9fie9nUBfY_Ap3CpgT1XDpn8sSU0qg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] alloc_tag: add ioctl filters to /proc/allocinfo
To: Hao Ge <hao.ge@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2026 at 8:00=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Abhishek
>
>
> On 2026/5/23 01:45, Abhishek Bapat wrote:
> > Extend the capability of the IOCTL mechanism to filter allocations base=
d
> > on tag's module name, function name, file name and line number.
> >
> > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > ---
> >   include/uapi/linux/alloc_tag.h | 26 ++++++++++++++-
> >   lib/alloc_tag.c                | 58 ++++++++++++++++++++++++++++++++-=
-
> >   2 files changed, 80 insertions(+), 4 deletions(-)
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
> > index 3598735b6c93..56c394ef721f 100644
> > --- a/lib/alloc_tag.c
> > +++ b/lib/alloc_tag.c
> > @@ -48,6 +48,7 @@ int alloc_tag_ref_offs;
> >   struct allocinfo_private {
> >       struct codetag_iterator iter;
> >       bool print_header;
> > +     struct allocinfo_filter filter;
> >       /* ioctl uses a separate iterator not to interfere with reads */
> >       struct codetag_iterator ioctl_iter;
> >       bool positioned; /* seq_open_private() sets to 0 */
> > @@ -167,6 +168,11 @@ static void allocinfo_copy_str(char *dest, const c=
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
> > @@ -198,27 +204,71 @@ static int allocinfo_ioctl_get_content_id(struct =
seq_file *m, void __user *arg)
> >       return 0;
> >   }
> >
> > +static bool matches_filter(struct codetag *ct, struct allocinfo_filter=
 *filter)
> > +{
> > +     if (!filter || !filter->mask)
> > +             return true;
> > +
> > +     if (filter->mask & ALLOCINFO_FILTER_MASK_MODNAME) {
> > +             if (!ct->modname)
> > +                     return false;
> > +             if (allocinfo_cmp_str(ct->modname, filter->fields.modname=
))
> > +                     return false;
> > +     }
> > +
>
> Apologies -- I previously suggested the "!ct->modname ->
>
> return false" approach, but I realized we broke the ability to
>
> filter for built-in allocations.  allocinfo_to_params() returns
>
> modname=3D"" for those, so a user would naturally try to filter
>
> by modname=3D"" -- except it never matches because ct->modname is
>
> NULL, not an empty string.
>
> Maybe something like this instead?
>
> if (filter->mask & ALLOCINFO_FILTER_MASK_MODNAME) {
>
>      if (ct->modname) {
>
>          if (allocinfo_cmp_str(ct->modname, filter->fields.modname))
>
>              return false;
>
>          } else if (filter->fields.modname[0] !=3D '\0') {
>
>              return false;
>
>          }
>
> }
>
> That way modname=3D"" matches built-in tags, which lines up with
>
> what the API actually returns.
>
> Thanks
>
> Hao
>

Ah good catch, will use the following logic that's a bit cleaner:
if (filter->mask & ALLOCINFO_FILTER_MASK_MODNAME) {
                /* user wants to filter by modname but ct->modname is NULL =
*/
                if (!ct->modname) {
                        /* validate if user was attempting to filter
for built-in allocations */
                        if (filter->fields.modname[0] !=3D '\0')
                                return false;
                }
                if (allocinfo_cmp_str(ct->modname, filter->fields.modname))
                        return false;
        }

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
> >       mutex_lock(&priv->ioctl_lock);
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
> > @@ -254,6 +304,8 @@ static int allocinfo_ioctl_get_next(struct seq_file=
 *m, void __user *arg)
> >       }
> >
> >       ct =3D codetag_next_ct(&priv->ioctl_iter);
> > +     while (ct && !matches_filter(ct, &priv->filter))
> > +             ct =3D codetag_next_ct(&priv->ioctl_iter);
> >       if (ct)
> >               allocinfo_to_params(ct, &params);
> >
