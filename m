Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F0F301471
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764773290; cv=none; b=nuA9NdUm4k6iLc7+A90h0GFcrmspfPJ3SMV9EW+48xDNz35fuDAYYwbe/B/pAgr70dTwadWr3j0xbayyDL8eFY0aGqG3DcoqiQpIsim5qYDK+X3vfWOU718OLp94A2Y7VqX8FqGFGdPuw2pFztLvg2yblUdnTFkrgQXGXNDr/wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764773290; c=relaxed/simple;
	bh=oL35OKvGOxDskjgVdfPaKqYXVuHhqzw09HymFZTzoDY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GYlKb4btLrtb3ISsmD1MMN3sHIYE2LyUUNuAi+BdjxmulZEYi2O1/16N0Oyi5705AzMYbMZqMu0ULx9a74/OjEtkWqLDrbAVK7tCj/KX/ALTu4Jegg1abv1YWuCrqvdItaOsaJyehCSaPPVwAD59e03oQzTBMs9FpkSAGf8mcBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faUnit+e; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faUnit+e"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b7277324054so977455066b.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 06:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764773286; x=1765378086; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oL35OKvGOxDskjgVdfPaKqYXVuHhqzw09HymFZTzoDY=;
        b=faUnit+eZTfoiBFjAP2wYoa0lbqq8nu9I3p4ocoBPQdVN5NHvI8YuOAmsnOqwdoi6S
         SHeq/cDFjfg/CaO1FuwWjgIJDK7yKVT39NFRkjBlBcB59U5jCHHf13Tlfe9tYTGcuKHt
         1nB70HxWvq+GLM9U4K0Ig5QA4cCdUhTw9y/kDdfEBRnizeFDzob+jj5O9PGRSebpmk/Y
         IG8qMftvRrJC1VIa8i4vtog8xlupAVd+/Nc5qqbWjElzKREcft/JriI10bSgnF/QFn0M
         z5dcvDRxp5wRjElcvnL0dRZxn2TcByh9SFxsoIy+W4iDTVI8CtnZEDNq/FxYroZcNEQd
         wl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764773286; x=1765378086;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oL35OKvGOxDskjgVdfPaKqYXVuHhqzw09HymFZTzoDY=;
        b=nvZ9gqB2uS78wqMkNYNCm7J/wFeAC2ft998RRHYNeNXA5QPFKsx2IImjJnwnv3/r3z
         stm8a/xU3SikT5PfokS+12D756Qeir2Z9x4l+gHkYbls0eMGkcWB4olHWx4PC13Om6LQ
         6cdN3NRs2iP3JF5gLCLm19cLgsUs/6rhAjbgMenl4F6PK+UWcwgGQ+3e6PGpTvsHjh8H
         KFV9dzVBA9kD0ReSMUgvCygzJ4/N93XQRT7RzZz7pshjLqrRyxhTE1m7EcMItPyIXOgZ
         yxpeU6nljAzXIHCv2A53Vxw1NR6khvS+XFTaWyc6ib2YluDHuovrJCXnASNSAnJVAXQ7
         oxnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYhdwsSEu05lgHwch7aiotcKDazirVprw+y3CTZy2o19DPUMImbnzaFqoRF+WfkXU7WfZx+ctyqYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8K+Na0BP6h68mg0yLabjAqUcKNO2TdIkdbuxrcf4xFwzjLzOx
	BsZAH2XznDC9WHHG6ddUa9iP8vrlJLJWhsrI9SB3zb9DZdpS8SwGcBPd
X-Gm-Gg: ASbGncvokMPbQZ2gC9ZRe1/mtgtgMoutGe+S0Ovb2uAOJ7f19qoFGtnmsgQrrWfgoL0
	FqmKCWsT4Rmx22N/rGT71WGF9N9OgRxTmOx6AdpWoel/PCr0RuN+Y3o8Dpse3bgkVKeCwDreJpf
	4TnYJrQHoVAKf3/vWAuwqamuAx1rwYpXeg628zQeJ34cZiw2yvDtmBBccmQx8MOkvHByjYXqp6r
	lLYjBFB8MzFMlM3SUHWfCcxdf1nEas6wKCkpEqlPdkkf5+u4VQz/vx1M1qyfciJjz0eCc/T+JCZ
	VgG1lnF8DMzpr3urOrfwEaqktOgxdCPTm5+aQxYkZhH5qAZO2lMp6NGMPpnvqyW2M/+zxKaMruO
	nWmDb9dipJi9gwXiFb2CD1sC0y+MqFcR10eRw3huAylbTSL5FXYhBvWT3USxbYZoq2zhEkOqeMW
	Szb94o+OF73SM=
X-Google-Smtp-Source: AGHT+IFGmiSxZ43YfANUOAK2kxqz366FrP8VXObqiHTmbXUrUCjFmKAoNnC01rZ2yC7eX7J63HXKeA==
X-Received: by 2002:a17:907:7210:b0:b73:7710:fe03 with SMTP id a640c23a62f3a-b79dc77e2a6mr310276466b.58.1764773285339;
        Wed, 03 Dec 2025 06:48:05 -0800 (PST)
Received: from [10.5.0.2] ([185.128.9.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a4b757sm1793579066b.66.2025.12.03.06.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 06:48:04 -0800 (PST)
Message-ID: <c45e24e5edb3ea668accb608f6cdffff62592c74.camel@gmail.com>
Subject: Re: [PATCH v3 2/3] iio: adc: Initial support for AD4134
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Marcelo Schmitt
	 <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jic23@kernel.org, nuno.sa@analog.com, 
	dlechner@baylibre.com, andy@kernel.org, Michael.Hennerich@analog.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net, 
	marcelo.schmitt1@gmail.com
Date: Wed, 03 Dec 2025 14:48:44 +0000
In-Reply-To: <aTA0LDYDzP8s__1V@smile.fi.intel.com>
References: <cover.1764708608.git.marcelo.schmitt@analog.com>
	 <c189c25b1c46f406c3f7942e5ac4cdb0b964ee52.1764708608.git.marcelo.schmitt@analog.com>
	 <CAHp75Vf7p=aPy2ofC_zVz1PURA3R9i0WZCG63-dCEXO=xKJ0FA@mail.gmail.com>
	 <daf53d16106f29a09134b2c2a5a2f4870a0bfbe1.camel@gmail.com>
	 <aTA0LDYDzP8s__1V@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-12-03 at 14:59 +0200, Andy Shevchenko wrote:
> On Wed, Dec 03, 2025 at 11:02:45AM +0000, Nuno S=C3=A1 wrote:
> > On Tue, 2025-12-02 at 23:26 +0200, Andy Shevchenko wrote:
> > > On Tue, Dec 2, 2025 at 10:55=E2=80=AFPM Marcelo Schmitt
> > > <marcelo.schmitt@analog.com> wrote:
>=20
> Nuno, may you please remove unrelated context when replying?

It was not that much. That is why I did not bothered :)

...

>=20
> >=20
> > Hmm, can you share why we should have a reset controller for the above?=
=C2=A0
>=20
> My point here is to have a standard way of handling "reset" pin independe=
ntly
> of what's beneath in the HW =E2=80=94 GPIO or other means to assert/deass=
ert it.

That makes sense.

>=20
> > Unless I'm missing something, even with the aux device, you'll need the=
 code to
> > optionally add it which (I think) will already force you to check the e=
xistence for
> > the pin (which would be a bit odd IMO).
>=20
> If this is the case, it needs to be fixed, but reset framework provides
> _optional() API, that's what should be used for the cases where reset is
> optional. Let reset framework to handle that.

Ok, I think I was also misunderstanding you. So you mean that instead of do=
ing=20
devm_gpiod_get_optional() we should use one of the devm_reset_control_get_*=
() calls?=C2=A0

Ok, I went to check the reset core implementation and with [1] I take back =
my comment. I can see now
that the framework will automatically handle creating the auxdevice. So whi=
le I still think most of
the times we'll still see reset-gpios in bindings, it makes sense to have t=
his HW abstraction in the
code.

One thing to note is that the reset framework always enforces reset-gpios a=
nd we do have places
where reset pins have different ids (just because that's how the datasheet =
defines them).

...

>=20
> > Having said the above, I would be up for some kind of helper in gpiolib=
.
> > I still see way too often people misinterpreting the meaning of
> > GPIOD_OUT_HIGH and that the value in gpiod_set_value_cansleep() means
> > assert/deassert.
>=20
> Consider this as a helper :-)

Indeed!

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tr=
ee/drivers/reset/core.c#n1038

- Nuno S=C3=A1
