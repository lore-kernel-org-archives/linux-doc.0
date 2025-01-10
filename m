Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F229211283
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 14:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736519974; cv=none; b=Ko0MzvGaRJNaUetq5Mwn9nx/5dvk4rt9hlvTCG71YKgyZ6TuYfAQprVUUJfYoT0uU8fFRdRzY7DaO9GQGk7m9+T0MCsozRjXq10bXHSG/uNzEsuRjFTj7qHLE1UY3+UDHXYOm5uzHaO+nA4EzQ7HHDMPLG/FZdQSTEJ02eTI62A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736519974; c=relaxed/simple;
	bh=dNcVzZTesBokg/jzESekrq3gcdde//x7yKqO6CtNHGM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jDg9sOAOPytgsPig3aqOzLoFxu+gUXXAtsv9Y8ziOGnKoF5Ojsn6/vSa7urIyfXZJN0DB7/cjEuhHRVcHQJI+kfnxWWNtA1J7c7IOIXoa+xbPDekpGc0jwODW+y6pHUWYP80PWbfig40J8IFriqeMI2i7+mi1ReORVmrxrNO8lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HjYkbY5B; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HjYkbY5B"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso21469705e9.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 06:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736519971; x=1737124771; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvV3AHUuYO6Tr9wrbauX5wDzxdO09agrWxXF+HRfAWU=;
        b=HjYkbY5BRbbMZ0l9kgNjutWDNTtw3NLD825Z+YvjmMW6HodK/yZSECY1R95IoQ4B3v
         upvLo5uJybvtN+tXKso7M+ilEPLQ30XZmoM60B8DXC7rOufKjKHFOEP7eamqgrzPTqzF
         b8jBb0Q+xB2jt2ZnXbZf7i/Mp7S3LpKGGrpPQ6oiplkjDU5RDYXxjeI7m6oFSDzy9qMu
         ti7ZZMgR8Nn05/b62oZOp5pOUAZI0ZEcKAm2dHNULe1ddVYK5hKiOqB+LY1u2XJS7+NR
         qjS8WrEUPPZXcS9FFGXnR2YBr/eIhQaH6NgXYA3TsQfXOPJoxkKc5YzhDVEuYXq5eXzu
         uvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736519971; x=1737124771;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yvV3AHUuYO6Tr9wrbauX5wDzxdO09agrWxXF+HRfAWU=;
        b=TUVLd/UCQiAiaadJDGBSRHBtTTnMO1DVxGMQwutSn4QvSMg8i+6p7U4ofzJvIA71Gr
         0bILyzubBuf19bL9klYuyVJ0+CIYlomcWKdSkQOBiGPfF7X8e07b8WWni9MQus+CT9tz
         NG8W4f0eFzdWh/wqaI3ASda3csnvjtAiyO1uV+IvR2yc86/FzkpiBPN6Ak5Qt3csrBJQ
         Qm/RSg22XrTFRqIz6P+RXVYLLfM1zJV8o+RBLcI8aqMlUiq6+LSAtn3tGfWQO4CAzOkQ
         ClZLAhx5s0cIpLwYw1jLMshPZ1BAmTgw8y1/kn87TWLoFCQ4h3DfSyMr3BJZ32qlIhaq
         gDuw==
X-Forwarded-Encrypted: i=1; AJvYcCWgJsV9LLGuaqosR80zxuP9F6/RUGT+7vuOJqXNSzOF4dMktZuVySQ6oJ7Z0U8c2tai/d8e/r9q5vU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxobJy7qPqEFJFxVFe+3/I4ZXYt4iltIz5M7lx3J47GSdqLEVyY
	wyViF/j8I7sj5+j/0EUsQWbzC7fPdBOkr+5DB4sexSW3ig7R6kA+O5+Zu9Eq/28=
X-Gm-Gg: ASbGncuH80I1KB0JK7wGMspMNuNKH8nByRhgW3wrGGXZEFOUgITqtIu+DETj5PX1DxD
	vkyOM2Gp8/JHe5MVDKj6h/W3IOGTtvibzMnLmwrvhqhihmjlp5STn7B6LMZ0XYkw1svMXO006qi
	ntBB+byEfhjteTr2S767EP+MfFkvc2xwFvS9gEpUfvRV8yqAbLK3LTMBBMr0nLDnGHhlQmkk3RJ
	U9UPp1R+FbJVpzYOR9A/RFMIROxGaDHM2kkQhgb11gnX9VMz9TwGsk=
X-Google-Smtp-Source: AGHT+IFsvuIAj4E6ymt7QQeU2pHWrvkUqe+Ac8WeW/VVn+1zRvvfjuYtDvvzhEKp8rrWDBKxsvfdDA==
X-Received: by 2002:a05:6000:1563:b0:385:f44a:a53 with SMTP id ffacd0b85a97d-38a872cfe40mr8748169f8f.4.1736519970862;
        Fri, 10 Jan 2025 06:39:30 -0800 (PST)
Received: from localhost ([2a01:e0a:448:76e0:cfad:dcf2:8a42:1d83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d447sm4625706f8f.4.2025.01.10.06.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 06:39:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jan 2025 15:39:29 +0100
Message-Id: <D6YGYCYXJSOF.3BIXI0UPGNNZW@baylibre.com>
Cc: "Lars-Peter Clausen" <lars@metafoo.de>, "Michael Hennerich"
 <Michael.Hennerich@analog.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] iio: adc: ad4030: add driver for ad4030-24
From: "Esteban Blanc" <eblanc@baylibre.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Marcelo Schmitt"
 <marcelo.schmitt1@gmail.com>
X-Mailer: aerc 0.18.2
References: <20241219-eblanc-ad4630_v1-v2-0-f36e55907bf5@baylibre.com>
 <20241219-eblanc-ad4630_v1-v2-2-f36e55907bf5@baylibre.com>
 <Z2eqOSN2Uk8SfTq1@debian-BULLSEYE-live-builder-AMD64>
 <20241223120419.757eadfb@jic23-huawei>
In-Reply-To: <20241223120419.757eadfb@jic23-huawei>

On Mon Dec 23, 2024 at 1:04 PM CET, Jonathan Cameron wrote:
>
> Just commenting on one particular bit feedback. Makes sure to address the
> rest!
>
> > > +
> > > +static int ad4030_get_chan_calibscale(struct iio_dev *indio_dev,
> > > +				      struct iio_chan_spec const *chan,
> > > +				      int *val,
> > > +				      int *val2)
> > > +{
> > > +	struct ad4030_state *st =3D iio_priv(indio_dev);
> > > +	u16 gain;
> > > +	int ret;
> > > +
> > > +	ret =3D regmap_bulk_read(st->regmap, AD4030_REG_GAIN_CHAN(chan->add=
ress),
> > > +			       st->rx_data.raw, AD4030_REG_GAIN_BYTES_NB);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	gain =3D get_unaligned_be16(st->rx_data.raw); =20
> > My impression is that it is a bit odd to handle endianness after/before
> > calling regmap_read/write(). Can you try set
> > .val_format_endian_default =3D REGMAP_ENDIAN_BIG, in ad4030_regmap_bus?
> > If that doesn't help, what about doing the get/set_unaligned stuff with=
in
> > the bus read/write calls?
>
> Unless these are all 16 bit registers (in which case push it into the
> regmap side of things), then a bulk read is not implying the registers
> read are one value. They could just be a load of registers next to each o=
ther.
> As such the regmap core won't touch them and endian conversion here, at t=
he
> layer where we know they are related is the right thing to do.
>
> It's  not worth dual regmap stuff just because we have a few pairs of
> registers.=20

In fact I've already set `.val_format_endian_default =3D REGMAP_ENDIAN_BIG`
but it has any effect as registers are 8bits long.

Most of the time registers are not related to each other. It's only for
offset and scale that multiple registers form one number

--=20
Esteban Blanc
BayLibre
