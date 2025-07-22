Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A672627A476
	for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 16:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753201375; cv=none; b=HEEJsk5fk0ut/UN3cb1xo/8XF0B9xmsWNLNqiHQ9p7aulBfXfKhvCGWgVRkFPwgtaqCeiID023CoxWT7IStyKEUw4gcCMjrcNd5MLAXu6vbsoeUPn5TGP1Sra5Ctsl7ctQAogNXE04MARoMrV02DMksKBrBCVPVdGYUjnucURsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753201375; c=relaxed/simple;
	bh=0I/bNUuFobxytL160W+kJ+iaUFZ+hUI/bFGemXe6FPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2+UGD2Czkz3F/2cM86iLXw2R2Muy++Ajh6G9Du75MAZWWnaMWXzSvCUkyiMjivpXwTyui3QlUyi6dGQzUQb6XyLQAmqpUbQLgAEv1mofOZkdlAVLZUBlOyN866Lpvhraob5v0yB247fQvgIDeck0ObasoVdb7uv6UfLQKwQEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A3nypxpv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A3nypxpv"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-235f9e87f78so53957075ad.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 09:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753201370; x=1753806170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEXUdZr0ohXXfzmWQ2dHHBxRJSqO63DOp1ZvGK6vo/c=;
        b=A3nypxpvi8yjuDilQhjqMKremXszVJhjYc+g9mtFkLHrJvcq+73jHH3uAcOEbZKOei
         AkqtNJwX4Eb/v5WHrazFedhkf+DaSbrZcJ1zGK0Q6havMTQZwrP1taJc4bEQUQqNjggu
         IKUGGCTRBoVzktPPUkjeYIS7VEMPXqpX18X8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753201370; x=1753806170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEXUdZr0ohXXfzmWQ2dHHBxRJSqO63DOp1ZvGK6vo/c=;
        b=IjS2RZKcplVTIBQ+IbBq/w7PGcOHZNjRWADRTQdCpG7UyKva50uuEVVk6HH9UJfeFj
         VxHb5z+9/iUFcN6JfeEebEDoo4VZu62SkmfJcBDztAwQicWqfUzp6Lb0ADaqxX4UF1ui
         potsIrPDydIDF+a7U0byYoWaRR84vYZUSUL+TADvEecSPhcEwid+zNIOtydzX/wo3KiR
         WYKbcB74nNzpZ5dpfI0Ift9WjL9Y6OCIFdHT3mJFc0jtRkv7VaQecMO6DQSqWQmrauMv
         ltlzxeWWEeQL0T5dffOFR5MB/LSWWjlyBYn9ZfPFChIw+eP5gIci38X4PlPTrKaTdJvk
         FH5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXv3SjR09ICBGvDlFClL4NiNIIkAtL9dEkcfy9aVI9NER6c17QYqXh3G5cUothok+l1FcTxLYTpZfg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy15EftuH9fb5zxmc0aTJLVH0h47g2gOGtgMvygRbZsTzUVCBiq
	tBdFFdwOH4fKhvqazqCx4QhTtCYqUvKkoDQEBocZX8x7XauNYsqbef4Jr+tlpN/USkoD7bXNzb7
	p8VY=
X-Gm-Gg: ASbGnctgW5LIa0hlubTmGSN/N3xgK972FknthJ50k6VGLTuG3p2HyHW+Bxwsv3L03KP
	he4Ln55LB/La1I/gP/jEyzAo4B8D0xZ4Cblc10AmJ58nn49z8cqwuB3wU8Z3VlB9wagw8Q1iLcb
	frfdQ6fWp6t0eWhUbR2dcmggXSiHw7KBCJoiapwGc4I34ihgrQC5xy1LIsdboz3XeypInW879sm
	fPFTosGjgBDv4SEI+1fDg1siCZWSdlQydjM0Jw4HD2wLSA6zqFwVCnjc1nIYwynvViP5gA9U76P
	LL5Jy2mBhhBqPv7bahx99hT33QfNA8GoDA0dKrqSEyULUbxS1Y/PTR62FtBFqbUv4Qrprcr3XIU
	cOtv7l891KIeE0qT0Kz9jft1P3py7A81jd6/LOGI27wkpv1MCWeKVFKQj1TfDgQ==
X-Google-Smtp-Source: AGHT+IH4DsCPPBhhbgsB9o2ZV+xmG90zcMXH85Fb5pxXSD1ZC9vDAAOvVB9BtQVaJ2/kmQMUr7JoWw==
X-Received: by 2002:a17:903:1107:b0:234:bef7:e227 with SMTP id d9443c01a7336-23e256b5dc8mr298267255ad.18.1753201370176;
        Tue, 22 Jul 2025 09:22:50 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f28807csm12253517a91.26.2025.07.22.09.22.45
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 09:22:48 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso4709357a91.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 09:22:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDWiki1wTMEdS0oqB2sGytMbM9yejs3V3kjp1ow/2GNY8oWwWiGQ+aNyeB3e5vrnVLvd3t78MHQfs=@vger.kernel.org
X-Received: by 2002:a17:90b:4f49:b0:311:c970:c9c0 with SMTP id
 98e67ed59e1d1-31c9f45e26cmr31413464a91.22.1753201365336; Tue, 22 Jul 2025
 09:22:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250719082639.307545-1-me@brighamcampbell.com>
 <20250719082639.307545-2-me@brighamcampbell.com> <CAD=FV=Xzno3ReSyp9w+DC+nLoy1AXmcwd+j1=_XRxFi_k+bmng@mail.gmail.com>
 <DBI61MARVMJA.1DDSNK4TZE5TG@brighamcampbell.com>
In-Reply-To: <DBI61MARVMJA.1DDSNK4TZE5TG@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Jul 2025 09:22:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U7rAhChkJgOXW09z6O0ad2n478oRXpeT5p9EzYTAr3mA@mail.gmail.com>
X-Gm-Features: Ac12FXwxEcBNTtJQox66nAzXomf74eWKkhHW-9gxqeg5dTLC3EZLkMZuuh1RwxM
Message-ID: <CAD=FV=U7rAhChkJgOXW09z6O0ad2n478oRXpeT5p9EzYTAr3mA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] drm: Create mipi_dsi_dual* macros
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

On Mon, Jul 21, 2025 at 5:43=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> On Mon Jul 21, 2025 at 10:30 AM MDT, Doug Anderson wrote:
> >> +void mpi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,
> >
> > BUG: above should be "mipi", not "mpi"
> >
> >> +                                     struct mipi_dsi_device *dsi2,
> >> +                                     struct mipi_dsi_multi_context *c=
tx,
> >> +                                     const void *payload, size_t size=
)
> >> +{
> >> +       ctx->dsi =3D dsi1;
> >> +       mipi_dsi_generic_write_multi(ctx, data, len);
> >
> > BUG: "data" and "len" are not valid local variables...
> >
> >> + * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
> >
> > It could be worth also pointing people to
> > mipi_dsi_dual_generic_write_seq_multi() and
> > mipi_dsi_dual_dcs_write_seq_multi() below?
> >
> >> + * @_func: MIPI DSI function or macro to pass context and arguments i=
nto
> >
> > nit: remove "or macro".
> >
> >> +               struct mipi_dsi_multi_context *_ctxcpy =3D (_ctx); \
> >> +               (_ctxcpy)->dsi =3D (_dsi1);                        \
> >
> > nit: now that "_ctxcpy" is a local variable you no longer need the
> > extra parenthesis around it.
> >
> >> +               mipi_dsi_dual_generic_write_multi(_dsi1, _dsi2, _ctx, =
d,        \
> >> +                                                        ARRAY_SIZE(d)=
);        \
> >
> > nit: the indentation of ARRAY_SIZE() is slightly off.
> >
> >> +#define mipi_dsi_dual_dcs_write_seq_multi(_dsi1, _dsi2, _ctx, _cmd, _=
seq)   \
> >
> > BUG: doesn't "_seq" need to be "_seq..." ?
> >
> > BUG: You need to remove the definition of this macro from
> > `panel-novatek-nt36523.c` or else it won't compile anymore since the
> > name of your macro is the exact same as theirs and they include this
> > header file. It would be OK w/ me if you squashed that into the same
> > patch since otherwise rejiggering things would just be churn...
>
> Sorry to have sent out such a poor quality patch, Doug! I always compile
> changed files and test my changes when I can, but I think I must have
> compiled just the lpm102a188a panel C source file itself by mistake when
> I sent out this series revision. From now on, I'll simply enable the
> relevant kernel config options and rebuild the entire kernel.
>
> I'll address each of these items in v6.

Don't worry too much about it. While it's good to make sure you test
your patches, everyone makes mistakes! :-)


> > I guess we also chose different argument orders than they did (that's
> > probably my fault, sorry!). They had the "ctx" still first and this
> > patch consistently has "dsi1" and "dsi2" first. I don't think it
> > really matters, but we should be consistent which means either
> > adjusting your patch or theirs. It's probably worth confirming that
> > the novatek driver at least compiles before you submit v6.
>
> No, this was my fault. You had suggested the correct order. When I
> implemented the change, I preferred to put `ctx` after `dsi1` and `dsi2`
> because that's what I had done when I implemented the mipi_dsi_dual
> macro. I'll swap up the order, remove the function definition from the
> novatek driver, and compile both lpm102a188a and the novatek driver
> before sending out v6.
>
> By the way, we can discuss this further when I've sent out v6, but the
> novatek driver appears to pass a mipi_dsi_context struct into the
> write_seq_multi macro directly instead of a mipi_dsi_context struct
> pointer. We opted to use a pointer in this patch series so that it can
> be passed to a function in order to reduce the compiled size of drivers.
> For now, I'll plan to solve this by changing calls to write_seq_multi in
> the novatek driver to pass a pointer. I hope that the churn that this
> will cause in the novatek driver isn't unacceptable.

Looks fine. It probably should have been a pointer in the novatek
driver to begin with, but when it was a macro it didn't really matter.

-Doug
