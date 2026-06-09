Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29E2352017
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016078; cv=pass; b=RzA279H8iAyIfFePiHlJfME3zElxzmlqLBsTuivEbW4RRs+pbJzG8f88S3PZxpkx1Ep59t/7wjw2D3q4UwrllHSU+iLuTId02Whob6odGzqAWjtjk7yH1xt1CZIVbpdgA4Kr3i6xSe+BFi7eRKCZxb0gasvNQd4o6AQG8Jqr6nY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016078; c=relaxed/simple;
	bh=vkYMiT15IDgP+UyvD48tHe2RSv3IfqAlFEWxzpklv7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WjnzkyEB8ztKxbdYiddLjDN97R1K7IaudtMcdK/cHNYtmdPc723mZa1ZocAj+QXhPj3zEmCvKHPsiexoaUbpo3qJSN8C2AQaHbgL8tdyZEknDisRbF8Brjo6cJ1ffS5HZswXT1aJFMc8ZeRic9t0kJiPU/D6IDqiIRE+WCpe9mY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yx8SDW2Z; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yx8SDW2Z"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5177d1ff061so2300871cf.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:41:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781016075; cv=none;
        d=google.com; s=arc-20240605;
        b=FfXSPtzN+tDTFS921n8YkUDVRu12YGDyPmqv8EgkK9cG0fW8BedxPHsSOi1IKLfWWX
         ftFq1D9Co0sINrWRsUEQOkfZsPEk0SRCQActTAttX2XKaF0/e3hxRoqhBp48keZQEvwJ
         1Jb0TwRRdKxNh7Yy1dCZ0MKZDx+umqMmLk4pZ6gaNCJLqLaSRKFPE5hTaA/zxbFAOpas
         edKvzey9/XCHptrrQvzPSH95trdDpiWJ9xR01uStT6QZhC9jdbb3njKKFOQSBubdik5n
         FllwkAI6JCECnVOVe8XW/2JB27iNka348dAOxJ8sqJLNy1JPNv3byhDeT2DP8n8AcwDw
         waHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cs6tgEzoVHYpv7k21ybqH49sF46z7hX0J0ePiR98zrw=;
        fh=oCn0eNBkV2YHDfwN8dP3BUyKrCupMJSbLX90oLdKxcg=;
        b=W09gkH373BVoRgijh6xS3Y86lu1heBx94UlcDgGHjj0sPRp/pm7BA70TpnkQC+BuCk
         MZAIrmN8yriLJKXDHFTHXNZsO5nsLt7nUS1iXCg+njDOxupI2S+uaGSHxaL6gvpGA5Cx
         fnBi+1YSDPkpdREXGEC7Y7N7YFxvEWbcjKZHyeU63ZPFAGVkt02fFEwwnoDp9W9tVWqa
         twKTH+W/86SxIdh0yRN30jg0rp7L5+nCxv2bB3G2rrEOBPUy9eZnkGzM/ejMk4bkdHdX
         eCMGiBT616xdailPD0oIIvftQXI2PaNuxLLfjKZyMBY1EgyIpih1OncT15nvZEI0gud/
         tkxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781016075; x=1781620875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs6tgEzoVHYpv7k21ybqH49sF46z7hX0J0ePiR98zrw=;
        b=Yx8SDW2Z6utMLswVPGCnmTS6LZk8w5ASde6KP2N1gdUxn0c1hdhgfra9nRXklnziFn
         A7pmU1TCRz0wJawW9cOYa7lYOlsyU/WV/TWL2jqAUu2H3Vu6hl9sJ7lfgaGJ6IKjoy0x
         aEuBWbz/06K5RfW6W5hiD5bj7uD2kghsbnaeJjlAhVIXtqPNbg1gUPch3Y58/RfgDyCr
         x0SxtyNWu0j5Ah2kL7XiJKjUwpR/egTKQawKLpbmZAMEafmkTiQ4NxxMv5eYH81+xEFb
         tTNWTFS5Wym0zjndlZD7PxwniaVffs/Mjst3Bp5smJoZflA55XWpz92IU6fwFWdQOIi9
         iFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016075; x=1781620875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cs6tgEzoVHYpv7k21ybqH49sF46z7hX0J0ePiR98zrw=;
        b=A4v3A/zmW1Yl6PLNg1x4ccbO9nsU/ZyzY1zSjwapMaT754+UnY2/tZezIMHmae4hpi
         sqtoF5Yrkdp9Lnr+X60eW+KE4BkNDcgE/xUs+WZD+eIOWLPp4WGu0GZ5Z5nRd1tx5nPB
         nxy+3/j3ECefZqSC4ZCKhb4CVZmZAtI+8AxRQxtdP3ye6tb6C6vqhXTONHyJ7zUGqW8y
         BylhHjElS6GPhCfKj2ikpAz4hjZW23c/4aI+WEkiF3ZdcJEzWE/kvWb8aYXOsIpoldMj
         t2UuqMBdClRQILK0a/amL6wVpflYXaKNICVacKMf7vfJfqXAcY5/a2S7N4OfnUAHY9IX
         zDNA==
X-Forwarded-Encrypted: i=1; AFNElJ8FhmhCJ/JvgrrbASGqnFZY0CrBNMJt61ELaa0DpypOvxS8XColwaJuNSJhGlSWz3V4G1CFIpXY/BI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPoT4o85qZVRYr116fDCAPXK4bLZ14t5gSEmrI/AuG9UE/CNwm
	g5Sryt760ELz3P6t65xiI4Ovgt7VHQseauGKMMHG4AJ2yqwmMrLJ+/QWAA7CZWnOUVWD6qfU/Wi
	QqpCPv9pwAQZ7I7CTNNTgSyMTnYUQmQLtPXACCWLe
X-Gm-Gg: Acq92OHODBkDHGyu8vSewl5eRngbVMOh7o60JHARBv449K3gqr7G4OKJgt/tJK/Po50
	1DZ+Eb9/hROkxh+l4XkGghqleoOA5uGUUvbB5YOVxIf4zuVRwuFQI2V1t8mknoph009OX47Qbke
	xXtUjQbKA3l6rMzPOWC3jR+akF7P13sxWdLbiXVl3TT1QmA84kfz/4MGdYdVazjfnOgNfE3FoIG
	7jLGESPFHJ5COOpGSO4x9GrPGfwfjiv2O7h96oThE2kaXonypbIKG8SxgVQUd8uxV4VA6wvtFEA
	5uk2PlGKEZwWxsw/pRdirs2vlwgR+yvBwPcfvrWVDR3dFX3h
X-Received: by 2002:a05:622a:aa4a:20b0:517:5ec3:b59c with SMTP id
 d75a77b69052e-51798027065mr33863531cf.2.1781016074112; Tue, 09 Jun 2026
 07:41:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780701922.git.abhishekbapat@google.com>
 <b608a6f7d71e3b728f766dbc6dfa1d1753ddcff5.1780701922.git.abhishekbapat@google.com>
 <1ec17313-cd2b-4389-a05d-998757af30b3@linux.dev> <a58e659e-5f54-4511-9a29-dc921002d102@linux.dev>
 <CAJuCfpHtdd=9D68cfRp4HDHHHCZdzTNP_RH9i2D-f9tJXht56A@mail.gmail.com> <ebcbe4a8-127b-4d12-83f1-dec93f0a9c61@linux.dev>
In-Reply-To: <ebcbe4a8-127b-4d12-83f1-dec93f0a9c61@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 9 Jun 2026 07:41:01 -0700
X-Gm-Features: AVVi8Cd8Mw9UFnLHYjZB_VFyvF_jL4KOSZdNa8eQSyaG7dF5Q3xsZiPC-kanxu4
Message-ID: <CAJuCfpGbxO0zu_UAWCYNNv8RHgT=E4AF0tgG-kWoLXECOL3byA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] alloc_tag: add accuracy based filtering to ioctl
To: Hao Ge <hao.ge@linux.dev>
Cc: Abhishek Bapat <abhishekbapat@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 6:26=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Suren
>
>
> On 2026/6/9 04:55, Suren Baghdasaryan wrote:
> > On Mon, Jun 8, 2026 at 1:25=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
> >>
> >> On 2026/6/8 14:22, Hao Ge wrote:
> >>> Hi Abhishek
> >>>
> >>>
> >>> On 2026/6/6 07:36, Abhishek Bapat wrote:
> >>>> Extend the allocinfo filtering mechanism to allow users to filter ta=
gs
> >>>> based on their accuracy.
> >>>>
> >>>> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> >>>> ---
> >>>>    include/uapi/linux/alloc_tag.h | 3 +++
> >>>>    lib/alloc_tag.c                | 8 ++++++++
> >>>>    2 files changed, 11 insertions(+)
> >>>>
> >>>> diff --git a/include/uapi/linux/alloc_tag.h
> >>>> b/include/uapi/linux/alloc_tag.h
> >>>> index 0e648192df4d..42445bdb11c5 100644
> >>>> --- a/include/uapi/linux/alloc_tag.h
> >>>> +++ b/include/uapi/linux/alloc_tag.h
> >>>> @@ -20,6 +20,7 @@ struct allocinfo_tag {
> >>>>        char function[ALLOCINFO_STR_SIZE];
> >>>>        char filename[ALLOCINFO_STR_SIZE];
> >>>>        __u64 lineno;
> >>>> +    __u64 inaccurate;
> >>>
> >>> I was wondering if it would make sense to define inaccurate as a flag=
s
> >>> field
> >>>
> >>> (e.g. __u64 flags with ALLOCINFO_TAG_F_INACCURATE (1 <<0)),
> >>>
> >>> so that only bit 0 is used today and the upper bits are reserved for
> >>> future use,
> >>>
> >>> aligning with current kernel codebase.
> >>>
> >>> This design also allows for better extensibility if we need to
> >>>
> >>> add new flags for any reason in the future.
> >>>
> >>> We also need to add flag validity checks if we go this route.
> >>>
> >> And I've reviewed the issue reported by Sashiko, and I think it's vali=
d.
> >>
> >> When we expand the allocinfo_tag_data structure
> >>
> >> struct allocinfo_tag_data{
> >>
> >>       char modname[64];
> >>
> >>       char function[64];
> >>
> >>       char filename[64];
> >>
> >>       __u64 lineno;
> >>
> >>       __u64 inaccurate;
> >>
> >>       __u64 bytes;
> >>
> >>       __u64 calls;
> >>
> >>       __u8 accurate;
> >>     /* padding */
> >>
> >> }
> >>
> >> I think user space may see two fields related to inaccuracy.
> > Yes but one field (inside allocinfo_tag) is the input parameter which
> > user provides to specify the filtering criteria and the other is the
> > returned tag information. It's similar to any other tag attribute
> > which you can be included in the filters.
> >
> >> How do you like these modifications?
> >>
> >>
> >> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc=
_tag.h
> >> --- a/include/uapi/linux/alloc_tag.h
> >> +++ b/include/uapi/linux/alloc_tag.h
> >> @@ -20,7 +20,6 @@ struct allocinfo_tag {
> >>        char function[ALLOCINFO_STR_SIZE];
> >>        char filename[ALLOCINFO_STR_SIZE];
> >>        __u64 lineno;
> >> -    __u64 inaccurate;
> >>    };
> >>
> >>    /* The alignment ensures 32-bit compatible interfaces are not broke=
n */
> >> @@ -40,7 +39,7 @@ enum {
> >>        ALLOCINFO_FILTER_FUNCTION,
> >>        ALLOCINFO_FILTER_FILENAME,
> >>        ALLOCINFO_FILTER_LINENO,
> >> -    ALLOCINFO_FILTER_INACCURATE,
> >> +    ALLOCINFO_FILTER_FLAGS,
> >>        ALLOCINFO_FILTER_MIN_SIZE,
> >>        ALLOCINFO_FILTER_MAX_SIZE,
> >>        __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> >> @@ -50,16 +49,20 @@ enum {
> >>    #define ALLOCINFO_FILTER_MASK_FUNCTION        (1 <<
> >> ALLOCINFO_FILTER_FUNCTION)
> >>    #define ALLOCINFO_FILTER_MASK_FILENAME        (1 <<
> >> ALLOCINFO_FILTER_FILENAME)
> >>    #define ALLOCINFO_FILTER_MASK_LINENO        (1 << ALLOCINFO_FILTER_=
LINENO)
> >> -#define ALLOCINFO_FILTER_MASK_INACCURATE    (1 <<
> >> ALLOCINFO_FILTER_INACCURATE)
> >> +#define ALLOCINFO_FILTER_MASK_FLAGS        (1 << ALLOCINFO_FILTER_FLA=
GS)
> >>    #define ALLOCINFO_FILTER_MASK_MIN_SIZE        (1 <<
> >> ALLOCINFO_FILTER_MIN_SIZE)
> >>    #define ALLOCINFO_FILTER_MASK_MAX_SIZE        (1 <<
> >> ALLOCINFO_FILTER_MAX_SIZE)
> >>
> >>    #define ALLOCINFO_FILTER_MASKS \
> >>        ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> >>
> >> +#define ALLOCINFO_FILTER_F_INACCURATE    (1ULL << 0)
> >> +#define ALLOCINFO_FILTER_FLAGS_ALL ALLOCINFO_FILTER_F_INACCURATE
> >> +
> >>    struct allocinfo_filter {
> >>        __u64 mask; /* bitmask of the filter fields used */
> >>        struct allocinfo_tag fields;
> >> +    __u64 flags; /* bitmask of ALLOCINFO_FILTER_F_* */
> >>        __u64 min_size;
> >>        __u64 max_size;
> >>    };
> >> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> >> --- a/lib/alloc_tag.c
> >> +++ b/lib/alloc_tag.c
> >> @@ -249,8 +249,6 @@ static bool matches_filter(struct codetag *ct,
> >> struct allocinfo_filter *filter,
> >>                   struct alloc_tag_counters *counters,
> >>                   bool *fetched_counters)
> >>    {
> >> -    bool inaccurate;
> >> -
> >>        if (!filter || !filter->mask)
> >>            return true;
> >>
> >> @@ -277,10 +275,11 @@ static bool matches_filter(struct codetag *ct,
> >> struct allocinfo_filter *filter,
> >>            ct->lineno !=3D filter->fields.lineno)
> >>            return false;
> >>
> >> -    if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
> >> -        inaccurate =3D !!(ct->flags & CODETAG_FLAG_INACCURATE);
> >> -        if (inaccurate !=3D !!(filter->fields.inaccurate))
> >> -            return false;
> >> +    if (filter->mask & ALLOCINFO_FILTER_MASK_FLAGS) {
> >> +        if (filter->flags & ALLOCINFO_FILTER_F_INACCURATE) {
> >> +            if (!(ct->flags & CODETAG_FLAG_INACCURATE))
> > How would you filter records which have only accurate data?
>
>
> Sorry, I overlooked this case.
>
> Since allocinfo_tag_data exposes both inaccurate (from allocinfo_tag) and
>
> accurate (from allocinfo_counter), userspace developers might mistakenly
> read
>
> inaccurate instead of accurate when checking accuracy.
>
> How about we add a comment to clarify?
>
> struct allocinfo_tag {
>
>      /* ... */
>
>      __u64 lineno;
>
>      /* filter criteria only; see allocinfo_counter.accurate for actual
> accuracy */
>
>      __u64 inaccurate;

I think we had comments showing which block of parameters are inputs
and which ones are outputs but I'm not opposed to an additional
reminder here.

>
> };
>
>
> LGTM for the rest.
>
>
> Thanks
>
> Best Regards
>
> Hao
>
> > Overall I would prefer ALLOCINFO_FILTER_MASK_INACCURATE rather than
> > ALLOCINFO_FILTER_MASK_FLAGS. The fact that this attribute is a
> > single-bit flag is a technical detail. It's still a tag attribuite
> > like file and module names and IMO deserves its own filter.
> >
> >
> >
> >> +                return false;
> >> +        }
> >>        }
> >>
> >>        if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE |
> >> ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
> >> @@ -318,6 +317,10 @@ static int allocinfo_ioctl_get_at(struct seq_file
> >> *m, void __user *arg)
> >>        if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
> >>            return -EINVAL;
> >>
> >> +    if ((params.filter.mask & ALLOCINFO_FILTER_MASK_FLAGS) &&
> >> +        (params.filter.flags & ~ALLOCINFO_FILTER_FLAGS_ALL))
> >> +        return -EINVAL;
> >> +
> >>        if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> >>            (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> >>            params.filter.min_size > params.filter.max_size)
> >>
> >>
> >> Thanks
> >>
> >> Best Regards
> >>
> >> Hao
> >>
> >>
> >>> Thanks
> >>>
> >>> Best Regards
> >>>
> >>> Hao
> >>>
> >>>
> >>>>    };
> >>>>      /* The alignment ensures 32-bit compatible interfaces are not
> >>>> broken */
> >>>> @@ -39,6 +40,7 @@ enum {
> >>>>        ALLOCINFO_FILTER_FUNCTION,
> >>>>        ALLOCINFO_FILTER_FILENAME,
> >>>>        ALLOCINFO_FILTER_LINENO,
> >>>> +    ALLOCINFO_FILTER_INACCURATE,
> >>>>        ALLOCINFO_FILTER_MIN_SIZE,
> >>>>        ALLOCINFO_FILTER_MAX_SIZE,
> >>>>        __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> >>>> @@ -48,6 +50,7 @@ enum {
> >>>>    #define ALLOCINFO_FILTER_MASK_FUNCTION        (1 <<
> >>>> ALLOCINFO_FILTER_FUNCTION)
> >>>>    #define ALLOCINFO_FILTER_MASK_FILENAME        (1 <<
> >>>> ALLOCINFO_FILTER_FILENAME)
> >>>>    #define ALLOCINFO_FILTER_MASK_LINENO        (1 <<
> >>>> ALLOCINFO_FILTER_LINENO)
> >>>> +#define ALLOCINFO_FILTER_MASK_INACCURATE    (1 <<
> >>>> ALLOCINFO_FILTER_INACCURATE)
> >>>>    #define ALLOCINFO_FILTER_MASK_MIN_SIZE        (1 <<
> >>>> ALLOCINFO_FILTER_MIN_SIZE)
> >>>>    #define ALLOCINFO_FILTER_MASK_MAX_SIZE        (1 <<
> >>>> ALLOCINFO_FILTER_MAX_SIZE)
> >>>>    diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> >>>> index ddc6946f56ab..cbcd12c4ef9c 100644
> >>>> --- a/lib/alloc_tag.c
> >>>> +++ b/lib/alloc_tag.c
> >>>> @@ -249,6 +249,8 @@ static bool matches_filter(struct codetag *ct,
> >>>> struct allocinfo_filter *filter,
> >>>>                   struct alloc_tag_counters *counters,
> >>>>                   bool *fetched_counters)
> >>>>    {
> >>>> +    bool inaccurate;
> >>>> +
> >>>>        if (!filter || !filter->mask)
> >>>>            return true;
> >>>>    @@ -275,6 +277,12 @@ static bool matches_filter(struct codetag *c=
t,
> >>>> struct allocinfo_filter *filter,
> >>>>            ct->lineno !=3D filter->fields.lineno)
> >>>>            return false;
> >>>>    +    if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
> >>>> +        inaccurate =3D !!(ct->flags & CODETAG_FLAG_INACCURATE);
> >>>> +        if (inaccurate !=3D !!(filter->fields.inaccurate))
> >>>> +            return false;
> >>>> +    }
> >>>> +
> >>>>        if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE |
> >>>> ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
> >>>>            if (!*fetched_counters) {
> >>>>                *counters =3D allocinfo_prefetch_counters(ct);
