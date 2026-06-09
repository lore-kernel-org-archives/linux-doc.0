Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C8F382374
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 20:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038410; cv=pass; b=DB3taPHrx/IjFWBOSbaCcha+PD2nRWV5GW4W2N5eBMkZKFUeyM7JaLywnZs9uYSGYA+dcnHtLGPi1TAp5ewucrcA0uDbXS5UQ/YCxrAai+mAt077VfzJfpsau6ucVe8vphGWHASfBFk0cAV8B2lWz9GqIL5XpKnO55MHJOrEv2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038410; c=relaxed/simple;
	bh=ShToL7Atw4J6Owi3Dn7CmEnwZlXr6wCEVWj67kGZsuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Li8wZ8WEHu2Dp93en5gNlfu+FIHD9L3llPW+HHRqOVT8k7OGu5LqcRJZQG4MT0YIkdbNpxibOf93PHhzQz+eXN3jyDSgOCapikUzsFWy5NP+cvBZpX3a6qbBHnevcSkflwD7FOjQCy63zwUHokHBNcap0oT4f31EPK6aJRn80Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rwQyFE2x; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rwQyFE2x"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf2911f93cso3655ad.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 13:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781038407; cv=none;
        d=google.com; s=arc-20240605;
        b=ZZdABsJwFxm+TKVrgD/VXCjXyS/8M+MTq4bmkL63u2ZjNEnLTmozOv3vECZaKOuzQ2
         lx/hwNkSaMbeAHVQWHditmgFbuSvXzNArNBQCKcNGhgmX5eijEO47iwdVydQ6+XpIUtz
         KM0a+RO6NkSbYdh2IkIwAPekuysC/z5cEZJN8ukqcjGwexUGuv3dGxtVawSz/xpBjyVr
         gnw09m4UYe1kCbb0UrUTXbHH+E1//2i8x3ujb5BlugljrtLUjN+zY/LPEuP2a3IpPePx
         tvoR9EkBSsW/bsDl5wRGVu71AKflOFw7qFBa/R3TzeuFJq73XCCja5lqiRvUF6mfZro2
         Z+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ciPLz0BxzGV6iVw62tuwMuRgsc1E7ocBiaZ0b0Nuy6o=;
        fh=GSG0gl3x48JeJnJK4bVdHkuFZd8KI4njna4bdgi379s=;
        b=MHrdf3nsKy9ILKOyeL3kAYhAsK3jsXcUUnBRhpGfj7dNA7A5Or1i7p5kTXMcOfUW4A
         rfXWzorKyuF6xAIYVU5pjOxF11M7Xd6qmr9gwnT6K7qbEWxi2L8yidwyRePlOUC/N3oF
         ZO0atjeJIEi7jnkIJTTg6lZwA8qqJUac4lQIvrSup8r4b1tkykxa8kE0XVRIvqAzz3/n
         Tfib9sZFk6rplts+ylpegPmflGuHEXdWjvhRWNZv7CtQYQFSshxXni7eojNN1demkPhq
         XkFa7biCEzOjJ9X1LY4A0L+R32YqA/U3F8vAo8uxCZin2lI0xBe5PWCDb5nRBP6UUX8G
         ppnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781038407; x=1781643207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciPLz0BxzGV6iVw62tuwMuRgsc1E7ocBiaZ0b0Nuy6o=;
        b=rwQyFE2xfi3L2euRfbE7DDKODF8oMmTcD96dfHnkoVMRvIognOxSW1ejqG6K+PhWBL
         yAR9qw7+eWywExDDmkOUfRmY8+g2PuxMz4dXQwRRPp+/3D374g3KUFxbs8AkVuWY+DPN
         bImR0SQpnW8q5noUDBpPPw8LBpCGgle3ZPiCQqIHT3RB5XOjVEh6xxCQHu0efvlZ8OWN
         P41HZzi0XyWVyABqLn3IRKo40xp9qPfs3sggexuLe9v1cuLd5sRyCfT5Cs8QE/jxPx+I
         D4J3djIq0xMEQ5u1BkuHF61ceTOKpdMAMEMuLDx+ctqfUgyq8T4XryaLD2YYUPx9/iXu
         zWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038407; x=1781643207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ciPLz0BxzGV6iVw62tuwMuRgsc1E7ocBiaZ0b0Nuy6o=;
        b=dnYCJWavq61JKKB9n+Kaz6c5Iqeuzi9aR0NLN/DfUwVQ+O3EfKRboOmo3h8vDVNk8S
         ZHLhcFZBAEyUOgphNeqLL0mI69FXxNJYmrZvMqTtXyfg6wBj+ONeViHqizWlhn3gh6Vn
         m5GBqtTvHkej2GdoUspw73Fq8TkdEULNBGZ9LFEyNNwMi9gg4dTn2G4IMCKZeR+ejUBb
         SS35IowN4PQ34JpRo7MR4GzrqvVWlG/SWJZmnLfeptPl9c2kyTlZ23Htk/XSf246Jqyc
         Xpd7Wu3N8VqCoW0j9k0QaidLznXN3jUnA4Lza1w98v2v5kzz3//K8a9CV/Tl5u/zdzAu
         3KkA==
X-Forwarded-Encrypted: i=1; AFNElJ+hC9eSnRjsMsJb/eyaig11KPNwpyGRJVoi8xlcD1j0XwcTlorJEiBQJl1K5koBKePP/nlCPBK5TW8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7vhe1mcwwTmdcBELbGX5kRyMqgUumjIAkdj73qCfINUNIqPWs
	C8Kju9qsp9gi8Rr/wtvTiGIDXp1+83Eq7mK2Kie5HgIlG+iL3HQkOa0dDi+tzEmRWMPb28s0JlT
	Pe2+pRIUX+NIsbdS7cHcqTlbmifmTIK0CwdTwMtA6
X-Gm-Gg: Acq92OHv6DVL6gIO9+ER+hP/DLYmPmL8VXNWIP4949pnYCp/IETWpNdygKt7jBK38Kj
	ydvF28DP+0eQLOK8JHry1kyINJRBbFGKhglKJZ/d46HEg+38HmprwyvLQx0XViLU6l19C/UVRSJ
	/waXrvyqGMI6ZteZEWeao32JMb6USe7qJtd1z+mzM8xMTgch7NDNLbsFU+bRp++VBTJGOnt+qDy
	wAyGSS0NUcrXJku9fogHV6tNlEg8dvSUkOiuF3nE0tDIiNl5DPOsD4s61XGb1DCg4bgG4SnkOPF
	XuCNTUqThLrG3c5YnweD4qYlwMaXeipF8c8oi2QRsh3bmNb43Xys+guy9EE=
X-Received: by 2002:a17:903:2283:b0:2c0:b19c:2e10 with SMTP id
 d9443c01a7336-2c1ea96cbb5mr8374015ad.0.1781038406624; Tue, 09 Jun 2026
 13:53:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780701922.git.abhishekbapat@google.com>
 <b608a6f7d71e3b728f766dbc6dfa1d1753ddcff5.1780701922.git.abhishekbapat@google.com>
 <1ec17313-cd2b-4389-a05d-998757af30b3@linux.dev> <a58e659e-5f54-4511-9a29-dc921002d102@linux.dev>
 <CAJuCfpHtdd=9D68cfRp4HDHHHCZdzTNP_RH9i2D-f9tJXht56A@mail.gmail.com>
 <ebcbe4a8-127b-4d12-83f1-dec93f0a9c61@linux.dev> <CAJuCfpGbxO0zu_UAWCYNNv8RHgT=E4AF0tgG-kWoLXECOL3byA@mail.gmail.com>
In-Reply-To: <CAJuCfpGbxO0zu_UAWCYNNv8RHgT=E4AF0tgG-kWoLXECOL3byA@mail.gmail.com>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Tue, 9 Jun 2026 13:53:14 -0700
X-Gm-Features: AVVi8Cfn78ORqX4oA_nr5VyV7O6esWdCgDaXx8ANezh2vF1JBG6XK4Z31C3kswU
Message-ID: <CAL41Mv7pdX-m8rOQE+PjwTUkXi4x5FffR=6Yjhe2N7-DBaR2VA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] alloc_tag: add accuracy based filtering to ioctl
To: Suren Baghdasaryan <surenb@google.com>
Cc: Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 7:41=E2=80=AFAM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Mon, Jun 8, 2026 at 6:26=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
> >
> > Hi Suren
> >
> >
> > On 2026/6/9 04:55, Suren Baghdasaryan wrote:
> > > On Mon, Jun 8, 2026 at 1:25=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrot=
e:
> > >>
> > >> On 2026/6/8 14:22, Hao Ge wrote:
> > >>> Hi Abhishek
> > >>>
> > >>>
> > >>> On 2026/6/6 07:36, Abhishek Bapat wrote:
> > >>>> Extend the allocinfo filtering mechanism to allow users to filter =
tags
> > >>>> based on their accuracy.
> > >>>>
> > >>>> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > >>>> ---
> > >>>>    include/uapi/linux/alloc_tag.h | 3 +++
> > >>>>    lib/alloc_tag.c                | 8 ++++++++
> > >>>>    2 files changed, 11 insertions(+)
> > >>>>
> > >>>> diff --git a/include/uapi/linux/alloc_tag.h
> > >>>> b/include/uapi/linux/alloc_tag.h
> > >>>> index 0e648192df4d..42445bdb11c5 100644
> > >>>> --- a/include/uapi/linux/alloc_tag.h
> > >>>> +++ b/include/uapi/linux/alloc_tag.h
> > >>>> @@ -20,6 +20,7 @@ struct allocinfo_tag {
> > >>>>        char function[ALLOCINFO_STR_SIZE];
> > >>>>        char filename[ALLOCINFO_STR_SIZE];
> > >>>>        __u64 lineno;
> > >>>> +    __u64 inaccurate;
> > >>>
> > >>> I was wondering if it would make sense to define inaccurate as a fl=
ags
> > >>> field
> > >>>
> > >>> (e.g. __u64 flags with ALLOCINFO_TAG_F_INACCURATE (1 <<0)),
> > >>>
> > >>> so that only bit 0 is used today and the upper bits are reserved fo=
r
> > >>> future use,
> > >>>
> > >>> aligning with current kernel codebase.
> > >>>
> > >>> This design also allows for better extensibility if we need to
> > >>>
> > >>> add new flags for any reason in the future.
> > >>>
> > >>> We also need to add flag validity checks if we go this route.
> > >>>
> > >> And I've reviewed the issue reported by Sashiko, and I think it's va=
lid.
> > >>
> > >> When we expand the allocinfo_tag_data structure
> > >>
> > >> struct allocinfo_tag_data{
> > >>
> > >>       char modname[64];
> > >>
> > >>       char function[64];
> > >>
> > >>       char filename[64];
> > >>
> > >>       __u64 lineno;
> > >>
> > >>       __u64 inaccurate;
> > >>
> > >>       __u64 bytes;
> > >>
> > >>       __u64 calls;
> > >>
> > >>       __u8 accurate;
> > >>     /* padding */
> > >>
> > >> }
> > >>
> > >> I think user space may see two fields related to inaccuracy.
> > > Yes but one field (inside allocinfo_tag) is the input parameter which
> > > user provides to specify the filtering criteria and the other is the
> > > returned tag information. It's similar to any other tag attribute
> > > which you can be included in the filters.
> > >
> > >> How do you like these modifications?
> > >>
> > >>
> > >> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/all=
oc_tag.h
> > >> --- a/include/uapi/linux/alloc_tag.h
> > >> +++ b/include/uapi/linux/alloc_tag.h
> > >> @@ -20,7 +20,6 @@ struct allocinfo_tag {
> > >>        char function[ALLOCINFO_STR_SIZE];
> > >>        char filename[ALLOCINFO_STR_SIZE];
> > >>        __u64 lineno;
> > >> -    __u64 inaccurate;
> > >>    };
> > >>
> > >>    /* The alignment ensures 32-bit compatible interfaces are not bro=
ken */
> > >> @@ -40,7 +39,7 @@ enum {
> > >>        ALLOCINFO_FILTER_FUNCTION,
> > >>        ALLOCINFO_FILTER_FILENAME,
> > >>        ALLOCINFO_FILTER_LINENO,
> > >> -    ALLOCINFO_FILTER_INACCURATE,
> > >> +    ALLOCINFO_FILTER_FLAGS,
> > >>        ALLOCINFO_FILTER_MIN_SIZE,
> > >>        ALLOCINFO_FILTER_MAX_SIZE,
> > >>        __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> > >> @@ -50,16 +49,20 @@ enum {
> > >>    #define ALLOCINFO_FILTER_MASK_FUNCTION        (1 <<
> > >> ALLOCINFO_FILTER_FUNCTION)
> > >>    #define ALLOCINFO_FILTER_MASK_FILENAME        (1 <<
> > >> ALLOCINFO_FILTER_FILENAME)
> > >>    #define ALLOCINFO_FILTER_MASK_LINENO        (1 << ALLOCINFO_FILTE=
R_LINENO)
> > >> -#define ALLOCINFO_FILTER_MASK_INACCURATE    (1 <<
> > >> ALLOCINFO_FILTER_INACCURATE)
> > >> +#define ALLOCINFO_FILTER_MASK_FLAGS        (1 << ALLOCINFO_FILTER_F=
LAGS)
> > >>    #define ALLOCINFO_FILTER_MASK_MIN_SIZE        (1 <<
> > >> ALLOCINFO_FILTER_MIN_SIZE)
> > >>    #define ALLOCINFO_FILTER_MASK_MAX_SIZE        (1 <<
> > >> ALLOCINFO_FILTER_MAX_SIZE)
> > >>
> > >>    #define ALLOCINFO_FILTER_MASKS \
> > >>        ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> > >>
> > >> +#define ALLOCINFO_FILTER_F_INACCURATE    (1ULL << 0)
> > >> +#define ALLOCINFO_FILTER_FLAGS_ALL ALLOCINFO_FILTER_F_INACCURATE
> > >> +
> > >>    struct allocinfo_filter {
> > >>        __u64 mask; /* bitmask of the filter fields used */
> > >>        struct allocinfo_tag fields;
> > >> +    __u64 flags; /* bitmask of ALLOCINFO_FILTER_F_* */
> > >>        __u64 min_size;
> > >>        __u64 max_size;
> > >>    };
> > >> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > >> --- a/lib/alloc_tag.c
> > >> +++ b/lib/alloc_tag.c
> > >> @@ -249,8 +249,6 @@ static bool matches_filter(struct codetag *ct,
> > >> struct allocinfo_filter *filter,
> > >>                   struct alloc_tag_counters *counters,
> > >>                   bool *fetched_counters)
> > >>    {
> > >> -    bool inaccurate;
> > >> -
> > >>        if (!filter || !filter->mask)
> > >>            return true;
> > >>
> > >> @@ -277,10 +275,11 @@ static bool matches_filter(struct codetag *ct,
> > >> struct allocinfo_filter *filter,
> > >>            ct->lineno !=3D filter->fields.lineno)
> > >>            return false;
> > >>
> > >> -    if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
> > >> -        inaccurate =3D !!(ct->flags & CODETAG_FLAG_INACCURATE);
> > >> -        if (inaccurate !=3D !!(filter->fields.inaccurate))
> > >> -            return false;
> > >> +    if (filter->mask & ALLOCINFO_FILTER_MASK_FLAGS) {
> > >> +        if (filter->flags & ALLOCINFO_FILTER_F_INACCURATE) {
> > >> +            if (!(ct->flags & CODETAG_FLAG_INACCURATE))
> > > How would you filter records which have only accurate data?
> >
> >
> > Sorry, I overlooked this case.
> >
> > Since allocinfo_tag_data exposes both inaccurate (from allocinfo_tag) a=
nd
> >
> > accurate (from allocinfo_counter), userspace developers might mistakenl=
y
> > read
> >
> > inaccurate instead of accurate when checking accuracy.
> >
> > How about we add a comment to clarify?
> >
> > struct allocinfo_tag {
> >
> >      /* ... */
> >
> >      __u64 lineno;
> >
> >      /* filter criteria only; see allocinfo_counter.accurate for actual
> > accuracy */
> >
> >      __u64 inaccurate;
>
> I think we had comments showing which block of parameters are inputs
> and which ones are outputs but I'm not opposed to an additional
> reminder here.
>
Ack, I'll include the recommended comment.
> >
> > };
> >
> >
> > LGTM for the rest.
> >
> >
> > Thanks
> >
> > Best Regards
> >
> > Hao
> >
> > > Overall I would prefer ALLOCINFO_FILTER_MASK_INACCURATE rather than
> > > ALLOCINFO_FILTER_MASK_FLAGS. The fact that this attribute is a
> > > single-bit flag is a technical detail. It's still a tag attribuite
> > > like file and module names and IMO deserves its own filter.
> > >
> > >
> > >
> > >> +                return false;
> > >> +        }
> > >>        }
> > >>
> > >>        if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE |
> > >> ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
> > >> @@ -318,6 +317,10 @@ static int allocinfo_ioctl_get_at(struct seq_fi=
le
> > >> *m, void __user *arg)
> > >>        if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
> > >>            return -EINVAL;
> > >>
> > >> +    if ((params.filter.mask & ALLOCINFO_FILTER_MASK_FLAGS) &&
> > >> +        (params.filter.flags & ~ALLOCINFO_FILTER_FLAGS_ALL))
> > >> +        return -EINVAL;
> > >> +
> > >>        if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> > >>            (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> > >>            params.filter.min_size > params.filter.max_size)
> > >>
> > >>
> > >> Thanks
> > >>
> > >> Best Regards
> > >>
> > >> Hao
> > >>
> > >>
> > >>> Thanks
> > >>>
> > >>> Best Regards
> > >>>
> > >>> Hao
> > >>>
> > >>>
> > >>>>    };
> > >>>>      /* The alignment ensures 32-bit compatible interfaces are not
> > >>>> broken */
> > >>>> @@ -39,6 +40,7 @@ enum {
> > >>>>        ALLOCINFO_FILTER_FUNCTION,
> > >>>>        ALLOCINFO_FILTER_FILENAME,
> > >>>>        ALLOCINFO_FILTER_LINENO,
> > >>>> +    ALLOCINFO_FILTER_INACCURATE,
> > >>>>        ALLOCINFO_FILTER_MIN_SIZE,
> > >>>>        ALLOCINFO_FILTER_MAX_SIZE,
> > >>>>        __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> > >>>> @@ -48,6 +50,7 @@ enum {
> > >>>>    #define ALLOCINFO_FILTER_MASK_FUNCTION        (1 <<
> > >>>> ALLOCINFO_FILTER_FUNCTION)
> > >>>>    #define ALLOCINFO_FILTER_MASK_FILENAME        (1 <<
> > >>>> ALLOCINFO_FILTER_FILENAME)
> > >>>>    #define ALLOCINFO_FILTER_MASK_LINENO        (1 <<
> > >>>> ALLOCINFO_FILTER_LINENO)
> > >>>> +#define ALLOCINFO_FILTER_MASK_INACCURATE    (1 <<
> > >>>> ALLOCINFO_FILTER_INACCURATE)
> > >>>>    #define ALLOCINFO_FILTER_MASK_MIN_SIZE        (1 <<
> > >>>> ALLOCINFO_FILTER_MIN_SIZE)
> > >>>>    #define ALLOCINFO_FILTER_MASK_MAX_SIZE        (1 <<
> > >>>> ALLOCINFO_FILTER_MAX_SIZE)
> > >>>>    diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > >>>> index ddc6946f56ab..cbcd12c4ef9c 100644
> > >>>> --- a/lib/alloc_tag.c
> > >>>> +++ b/lib/alloc_tag.c
> > >>>> @@ -249,6 +249,8 @@ static bool matches_filter(struct codetag *ct,
> > >>>> struct allocinfo_filter *filter,
> > >>>>                   struct alloc_tag_counters *counters,
> > >>>>                   bool *fetched_counters)
> > >>>>    {
> > >>>> +    bool inaccurate;
> > >>>> +
> > >>>>        if (!filter || !filter->mask)
> > >>>>            return true;
> > >>>>    @@ -275,6 +277,12 @@ static bool matches_filter(struct codetag =
*ct,
> > >>>> struct allocinfo_filter *filter,
> > >>>>            ct->lineno !=3D filter->fields.lineno)
> > >>>>            return false;
> > >>>>    +    if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
> > >>>> +        inaccurate =3D !!(ct->flags & CODETAG_FLAG_INACCURATE);
> > >>>> +        if (inaccurate !=3D !!(filter->fields.inaccurate))
> > >>>> +            return false;
> > >>>> +    }
> > >>>> +
> > >>>>        if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE |
> > >>>> ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
> > >>>>            if (!*fetched_counters) {
> > >>>>                *counters =3D allocinfo_prefetch_counters(ct);
