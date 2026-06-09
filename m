Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE4A27FB3A
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 00:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780966333; cv=pass; b=G2IO2VQvQmbXGeutgN41UzOuiyH1qxxhM3onU7HvTaDi1gl+0PszrPE3nKTVoPKsjjvU5Wc81TlKoXI+x6EkYxG6sqvk87k1Wl/mz37h44vl/ILw2FgNpKxAeQQxrKkP3qTmhS34PfSSNDPSJP8duC18mZKOYG0IRkbT9U2zLZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780966333; c=relaxed/simple;
	bh=PKb9VLrKQBKvIzp1b0j/mElPDqJgrm1CeyfdyhNe8IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IGTOwkQJ7qfmeoijZBOIuk591CJGwYpWH3R6UAHgVQD7aFxJIfyat9XrzSTU+m52RH4QiRXUrTmx8ywcUwhW3O6BQpc9noabMK+EfXfgd0+lpnzR1HZRgl2muah9phHpAtqWrnHn2CSKcOAqq+YZoB+DAYaHs/xhhxkEbimlGd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BtJIp2Hs; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BtJIp2Hs"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf22c18ad3so459065ad.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 17:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780966331; cv=none;
        d=google.com; s=arc-20240605;
        b=HkMOLcL+KmWBM3FFtr7gF4rA50ijHvj/gZOpLo3V8muzCuka4KCgokni46fIztQMe4
         Nrsx1sFcOhAISNVkWVP1VwQuOU6s6+fCdjgV2UxiyBzEJRXtne+ulxCqwc24yS8noRit
         Clh9p1gfYhVjq4/tGkKj/KxiIf6avGW7bIxZJDeHj5H03w7aRh5n/njSnBfbcfyrlQBA
         cjueUZ7c41ArwIk1jeCjcPRZ8X2qz5MvLpLs5E1P7mrSUpSyjmOgckBcdzCWSFDwoPfb
         7EaEFPvT66agXfM4BLiV9xZiSI05frjJfupfoqRmB/gI7WXnowZzAoSMubBChuAuw9hZ
         xhOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yyMGW1i2m9k5e6Z/c+aGhXUK2zO1xCZ6B7u/QeKxqvw=;
        fh=zTfAIPnWjNJFgbBFETJBV9H54ZbxtcHTXVGIT27oKGc=;
        b=CL+4OMH5h7y6qsFaS2eNpe8pdwoqVFJPLTm6KXYhtfnydZ012Q8BfOoYKEijI8LaaZ
         pDkPxErJFuiOmg6I+6g9TPhvodGhwc9LGZk6uMlKZD+/tdyxehE+265yJ/d6rMqo0qPJ
         NdLpX7Sv0IVVYBOSC0BjpW4rrVbL+co/IbZnklA5YCeorXlSrx9BxD7trbjqMJpMUpEN
         W2/8dru0Y1yqxrBun7bHMiSVzv72fLulcwAf3Oy14ung6vg6HK0XOp7OWFVkEQEn0MNu
         sTQU+OJMP0LitYb4fuUTmu0ho7xbWShAs/2V2OcHb7FmuwmsEHIEyfxvcDOXocTZ2GiB
         Bvtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780966331; x=1781571131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyMGW1i2m9k5e6Z/c+aGhXUK2zO1xCZ6B7u/QeKxqvw=;
        b=BtJIp2Hsg3vkcwfhjFtajEWA/4/XakGjkBeoc3lWtGekix6eHMpd6DflWo6dj1Vuzf
         B+ojhxfeFsbJdYVf8i3BMydxFnkEgBUOg/PM+Ko3v8BWjfPOaiHs1smTrC0YVsalFPp+
         u1eKhXzEEjps6cI3c5IHEnzC41jRTgCKoPyTcvg6P/G3XDWH10tHsWAY2BOQU6iuPW7o
         hUxWD+S+V9/xtjp/HB16kii+izbcS6rTwgdZ80+HmUIx9VNVRjcAwBS28Z4dedHKF5YQ
         kCTugjWrsHhbtWlEokMRoiflXlX/yQELJsbzwR237PAfxDTnhhkZF+5oXkqHMKVN3XVx
         E/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780966331; x=1781571131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yyMGW1i2m9k5e6Z/c+aGhXUK2zO1xCZ6B7u/QeKxqvw=;
        b=T8rSF5VuQelv7/ddJTsMSzG7YXTMbo+I6VOdhn6/AjytGP4pRusuj7ZtnHIwePNWN0
         UYfgljb02H19gnpLEhSKS7PNDCTdszlS7xzNGF7kMfonPojyI2YYI9/aDsr620GZKwPA
         KimVOfH6/rSXqfjAv4qMdo08P75iVnZ4ptGcBQWE+SZ9jktAVo4GIympZA8lrVXvc5TA
         vXylRbIcYSMDbXku+g+qtPsH9stZSHyG4vq75VLXEunUnv7jezjw9gSFHjM9cIg0FlQQ
         M9v8Qxj4XXJUUMQ/5WDPmmRpNKhEjbtBZQMHBpJ7fryiFEvHMYm+viGNCibTFQjbieFJ
         819Q==
X-Forwarded-Encrypted: i=1; AFNElJ/4JJ26zjUgQtT2QuaG5dF4iQw8slm8KP9GCADvICRl3CaRgnIaKcktwOVBS01Q8qbUhOw1jY1YYUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YybD+3WZ5EcCZSPAbYvIGM/5naHoW43F2kp5f6F3RVQENQfZbjx
	cwke2uyJ9rdEoW9ayXXmQPM/WYGxV1fLhA251I/ssTq3QvP9k5Mcq9KsGBgZ1DGWn7oiR3JTA0R
	1LrNofnxv9M9uW6su7FEUpo+DR47hkVr6LHN0rUpD
X-Gm-Gg: Acq92OG9W8qZl8EjBa6dUIjaeyXyuV/D/Uzl/GQaa0Qcus0pC7bzINn+y8MbQd8hSKi
	NT5/MRZRGQDYTRzqssGPzvIIjvB+cq9OVSVTCiw+MludYlPAk8Wnt/HZRYWUhYkMgthZGtC/4Ny
	eWnMWcL5p8OLHnM18wYEs2fLOG5lH9FADJzOSxMMWVK8gdxThHzQ4pBsvCYirSD22DjDSEL31Vh
	wp+qqKEB41jY0AYnyBPXzrEyRdN04Rxjmzazs60J28lZDzZi13SWnsEYaBLqxrMR/G6ZlzOPdID
	ghN9IyM9vkzyff7vCK0PnD3jgne2SU65u1gsHQvl3U9W8IoNqqSkt0TRL3k=
X-Received: by 2002:a17:902:d4d2:b0:2bd:6727:d689 with SMTP id
 d9443c01a7336-2c1eb50745emr6698485ad.12.1780966330130; Mon, 08 Jun 2026
 17:52:10 -0700 (PDT)
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
In-Reply-To: <CAJuCfpHtdd=9D68cfRp4HDHHHCZdzTNP_RH9i2D-f9tJXht56A@mail.gmail.com>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Mon, 8 Jun 2026 17:51:58 -0700
X-Gm-Features: AVVi8CelJXzAnAlhAUCNJ9xNtleSAw0y3N4bUAKNwMiH_03MRORRRAxIR0iDOKY
Message-ID: <CAL41Mv4MG6ym7jQcug2LNF_g-28Mr4+7doWxat4qG9by5o+A8w@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] alloc_tag: add accuracy based filtering to ioctl
To: Suren Baghdasaryan <surenb@google.com>
Cc: Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Btw, Sashiko left a comment in this patch stating that the value of
"inaccurate" is echoed back to the user. But since it's an input-only
parameter, that is expected. Changing it in the kernel would be
unexpected. Hence, I will ignore that comment.

On Mon, Jun 8, 2026 at 1:55=E2=80=AFPM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Mon, Jun 8, 2026 at 1:25=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
> >
> >
> > On 2026/6/8 14:22, Hao Ge wrote:
> > > Hi Abhishek
> > >
> > >
> > > On 2026/6/6 07:36, Abhishek Bapat wrote:
> > >> Extend the allocinfo filtering mechanism to allow users to filter ta=
gs
> > >> based on their accuracy.
> > >>
> > >> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > >> ---
> > >>   include/uapi/linux/alloc_tag.h | 3 +++
> > >>   lib/alloc_tag.c                | 8 ++++++++
> > >>   2 files changed, 11 insertions(+)
> > >>
> > >> diff --git a/include/uapi/linux/alloc_tag.h
> > >> b/include/uapi/linux/alloc_tag.h
> > >> index 0e648192df4d..42445bdb11c5 100644
> > >> --- a/include/uapi/linux/alloc_tag.h
> > >> +++ b/include/uapi/linux/alloc_tag.h
> > >> @@ -20,6 +20,7 @@ struct allocinfo_tag {
> > >>       char function[ALLOCINFO_STR_SIZE];
> > >>       char filename[ALLOCINFO_STR_SIZE];
> > >>       __u64 lineno;
> > >> +    __u64 inaccurate;
> > >
> > >
> > > I was wondering if it would make sense to define inaccurate as a flag=
s
> > > field
> > >
> > > (e.g. __u64 flags with ALLOCINFO_TAG_F_INACCURATE (1 <<0)),
> > >
> > > so that only bit 0 is used today and the upper bits are reserved for
> > > future use,
> > >
> > > aligning with current kernel codebase.
> > >
> > > This design also allows for better extensibility if we need to
> > >
> > > add new flags for any reason in the future.
> > >
> > > We also need to add flag validity checks if we go this route.
> > >
> > And I've reviewed the issue reported by Sashiko, and I think it's valid=
.
> >
> > When we expand the allocinfo_tag_data structure
> >
> > struct allocinfo_tag_data{
> >
> >      char modname[64];
> >
> >      char function[64];
> >
> >      char filename[64];
> >
> >      __u64 lineno;
> >
> >      __u64 inaccurate;
> >
> >      __u64 bytes;
> >
> >      __u64 calls;
> >
> >      __u8 accurate;
> >    /* padding */
> >
> > }
> >
> > I think user space may see two fields related to inaccuracy.
>
> Yes but one field (inside allocinfo_tag) is the input parameter which
> user provides to specify the filtering criteria and the other is the
> returned tag information. It's similar to any other tag attribute
> which you can be included in the filters.
>
> >
> > How do you like these modifications?
> >
> >
> > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_=
tag.h
> > --- a/include/uapi/linux/alloc_tag.h
> > +++ b/include/uapi/linux/alloc_tag.h
> > @@ -20,7 +20,6 @@ struct allocinfo_tag {
> >       char function[ALLOCINFO_STR_SIZE];
> >       char filename[ALLOCINFO_STR_SIZE];
> >       __u64 lineno;
> > -    __u64 inaccurate;
> >   };
> >
> >   /* The alignment ensures 32-bit compatible interfaces are not broken =
*/
> > @@ -40,7 +39,7 @@ enum {
> >       ALLOCINFO_FILTER_FUNCTION,
> >       ALLOCINFO_FILTER_FILENAME,
> >       ALLOCINFO_FILTER_LINENO,
> > -    ALLOCINFO_FILTER_INACCURATE,
> > +    ALLOCINFO_FILTER_FLAGS,
> >       ALLOCINFO_FILTER_MIN_SIZE,
> >       ALLOCINFO_FILTER_MAX_SIZE,
> >       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> > @@ -50,16 +49,20 @@ enum {
> >   #define ALLOCINFO_FILTER_MASK_FUNCTION        (1 <<
> > ALLOCINFO_FILTER_FUNCTION)
> >   #define ALLOCINFO_FILTER_MASK_FILENAME        (1 <<
> > ALLOCINFO_FILTER_FILENAME)
> >   #define ALLOCINFO_FILTER_MASK_LINENO        (1 << ALLOCINFO_FILTER_LI=
NENO)
> > -#define ALLOCINFO_FILTER_MASK_INACCURATE    (1 <<
> > ALLOCINFO_FILTER_INACCURATE)
> > +#define ALLOCINFO_FILTER_MASK_FLAGS        (1 << ALLOCINFO_FILTER_FLAG=
S)
> >   #define ALLOCINFO_FILTER_MASK_MIN_SIZE        (1 <<
> > ALLOCINFO_FILTER_MIN_SIZE)
> >   #define ALLOCINFO_FILTER_MASK_MAX_SIZE        (1 <<
> > ALLOCINFO_FILTER_MAX_SIZE)
> >
> >   #define ALLOCINFO_FILTER_MASKS \
> >       ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> >
> > +#define ALLOCINFO_FILTER_F_INACCURATE    (1ULL << 0)
> > +#define ALLOCINFO_FILTER_FLAGS_ALL ALLOCINFO_FILTER_F_INACCURATE
> > +
> >   struct allocinfo_filter {
> >       __u64 mask; /* bitmask of the filter fields used */
> >       struct allocinfo_tag fields;
> > +    __u64 flags; /* bitmask of ALLOCINFO_FILTER_F_* */
> >       __u64 min_size;
> >       __u64 max_size;
> >   };
> > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > --- a/lib/alloc_tag.c
> > +++ b/lib/alloc_tag.c
> > @@ -249,8 +249,6 @@ static bool matches_filter(struct codetag *ct,
> > struct allocinfo_filter *filter,
> >                  struct alloc_tag_counters *counters,
> >                  bool *fetched_counters)
> >   {
> > -    bool inaccurate;
> > -
> >       if (!filter || !filter->mask)
> >           return true;
> >
> > @@ -277,10 +275,11 @@ static bool matches_filter(struct codetag *ct,
> > struct allocinfo_filter *filter,
> >           ct->lineno !=3D filter->fields.lineno)
> >           return false;
> >
> > -    if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
> > -        inaccurate =3D !!(ct->flags & CODETAG_FLAG_INACCURATE);
> > -        if (inaccurate !=3D !!(filter->fields.inaccurate))
> > -            return false;
> > +    if (filter->mask & ALLOCINFO_FILTER_MASK_FLAGS) {
> > +        if (filter->flags & ALLOCINFO_FILTER_F_INACCURATE) {
> > +            if (!(ct->flags & CODETAG_FLAG_INACCURATE))
>
> How would you filter records which have only accurate data?
>
> Overall I would prefer ALLOCINFO_FILTER_MASK_INACCURATE rather than
> ALLOCINFO_FILTER_MASK_FLAGS. The fact that this attribute is a
> single-bit flag is a technical detail. It's still a tag attribuite
> like file and module names and IMO deserves its own filter.
>
>
>
> > +                return false;
> > +        }
> >       }
> >
> >       if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE |
> > ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
> > @@ -318,6 +317,10 @@ static int allocinfo_ioctl_get_at(struct seq_file
> > *m, void __user *arg)
> >       if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
> >           return -EINVAL;
> >
> > +    if ((params.filter.mask & ALLOCINFO_FILTER_MASK_FLAGS) &&
> > +        (params.filter.flags & ~ALLOCINFO_FILTER_FLAGS_ALL))
> > +        return -EINVAL;
> > +
> >       if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> >           (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> >           params.filter.min_size > params.filter.max_size)
> >
> >
> > Thanks
> >
> > Best Regards
> >
> > Hao
> >
> >
> > >
> > > Thanks
> > >
> > > Best Regards
> > >
> > > Hao
> > >
> > >
> > >>   };
> > >>     /* The alignment ensures 32-bit compatible interfaces are not
> > >> broken */
> > >> @@ -39,6 +40,7 @@ enum {
> > >>       ALLOCINFO_FILTER_FUNCTION,
> > >>       ALLOCINFO_FILTER_FILENAME,
> > >>       ALLOCINFO_FILTER_LINENO,
> > >> +    ALLOCINFO_FILTER_INACCURATE,
> > >>       ALLOCINFO_FILTER_MIN_SIZE,
> > >>       ALLOCINFO_FILTER_MAX_SIZE,
> > >>       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> > >> @@ -48,6 +50,7 @@ enum {
> > >>   #define ALLOCINFO_FILTER_MASK_FUNCTION        (1 <<
> > >> ALLOCINFO_FILTER_FUNCTION)
> > >>   #define ALLOCINFO_FILTER_MASK_FILENAME        (1 <<
> > >> ALLOCINFO_FILTER_FILENAME)
> > >>   #define ALLOCINFO_FILTER_MASK_LINENO        (1 <<
> > >> ALLOCINFO_FILTER_LINENO)
> > >> +#define ALLOCINFO_FILTER_MASK_INACCURATE    (1 <<
> > >> ALLOCINFO_FILTER_INACCURATE)
> > >>   #define ALLOCINFO_FILTER_MASK_MIN_SIZE        (1 <<
> > >> ALLOCINFO_FILTER_MIN_SIZE)
> > >>   #define ALLOCINFO_FILTER_MASK_MAX_SIZE        (1 <<
> > >> ALLOCINFO_FILTER_MAX_SIZE)
> > >>   diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > >> index ddc6946f56ab..cbcd12c4ef9c 100644
> > >> --- a/lib/alloc_tag.c
> > >> +++ b/lib/alloc_tag.c
> > >> @@ -249,6 +249,8 @@ static bool matches_filter(struct codetag *ct,
> > >> struct allocinfo_filter *filter,
> > >>                  struct alloc_tag_counters *counters,
> > >>                  bool *fetched_counters)
> > >>   {
> > >> +    bool inaccurate;
> > >> +
> > >>       if (!filter || !filter->mask)
> > >>           return true;
> > >>   @@ -275,6 +277,12 @@ static bool matches_filter(struct codetag *ct=
,
> > >> struct allocinfo_filter *filter,
> > >>           ct->lineno !=3D filter->fields.lineno)
> > >>           return false;
> > >>   +    if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
> > >> +        inaccurate =3D !!(ct->flags & CODETAG_FLAG_INACCURATE);
> > >> +        if (inaccurate !=3D !!(filter->fields.inaccurate))
> > >> +            return false;
> > >> +    }
> > >> +
> > >>       if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE |
> > >> ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
> > >>           if (!*fetched_counters) {
> > >>               *counters =3D allocinfo_prefetch_counters(ct);
