Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792491828;
	b=BW1AOysD1WKdfLOwRqkIOupqMODq8f8WAZ2PJw+uPAgSVc7tBg4v870Wlt+3+e5712UK
	 rnfsMgbP/O4CKBrvRX9dSr/f5ujGDJjxu3We48tFlAqYiTtIDxeTQ/7g4kZio/0q6wOS9
	 COgsWUpFAQr2VicI99Y7HynFzez0jSPdM5R1qHk09/VBbiHxpjk/Mgj5rrkDCuketbgoO
	 N2+GxoTGtEvuJq4mHceH06m6BYSyVAlYxry7qPs8sbebAfNZv/ZNJf8f2PC8DhdRPtuMg
	 J+7nLcG4angCofZfHcgROIrtCVn9jyWhk6rtoPUO6HaD2KSPAURBjWXX4/4JCWab9ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BfR0mGbepdFVmOYecKANCw7jQRUn1LoApl6AFcTjWOM=;
	b=E7rM+TvLHBugfTrDv0frEzOcuYfgqKaKUzj1GaGA3rTZXr6liHLELk89cyTEMnZEoReM
	 LtvVbvtMQdWB0Bja5dIzRvS8jvzSZBrn841nOYZkDv+PF1Wg/21LMYCzPdPxx8WCbFKMD
	 x/mql09/j9z72N5DlN77Obe54qCuCnh5L9qca4ouzWJ2E7ypmh+z8Kx5+uqIrzY0bp9tD
	 ii6pJl/zpT1NRw5DnAyIfrP5DcYHrph8/Wu1Z2hUQsFL7FO4zGrcXcR3jYK6Irw9ExkSs
	 OhoYjrOd6maoXmo9fFnw4JHODRjizJTuaIJFofHgX9h39ZHPNH6tUOaYqF/y5S4WttA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bRtwkeq4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EFE606A32E
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 10:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98EFE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bRtwkeq4
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e946155442so24449575ad.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 03:23:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792491827; cv=none;
        d=google.com; s=arc-20260327;
        b=CzcrMnrROlYvj//QHmtwLOk9E5IJPynjrJ05rgDvZdjZkG2zfPRAzbncW6r9qSopB0
         1Aboqsb66FI/zjqtQIvEmmfOu8ZMAyO+vKrrWOFFYZDhWndNGxvYEwbo3e0Zo4KiceCW
         Grv7STtcMQNbjYopcYPoQYamIw8/f5zBaycluJyuppOchtYKNjZfRAW3fAERtdBF1ueW
         ui/iZbp3OXF64ncTHj6Kt/cXB9PJCJc2tCX2ZEHS1kOhuKEAWcvOsdHutcgLdwXekxVu
         ez62b7RK1ehThfDZieXldmAl5Z2ztaFRY8Almd1DTAsEv4k2AgZ2V9Bb4LIPhy2h2trq
         Vslg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BfR0mGbepdFVmOYecKANCw7jQRUn1LoApl6AFcTjWOM=;
        fh=qDpzSa25/ikKgTPexDsxMw3PQ+xXoD6xWJT18mbAH80=;
        b=QVB1Y0c8BsBYz/Zx+lT8/sNlDV1mOzVbmkrA+bhn3dyUv6/6s9jsCMzgY4HAGYzaKW
         2TPA2aXlv1C2n2eTwLeRhpHfPn+/Jb2u+rF/jBOd6XOhLBYVqKr4es4Caz/yH8FSGaPv
         1axEqObkQjfTqF0RSlJMmvK5kwsjq+cbzSlTc5SFtF2iy0F25mZwfzXIgpZ7vaCuYHhl
         vdIUr6mA+XxJpei2/dYSB/DqZVYDvBdbuwMtNSqSpLpx/2F6KLex4hUNuUDE6JulGQdC
         xusCynt6v0X/9iHmrpG+aAP7w2I4H/rmpTLNBunaAUmcYfmW58Vv9QAMkwM+VFaOFz+v
         +g9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792491827; x=1793096627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BfR0mGbepdFVmOYecKANCw7jQRUn1LoApl6AFcTjWOM=;
        b=bRtwkeq4ijIqhbb2Pg4ZvqJctj6U8COmzWh/LMQcn7SRmsb9Th2OWxWvAZIOMcXibj
         bdT8bR4F/Lu0BzZbeb6SIk7isfzhvr+T604fPC4/f0qsTcabzcyCnd5+hwk540AKhJCH
         Dl6j/JVAVhDephiWph7mPPg6ApaCyX7NukIh5Ce5Io9IZzvvSRwWo0vhSFk0KM2m5czR
         ibQpJA9KnhS2Xk4jt0nqGh0heqnxLpLD6a31hdVWlcvyxSnNxQLhMiE0pCRH0pnpuDbk
         4qDIVb1UmmZ7HMD1FijwSPmjQqCu2kMrqngVlPJ2AmQ/5bvFBb8cKPKYfFW6zwoUWER+
         dXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491827; x=1793096627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BfR0mGbepdFVmOYecKANCw7jQRUn1LoApl6AFcTjWOM=;
        b=uG++04liYkk5RCscXiPJKVQFzg3c5m4F/4sj28PXcMG2Ko9C/VCJXw1uv5wAw8v3sS
         43vAJ3mr7o/m78hCHpTL8MNTjs0N2RCTHZKlGchfTLLJQza2fbpI/WUmER+sNu/qYYYm
         KEe+rF1GqEm1nRyFonwHm/lfMW2c69AuRfOCVgqrjQ7KxB1/GFwnxs39wwkfr3su7qEM
         RK826jtegj59vZg58ZL7N8uh4pWcJmcgMGhEyBG6HKpV2Et8P0mkfbfHgi+Gx4EC+ClQ
         zgABEnwLiL2x3zdEXfycKi7a4gfxaht6cIBqCsg4cEc0+yOIMsgeqAs4XIcrz0XOh58Y
         ubig==
X-Forwarded-Encrypted: i=1; AKwUvBy+C56ctR1Q3XuHK/lYLKpBbfHqRJzicE0prP0zITmoMKt+mIUwuw0V9DOwsFyN6p8gErMIBwIFhzw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgOmdRbs3XbftitKoBXpB5W4bPHmXVJwKkDW1tn4O7yMNCOjee
	G9RM3vsF+XZFSB5ERMv7p1F/MiO/AH8XyqJv//x//GDfr/XWdUNAXo4+6gfkufS0y4Qli/rUT3/
	tqVWlGI+iD8aLHE1OFqhQ9O900HKalis=
X-Gm-Gg: AYBFou2Ztvb4/qU1SKlIPIs1fiFy1+9FHt9fYnX8J4BPCFv4+8i6COe4B986h5zPgiY
	c+stmxoKv0yRLeioxzdCjnnxPlHIEcVazbAhZPP4YbbLKv4S8gr4NLYXeJPy46wJQB/sjvi0Z4K
	PLlJ23SA+85e4hroCcPhG+e0wsRs+Dt78UiCUe/qG1DhtnXV6eRWmk2tcOiFTz5MQDVOhuUUnA9
	yVddhrpGg8oY4hdVJTvVuEFaQeMwomQY24yz6nek4ZFRY4MheaSd4AetFfPXrfLSgLOsVrMRXv8
	DMEQ871XmUz7Pn4AR1NKldQMH/5lnXdaMNQHfKKI7lU2VNx7kfX/HA==
X-Received: by 2002:a17:903:fab:b0:2e9:5507:b532 with SMTP id
 d9443c01a7336-2e9a6f587c4mr85052035ad.43.1792491826941; Tue, 20 Oct 2026
 03:23:46 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019055301.3234571-1-shengjiu.wang@oss.nxp.com>
 <CAA+D8APDSYbzX3S9RuLinoPiuqPHEX+L+-ZcSg-RtxxaWyvrJA@mail.gmail.com>
 <atcf1PFVcn5pdsVO@analog.com> <cda25e6b8be6887da0da859b748662238025c60c.camel@pengutronix.de>
 <atc4eH5JMQnquRBY@analog.com>
In-Reply-To: <atc4eH5JMQnquRBY@analog.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 20 Oct 2026 18:23:29 +0800
X-Gm-Features: AclHuK96YJV3IFk2UWQrHaP6m1W5aPVAHtJAF1UZ9XaAeh1-CjjLbLnsyduMW10
Message-ID: <CAA+D8AO=OpHDMOuzTSeXuUnGKchAjrpUTfzhpCDc=nXPV=aRbw@mail.gmail.com>
Subject: Re: [PATCH V2] reset: core: Serialize concurrent deassert/reset of
 shared resets
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, shengjiu.wang@oss.nxp.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, hansg@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 6:03=E2=80=AFPM Alvin =C5=A0ipraga <alvin.sipraga@a=
nalog.com> wrote:
>
> On Tue, Oct 20, 2026 at 10:56:14AM +0200, Philipp Zabel wrote:
> > On Di, 2026-10-20 at 10:29 +0200, Alvin =C5=A0ipraga wrote:
> > > On Tue, Oct 20, 2026 at 03:17:40PM +0800, Shengjiu Wang wrote:
> > > > Hi Philipp
> > > >
> > > > On Mon, Oct 19, 2026 at 1:52=E2=80=AFPM <shengjiu.wang@oss.nxp.com>=
 wrote:
> > > > >
> > > > > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > >
> > > > > reset_control_deassert() and reset_control_reset() guarantee that=
 the
> > > > > reset line is deasserted / a reset pulse has been issued once the=
y return.
> > > > > For a shared reset only the first caller runs the hardware op; ot=
hers just
> > > > > bump the refcount and return early, so a concurrent caller can re=
turn
> > > > > before the first caller's (possibly sleeping) op has finished.
> > > > >
> > > > > Serialize the shared refcount update and the hardware op under th=
e
> > > > > existing per-control rstc->lock, taken before the SRCU section to=
 match
> > > > > reset_control_acquire()'s mutex->srcu order. The lock is taken on=
ly on the
> > > > > shared path and only for may-sleep callers (reset_control_reset()=
 and
> > > > > reset_control_deassert()); the exclusive path stays lockless. Cal=
lers in
> > > > > atomic context must use the new lockless reset_control_reset_atom=
ic() and
> > > > > reset_control_deassert_atomic() variants, which skip the mutex an=
d so
> > > > > carry no completion guarantee.
> > > > >
> > > > > The op is now called with rstc->lock held on the shared path, so =
it must
> > > > > not re-enter reset_control_reset()/deassert()/acquire() on the sa=
me
> > > > > control; a lockdep_assert_not_held() at each lock site catches th=
at.
> > > > >
> > > > > reset_control_assert() is unchanged: a shared assert makes no gua=
rantee
> > > > > about the line state, so there is nothing to serialize.
> > > > >
> > > > > Fixes: 0b52297f2288 ("reset: Add support for shared reset control=
s")
> > > > > Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
> > > > > Assisted-by: Anthropic:claude-opus-4-8
> > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > ---
> > > > > Changes in v2:
> > > > > - Serialize only the shared may-sleep path under rstc->lock (take=
n before
> > > > >   SRCU to match reset_control_acquire()'s order); exclusive path =
stays
> > > > >   lockless, and reset_control_assert() is left unchanged.
> > > > > - Add lockless reset_control_reset_atomic()/reset_control_deasser=
t_atomic()
> > > > >   for atomic callers; gate the mutex on can_sleep so no shared co=
nsumer is
> > > > >   regressed and so it works on all configs.
> > > > > - Factor the body into __reset_control_*()/__reset_control_*_lock=
ed()
> > > > >   helpers, and lockdep_assert_not_held() at each lock site to cat=
ch a
> > > > >   controller op re-entering the API on the same control.
> > > > > - Declare the new variants and stubs in reset.h, and document the=
 sleeping
> > > > >   vs atomic variants in the kerneldoc and reset.rst.
> > > > >
> > > > >  Documentation/driver-api/reset.rst |  10 ++
> > > > >  drivers/reset/core.c               | 204 ++++++++++++++++++++++-=
------
> > > > >  include/linux/reset.h              |  12 ++
> > > > >  3 files changed, 177 insertions(+), 49 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/driver-api/reset.rst b/Documentation/d=
river-api/reset.rst
> > > > > index 932699c57d1e..0fbc1ba92dd8 100644
> > > > > --- a/Documentation/driver-api/reset.rst
> > > > > +++ b/Documentation/driver-api/reset.rst
> > > > > @@ -185,13 +185,23 @@ Given the reset control, consumers can call=
 reset_control_assert() and
> > > > >  reset_control_deassert(), trigger a reset pulse using reset_cont=
rol_reset(), or
> > > > >  query the reset line status using reset_control_status().
> > > > >
> > > > > +For shared reset controls, reset_control_reset() and reset_contr=
ol_deassert()
> > > > > +may sleep and must be called from process context. Consumers tha=
t need to
> > > > > +operate a reset line from atomic context can use reset_control_r=
eset_atomic()
> > > > > +or reset_control_deassert_atomic(); these never sleep, but do no=
t serialize
> > > > > +concurrent shared callers and so do not provide the completion g=
uarantee of
> > > > > +their sleeping counterparts. The underlying reset controller's o=
ps must not
> > > > > +sleep when the atomic variants are used.
> > > >
> > > > On second thought, this change lets reset_control_deassert() sleep,=
 so
> > > > any driver
> > > > that currently calls it from atomic context would now block. The ne=
w
> > > > _atomic() variants
> > > > let those callers opt out, but I can't tell how many drivers would
> > > > need updating, and any
> > > > one we miss is a silent risk.
> > > >
> > > > Do you have another idea to fix the concurrent deassert() problem o=
n
> > > > shared resets
> > > > without this risk?  Or should we go back to the original proposal?
> > > > https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/T/#m6661547=
7929b38f788d6d22a2c0bb9ca62173e89
> > >
> > > The reset core could borrow a trick from the regmap library, where it
> > > uses either a mutex or spinlock depending on whether the underlying
> > > reset controller's ops can sleep or not. Check the struct
> > > regmap_bus::fast_io member and how it's used in __regmap_init().
> > >
> > > It would also allow the problem to be fixed for atomic users. Right n=
ow
> > > you still have the race even if the underlying reset controller's ops
> > > don't sleep and the _atomic() API is being used. But if you know that
> > > the reset controller ops don't sleep, you can serialize shared reset
> > > control operations using a spinlock.
> >
> > Yes, that sounds like it could work.
> >
> > > With the above design you can leave the consumers alone and drop the
> > > _atomic() variant of the API functions. (I'll also point out that add=
ing
> > > sleepy/atomic-awareness to the core would open the door for consumers=
 to
> > > report their requirements, e.g. that the reset control musn't sleep, =
and
> > > for the core to validate this with the properties of the consumer.)
> >
> > Adding _atomic() variant at the very least would require correctly
> > setting can_sleep/fast_io for all reset controller implementations and
> > making sure that the sleeping controllers throw an error in the
> > _atomic() API.
> >
> > > But... it requires an audit of all reset controller providers in the
> > > tree, to see if they are atomic-safe or not, and report some kind of
> > > .can_sleep property to the core (like regmap's .fast_io). I have a
> > > feeling this is still more straightforward and less error-prone than
> > > auditing all the consumers.
> >
> > Seconded. I'd really like to move to an API that visibly separates
> > exclusive and shared resets, as well as sleeping / non-sleeping API,
> > but I'm afraid that would be a lot of churn.
> >
> > > The other downside is that it's not a simple patch which can be
> > > backported, which might be what you are looking for.
> > >
> > > Any thoughts? I can also help out if the idea seems good.
> >
> > How about adding the can_sleep property, setting it for reset-gpio, and
> > adding the mutex first, and only then adding the other reset
> > controllers and the spinlock. That could allow to backport a relatively
> > constrained subset of the change.
>
> Yeah that makes sense. Shengjiu, if you also agree, I can pick up the
> second phase (tree-wide audit + spinlock variant) if you don't have the
> time. Or Philipp, do you think it both phases should be part of the same
> overall series?
>

Agreed on the phased approach. I will send the patch for phase 1.

Alvin, please go ahead and pick up phase 2 (the tree-wide audit +
spinlock variant) - I'm happy for you to own it.

Best regards
Shengjiu Wang
