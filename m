Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2D1344DB3
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 09:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702649; cv=pass; b=Z9BeuNeNEOpPDSXkX2CmSW9Uq6vsyT00cLCgBJb1xseIO5zwQ0BBgu5PnVx+K2FrkzP8zdx8Pgq52hZizgW3+z1/d2TORponasthvIiit7w1jdZKuscUZNzVeraFXD5hMG09snOXBJR98ZhEM/JeEe6H8IcOnDh8TB1XQIry+DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702649; c=relaxed/simple;
	bh=yOGSzeXM/fJTAPIw5zs6GzDVPcLedX2kJhZdWG+5xLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=utLuyOLO5uYyRvsXGVEIdRwKyTXB32mjATy03y4qnnkW4iBH6fWjP1VtrA2UNy/QWEOorDrpWC/AXyX3ilvntxvx0Vsrx6YmDLRvNvP+CMiYG8iRgvMUrugl/rMFwYP3bOKWtVvHSJJssxVG69NO9n5b0mJtAD6a32r3j1xxg1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzDsPtOF; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzDsPtOF"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8fbb24a9a9so1299761666b.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 01:24:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772702646; cv=none;
        d=google.com; s=arc-20240605;
        b=Kr5cysecplsdTQV1UA9ujPQs6lWpbeic5leJPfs8Mti4f9fW57xqQ24nU6fmrmeDyb
         hxT4um4Xxhah5O1NE1PKoC4ia0o/mAg3gXFwiJ12KSZmHAiFbban/Hq3HuSduwXfwhFX
         Gc+ubCfbSc05XKDUiDRlp7dbQRhMcYjLHpkFrjo9UztHr/B4nveY/45Xz5RUb82bN1DO
         WXVZwQa9kpdAMMFjOqMF3OApWwQGatgBvROJEL7c1K62TDpUmYscCoBZevnARYEIuyeV
         5aSX0GMN6FOYWX1jzP6P3B9n39K2NlhdMigQKlzjwWUuMtebFJxym241N4GaY7Mfu3Tj
         2t2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7V/aynPgarI00J6RHHmZxLR/eFY6yKbzGs2AV4GWAE=;
        fh=2Lotj7P5SgcbTebzOU+UbSax46ZaRPY9Oz3DzNrzXMs=;
        b=Ymribbokzk9MEG0oX72OuUyF3J3U5pEW2qEvPs0WXPzgx4QOuVSU0f5/3yC0uRUX0a
         b5lDeKiulyyobKARinrVzZ+g0gx2Cd1wlf4NQ3IztBSZtbJyWw6u9cG76EGvnsJjAekm
         UjkwoTuwXXuIEDqvdcn4XglOjpmtl9Mw8ASpMtPil7QTHifG9S+cfsxJETvmzLr3XElM
         KG6sHhChimQfkzUwzpNihsVMK5+JaekpJoQvB9tuafRG9LzPEBTBh4h9Ap2SRE51Uxwo
         xw+wrIbIs7u0R6K7W/Vs33DxMDmUVoEzJPQ9byPyfVzmXbsL1s6PC8FZgjzhdOS8V6x4
         hJ8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772702646; x=1773307446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7V/aynPgarI00J6RHHmZxLR/eFY6yKbzGs2AV4GWAE=;
        b=EzDsPtOFsUZzB5vhFUBXdFfTG5CnS3MCa2zjysCqIrZbXCqIsbA6W1Ht9vlfAG9d7/
         qDDYEGRUC3UZAReaUZICoSWpvpa2bvtjvd9c7UfRYp8A7gpK+hQMHWLa/A+ZBJZndjvb
         RMFDQivCn3tNY1Bt7hSxeLQwEFdYUicsMsqtvbNkNtDsTMXG8BvYhlYqbnlp2xYeYQiA
         vG+oZlaL6okJW31wjk/k5G6G6OQ2nFF9dYYB6k92acst23CaPvB8UoA+q0s8VQUcLoBG
         ecjBH69qI/3b1VQC/vRcpTqXF3CuSqeXUyTb1f6SF/2XQ7h+B36p5aCT2FcoPuHyALtE
         I9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702646; x=1773307446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O7V/aynPgarI00J6RHHmZxLR/eFY6yKbzGs2AV4GWAE=;
        b=gSzOhIIu6F7lFiANCM2uA0laZeN2Zhf8c+BXErOMFSPnd434j9vbyFvIUbpoBTKos5
         HR+9J2+i4Xn4FqTl7WIvcXACw+uh6S5MiWp5EIT9Iqfjg44e/eXnGUhfms9Q2cn9y+vh
         AnXgId/IxCf82QmDB3H/T3PhPPLvgN46VnXhfuGcn2QYFTfrABkmVzluzbYqehGUXQRi
         0mi1VSIKACAC3kAp0+AK/joXbhoghb/feBYjj8By56cUAU1woy54hzToOdcknqV5KUhZ
         MHHKY0Ld+2SeuJriHIuCoFxwJr7Xxo2E6iARaWS2lCWoB3mHWZNkLctTQQ9fCXso9hiO
         9mJg==
X-Forwarded-Encrypted: i=1; AJvYcCVGFYVIRnufyw9tser8z3L1kNCKxvnYV5suXfTbzXc6lUAGKR9elIhxDp3G0icqX4oC8v8w2RMrwwg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+McpDtny7MJyJTJeAm80oxoAiV/G06eGmZZbCb/URMN3lWSSg
	xAjIWNBu6e0600MWoD50fKLHkazxtz6ZaWFTZsoHQoO8UKJ1uAX0/Vz2wKJhi2vS7y+5DfRTlCt
	Q4Xrno+g/pf8skA1fOeZ8cmA/19hxGDQ=
X-Gm-Gg: ATEYQzw4G6aJBxI0Rlk/QiX7ysn5/ngjLeU1jTExYo6Zx7df/zo6gLbQQIjoYi/Jkpy
	rZx7tzGbuEvjqaWY3zWz5V978UTQao2lnpRash5ZG0hHhg4hNuw7RmIbLQV+SC2QKYZ3OnP+Lo9
	eGDiRAccOPAEswwyyazi6T558J3j+OzK8vAA7d9bXe8x5wghtLnHUlh38e753IufaKO7CN5KzCB
	v9FGFj2OyRWNA9i+IkAlz5aODSucwO1C3+2WN7LXi+4hZaSIQn47RPpC+8bbrxf3QIJgmoApELo
	Bo/+2qZlmSNqH0gBUeGQbF64dPMfm2cTl+AHuUyTcNKU7DPlPSkKFshObBN0uQQmjWw/ZOZBQi5
	jgnpS7m0=
X-Received: by 2002:a17:906:f594:b0:b8f:de15:8334 with SMTP id
 a640c23a62f3a-b9409e6c303mr96538466b.24.1772702645754; Thu, 05 Mar 2026
 01:24:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304080519.2844101-1-flavra@baylibre.com> <20260304080658.2844434-1-flavra@baylibre.com>
 <70f25902-5c79-46f9-8c67-99633b22b5ac@baylibre.com> <098886563f5fdcde837989d0556ed9a2d8d3203b.camel@baylibre.com>
In-Reply-To: <098886563f5fdcde837989d0556ed9a2d8d3203b.camel@baylibre.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Mar 2026 11:23:29 +0200
X-Gm-Features: AaiRm53YqAUMQyvSLktnGg5SuN9kQ9-08zQw4GXGWg1FP3qWaxXWqtsvLa9Yl24
Message-ID: <CAHp75Vdni=OgHiDi8G5s6CgBFZZuypOyJSo5DFjaKYFkLGPqkQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] iio: ABI: Add support for floating-point numbers
 in buffer scan elements
To: Francesco Lavra <flavra@baylibre.com>
Cc: David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 11:09=E2=80=AFAM Francesco Lavra <flavra@baylibre.co=
m> wrote:
> On Wed, 2026-03-04 at 16:45 -0600, David Lechner wrote:
> > On 3/4/26 2:06 AM, Francesco Lavra wrote:
> > > In the data storage description of a scan element, the first characte=
r
> > > after the colon can have the values 's' and 'u' to specify signed and
> > > unsigned integers, respectively.
> > > Add 'f' as an allowed value to specify floating-point numbers formatt=
ed
> > > according to the IEEE 754 standard.

...

> > > -  Format is [be|le]:[s|u]bits/storagebits[Xrepeat][>>shift] .
> > > +  Format is [be|le]:[f|s|u]bits/storagebits[Xrepeat][>>shift] .
> > >
> > >    * *be* or *le*, specifies big or little endian.
> > > +  * *f*, specifies if floating-point.
> > >    * *s* or *u*, specifies if signed (2's complement) or unsigned.
> >
> > I would keep all of the format options on one bullet point.
>
> That's what I did initially, but Andy suggested doing differently [1].

And still I think it's better to not mix them. The floating in the
same sentence is confusing (along with 2's complement mention and
sign).

...

> > > -is [be|le]:[s|u]bits/storagebits[Xrepeat][>>shift], where:
> > > +is [be|le]:[f|s|u]bits/storagebits[Xrepeat][>>shift], where:
> > >
> > >  - **be** or **le** specifies big or little-endian.
> > > +- **f** specifies if floating-point.
> > >  - **s** or **u** specifies if signed (2's complement) or unsigned.
> >
> > same here
>
> [1] https://lore.kernel.org/linux-iio/aZ7dCdLs5xcJ4UGW@smile.fi.intel.com=
/

Same here.

--=20
With Best Regards,
Andy Shevchenko
