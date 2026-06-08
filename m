Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D384037649A
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 20:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780952153; cv=pass; b=RUiXRmATZOsmqnZTyEGU825eUZZ3Qe2v3QqbUD42ZtbMXSKY2hE4rE/oJI0R09ydzqO9QbqrkPWKxUDkH/wPcP5siZ1sa0yR1yAfN8kz807JXiMo4hAG24fvBaW3LDkGYsOk2KEahMmbZ+G8J0wxK+4gnNZtvvWsKoeTI9SCQfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780952153; c=relaxed/simple;
	bh=I7iIFG10NQMfO0VoJBGmDtaivHP0lNYfYKMKkgyeL1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTo03yTGVgmo3wdfkwxykasZWwM/RRlW8d9OCrQ6hJ7KFNX23sH5LiWg1qmgM0MrX2/4ARd6Plq9oONmkTzSgzgBQwJ33PXecXfTU3nNJ4S2xqP+WkgMCOlyj46SBUEQQEPxbNLqMwnmhIlftg5JOSj47h8ZrWDrxi0CIriOixI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F5zEkd+y; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F5zEkd+y"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68bd7ec2371so31829a12.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 13:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780952150; cv=none;
        d=google.com; s=arc-20240605;
        b=ZXNgByUrxrbnQ8K8ix8Kd083Aim5u0jPC80nlOQn49ORdqgQq8H6sNkZWLLyKj5Yin
         VDe6XCyq2+kjHSB8LlKg+yCgEzIsysSjJ2iR8p6MmBrQDwt/sDfQ6OGKqg09C9oAaOD+
         3pjDDbIsHt6FE++2L1MekiaxpR2De58SYJbLuzKKXRZrfPApIbha/AjUEk62iXtoE1To
         uSmSYdtUE7NCFdfIaQ7lL2Y+nGijIR88y2b+6SG+IEeety0y6VCuuaonpzDoyvkQ51LJ
         h60VWFMDsEV9zgFT82ON8BROG1DsSMjpF8LIP+mYT9RGcS24r93ZXDVmRL3IZ+vmqU0X
         eA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RAZgpIOhuy89l4nHzFqDDK0sSW6SMmaa0ddVIDTKLoY=;
        fh=6CQ78VXGLl47vUMu9K3aZ/tRZkGD50fXakyLSoDlu8U=;
        b=GsCd5DVMEZCqkFwPg8LV4viAIoNMms6UXnYiptCQJz0NoEtnk1QhyfueeqHvHIumTA
         a1V3Q1SrDfsAijzuc7Axte6CIBhy4LrocTnpZPsP6LNXw8S9l3egnCWc4/KlYrhgHUBs
         jF/Tg55YMochNF69RYhjgntH/HiqJfKrDCewCfEx53kFj0c+gB5ri25OWznF1D2bnja0
         BAdwu6en+6SW7NuKw6uyNYiBQFV0d9kxliv6Y+3d812eG2BOmVcNRYgbZ9AlLpjoUpfl
         H+f3e38IdLJNDia0ve9NncT7zRXhFLpJ3EU8vqsS9TDITGeFYaXjY9MvOjf638GnhF4Z
         J9Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780952150; x=1781556950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAZgpIOhuy89l4nHzFqDDK0sSW6SMmaa0ddVIDTKLoY=;
        b=F5zEkd+yKEPBWgR5K9Vz5Nnro0wPotgoX2cfmUakzx2z75hJ+sehspAj/u3tiZeOqH
         zMFQ0HMkZIvEROgkWPO5V6bWHCo83GROpn64ALhvl/X6PFKhRgdhOicurDMCBjq+E0CU
         srKLp4jWG3Yx4oOhmEhljvNfQrF2cV1lyIr9vnZt8I3GEt+6cn8xKG1HuhXN+r9eXjUs
         GaOHuGRQ1k3L1iCg8DRQBa1whEif2orxIaMfDnEFYvr8WwLPrZ1ZnPVzKyF7oZuRGY+P
         /dNrNUngc2lvST6uSY/czZ8G7AgYHl7BxJVD7411NevHQ6n3qvomHN6Xy4qj45fb/rPe
         JBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780952150; x=1781556950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RAZgpIOhuy89l4nHzFqDDK0sSW6SMmaa0ddVIDTKLoY=;
        b=LZuUEFV+LVrUtHfW4lbQU2iNQmTtf9UpoPhPNXQBJiIF/rrlozKt+ihMxwwyTOdzmu
         4XAQN6nWksZp8s4mkOwmkBi5vjwtmHXgnuXutTdVikEnTzYD8IfAapnw7wyjWCAhEoY1
         cbwOLiCvXXbhW1RtdxFVVexE7CcSOad+bQcX202mTBKuOa5dJ5luZrEKBkMgftV5y4TM
         90sE/gBmnQz/y5Z5lea5CXxXvSVQmEpw17WWRLpFATnI4up/qYThQOQU0+uaG3EoXOA1
         DXMGwu/Aa48YMXNmKPiy6uAW7m253gS2hbaUrnYOEqxyUiekgS6wTj0l3ZXan9JrGxlM
         NAOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EM3k8epYXrN4TNkmGXL8aI+JNYU7488wgIMcAhBqOSoHiRbIUf4XFFe3ll6meRFtVZg2orefONhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnfW8UwVsu85dZFsEyDZGWuvKuC7UWA2YXqQlmJmDFQC88obDP
	XDLapnyDJ5aSdcmi1smKV9NPMLKVHOJwlgMm90Agx12OGSQ6kg0w+w8mbtRNAkZ5ptJWOdDyi34
	CYxKzgcbIypn3M73velSShoFjLpKyRW93wB/9eTRh
X-Gm-Gg: Acq92OHuzDld6H1z/WJQPnZRRlKVGkEOxIemZrrnfbAsWhSkRpIWIkcSDUri3fO+4b/
	kR5Ni28YHsBvRsT+SaX+jqOKufUmGEcF64Oer3Z5sMLcKoyk1x449ynsNBTMXzt5I/jcB9rwBom
	T2wRHI25q+gB1xtrHE1lnnfhAncj6Zv4PzYHGDO6gADD+x+ThTgDIpx1p567IUUywvOYLIEJ5q7
	H3MfUeZgHlMJhaNMpiB2lic8sDdCKvltdVbpTatjW4lv6jzozJ/mwuq5e48Oi1ahaO5UcuZ1I+1
	c6tyGIErENmubBtM7ZZWvQSxyAU=
X-Received: by 2002:aa7:d952:0:b0:672:117e:55d4 with SMTP id
 4fb4d7f45d1cf-68fe0f40f43mr162696a12.0.1780952149635; Mon, 08 Jun 2026
 13:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780701922.git.abhishekbapat@google.com>
 <b608a6f7d71e3b728f766dbc6dfa1d1753ddcff5.1780701922.git.abhishekbapat@google.com>
 <1ec17313-cd2b-4389-a05d-998757af30b3@linux.dev> <a58e659e-5f54-4511-9a29-dc921002d102@linux.dev>
In-Reply-To: <a58e659e-5f54-4511-9a29-dc921002d102@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 8 Jun 2026 13:55:37 -0700
X-Gm-Features: AVVi8Cdov9dGMj4FbL-YcJWyyyPjXlU7BsBAN55M7jfwf-TpkziPB4nTd6bIPm0
Message-ID: <CAJuCfpHtdd=9D68cfRp4HDHHHCZdzTNP_RH9i2D-f9tJXht56A@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] alloc_tag: add accuracy based filtering to ioctl
To: Hao Ge <hao.ge@linux.dev>
Cc: Abhishek Bapat <abhishekbapat@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 1:25=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
>
> On 2026/6/8 14:22, Hao Ge wrote:
> > Hi Abhishek
> >
> >
> > On 2026/6/6 07:36, Abhishek Bapat wrote:
> >> Extend the allocinfo filtering mechanism to allow users to filter tags
> >> based on their accuracy.
> >>
> >> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> >> ---
> >>   include/uapi/linux/alloc_tag.h | 3 +++
> >>   lib/alloc_tag.c                | 8 ++++++++
> >>   2 files changed, 11 insertions(+)
> >>
> >> diff --git a/include/uapi/linux/alloc_tag.h
> >> b/include/uapi/linux/alloc_tag.h
> >> index 0e648192df4d..42445bdb11c5 100644
> >> --- a/include/uapi/linux/alloc_tag.h
> >> +++ b/include/uapi/linux/alloc_tag.h
> >> @@ -20,6 +20,7 @@ struct allocinfo_tag {
> >>       char function[ALLOCINFO_STR_SIZE];
> >>       char filename[ALLOCINFO_STR_SIZE];
> >>       __u64 lineno;
> >> +    __u64 inaccurate;
> >
> >
> > I was wondering if it would make sense to define inaccurate as a flags
> > field
> >
> > (e.g. __u64 flags with ALLOCINFO_TAG_F_INACCURATE (1 <<0)),
> >
> > so that only bit 0 is used today and the upper bits are reserved for
> > future use,
> >
> > aligning with current kernel codebase.
> >
> > This design also allows for better extensibility if we need to
> >
> > add new flags for any reason in the future.
> >
> > We also need to add flag validity checks if we go this route.
> >
> And I've reviewed the issue reported by Sashiko, and I think it's valid.
>
> When we expand the allocinfo_tag_data structure
>
> struct allocinfo_tag_data{
>
>      char modname[64];
>
>      char function[64];
>
>      char filename[64];
>
>      __u64 lineno;
>
>      __u64 inaccurate;
>
>      __u64 bytes;
>
>      __u64 calls;
>
>      __u8 accurate;
>    /* padding */
>
> }
>
> I think user space may see two fields related to inaccuracy.

Yes but one field (inside allocinfo_tag) is the input parameter which
user provides to specify the filtering criteria and the other is the
returned tag information. It's similar to any other tag attribute
which you can be included in the filters.

>
> How do you like these modifications?
>
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_ta=
g.h
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -20,7 +20,6 @@ struct allocinfo_tag {
>       char function[ALLOCINFO_STR_SIZE];
>       char filename[ALLOCINFO_STR_SIZE];
>       __u64 lineno;
> -    __u64 inaccurate;
>   };
>
>   /* The alignment ensures 32-bit compatible interfaces are not broken */
> @@ -40,7 +39,7 @@ enum {
>       ALLOCINFO_FILTER_FUNCTION,
>       ALLOCINFO_FILTER_FILENAME,
>       ALLOCINFO_FILTER_LINENO,
> -    ALLOCINFO_FILTER_INACCURATE,
> +    ALLOCINFO_FILTER_FLAGS,
>       ALLOCINFO_FILTER_MIN_SIZE,
>       ALLOCINFO_FILTER_MAX_SIZE,
>       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> @@ -50,16 +49,20 @@ enum {
>   #define ALLOCINFO_FILTER_MASK_FUNCTION        (1 <<
> ALLOCINFO_FILTER_FUNCTION)
>   #define ALLOCINFO_FILTER_MASK_FILENAME        (1 <<
> ALLOCINFO_FILTER_FILENAME)
>   #define ALLOCINFO_FILTER_MASK_LINENO        (1 << ALLOCINFO_FILTER_LINE=
NO)
> -#define ALLOCINFO_FILTER_MASK_INACCURATE    (1 <<
> ALLOCINFO_FILTER_INACCURATE)
> +#define ALLOCINFO_FILTER_MASK_FLAGS        (1 << ALLOCINFO_FILTER_FLAGS)
>   #define ALLOCINFO_FILTER_MASK_MIN_SIZE        (1 <<
> ALLOCINFO_FILTER_MIN_SIZE)
>   #define ALLOCINFO_FILTER_MASK_MAX_SIZE        (1 <<
> ALLOCINFO_FILTER_MAX_SIZE)
>
>   #define ALLOCINFO_FILTER_MASKS \
>       ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
>
> +#define ALLOCINFO_FILTER_F_INACCURATE    (1ULL << 0)
> +#define ALLOCINFO_FILTER_FLAGS_ALL ALLOCINFO_FILTER_F_INACCURATE
> +
>   struct allocinfo_filter {
>       __u64 mask; /* bitmask of the filter fields used */
>       struct allocinfo_tag fields;
> +    __u64 flags; /* bitmask of ALLOCINFO_FILTER_F_* */
>       __u64 min_size;
>       __u64 max_size;
>   };
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -249,8 +249,6 @@ static bool matches_filter(struct codetag *ct,
> struct allocinfo_filter *filter,
>                  struct alloc_tag_counters *counters,
>                  bool *fetched_counters)
>   {
> -    bool inaccurate;
> -
>       if (!filter || !filter->mask)
>           return true;
>
> @@ -277,10 +275,11 @@ static bool matches_filter(struct codetag *ct,
> struct allocinfo_filter *filter,
>           ct->lineno !=3D filter->fields.lineno)
>           return false;
>
> -    if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
> -        inaccurate =3D !!(ct->flags & CODETAG_FLAG_INACCURATE);
> -        if (inaccurate !=3D !!(filter->fields.inaccurate))
> -            return false;
> +    if (filter->mask & ALLOCINFO_FILTER_MASK_FLAGS) {
> +        if (filter->flags & ALLOCINFO_FILTER_F_INACCURATE) {
> +            if (!(ct->flags & CODETAG_FLAG_INACCURATE))

How would you filter records which have only accurate data?

Overall I would prefer ALLOCINFO_FILTER_MASK_INACCURATE rather than
ALLOCINFO_FILTER_MASK_FLAGS. The fact that this attribute is a
single-bit flag is a technical detail. It's still a tag attribuite
like file and module names and IMO deserves its own filter.



> +                return false;
> +        }
>       }
>
>       if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE |
> ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
> @@ -318,6 +317,10 @@ static int allocinfo_ioctl_get_at(struct seq_file
> *m, void __user *arg)
>       if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
>           return -EINVAL;
>
> +    if ((params.filter.mask & ALLOCINFO_FILTER_MASK_FLAGS) &&
> +        (params.filter.flags & ~ALLOCINFO_FILTER_FLAGS_ALL))
> +        return -EINVAL;
> +
>       if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
>           (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
>           params.filter.min_size > params.filter.max_size)
>
>
> Thanks
>
> Best Regards
>
> Hao
>
>
> >
> > Thanks
> >
> > Best Regards
> >
> > Hao
> >
> >
> >>   };
> >>     /* The alignment ensures 32-bit compatible interfaces are not
> >> broken */
> >> @@ -39,6 +40,7 @@ enum {
> >>       ALLOCINFO_FILTER_FUNCTION,
> >>       ALLOCINFO_FILTER_FILENAME,
> >>       ALLOCINFO_FILTER_LINENO,
> >> +    ALLOCINFO_FILTER_INACCURATE,
> >>       ALLOCINFO_FILTER_MIN_SIZE,
> >>       ALLOCINFO_FILTER_MAX_SIZE,
> >>       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> >> @@ -48,6 +50,7 @@ enum {
> >>   #define ALLOCINFO_FILTER_MASK_FUNCTION        (1 <<
> >> ALLOCINFO_FILTER_FUNCTION)
> >>   #define ALLOCINFO_FILTER_MASK_FILENAME        (1 <<
> >> ALLOCINFO_FILTER_FILENAME)
> >>   #define ALLOCINFO_FILTER_MASK_LINENO        (1 <<
> >> ALLOCINFO_FILTER_LINENO)
> >> +#define ALLOCINFO_FILTER_MASK_INACCURATE    (1 <<
> >> ALLOCINFO_FILTER_INACCURATE)
> >>   #define ALLOCINFO_FILTER_MASK_MIN_SIZE        (1 <<
> >> ALLOCINFO_FILTER_MIN_SIZE)
> >>   #define ALLOCINFO_FILTER_MASK_MAX_SIZE        (1 <<
> >> ALLOCINFO_FILTER_MAX_SIZE)
> >>   diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> >> index ddc6946f56ab..cbcd12c4ef9c 100644
> >> --- a/lib/alloc_tag.c
> >> +++ b/lib/alloc_tag.c
> >> @@ -249,6 +249,8 @@ static bool matches_filter(struct codetag *ct,
> >> struct allocinfo_filter *filter,
> >>                  struct alloc_tag_counters *counters,
> >>                  bool *fetched_counters)
> >>   {
> >> +    bool inaccurate;
> >> +
> >>       if (!filter || !filter->mask)
> >>           return true;
> >>   @@ -275,6 +277,12 @@ static bool matches_filter(struct codetag *ct,
> >> struct allocinfo_filter *filter,
> >>           ct->lineno !=3D filter->fields.lineno)
> >>           return false;
> >>   +    if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
> >> +        inaccurate =3D !!(ct->flags & CODETAG_FLAG_INACCURATE);
> >> +        if (inaccurate !=3D !!(filter->fields.inaccurate))
> >> +            return false;
> >> +    }
> >> +
> >>       if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE |
> >> ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
> >>           if (!*fetched_counters) {
> >>               *counters =3D allocinfo_prefetch_counters(ct);
