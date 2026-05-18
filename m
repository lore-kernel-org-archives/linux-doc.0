Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF07433BBC5
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 23:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779147852; cv=pass; b=WD3A3RwAOaL78A4S8OZ6XTdbvq2Z+2w/JEwhb7UTOnq6uBg0VdcKkROeEVhPgDX/rtqLclOJTF3VBVtHakOJw14ZIJfjQtZQJXlS6HlfvoFaiANctrBl2t2u0eETBwd/nrl/eJDCtjbebtUqapeVXktW2slnDJgPqi0gL57+lQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779147852; c=relaxed/simple;
	bh=JQuaufZb42cSQT+K2B+eJcLZX3wHEolurYRE/4MEreY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqiKrhmm5qWgMEtZRvKdMAwgC92DTRzOXzj6DssPXAQ3nggQFxUI2evuQ+sFQUp8qc0HU6rsiefXmvl+NpWMOIZBGtUjoKtyQMwSZ+B6i7Asd84Hqcm/gMhoZJhOKvCgqJw1Epjt706yf68iHYK6UyZgosSu22HmCyT36T4StNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iq5Q8Ury; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iq5Q8Ury"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b46da8c48eso215ad.1
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 16:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779147850; cv=none;
        d=google.com; s=arc-20240605;
        b=gDPdfktOyppPg/l5AZioS14FXihMnHe4njjCtvL8zCyFK3+cXONAOzIsGngYtgjcub
         NLHpO5qsHF/EFHjkOUhH3PMWnKUqiPJRWaET7yqE5vlL1cvPRwiKbr5i7NlYBHY+bXju
         l2feqQXHdt8WvYFuwUp+MDbfxxNOZE+mm5gsHgVWJiF4eQcPZrslM0Xxp9hOxCECBUik
         nYind3xMDVgoQx09tWRvozXKdOOP0qsNmjL4zGyo1Do+G52pjdMAcU1QVWYiLoPTjsD0
         K+arQ1xui4UzoLgeXd7kbd90vA6VGqpgrjWNoPRJDlIDBU4LuAYMxpNJXy5xx9GCViyQ
         UjDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vjjrnb0zzLCqFpCp1zPFpzNxaHxcXt90nJobkRgJJ64=;
        fh=Efb21k/1tox3ngMCYtiMAkdt5WO5eBTMlTCECT+tB1w=;
        b=Ozqj86gp85iG3E2PhaYMlB9nIoeGxOUOcba1VJrSSrUFGe0sMb1BrAZhZssMz/mWNn
         CYP2RuyBQPQ2lD4Dq7TKH81kbc/VVdSkUNPYJUZC8Ow0SapVUikILJ24TGXIgMXDc8dh
         jzu/cPmtMuFrpgdXq6b8R6SsoVxbBN0APRLjiDEn5TsJi+uzH0/3uR4ufPJ5A58ZEpgI
         +D0Hc4gbqpvqHeIPWMgVb5Om7RwYSqX/XP/YDevSlEAp1bsu3LbADnOhDGnisb1G42US
         5w0xph4FIhMFbIsXK7GevMDPKt00RW5Pm66weJXvhnwVy7cxQgiXIcCfGHj6ZSziHDdS
         GH2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779147850; x=1779752650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vjjrnb0zzLCqFpCp1zPFpzNxaHxcXt90nJobkRgJJ64=;
        b=iq5Q8Ury6tsnncfExvEBJNp+vy+MCFD3vQKGDKShS893ywDCMTwb0s8UeM6vHRi3f6
         +g7+4RwElOrwLOsEkDdDFOpJmufi+1H8FgS/X5Zhy+z5hfHppDCxUyZxuXq8GutiHulG
         ibRjc7uLLWTfFvzgJveM6Ko6pEIWuCbbIWIxFFeUDWDcd64PFbE8AIKVO4h12inXwBYT
         Rz6LpCnIVAhdR3YLzrk4yoHS8I42xILCWFREhN19JNEejXOB2bRZFZl+wNx/uguDY9k8
         OLehkIGQQuPYqrzUZ8tWlMYFGaDwEMoD55EOgS5R2CZm/Xi0qyNuj+XbxPrfyfJ58kx0
         64zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779147850; x=1779752650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vjjrnb0zzLCqFpCp1zPFpzNxaHxcXt90nJobkRgJJ64=;
        b=WSWFgZ3lMU9nE7Ed2kf7GBlygdilVVX4mir9RBjs4yJbRaoJOp8rczRVX8HPZBoyDW
         1QRzkBnNCyPWYIF6R2nx1/XE2xw/ku+TW2NI52E0QGA5KjZ8ApaY+K5L04TxNlaNjDCb
         9OyJyWfhvH196o3H5PLUZ4gbaCQIOGrBpF2htknFItXvSFLpc1cOVMaJIhYYlLe+RsB/
         gY2xEF3Ey2hrZn3YIU5MkNYKai0ugH2fenIo5BmidcKZ5Xt7dmyzyhvsS4IMslzVOtg7
         bi92ww0fc3RsTLPIHG8v6Et0tfrurNWgnLtNEVXOvqIZg0XsDtg+6XZjOB246vd1hvbw
         cHxw==
X-Forwarded-Encrypted: i=1; AFNElJ+91WP+ThVInfe3NJhofcvGWBrdIlLyxvxOXlL2qpOfAGlSgNJeTFuiKQYHTpbIC7EMY5vz2/D7j+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxKfGUYh3DF7abOhXd7Ez2G+rKpiH++8HdgbKkWqNZt9hH+2kM
	ncAErxz7y0/1gI5oA/7jkGgQjpmuoV1HSpzlw8h6je5JUcwm5zGincjJULkfbel3hSAIIx9n1KT
	ZtQ9/2h46NKa19m7JCtwO2jz5EIp8hMW4IrFvyKWk
X-Gm-Gg: Acq92OGmOyT3qqsZlQnX3h2FP02xbtWK+jTod17e/B48IsZl760RVqZabZTyB/RjEKJ
	P8w4Ze4NdKeukXTArSKkHPq37VrzI4uW7gdQivP/Ia75Uf/DgxRmXUhki4cH1Tx22jheecUFwFb
	jhZ1mhx3KXq3BptCLyMrUBITK9SoUgGw4J170emnkuEdttYPU6hu1AwoQAScZm8TKKL/+7nX/P6
	I8kg+5U/Rxzjg1ClugQMXu5Wq2rvHvN09i12uLp4xJKCRZB8c581/0h0l1bOIWwuPqKl4rAm3Dy
	SvxFIGWhrYY0fJvdPQkv9SpVzpi6aLTxdK5TXbZwGFdNau26
X-Received: by 2002:a17:902:db0b:b0:2bd:6dad:3df8 with SMTP id
 d9443c01a7336-2bdb0410748mr4322435ad.22.1779147849409; Mon, 18 May 2026
 16:44:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777936301.git.abhishekbapat@google.com>
 <06b4fc2457fb4b75eb1ef18320a8722ddb5a850f.1777936301.git.abhishekbapat@google.com>
 <b681fad1-1a27-47fa-b58a-1f639eb3f3d9@linux.dev>
In-Reply-To: <b681fad1-1a27-47fa-b58a-1f639eb3f3d9@linux.dev>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Mon, 18 May 2026 16:43:58 -0700
X-Gm-Features: AVHnY4Jpj1TOqBWxRSpppDVQiGaaapy1D4FbzylwALObYIpRvFGN07LLS_hQngc
Message-ID: <CAL41Mv65WwzdYsehUn9Ciu5PBKrMF6Wyun+BiqdTez9d7c6SRA@mail.gmail.com>
Subject: Re: [PATCH 3/6] alloc_tag: add size-based filtering to ioctl
To: Hao Ge <hao.ge@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 11:54=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Abhishek
>
>
> On 2026/5/5 07:36, Abhishek Bapat wrote:
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
> >   include/uapi/linux/alloc_tag.h |  8 +++++++-
> >   lib/alloc_tag.c                | 15 +++++++++++++++
> >   2 files changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_=
tag.h
> > index 0cc9db5298c6..229068efd24c 100644
> > --- a/include/uapi/linux/alloc_tag.h
> > +++ b/include/uapi/linux/alloc_tag.h
> > @@ -20,6 +20,8 @@ struct allocinfo_tag {
> >       char function[ALLOCINFO_STR_SIZE];
> >       char filename[ALLOCINFO_STR_SIZE];
> >       __u64 lineno;
> > +     __u64 min_size;
> > +     __u64 max_size;
> >   };
>
> allocinfo_tag is used both as a tag identifier in the output data
>
> (allocinfo_tag_data.tag) and as filter criteria
>
> (allocinfo_filter.fields). min_size and max_size are filter
>
> parameters, not tag identity. Also, allocinfo_to_params() does not
>
> fill these fields, so userspace gets zeros in the output, which is
>
> a bit confusing. Might be cleaner to separate filter parameters
>
> from tag identity.
>
> >   struct allocinfo_counter {
> > @@ -39,13 +41,17 @@ enum {
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
> > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > index 7ff936e15e97..98a27c302928 100644
> > --- a/lib/alloc_tag.c
> > +++ b/lib/alloc_tag.c
> > @@ -195,6 +195,9 @@ static int allocinfo_ioctl_get_content_id(struct se=
q_file *m, void __user *arg)
> >
> >   static bool matches_filter(struct codetag *ct, struct allocinfo_filte=
r *filter)
> >   {
> > +     struct alloc_tag *tag;
> > +     struct alloc_tag_counters counters;
> > +
> >       if (!ct || !filter || !filter->mask)
> >               return true;
> >
> > @@ -214,6 +217,18 @@ static bool matches_filter(struct codetag *ct, str=
uct allocinfo_filter *filter)
> >           ct->lineno !=3D filter->fields.lineno)
> >               return false;
> >
> > +     if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) ||
> > +         (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
> > +             tag =3D ct_to_alloc_tag(ct);
> > +             counters =3D alloc_tag_read(tag);
>
> alloc_tag_read() is called twice for matching tags
>
> When size filtering is enabled, matches_filter() calls alloc_tag_read()
>
> to check the size, and then allocinfo_to_params() calls it again to
>
> fill the output data:
>
> matches_filter():
>
>      counters =3D alloc_tag_read(tag);        // 1st read
>
>      if (counters.bytes < min_size)
>
>          return false;
>
> allocinfo_to_params():
>
>      counter =3D alloc_tag_read(tag);         // 2nd read (same tag)
>
>      data->counter.bytes =3D counter.bytes;
>
> For matching tags, the same per-CPU counter aggregation is done twice.
>
> On large machines this is not trivial. Would it make sense to cache
>
> the counters from matches_filter() and reuse them in allocinfo_to_params(=
)?
>
>
> > +             if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> > +                 counters.bytes < filter->fields.min_size)
> > +                     return false;
> > +             if ((filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> > +                 counters.bytes > filter->fields.max_size)
> > +                     return false;
> > +     }
> > +
>
> No validation for min_size > max_size.
>
> If both MIN_SIZE and MAX_SIZE are set but min_size > max_size,
>
> no records will match and the user gets no indication of the
>
> invalid input. This could be checked alongside the existing
>
> mask validation in allocinfo_ioctl_get_at():
>
>      if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
>
>          return -EINVAL;
>
>      +   if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
>
>      +       (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
>
>      +       params.filter.fields.min_size > params.filter.fields.max_siz=
e)
>
>      +            return -EINVAL;
>
> Thanks
>
> Best Regards
>
> Hao
>
Ack, will include in v2.
> >       return true;
> >   }
> >
