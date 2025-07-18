Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B2920FAB6
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 20:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752870764; cv=none; b=abu8aP9lj4WXqHAyI+fGlXj1vi6E8HnLBAxdGY8E+ZwvaCK/uBm4Ebx6H3281Fljx5JdY8GWcHnmKiH9k4T6ZWSTLl5xUhJKMdoiY+rP52c5aIEh4Ww7udCvO839h9VQf6jXKG6KwP1VZgJj2vgGl/Nv4G9zy+7rNN0qGPTobHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752870764; c=relaxed/simple;
	bh=VYLFPInX5wYDsdSBLHlW5bQbgZ8bMLX6OLJt3sa/vVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oLyIWadoTxw4FCuwep0Tw7xZ6wRyCU8OQzdmy0xdUNamVmijzpr4r5WtpcS+hrzFciFZVWv/AgSMIC2PEO/Em8/InC2AW76lysghEemd23cqmATOtrf96Rnu05qxKMRrkzIVAXX4kj2SXeL7lKWJPpeYL/tL8kGTU1A5Q8d/19A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I8itxYzV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I8itxYzV"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234bfe37cccso20638875ad.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 13:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752870761; x=1753475561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKZtbK4lVu+Fa2vzfgm/vl63kukiWlzYzbXwLbRXVPM=;
        b=I8itxYzVHzQwdBhRTNS4RfpHY4+ttbKbzKb38RDKuY3Y20TX4vEZ6t/1aDuWrtjxzu
         tpa9TZucOQGRzGaEpVHdmNf7Y+/8wj3H72Hkm9mfXX+786li/DoNHO7ig/bracc+1VDx
         DRRg4VWA0zCJtVmU6IaazxwosUEgpHqq5GGAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752870761; x=1753475561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKZtbK4lVu+Fa2vzfgm/vl63kukiWlzYzbXwLbRXVPM=;
        b=NboXMx8Tl7N8lNAxS6YjOBH4QIF/OlOwlWMe7tg93W4nPiTAtQzDZuVVOecAYpmP4/
         wOc1pYuJ2l7XnqyaiNj8o5T2Sx6lUkG4SMRQtzgWm+CrOca8QExpV5ApUg8f60Gc/3D9
         h5dOt/cMh2ABiqgrvZF4WctUfFD/8o3NKb3KT4TDFyj6rL2/8T6paKr8Zw3Wn/WvLt4b
         o+H/WVSO+Pa7THtIcBOszm92L13rtUfmHq76LfZdtwQzzJS8vG+aR66uSNzmbBgKnryU
         5m3k2Qzkw5ojQa+mUXzoVNUswPqZiTCqE49CaRnKU8WBWgD36h1hYWKGWG03uazSTlSJ
         OdcA==
X-Forwarded-Encrypted: i=1; AJvYcCW7vLHpTQbxDDGM3SVBUhyjFRJtLBPsNYELphkBIZjC2X4D4yNlv+Ify5iK8bn+uFGtAbSAA4/K100=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSDcsCrAm3e+IBrdW48QYUxZg6FHr2eLtnwi61H9rI8FjaeD/L
	av31NJQxA3pni2uF/lCRQO+n+w7luX2959ygDzR9Ow2z3CG4WORCauZlHAiCuUHULXZKxNoyg4+
	jdhM=
X-Gm-Gg: ASbGncsRN9Ju6EAwNFoeS8HORibnV9/FoHetRty0A/kb+JOHsA9XaLCIzPWTg8b+YwY
	/5rDCnwjV8divzJ5UEfVmDwIsOX28Upj36nskX7gUQuCuKD0LxugQK1kgtiF7W8OFFZ/7IkMtyA
	NxALC70x2u4UV1ZC78EWMThGxw4lBvL7vEwJKJvY9pTA6FqeoDbLIN+m1sS0TtKRYGK//AihZKb
	O4e7DMMx4kAu0MK411VihaQAv/U8VIAk8b1tHFzsad2cCyk8vcy5mCBgFT+Sowgj4KKNVN8pvzY
	mhfOPwr+hS+cVrssnhEFrs0480D98+jDwO5Fmwih+9DlOTbynB3czMn3ixfzSzgvVKQDdXsNmtn
	FSRgr6SSg91KXmML56OFapdKY9ZPzlyoOETQdxKr7TCcrsW4e+Wq1yntyXXajY6XbCcGG6XdoUC
	C7
X-Google-Smtp-Source: AGHT+IH8pFUwJ9Kj+2DMnh4Nh6CeFeAbj93dN7r8aitascRqtHKeKCqP7dGnw2vyb3dHJ7sckeRioA==
X-Received: by 2002:a17:903:1aa3:b0:235:e76c:4362 with SMTP id d9443c01a7336-23e3b79a5acmr45588685ad.18.1752870761075;
        Fri, 18 Jul 2025 13:32:41 -0700 (PDT)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com. [209.85.214.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4e84sm17614225ad.104.2025.07.18.13.32.39
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 13:32:40 -0700 (PDT)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234d3261631so20368925ad.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 13:32:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEE131RI8qG4OfDiuLKH2qpvUlUz3vm/dHVo+JTR7GiyjPKhvCuEQElFuPPYR6gYZcuANxcrnJSRg=@vger.kernel.org
X-Received: by 2002:a17:90b:2e06:b0:312:e49b:c972 with SMTP id
 98e67ed59e1d1-31cc256fb86mr7355028a91.15.1752870759183; Fri, 18 Jul 2025
 13:32:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717164053.284969-1-me@brighamcampbell.com>
 <20250717164053.284969-2-me@brighamcampbell.com> <CAD=FV=WYBFrm-J55BTEJ7s=Jk4EFuMVAkahVZfdzW6V8mxE7Tg@mail.gmail.com>
 <DBFCOJFGI5HB.1RNJBDPNTEL2U@brighamcampbell.com>
In-Reply-To: <DBFCOJFGI5HB.1RNJBDPNTEL2U@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Jul 2025 13:32:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZUr=cwAQyPFWVDXg4pRavLWChpR4dOOyUywQN4GdE-w@mail.gmail.com>
X-Gm-Features: Ac12FXzSqdFPsH4TrONq3wFHu-HzqqxZ5pwzD4g92X8kRwKlib7OsOrk_7f6tnM
Message-ID: <CAD=FV=VZUr=cwAQyPFWVDXg4pRavLWChpR4dOOyUywQN4GdE-w@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] drm: Create mipi_dsi_dual macro
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 18, 2025 at 10:17=E2=80=AFAM Brigham Campbell
<me@brighamcampbell.com> wrote:
>
> On Fri Jul 18, 2025 at 10:10 AM MDT, Doug Anderson wrote:
> >> +#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)           \
> >> +       _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ##__VA_ARGS__)
> >> +
> >> +#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
> >> +       do {                                           \
> >> +               (_ctx)->dsi =3D (_dsi1);                 \
> >> +               _func((_ctx), ##__VA_ARGS__);          \
> >
> > nit: shouldn't func be in parenthesis for safety? It's unlikely to
> > really matter, but just in case it's somehow a calculated value that
> > would make it safe from an order-of-operations point of view.
>
> My assumption is that wrapping _func in parenthesis would cause a
> compilation error in the case of _func being a macro (more on that
> later...). I'll test that later today.

Huh, OK. If that's the case then no need to do it.


> >> +               (_ctx)->dsi =3D (_dsi2);                 \
> >> +               _func((_ctx), ##__VA_ARGS__);          \
> >> +       } while (0)
> >
> > Can you explain why you need the extra level of indirection here (in
> > other words, why do you need to define _mipi_dsi_dual() and then use
> > it in mipi_dsi_dual())? I don't see it buying anything, but maybe it's
> > performing some magic trick I'm not aware of?
>
> I mentioned this in v3 after the changelog and prompty forgot to include
> that information in v4: The extra indirection between mipi_dsi_dual()
> and _mipi_dsi_dual() is to allow for the expansion of _func in the case
> that _func is also a macro (as is the case with
> mipi_dsi_generic_write_seq_multi, i believe). Compilation fails after
> removing the indirection.
>
> There may very well be a better solution to this problem. I'd appreciate
> your thoughts.

Wow, crazy. I think the C preprocessor is one step away from magic.
While I know there are rules for it, I often find the way that it
behaves to be counter-intuitive. I can't say I've followed exactly how
your solution is working, but if it works and is needed then it's OK
w/ me. It might be worth promoting the note to be in the commit
message itself (or even a code comment?) so future people trying to
understand the code will have some chance of stumbling across it...

You might hate this, but one possible other solution would be to make
a custom `mipi_dsi_dual_dcs_write_seq_multi` (lifting it out of the
novatek driver) and then say that the "_func" parameter can't be a
macro. If you did it correctly, it would be a pretty big space savings
too. Unlike how we did it in the novatek driver, I think a proper way
to do it that would save the most space would be:

#define mipi_dsi_dual_dcs_write_seq_multi(ctx, dsi0, dsi1, cmd, seq...) \
  do { \
  static const u8 d[] =3D { cmd, seq }; \
  mipi_dsi_dual_dcs_write_buffer_multi(ctx, dsi0, dsi1, \
                             d, ARRAY_SIZE(d)); \
  } while (0)

...and then mipi_dsi_dual_dcs_write_buffer_multi() would be
implemented in drm_mipi_dsi.c.

With the above implementation, you only have one "static const" buffer
(maybe the compiler is smart enough to combine w/ the novatek code,
but  it might not be) and also only have a single function call taking
up space in the panel driver. You'd only have the "custom" dual
implementation for the "write_seq" stuff since that appears to be the
most common. All the other DSI calls could use the normal
mipi_dsi_dual() macro...

I was thinking of suggesting that as an optional followup to your
series anyway (for the space savings), but it could also solve some of
the preprocessor woes. :-P

I'm certainly not dead-set on this, so if you want to just keep
something like your current solution that's OK w/ me too.


> > Reading this with a fresh set of eyes, I also realize that this macro
> > is probably vulnerable to issues where arguments have side effects
> > since we have to repeat them. I don't think there's a way around this
> > and I think the macro is still worthwhile, but something to go into
> > with open eyes. Possibly worth noting in the macro description? We
> > could probably at least eliminate the need to reference "_ctx" more
> > than once by assigning it to a local variable. I think referencing
> > "_func" and "__VA_ARGS__" more than once is unavoidable...
>
> I'm using _func, _ctx, and __VA_ARGS__ more than once in this macro and
> I don't expect the indirection to fix the potential issue of unintended
> side effects. I believe we can use GNU extensions to eliminate side
> effects to _ctx,

I wasn't thinking of any GNU extensions. Just using a scope-defined
local variable...

#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
  do { \
    struct mipi_dsi_multi_context *__ctx =3D (_ctx); \
    __ctx->dsi =3D (_dsi1); \
    ...

> but especially since _func can be a macro, I don't
> think there's much to be done about it. Not sure about __VA_ARGS__.
>
> I fear my inexperience is made sorely manifest here.

I think it's a rare person who fully understands the dirty corners of
the C preprocessor and I wouldn't count myself as one of them. I can
sometimes make it do what I want, but I think we're up against my
limits too...

-Doug
