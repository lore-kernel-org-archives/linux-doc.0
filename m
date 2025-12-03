Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDF6308F1A
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764775525; cv=none; b=GYGkg6PHxKNyQNXExYkYhTDerggLjzpYZCYenRYSLiBKWAR5oGgwMaxpnLzLwNIgY9jbZl5EYJGgGCBGKAEsFXDUURcAD5ToyPNbPueKaJm5dIAYFg3l4l/yTjsDzDiPbfDMJMk94u0llj5+7EikQow+fM2saodLL8ajk1IyHvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764775525; c=relaxed/simple;
	bh=QMxlU2mP5sVIHH6ONXWfzRA4uEU+uCE29vNHHDBoxBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3Mf1JDrSzUr8ARlPAnlypCOGGGhL2eeUECcu37W8dTFf/+UzFkvwenZsEuMXzuO4kCVORrp7msjwSw9dIQ4TphOpKmlboLb51oCkAhdA+TeIO8a1p0uOLwZPIjMjTp7Mq9ZDsjLnVqTqQYmEbnVrtuaaYIS3SI3N09Akd+m1AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=qNtqF/ws; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="qNtqF/ws"
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 885E34012B
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764775516;
	bh=4MwkYLIjnETNsl0RiJb3ZpekiSUCzPerjJd0pE4uF2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=qNtqF/ws06Ug8w0yhbkJ0sOoxzJN9f5aZIsM+8orAg+cp1zPDR4/uGPefSVZflihu
	 R+e6XAdl3cJbAxcn7nvrCPWSfUimxxsfRjqCzODZY8pVj9qh4G5jtPYOBxEBGRYdDP
	 6xfjeCUQ8yd7tSXCkDu1OHDPfTfmLRGpfpM6QqGv8ZDA9RSdvOOwpskU2TMIK7WnOl
	 ait7lP7WbC3C4H1ikgG6djz8QKezkKFxdXYZgybY6Fh+DxR65JF/KZeEUVRoM61ZNx
	 cIsfxVuprX4HMuoBiBpzC4uD3AUY8HEHYYTqomSjdGbxIM5C0nW/SlnlaQO4EvMv2B
	 jhZ02HB4BYmNfq3DN2tit8VtaCbFHoj8kc73CLewuPq+nYrfaE7zguV9dawvPar3u3
	 pKGq9bcSMI/+M4asM40JRuvsEnXRvek95TjlorvxPYK0LXdcd9lHkqnobyRQbOl2hT
	 QJgUJe0Kxv2KLGNGVlfOT2SLnlQIqrdYgEKqOJupLPywNDX0mGIir2Sjl1dGwrbaaW
	 o1ToolitWrAUEjQrpZ7zq7yasCS4te+KQOFu+W4tn6cgDwTEYtbw/al2zx1VXoIy/P
	 XaD7E5KP/GFaruWqT8f3gOOWgBLj0jG25FhCr9fwvd+L3JqXwsrhXAFDxzMxQ78kgu
	 42DDK2SigF1xZbrbBl3oT9nE=
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5dfb407f2faso9331632137.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 07:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764775515; x=1765380315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4MwkYLIjnETNsl0RiJb3ZpekiSUCzPerjJd0pE4uF2Q=;
        b=rIPf99JdY4FLL6CrozKRcoxQu7Tb8X2vFUQwvzvtdUPPDkahK5s/iL22FY00JelXHw
         qLUWzHNEiu2oqz8nG8Sxne6IOXYAMByWKpdxyBrAqF/bY1suF8STFtXKPy7eb/HpcwWE
         nwzx2rCahuw3YO4HAvC63rkEcujAH1csSRR0Og+ZsJ/PHoWIOUUwZN76o49DWDwtnJvS
         O8je4Ley5jot3BEb+G12oE/teSxPMDIjcTBwdjClQTSkIno0CptRnzThHWeElyC1jl5r
         Mf0Qa6MfLBoYJAeby2uxENeM3xX1hUPy1LKpnbUXg0OMst1yl+Bd/+7wXcDBI3D66Kpn
         hUuw==
X-Gm-Message-State: AOJu0YxveQFtp1/cbsVtHNLqo3te2y0Vm5j1iAJ67F4nwPxHsFoNXBKz
	CNGXH0zjbzEW0VoEe5uh/nKqPQ1BCgXXBztyoB1i0xo6yk7EYhBUPg9H1et5LE5ra89uZ0rCvnM
	o4wr38P34OV4wvUVOC67MYxDjDKX8XcyHGwprG6/ri+C3Q3LRkGyKc+Yr4UsetX+YfmRjHdATkK
	9oZi3y2gKixTLBYJzBLSTn3GERjxpEWK8y74cQeRHPQGWiK2mi3Daq
X-Gm-Gg: ASbGnct56qBBcdkZWsvGBXw7glbUrc1nR5oEx3LWCFn8ovzgJ8BfJtaIGd6tWBaZ641
	ddg+zMVHuKMZchnnRuGeSj8hV/BXwLsX+Mo92ZgS3cS7VUQl/esUnAPwY2mqw4hNM8V3l/FArm2
	Y7nUEpbnCg1PYqYLb0B47eCavkmujbsN6qdPVivj2MBziD4JMQ7nslfZ83lbEdMy25eFUUM/xtz
	jCsrvpbttPWg/gU5g76dthIwg==
X-Received: by 2002:a05:6102:b08:b0:5db:cc25:dd7a with SMTP id ada2fe7eead31-5e48e365c21mr979499137.28.1764775515290;
        Wed, 03 Dec 2025 07:25:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMYENqj5KDA8SxRG4CSMMDrx1CGwLNpt/Rfg9iOOovQLTk5DIV4QrMh3GFkl8+9xMdydlopUE8nUZs8LE/5XQ=
X-Received: by 2002:a05:6102:b08:b0:5db:cc25:dd7a with SMTP id
 ada2fe7eead31-5e48e365c21mr979492137.28.1764775514935; Wed, 03 Dec 2025
 07:25:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201122406.105045-1-aleksandr.mikhalitsyn@canonical.com>
 <20251201122406.105045-3-aleksandr.mikhalitsyn@canonical.com> <202512021222.752619D@keescook>
In-Reply-To: <202512021222.752619D@keescook>
From: Aleksandr Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Date: Wed, 3 Dec 2025 16:25:03 +0100
X-Gm-Features: AWmQ_blbQDSmfCFffQUJgZGdTWqQ34absg4PptSY7rDsf-boHd3z0lKnI9mia8g
Message-ID: <CAEivzxcEXqJUPKrHS2buKmMTqkvtdbO1ng+RHTNZKwRrTz0h3g@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] seccomp: prepare seccomp_run_filters() to support
 more than one listener
To: Kees Cook <kees@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Tycho Andersen <tycho@tycho.pizza>, Andrei Vagin <avagin@gmail.com>, 
	Christian Brauner <brauner@kernel.org>, =?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@stgraber.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 2, 2025 at 9:26=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Dec 01, 2025 at 01:23:59PM +0100, Alexander Mikhalitsyn wrote:
> > Prepare seccomp_run_filters() function to support more than one listene=
r
> > in the seccomp tree. In this patch, we only introduce a new
> > struct seccomp_filter_matches with kdoc and modify seccomp_run_filters(=
)
> > signature correspondingly.
> >
> > No functional change intended.
> >
> > Cc: linux-doc@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: Kees Cook <kees@kernel.org>
> > Cc: Andy Lutomirski <luto@amacapital.net>
> > Cc: Will Drewry <wad@chromium.org>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: Shuah Khan <shuah@kernel.org>
> > Cc: Tycho Andersen <tycho@tycho.pizza>
> > Cc: Andrei Vagin <avagin@gmail.com>
> > Cc: Christian Brauner <brauner@kernel.org>
> > Cc: St=C3=A9phane Graber <stgraber@stgraber.org>
> > Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.c=
om>
> > ---
> >  kernel/seccomp.c | 35 +++++++++++++++++++++++++++++++----
> >  1 file changed, 31 insertions(+), 4 deletions(-)
> >
> > diff --git a/kernel/seccomp.c b/kernel/seccomp.c
> > index f944ea5a2716..c9a1062a53bd 100644
> > --- a/kernel/seccomp.c
> > +++ b/kernel/seccomp.c
> > @@ -237,6 +237,9 @@ struct seccomp_filter {
> >  /* Limit any path through the tree to 256KB worth of instructions. */
> >  #define MAX_INSNS_PER_PATH ((1 << 18) / sizeof(struct sock_filter))
> >
> > +/* Limit number of listeners through the tree. */
> > +#define MAX_LISTENERS_PER_PATH 8
> > +
> >  /*
> >   * Endianness is explicitly ignored and left for BPF program authors t=
o manage
> >   * as per the specific architecture.
> > @@ -391,18 +394,38 @@ static inline bool seccomp_cache_check_allow(cons=
t struct seccomp_filter *sfilte
> >  }
> >  #endif /* SECCOMP_ARCH_NATIVE */
> >
> > +/**
> > + * struct seccomp_filter_matches - container for seccomp filter match =
results
> > + *
> > + * @n: A number of filters matched.
> > + * @filters: An array of (struct seccomp_filter) pointers.
> > + *        Holds pointers to filters that matched during evaluation.
> > + *        A first one in the array is the one with the least permissiv=
e
> > + *        action result.
> > + *
> > + * If final action result is less (or more) permissive than SECCOMP_RE=
T_USER_NOTIF,
> > + * only the most restrictive filter is stored in the array's first ele=
ment.
> > + * If final action result is SECCOMP_RET_USER_NOTIF, we need to track
> > + * all filters that resulted in the same action to support multiple li=
steners
> > + * in seccomp tree.
> > + */
> > +struct seccomp_filter_matches {
> > +     unsigned char n;
> > +     struct seccomp_filter *filters[MAX_LISTENERS_PER_PATH];
> > +};
> > +
> >  #define ACTION_ONLY(ret) ((s32)((ret) & (SECCOMP_RET_ACTION_FULL)))
> >  /**
> >   * seccomp_run_filters - evaluates all seccomp filters against @sd
> >   * @sd: optional seccomp data to be passed to filters
> > - * @match: stores struct seccomp_filter that resulted in the return va=
lue,
> > + * @matches: array of struct seccomp_filter pointers that resulted in =
the return value,
> >   *         unless filter returned SECCOMP_RET_ALLOW, in which case it =
will
> >   *         be unchanged.
> >   *
> >   * Returns valid seccomp BPF response codes.
> >   */
> >  static u32 seccomp_run_filters(const struct seccomp_data *sd,
> > -                            struct seccomp_filter **match)
> > +                            struct seccomp_filter_matches *matches)
> >  {
> >       u32 ret =3D SECCOMP_RET_ALLOW;
> >       /* Make sure cross-thread synced filter points somewhere sane. */
> > @@ -425,7 +448,8 @@ static u32 seccomp_run_filters(const struct seccomp=
_data *sd,
> >
> >               if (ACTION_ONLY(cur_ret) < ACTION_ONLY(ret)) {
> >                       ret =3D cur_ret;
> > -                     *match =3D f;
> > +                     matches->n =3D 1;
> > +                     matches->filters[0] =3D f;
> >               }
> >       }
> >       return ret;
> > @@ -1252,6 +1276,7 @@ static int __seccomp_filter(int this_syscall, con=
st bool recheck_after_trace)
> >  {
> >       u32 filter_ret, action;
> >       struct seccomp_data sd;
> > +     struct seccomp_filter_matches matches =3D {};
>

Hi Kees,

Thanks for looking into this stuff! ;)

> I was surprised to see this didn't induce a stack protector check (due
> to the array use). It does, however, expand the work done to clear local
> variables (i.e. this adds 9 unsigned long zeroings to the default case).

Actually, by saying this you've inspired me to look at this stuff with
a fresh mind again
and I have a feeling that I can probably make it work with just one additio=
nal
struct seccomp_filter pointer on the stack, instead of adding extra 8
pointers... :)
Let me make another iteration on this and send a -v3 then.

>I was surprised to see this didn't induce a stack protector check (due
> to the array use).

Also, sorry if my question is stupid, but what do you mean by stack
protector check in
this case? Just a check for an array index before writing to it? Or
something more generic?

>
> Regardless, I'll read this thread more closely in time for the LPC
> session; I'm not exactly opposed to allowing multiple listeners, but I
> do want to meditate on the safety logic (which I see you've spent time
> thinking about too).

Thanks, Kees!

>
> Thanks!

Kind regards,
Alex

>
> -Kees
>
> --
> Kees Cook
