Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D6B30F927
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 15:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711774; cv=pass; b=VXp8gYFYHJyaKdNj6NCnoztjaidMNKA+MutU0YdRCQ1ze1R+SwhKwSlolCxutwV2zxMprDn1uG3n8uhrLEv2Z1fKKUKZXzFjXT9PxMImdbHpqvmYGhovv5oqcIk7yKsB+L0ZxEZ0XGutZLHqZsWBtJY5n035iBhW8wv10YAshkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711774; c=relaxed/simple;
	bh=qMp3VaXbqiIHIJuceGnAORnzCmwE8+VoIrbX01hxxUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKJuSNWxdGqiMxezONQl1ui1PcK3hEfOa0xzWWU3CCUFBPOJRvTnPEWgsmd4wRWZjmZvDI5ojE7d2K+ystvUVd6NYY82xy82I9Je0dOMldVuhpG8U52px4KZAMhjUG0pNq9DyREqDvV8CUTiS0hYCXrdtWJ1vK6BXBpADkCANys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DsSODWfD; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DsSODWfD"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5177d1ff061so299671cf.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 08:56:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781711761; cv=none;
        d=google.com; s=arc-20240605;
        b=fcWn5n7OUTT/diQgrdPw3QY9H3uYXGFlSUgRMx6HjtyNtciQn5JPmY5et2oH1P50LB
         7l3lNOU1qXkynW+kG/oPoAKhDyShuip5bulYDfRrj+yRNPWtbU0Gj3tItauq9PMyWbYO
         CcRVju6i3QxzGq1+P4MtV2gKpmjwyWMS473+F8iQLMN4QTvdFkmsB9w785KpIKU0BuQ7
         zvxuRMfBic8UPEyQsWtkQn6yR2CRJTOX9PYkGd4by7m8uAPsdJZD2px2pvPbF2RBqrGQ
         dwV36UpufLNPhMOOlUgSuS+kbpjfgXJbbWMe0znMdIszimsFuNMZw6l/O3yqc3BIr8Mx
         tPzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ERwGw8p2/Jms/iJMYT/dn1PYwf2dRmoIQRea7lQP5Io=;
        fh=FTK95LZzHkFHXQWv/KahD4or6pIhU10AHnGJDaNXY/o=;
        b=GbOIQV4gj9fq3ow/93rsQ3bslCO+D1toHKx9kl0oUEdFerzLBYPhpbEBHjg/Qw0yd6
         xGP7CbTd03yF/oQ6a1l9/6y2ps6qU7qyvXxkJNJGmoPfHL9yp4Rryo01zauWGSVOqB2i
         WyP29THon8jxxsLsieJUQkFKfPqX8hBqTdHuBDF72BZbmpi0uihNlxfVlJhmf6bcMBs6
         tPBSbBQupqRltcCpJtCRJJ6ynpRvhV/nnZDgNaUSuP5qwF5KU6MkQb10psJ51uXFoUhB
         IFyLZK+5JB2l5WP/5+Dcl9qaiQnXS7UtTtBhjoXFmLg3TQwgrH+xu3RrTbTPtkPLdvft
         tdlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781711761; x=1782316561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ERwGw8p2/Jms/iJMYT/dn1PYwf2dRmoIQRea7lQP5Io=;
        b=DsSODWfDQFK+cTiTMt/c6I9pMecYjJj+RtHAQcMw3TmaU7NpG6yRyngvAxgDuoZ2rg
         46q2/Sk9hQ6Yvm2rhc6mwi0q5kjmLhsjxBw39cbhIw1NZGaj9tvlvGdwup6nSoGbGLpD
         44cpgl0um9fzlK2ESVZRYedOQlX2QzpAZKUY9UcoRUGYbREWJ0cfYwbpxOQPoP9ew39g
         nEd+7VbAAg+CCtDsv/u1APUNlw1z5KzhOkLM6UnPt/UeHEc6ydZ+T4hfZuI8RdSqUpH6
         er18dbinEABivlDOwfHBJt/MBe6Mec82iTFUpuF6ewKSHZeCX9fPXGxy0zGIMjPaiCKx
         0z9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781711761; x=1782316561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ERwGw8p2/Jms/iJMYT/dn1PYwf2dRmoIQRea7lQP5Io=;
        b=XL2Y7z5tACBv3/vonjdbOxmCN47e0IGVhMmMI/849gpx2XlEqPx2br9E7soN1n8Y7A
         ZB0h1mDC/0rGAYYa61nuGeAg8wUPn5CuSSaOhvDKuNNkGN3UshDXw0Z1VqOhqTkYVvh+
         Wg1ScqkFQX0VFxLSu2/Vf2tlJU/JjTloWMFbdyGrKoBQymkyVo/oqbOx3eFalaguOFdz
         e7uPQ5wyAYiRGz4lGInRxrSuTXrm19QBLarWULm8/SA4qmQx4Pqb3t1aMxgjk43gCDEG
         8Mqp2tZk/j/+pvvrkJT5GQTuUN13TblF7I9Jj5CELQOHgyhv37zJBHQnEza+KeT1znrR
         r+wg==
X-Forwarded-Encrypted: i=1; AFNElJ9Vr9vKBaPmxyQqF4e5EVlurPI6Q8oN5XjLximg82sR2+FxuG103DAboYj2dhYohrFUSal559onNgA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyixft5FnKd+o0JKs9J4DdhwmkTnQd+QCZNBAvgm8gKDWNPtcQH
	iDroWdpwxlHNdnZ0/mdPOqQHyp2dO+XR4inqfxP7F1l1nfL68BtukVXOMUdp4Tx22Q63vxRnnYQ
	3+tlVEV3HTwHmsaJb9cCJIgWcJJYhJaXv8L1aARyq
X-Gm-Gg: Acq92OGTKX+8orrWW/bSsV0Bv6Mqo0tN87G8HQQgueywamDD9oW0CL2Bj95xRCcpuJH
	u5m/0qZE0laDNwzLBl+xZBFXJJtAaaRXiOc65E8Dj8nYdbg9y8S+p7G3VOW8HXFZZaXB1gKWUqv
	btpQVG/ED9GtdignaE3yIT+Js1px/vKAY7c+LCQfZKjy4mBsdcO/LSahzRzzLAC0rGj0w55eyyc
	dS6YXNqrOCGj6YqZ9PphPjIq0XWLbOw4NmlhVzb4rvmJXqoWN9z2pmsNlQ+lFRzTAAWWUOtMKvB
	jbNh7Ul99wAvCgKs7uagGF0Hdzw=
X-Received: by 2002:a05:622a:4a06:b0:50e:595d:164 with SMTP id
 d75a77b69052e-519aa968720mr11073771cf.8.1781711760128; Wed, 17 Jun 2026
 08:56:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com> <2f9c58f6fd8a81325ec03e19327e03b0b7dca2aa.1781564384.git.abhishekbapat@google.com>
In-Reply-To: <2f9c58f6fd8a81325ec03e19327e03b0b7dca2aa.1781564384.git.abhishekbapat@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 17 Jun 2026 08:55:48 -0700
X-Gm-Features: AVVi8Ccnnkvljr8vqsuHECttm3M8Or1Z6AydADGkWkp28nE9QeppOD0jXeg8YMQ
Message-ID: <CAJuCfpERhK341cxCqoLXEkkUBhP7fQ56U14gDms9rwbkWK1mTw@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] alloc_tag: add ioctl filters to /proc/allocinfo
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 4:04=E2=80=AFPM Abhishek Bapat <abhishekbapat@googl=
e.com> wrote:
>
> Extend the capability of the IOCTL mechanism to filter allocations based
> on tag's module name, function name, file name and line number.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> Acked-by: Hao Ge <hao.ge@linux.dev>

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  include/uapi/linux/alloc_tag.h | 26 ++++++++++++-
>  lib/alloc_tag.c                | 68 ++++++++++++++++++++++++++++++++--
>  2 files changed, 89 insertions(+), 5 deletions(-)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_ta=
g.h
> index 0928e1a48d49..3b11877955b9 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -40,8 +40,32 @@ struct allocinfo_tag_data {
>         struct allocinfo_counter counter;
>  };
>
> +enum {
> +       ALLOCINFO_FILTER_MODNAME,
> +       ALLOCINFO_FILTER_FUNCTION,
> +       ALLOCINFO_FILTER_FILENAME,
> +       ALLOCINFO_FILTER_LINENO,
> +       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_LINENO
> +};
> +
> +#define ALLOCINFO_FILTER_MASK_MODNAME          (1 << ALLOCINFO_FILTER_MO=
DNAME)
> +#define ALLOCINFO_FILTER_MASK_FUNCTION         (1 << ALLOCINFO_FILTER_FU=
NCTION)
> +#define ALLOCINFO_FILTER_MASK_FILENAME         (1 << ALLOCINFO_FILTER_FI=
LENAME)
> +#define ALLOCINFO_FILTER_MASK_LINENO           (1 << ALLOCINFO_FILTER_LI=
NENO)
> +
> +#define ALLOCINFO_FILTER_MASKS \
> +       ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> +
> +struct allocinfo_filter {
> +       __u64 mask; /* bitmask of the filter fields used */
> +       struct allocinfo_tag fields;
> +};
> +
>  struct allocinfo_get_at {
> -       __u64 pos;      /* input */
> +       /* inputs */
> +       __u64 pos;
> +       struct allocinfo_filter filter;
> +       /* output */
>         struct allocinfo_tag_data data;
>  };
>
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index 82e3b5f32dff..5feb61d9fb92 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -49,6 +49,7 @@ struct allocinfo_private {
>         struct codetag_iterator iter;
>         struct codetag_iterator reported_iter;
>         bool print_header;
> +       struct allocinfo_filter filter;
>         /* ioctl uses a separate iterator not to interfere with reads */
>         struct codetag_iterator ioctl_iter;
>         bool positioned; /* seq_open_private() sets to 0 */
> @@ -188,6 +189,12 @@ static void allocinfo_copy_str(char *dest, const cha=
r *src)
>         strscpy_pad(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE);
>  }
>
> +/* Compare two strings and only consider the trimmed suffix if s1 is too=
 long */
> +static int allocinfo_cmp_str(const char *str, const char *template)
> +{
> +       return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SIZE);
> +}
> +
>  /*
>   * Populates the UAPI allocinfo_tag_data structure with active runtime
>   * profiling counters extracted from the given kernel codetag.
> @@ -227,6 +234,40 @@ static int allocinfo_ioctl_get_content_id(struct seq=
_file *m, void __user *arg)
>         return 0;
>  }
>
> +/*
> + * Verifies whether a given codetag satisfies the active filtering crite=
ria by
> + * matching its characteristics against the specified filter.
> + */
> +static bool matches_filter(struct codetag *ct, struct allocinfo_filter *=
filter)
> +{
> +       if (!filter || !filter->mask)
> +               return true;
> +
> +       if (filter->mask & ALLOCINFO_FILTER_MASK_MODNAME) {
> +               /* user wants to filter by modname but ct->modname is NUL=
L */
> +               if (!ct->modname) {
> +                       /* validate if user was attempting to filter for =
built-in allocations */
> +                       if (filter->fields.modname[0] !=3D '\0')
> +                               return false;
> +               } else if (allocinfo_cmp_str(ct->modname, filter->fields.=
modname))
> +                       return false;
> +       }
> +
> +       if ((filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) &&
> +           ct->function && allocinfo_cmp_str(ct->function, filter->field=
s.function))
> +               return false;
> +
> +       if ((filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) &&
> +           ct->filename && allocinfo_cmp_str(ct->filename, filter->field=
s.filename))
> +               return false;
> +
> +       if ((filter->mask & ALLOCINFO_FILTER_MASK_LINENO) &&
> +           ct->lineno !=3D filter->fields.lineno)
> +               return false;
> +
> +       return true;
> +}
> +
>  /*
>   * Seeks the ioctl iterator to the specified 0-indexed tag position, rea=
ds its
>   * profiling data and returns it to userspace.
> @@ -235,29 +276,46 @@ static int allocinfo_ioctl_get_at(struct seq_file *=
m, void __user *arg)
>  {
>         struct allocinfo_private *priv;
>         struct codetag *ct;
> -       __u64 pos;
>         struct allocinfo_get_at params =3D {0};
> +       __u64 skip_count;
>
>         if (copy_from_user(&params, arg, sizeof(params)))
>                 return -EFAULT;
>
> +       if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
> +               return -EINVAL;
> +
>         priv =3D m->private;
> -       pos =3D params.pos;
>
>         mutex_lock(&priv->ioctl_lock);
>         codetag_lock_module_list(alloc_tag_cttype);
>
> -       if (pos >=3D codetag_get_count(alloc_tag_cttype)) {
> +       if (params.pos >=3D codetag_get_count(alloc_tag_cttype)) {
>                 codetag_unlock_module_list(alloc_tag_cttype);
>                 mutex_unlock(&priv->ioctl_lock);
>                 return -ENOENT;
>         }
>
> +       skip_count =3D params.pos;
> +
> +       if (params.filter.mask)
> +               priv->filter =3D params.filter;
> +       else
> +               priv->filter.mask =3D 0;
> +
>         /* Find the codetag */
>         priv->ioctl_iter =3D codetag_get_ct_iter(alloc_tag_cttype);
>         ct =3D codetag_next_ct(&priv->ioctl_iter);
> -       while (ct && pos--)
> +
> +       while (ct) {
> +               if (matches_filter(ct, &priv->filter)) {
> +                       if (skip_count =3D=3D 0)
> +                               break;
> +                       skip_count--;
> +               }
>                 ct =3D codetag_next_ct(&priv->ioctl_iter);
> +       }
> +
>         if (ct) {
>                 allocinfo_to_params(ct, &params.data);
>                 priv->positioned =3D true;
> @@ -298,6 +356,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *=
m, void __user *arg)
>         }
>
>         ct =3D codetag_next_ct(&priv->ioctl_iter);
> +       while (ct && !matches_filter(ct, &priv->filter))
> +               ct =3D codetag_next_ct(&priv->ioctl_iter);
>         if (ct)
>                 allocinfo_to_params(ct, &params);
>
> --
> 2.54.0.1136.gdb2ca164c4-goog
>
