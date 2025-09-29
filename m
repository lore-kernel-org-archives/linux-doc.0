Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F33314A91
	for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 16:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759162586; cv=none; b=GQMkq7jNYwpFql8MeTtYi0CYvvpnXnGkvD/ozqQRjdOLFyn1hxugBhAEA7//tefPqed86Idtn6INfvjHKb4SYG2Ho7yoRhWJ+G1MQ5tZygaSB+LXGI1MbmH72AFXfIqhyftnz0r5TZD6b5Cn3DMQ4L3mchtiHh/zd+z0MjFIGSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759162586; c=relaxed/simple;
	bh=UP0zi38iIoysyicUu4wqlIM8wUKsVlWusdH50CB/mrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NaIaagLvcXqUapSPWYklg40GSdcVJuSpZ3wO/JCZOsqIesM/ryTVWOqtNxeZYOsvcZyuCZuFZWrMdlPNIjwbHwmfif26Ah6iY68KA3Ew6SpB+ldrZBXkz8cv+PuYg41N1gfvrau8jAPQ/zG43eCqKYOrIHn4dWXcOLCatTnNiLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=D569lMdd; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="D569lMdd"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-579363a4602so5241308e87.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 09:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759162582; x=1759767382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzkAIyqWbByhbLEusljJFiOftspWJiXeUC9AQt6tH38=;
        b=D569lMddRMsr87CA2o7/j/HWhUycz/6ITLt4Yq3vAl+Wi5c4NxQszqoFU/e/GZqjAQ
         uElIPr5Dy4wnOcZo9j4IU0PC89GMSCKXN58cAobhfRYQ2NetTBdIWdSBhwBHX1fYjF/c
         mwprV5ywntynU4YXzM6YnBNP5gyEoyp0Burz/buh73UcppDrXEV31hUvyBL6/gRjjM6X
         TsusqLWkfzK7Wu5HGwRH3G6TY58+3FrlhRPdymvZZG6BJfU3El4OMbdPAGJQhD/7hGtN
         4SBsc5Z2TRfP1DUJUsAD1OCp8JEsXVJNKpRWjeyTZx17agLyCNFPE6h3VVJPOk/0rIEs
         AViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759162582; x=1759767382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzkAIyqWbByhbLEusljJFiOftspWJiXeUC9AQt6tH38=;
        b=A1T9ougLuleV31WgSL+gUaM48pPb4WgPkE9lXeV9tadmWB4iIzBOZWqWsqbu5FTHcs
         gM26ICkntFsRm3+mxrHlPYcDjovK8U6vxgucqwek++2F67eE7bu48SljAiZ5hLNgRyWQ
         k+MscOE7HiulrpEraUBIL7ELvz3ewd60xWaZCaxs7GM6xjnt51TvH9EZWSzaoez2u3KN
         n3dtDNNrRdJFRqvENm2B7i6S+Iv9fYkwEId6RkUuomPxZuGDNyVlHM6IRfNOfyc3pNcW
         xZRcrrixcN4wgUSXGWVABi2M1rOI5/hHDGEgx5L6Zp52VawU+8GF7skbXqI4OCXh9k/Q
         Bkpw==
X-Forwarded-Encrypted: i=1; AJvYcCXsAxEXI2+tVEkGj6Z5W/HwNizSEkSzENatknXEiydTy3DxGYyIEkYXvlWptpqTF+7EvdYafgEyppo=@vger.kernel.org
X-Gm-Message-State: AOJu0YySM9bvpcHEWT5KDamSD6oc6yVAillPmDgcoCGAvmdkk/8wtmUg
	aaSWozqMjnYMCADmgIt6P7t6LErEX5nhg75/f5mr9W3H9LFslpqWycnRGtIgIoP+RUUgDOFPG/e
	2YtPPEbUbLY3Wc2KtjIj0EC3blV6BesORaoBBVApb3w==
X-Gm-Gg: ASbGncsFL7nBgld+Ryi7sqZtMjt5iU2JpzcSbCpn+qCMkgzHa8C/YnfgCMJsVyQBEDB
	hbcLEDmI+tfFmAZHuAVU+T+2YlBt31R9VJ2kGEMNbI6uAGrqfZTa5PzUED9JV9PU5X+wqc97LEH
	sIKqr8sEjrQNtgek721Gmf79RP3xcFF8k2fXWt21OigyArPdTXueZP6QyPaaizUDM4eX0aNG1RB
	eez6mcvo9J8LMS9Yg==
X-Google-Smtp-Source: AGHT+IFmU3wi4tOnHePsrkLhoeC52jJ7F2ZfQX4guvNO6akL0hF7fNRykrkZGq5tIOtl7Q4G/w4kyGLo4MIueW6zV24=
X-Received: by 2002:a05:6512:61b1:b0:55f:4bf6:efed with SMTP id
 2adb3069b0e04-582d092f44dmr4939397e87.1.1759162581685; Mon, 29 Sep 2025
 09:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1758916484.git.marcelo.schmitt@analog.com>
 <5dc08b622dac1db561f26034c93910ccff75e965.1758916484.git.marcelo.schmitt@analog.com>
 <20250928111955.175680cb@jic23-huawei> <20250929143132.GA4099970-robh@kernel.org>
In-Reply-To: <20250929143132.GA4099970-robh@kernel.org>
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 29 Sep 2025 18:16:10 +0200
X-Gm-Features: AS18NWBfQ_PCDi7BrV3nUUthJBlzt7e5fMnLoo96Qy56YiwyIoDz8ZCBE2Bqo2Q
Message-ID: <CAMknhBHzXLjkbKAjkgRwEps=0YrOgUcdvRpuPRrcPkwfwWo88w@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] dt-bindings: iio: adc: adi,ad4030: Add ADAQ4216
 and ADAQ4224
To: Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Marcelo Schmitt <marcelo.schmitt@analog.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, michael.hennerich@analog.com, 
	nuno.sa@analog.com, eblanc@baylibre.com, andy@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, marcelo.schmitt1@gmail.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 4:31=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sun, Sep 28, 2025 at 11:19:55AM +0100, Jonathan Cameron wrote:
> > On Fri, 26 Sep 2025 17:40:47 -0300
> > Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> >
> > > ADAQ4216 and ADAQ4224 are similar to AD4030 except that ADAQ devices =
have a
> > > PGA (programmable gain amplifier) that scales the input signal prior =
to it
> > > reaching the ADC inputs. The PGA is controlled through a couple of pi=
ns (A0
> > > and A1) that set one of four possible signal gain configurations.
> > >
> > > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > ---
> > > Change log v2 -> v3
> > > - PGA gain now described in decibels.
> > >
> > > The PGA gain is not going to fit well as a channel property because i=
t may
> > > affect more than one channel as in AD7191.
> > > https://www.analog.com/media/en/technical-documentation/data-sheets/A=
D7191.pdf
> > >
> > > I consulted a very trustworthy source [1, 2] and learned that describ=
ing signal
> > > gains in decibels is a common practice. I now think it would be ideal=
 to describe
> > > these PGA and PGA-like gains with properties in decibel units and thi=
s patch
> > > is an attempt of doing so. The only problem with this approach is tha=
t we end up
> > > with negative values when the gain is lower than 1 (the signal is att=
enuated)
> > > and device tree specification doesn't support signed integer types. A=
s the
> > > docs being proposed fail dt_binding_check, I guess I have to nack the=
 patch myself.
> > > Any chance of dt specification eventually support signed integers?
> > > Any suggestions appreciated.
> > >
> > > [1] https://en.wikipedia.org/wiki/Decibel
> > > [2] https://en.wikipedia.org/wiki/Gain_(electronics)
> >
> > I still wonder if the better way to describe this is to ignore that it
> > has anything to do with PGA as such and instead describe the pin strapp=
ing.
> >
> > DT folk, is there an existing way to do that? My grep skills are failin=
g to
> > spot one.
> >
> > We've papered over this for a long time in various IIO drivers by contr=
olling
> > directly what the pin strap controls with weird and wonderful device sp=
ecific
> > bindings. I wonder if we can't have a gpio driver + binding that reject=
s all
> > config and just lets us check the current state of an output pin.  Kind=
 of a
> > fixed mode regulator equivalent for gpios.
>
> If these are connected to GPIOs, isn't it possible that someone will
> want to change their value?
>
> Other than some generic 'pinstrap-gpios' property, I don't see what we'd
> do here? I don't feel like pin strapping GPIOs is something that we see
> all that often.
>
> Rob

I think the idea is that it is not actually a GPIO, just a hard-wired
connection. We would want to have a "fixed-gpios" to describe these
hard-wired connections as GPIOs so that we don't have to write complex
binding for chip config GPIOs. I've seen configuration pins like on at
least half a dozed of the ADCs I've been working on/reviewing over the
last two years (since I got involved in IIO again).

For example, there might be 4 mode pins, so we would like to just have
a mode-gpios property. So this could be all 4 connected to GPIOs, all
4 hard-wired, or a mix.

(The actual bindings would need more thought, but this should give the
general idea)

fixed_gpio: hard-wires {
    compatible =3D "fixed-gpios";
    gpio-controller;
    #gpio-cells =3D <1>;
};

gpio0: gpio-controller@4000000 {
    compatible =3D "vendor,soc-gpios";
    gpio-controller;
    #gpio-cells =3D <2>;
};

spi {
    adc@0 {
        compatible =3D "vendor,adc";
        /* All gpios */
        mode-gpios =3D <&gpio0 0 GPIO_ACTIVE_HIGH>,
                     <&gpio0 1 GPIO_ACTIVE_HIGH>,
                     <&gpio0 2 GPIO_ACTIVE_HIGH>,
                     <&gpio0 3 GPIO_ACTIVE_HIGH>;
         /* or all hard-wired */
        mode-gpios =3D <&fixed_gpio 0 GPIO_FIXED_HIGH>,
                     <&fixed_gpio GPIO_FIXED_HIGH>,
                     <&fixed_gpio GPIO_FIXED_LOW>,
                     <&fixed_gpio GPIO_FIXED_LOW>;
         /* or mixed */
        mode-gpios =3D <&gpio0 0 GPIO_ACTIVE_HIGH>,
                     <&gpio0 1 GPIO_ACTIVE_HIGH>,
                     <&fixed_gpio GPIO_FIXED_LOW>,
                     <&fixed_gpio GPIO_FIXED_LOW>;
    };
};
