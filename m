Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B579220AF77
	for <linux-doc@vger.kernel.org>; Tue,  4 Feb 2025 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673673; cv=none; b=dzPLuUeIGd27q8v3L186m+I+wfVIg4nAxmozgGBCVwpHj8XkEd0rgwdEdYuJFo4H37g8NMODYhZOzNa4GlkVK8ZAiXUQP8kMA/RNUUPffHL84lX5bmu9LwiiUn0nSpvlQtIr+5BA5tUr0gywLpLsilBScjai+e0tcZA618Jfa94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673673; c=relaxed/simple;
	bh=ynSUJ63SuLhCXyf2usS1JVLKxrhDuZv8kV79M/Jon+I=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=JS6Dl4R1T/JI53Np9iqTozOITpHA+fPhdd5ba7x3f7EMU8jov/M7bdShKNq+QiSkQCum3hDZbFW94IEp2MUuX79COVo+GOsQAkyhdoZYFzECl4PUMFkuqtKLEs1gyr6MdCbOXZZa8vqtmZszCvKsTtDlALQnuBYDmHp5eyp7DrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LxDLjHsZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LxDLjHsZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43624b2d453so64623965e9.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 04:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738673669; x=1739278469; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSDieL9GBtvsQS7Ye0zV4eVocVG/YaV0pHO+Q0/Wne4=;
        b=LxDLjHsZPwDJHzkD+Eim7w5Zmh4tZJddvIc26w2ntrXWaPAcPVrs9D+/dkx4bgJvIH
         Tqlv/kNkn840rWVSTbjF+yDxbg882vYfVskYls3e+MMo+K82eFSG46lIhSs9fKocNzae
         m78PVoCyZs7WZUUHPSTCUoV8FVX38o9hN5m0yrNB6c3mLIDdGCNK95oU/LXr43LxrUqe
         aWmBdXsAgSACZJLm/A1vzQcziT7VzJVKvQVONOZgbg0o7eP3v9kaSPaRrh2wK3ZUYnMK
         YoI8Y3phTWWXT2L+qWhFE1LqB88TPEgttiAA+V1PIQZ7T8VLbE+o8j7CG2mpZRDuKxvZ
         oRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673669; x=1739278469;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fSDieL9GBtvsQS7Ye0zV4eVocVG/YaV0pHO+Q0/Wne4=;
        b=wY4zjVmEQ06xuPdOmL9l62gAcjwD7Veaae6Li67ZKaxOpSH2/n8vb9j6cPh0qZza7X
         70+wjsiSytdr+k4ZUopeBtWloWc8sQXGkr24k7c+10jvEqD5ZE5ci6X2piHYrvmDK3en
         s6nfBAETFMKC0yOHr84QJU2c8fgD63sYp9JaQueQOggPZkpRyau6h5AP9J6/7N5skOq/
         FO5DGWSTK870QD2YIRMIda2335GJHBpy4MORLV2EJSr2K0Sst7XbTNDsxh3wW9WZSp4p
         6+ZNNYoSxCbYJE3V2lDPq1TuutnCYO2bVNykPhtyGoVpOz/jnYSGSKMMJ9G8S0UCx19N
         WFvg==
X-Forwarded-Encrypted: i=1; AJvYcCUwSdjTO9psIq4fJmvvWnAPTrlg/pgZosWmgqEH1WP5OROvpdn7Vv/96r4+J3gGPIESPCo6K8UqUFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTFd5k7JA0kkiuAeoyxxNFIORY7M1hqLrqIS/eqCUPQxVRXnYa
	kKBZqwTs2q2xsDK499mmpf3F4c17P1TzFcLHedO2jjCQpVDiNzvF0PvA4xdNX38=
X-Gm-Gg: ASbGncvCOJpNAra+kp1UioZ8iQmKMWyyJYf3HqQ0/19+oOEOoizm2BZcwq1HaKNZ5EO
	GCH9S3GGTyCHUMxaVRNZYDmXyX3v4EmO6yqqOwg5hPxXasEU7oR06f7SRLPetVcpzvObCxhI7m+
	VJKNnbE8H8YYxp6FxaPfXOt3vqECYQ9rTOGl1FohrDENQwhL+S37dXjYfQTH7Fze6pLWBdDubcZ
	N1J39LTAAPeyadP+e+m8lGShr46+VI7E87JaO4ezdcTiIqpdM8JQlcAq6uhpw/d4z5Lsk+DP03V
	QkSGrEfwhm08QToKzQt119JDfA9yb3jlXNaoeS6hNPvg0Lf6jqIu0jGch5J6mxpJbd3Sfw==
X-Google-Smtp-Source: AGHT+IFouneBDH4lcmisK2CqC0lJVk1uEkk/8hKiuwfY//uH+O/ijh/ARezQ4p0atRjAsVemu/oJlw==
X-Received: by 2002:a05:600c:3d05:b0:436:18d0:aa6e with SMTP id 5b1f17b1804b1-438dc3ab518mr293284155e9.5.1738673668943;
        Tue, 04 Feb 2025 04:54:28 -0800 (PST)
Received: from localhost (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr. [109.210.4.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390692a66esm14765885e9.0.2025.02.04.04.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 04:54:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Feb 2025 13:54:27 +0100
Message-Id: <D7JODK8W4W9W.3OO4GRGNDU5ZX@baylibre.com>
To: "Jonathan Cameron" <Jonathan.Cameron@huawei.com>
Cc: "Lars-Peter Clausen" <lars@metafoo.de>, "Michael Hennerich"
 <Michael.Hennerich@analog.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] iio: adc: ad4030: add driver for ad4030-24
From: "Esteban Blanc" <eblanc@baylibre.com>
X-Mailer: aerc 0.18.2
References: <20250130-eblanc-ad4630_v1-v3-0-052e8c2d897d@baylibre.com>
 <20250130-eblanc-ad4630_v1-v3-2-052e8c2d897d@baylibre.com>
 <20250131181437.00000097@huawei.com>
In-Reply-To: <20250131181437.00000097@huawei.com>

On Fri Jan 31, 2025 at 7:14 PM CET, Jonathan Cameron wrote:
> On Thu, 30 Jan 2025 12:08:26 +0100
> Esteban Blanc <eblanc@baylibre.com> wrote:
>
> > This adds a new driver for the Analog Devices INC. AD4030-24 ADC.
> >=20
> > The driver implements basic support for the AD4030-24 1 channel
> > differential ADC with hardware gain and offset control.
> >=20
> > Signed-off-by: Esteban Blanc <eblanc@baylibre.com>
> Hi Esteban,
>
> Just one thing in here that actually matters. Question about scaling of
> the common channel.  The others I could tidy up whilst applying if
> nothing much else comes up.
>
> Jonathan
>
>
> > +static int ad4030_get_chan_scale(struct iio_dev *indio_dev,
> > +				 struct iio_chan_spec const *chan,
> > +				 int *val,
> > +				 int *val2)
> > +{
> > +	struct ad4030_state *st =3D iio_priv(indio_dev);
> > +
> > +	if (chan->differential) {
> > +		*val =3D (st->vref_uv * 2) / MILLI;
> > +		*val2 =3D st->chip->precision_bits;
> > +		return IIO_VAL_FRACTIONAL_LOG2;
> > +	}
> > +
> > +	*val =3D st->vref_uv / 256;
>
> This is a bit non obvious.
> A comment on this scaling might be good to have.
> Particularly the lack of / MILLI
> (I think that's a bug?)

Yes I think that should be:
``
*val =3D st->vref_uv / MILLI;
*val2 =3D 8;
return IIO_VAL_FRACTIONAL_LOG2;
``

So I guess that requires a V4. I will address the other comments there.

Thanks for your time,

--=20
Esteban "Skallwar" Blanc
BayLibre

