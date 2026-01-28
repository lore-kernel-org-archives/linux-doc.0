Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911AE374733
	for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 18:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769623605; cv=none; b=qlPrL3I+FhZkor9m601pJ9LRDCbpRQgkuIHfXIWUgnpfHHtgQNLQMIk/6hRaRhmcbOyvY2hd7kxDOiFRXLQLV9TzxeXgBRefKWIclYbdod+QaY0MEWjZI1EEQurhJwW0JDK3QdGS6SlZ142sTKxARZ4lKLLsgJ1VpP1fI5RsBRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769623605; c=relaxed/simple;
	bh=8wTbKFDxZbZCQ1Q7yTsRV4W/LC5P/5on3cRlcOF4pOA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Suebm1KZShy3RsFB88zUGvoB3KVxbMRB2vHebY8MSab1nI4vI8IwMhOQKK7E1aAOI9T2yNEvyH+/Z1JDQSQvGBTij51sWzipRra2GqbglTqQdhnQC96Zs1Hchz8B/D6y1OXEi3+BT9Qpf2xqqdAI3N4WYYUQJTLtjXJAiXttzng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4aosgMO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4aosgMO"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fbc305882so133051f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 10:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769623602; x=1770228402; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bv3Ru//yBMPMzCGxGlXC/tIcSHnEGcKaRRDL4KweM6Y=;
        b=X4aosgMOpCId7mxCyyIUchG1tEuXzQpw4a3QLA+6VElOqpuclOFzwvIgT4YsHLRTrl
         TwuJct3SkVHpVjAPgEe8AuB+pVUJUqpCVS8izcyozuXHNN2Yw5u+tepoVBMYOOYNGhVe
         2+R2xOCQ0hmiBCIsxeY0AW+IhOljZ8P47icwjgngB2XhhNMVzSDl24+uh50j1xrMeI5W
         3mSpFFtV/mL3uKV4Ed5CvA/cVSJ5NiZlEBRsG0MzXwuvRUwV0tAAN820NgApt7P5uEYB
         FpluslxaGxykQwmgPU5jvdNcGo5jzCt4d9Tk3MkI/XriiE5R5/aPxjCAMm/mnWx5OhxZ
         x8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769623602; x=1770228402;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bv3Ru//yBMPMzCGxGlXC/tIcSHnEGcKaRRDL4KweM6Y=;
        b=Viurl2UlssY8CYP7o9FD2EWYr7Ng5W6X5e+133n4BBxhEQpVQFonHmhQvWmgcxwbcG
         ErB5O4JzdJErwrYZURkmDGqksxFW684PTBNb0M7sGmxTLEA24CfZ7IT03xLZaiYmOClw
         RmICWWax6i37I8d/mAaJRaPJ7gKLgncg9UzIb6Y0bSEiD7RbkWnptqmzz1Z6D/xCz+NI
         NbS/QKua0Ncdv5A1MLXC4VvCwQuFZAbap3U+Bv2m+z/zAjNAHey7A6LV3JDKIzO62t0V
         mle5c+tLeRMjA+Jmx2cxqIdarzSh0rhGHvOPPbXyUe611xA9T8UxdWlZ5rj+j0csMWFQ
         mxcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLd0FT6whkX32iBbNxdjdUzqkEBxrDOTWmWKiENT/E1VD0ASoHf/Q6gqglIfLM0GFQ/IyyFvzADv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVHyioJQ3JPyQiUpLaBzdKlFcUcCotdP7EAEVaiCBxza5Eh1bN
	dbd4jTuJIv3HOqMcjn9+mlCh2cDEzyirQD28BUQZ9NJ/ei3dRq9gE5d8
X-Gm-Gg: AZuq6aKkpZt9xRCVHqTLdbjvPKyY1I10n7NJoEJ5hiOrZnbI/Gt5Nrynur1TGsLJkd6
	qQD/zIdZrdOgrj4jCMl6kt8IXiQ13uqQbG38h/UsclsIPG9zrphbaVZwOsCZ4AefblJbATcsnor
	Nl6PwwQqdIn1Oam1eYLjGWCqFcGIxHzMGnQPvKHHbanzj8AEqZy5goNkEsdaMQO6TDDRGkUERfm
	spFH26R9WLDdS/ShGAvvPjoZsCTvi4F8YwWfPmNJzOE7gah8QpIujggmX9HTsIfjsktsETFXm/w
	1SnFXLcuLMfeMC2Pkwfimw3VfkgIJ6nyzuMXPTnWEJeb0fTndYHZW9UtRYZ+UhbaYxatH7rzOp0
	yc+lAcxc5Bp+v6rYavb3IrOxR144eFnJ6Sp0H+AH83C+451jJKpWXTgUIldKsoGxebYctnWCMVP
	2sKFg4EObnSWEjFvp9KjhGeUfITVDcgA==
X-Received: by 2002:a05:6000:2001:b0:435:9f41:d54 with SMTP id ffacd0b85a97d-435dd1d8e78mr8748442f8f.60.1769623601691;
        Wed, 28 Jan 2026 10:06:41 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm9024567f8f.33.2026.01.28.10.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 10:06:41 -0800 (PST)
Message-ID: <e5b775065b92cada730f42a3d60546700ec46db9.camel@gmail.com>
Subject: Re: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jean Delvare <jdelvare@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>, Linus
 Walleij	 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 28 Jan 2026 18:07:24 +0000
In-Reply-To: <02b7cf63-4f87-4cdd-8d9e-53a7d0e808a6@roeck-us.net>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
	 <eed64bf1-93af-4b36-adf5-1476cb40edbb@roeck-us.net>
	 <382e259ea3835ffbd2be9c36b529875f5a43f38b.camel@gmail.com>
	 <8efa188b-8b91-479c-ac10-3fba5b0cbb5f@roeck-us.net>
	 <02b7cf63-4f87-4cdd-8d9e-53a7d0e808a6@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-01-28 at 08:55 -0800, Guenter Roeck wrote:
> On Wed, Jan 28, 2026 at 02:04:35AM -0800, Guenter Roeck wrote:
> > On 1/28/26 01:44, Nuno S=C3=A1 wrote:
> > > Hi Guenter,
> > >=20
> > > On Tue, 2026-01-27 at 09:39 -0800, Guenter Roeck wrote:
> > > > Hi Nuno,
> > > >=20
> > > > On 12/23/25 04:21, Nuno S=C3=A1 via B4 Relay wrote:
> > > > > This is v3 for the LTC4283 how swap controller. Main change is th=
at I'm
> > > > > now using the auxiliary bus for adding the GPIO device (done depe=
nding
> > > > > on FW properties).
> > > > >=20
> > > > > Similar to the LTC4282 device, we're clearing some fault logs in =
the
> > > > > reset_history attributes.
> > > > >=20
> > > >=20
> > > > I ran the patch series through an AI review. Results are below.
> > > > Please take a look.
> > > >=20
>=20
> Another run through AI below. Please let me know if there are further ina=
ccuracies.
>=20
> Thanks,
> Guenter
>=20
> ---
> commit 82433332ce165903d56fae327ced975aeef30475
> Author:=C2=A0=C2=A0=C2=A0=C2=A0 Nuno S=C3=A1 <nuno.sa@analog.com>
>=20
> hwmon: ltc4283: Add support for the LTC4283 Swap Controller
>=20
> Adds support for the LTC4283 Hot Swap Controller I2C interface.
>=20
> > diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> > new file mode 100644
> > index 000000000000..402b53f81548
> > --- /dev/null
> > +++ b/drivers/hwmon/ltc4283.c
>=20
> [ ... ]
>=20
> > +static int ltc4283_read_power_word(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0 u32 reg, long *val)
> > +{
> > +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MI=
LLI;
> > +	unsigned int __raw;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(st->map_word, reg, &__raw);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Power is given by:
> > +	 *=C2=A0=C2=A0=C2=A0=C2=A0 P =3D CODE(16b) * 32.768mV * 2.048V / (2^1=
6 * Rsense)
> > +	 */
> > +	*val =3D DIV64_U64_ROUND_CLOSEST(temp * __raw, BIT_ULL(16) * st->rsen=
se);
>=20
> Does this overflow *val on 32-bit systems if the calculated power exceeds
> 2000 Watts (approx 2^31 microWatts)?=C2=A0 The intermediate calculation i=
s
> u64, but the result is assigned to a signed long.
>=20

I'll have to double check this one but IIRC 2000W is not a realistic value =
for
these applications. One thing that could overflow is power_max given that t=
he default
register value is 0xff but we do write the proper max value depending on
rsense (I actually need to check how will this behave in case we use a defa=
ult
rsense value - ie with no DT property).

> [ ... ]
>=20
> > +static bool ltc4283_word_reg(struct device *dev, unsigned int reg)
> > +{
> > +	switch (reg) {
> > +	case LTC4283_SENSE ... LTC4283_ADIO34_MAX:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
>=20
> LTC4283_SENSE is 0x41 and LTC4283_ADIO34_MAX is 0x40.=C2=A0 Does this inv=
alid
> range (start > end) effectively disable access to the word registers
> via st->map_word?

The above is odd ad I'm pretty sure I ran sensors on this but could be some=
 late edit
mistake. Anyways irrelevant for the next version as you prefer the custom b=
us regmap
approach.

>=20
> > +static const struct regmap_config ltc4283_word_regmap_config =3D {
> > +	.name =3D "ltc4283-16",
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 16,
> > +	.max_register =3D LTC4283_ADIO34_MAX,
> > +	.val_format_endian =3D REGMAP_ENDIAN_BIG,
> > +	.writeable_reg =3D ltc4283_word_reg,
> > +	.readable_reg =3D ltc4283_word_reg,
> > +};
>=20
> Does max_register =3D 0x40 prevent access to the sensor value registers
> (LTC4283_SENSE at 0x41 and above) which are intended to be read as
> words?

ditto

>=20
> commit 5998c620fbd8915340a4b92635c9489a91fae567
> Author:=C2=A0=C2=A0=C2=A0=C2=A0 Nuno S=C3=A1 <nuno.sa@analog.com>
>=20
> gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller
>=20
> Adds GPIO support for the LTC4283.
>=20
> > diff --git a/drivers/gpio/gpio-ltc4283.c b/drivers/gpio/gpio-ltc4283.c
> > new file mode 100644
> > index 000000000000..fa0c106d4fac
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-ltc4283.c
>=20
> [ ... ]
>=20
> > +#define LTC4283_PINS_MAX			8
> > +#define LTC4283_PGIOX_START_NR			4
> > +#define LTC4283_INPUT_STATUS			0x02
> > +#define LTC4283_PGIO_CONFIG			0x10
> > +#define=C2=A0=C2=A0 LTC4283_PGIO_CFG_MASK(pin)=20
> > +	GENMASK(((pin) - LTC4283_PGIOX_START_NR) * 2 + 1, (((pin) - LTC4283_P=
GIOX_START_NR) *
> > 2))
> > +#define LTC4283_PGIO_CONFIG_2			0x11
> > +
> > +#define LTC42823_ADIO_CONFIG			0x12
>=20
> This isn't a bug, but should this be LTC4283_ADIO_CONFIG instead of
> LTC42823?

Indeed!

- Nuno S=C3=A1
		2
