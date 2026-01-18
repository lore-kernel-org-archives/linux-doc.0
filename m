Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386682D73B5
	for <linux-doc@vger.kernel.org>; Sun, 18 Jan 2026 10:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768731103; cv=none; b=i+X8ZrFhl4jVVxuRzfbd31QcOKhx0u+bg7QD5Df1zauy0otVi/0pPghv27SZN6yToBy9hpd0x599sAqFNr9HAdrGvWx8qQTisxxsNUQWY0ahaKvivuxNSEPBcA33/T5u11yqE0V+mOrQqB2NDTEm/+uECWjkQ+98hHANHi/c4MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768731103; c=relaxed/simple;
	bh=LvWRP8Kvnm4HcYbXM1gISUJO/wKhYPV7aq8AvbjshSY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R2t6nfW04DJV2pLC5a5tbXKTZPp7kkHfP6KweT8MKE8TLbKGwWFW7LIHbnVqAvPpN+mEiwCYiteqfxdDQv+VavnoxMj5WD8Rlog+va5z1U0uOq9uTb79WEPV2v0+imXz5uJlmejexz9ayo48FwgQAOotgYuwM+2cgRHdbx5XqJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWXzVz4w; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWXzVz4w"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ee974e230so27926375e9.2
        for <linux-doc@vger.kernel.org>; Sun, 18 Jan 2026 02:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768731100; x=1769335900; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LvWRP8Kvnm4HcYbXM1gISUJO/wKhYPV7aq8AvbjshSY=;
        b=nWXzVz4w//cEpWYq8CWQj/iOOl8JdJfsdlWtmAlJ/4ZppLoCwFVfDaUWBbo33kvVlc
         8DawAMgM9oqQ7mrZl7+7SqY+6mnd0gxfyV4pb7FNFv7yLreBWRAi+Ta4d1+L60iRvEQN
         pF75Ft478NOJnCnxa+60DT4NZuGgiSIkYWpyjFBfRpHqRr/sbPCa1fhE9QcMufXo9Bhp
         w1WiSmucMUGR9AZCYB8a3da/73IcgKiE02u3bC0mUuqYqFLtS0IMLL7ThVQibJcPgAmf
         WMztp1S4n8mRj0D6O7h59Je3KEiigsCiL2kBaOeOzLDQSpyTqi+Prk8wxP27V5Dqb8er
         Lp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768731100; x=1769335900;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LvWRP8Kvnm4HcYbXM1gISUJO/wKhYPV7aq8AvbjshSY=;
        b=C4Jjl7H8oiqiT0N3SfMgP40aDngj/WiPgG9XrxNsPN5AB3t3IY+lAcG02vkHjWGJpz
         4klspdEicZeS739lUe/XQXO1A21aytXtjz3pBzPMpjUz6LB72/chGcpDEo8nBnFqbrnH
         I4Ydhn+Sf43/OCj/JR8Egzt4ddcOH08Yek+z9aq7BPWx1AUlncWpNrO86eERHQX180fE
         V+1bGwFQI0+aUfhl5BXx1XTkvnZVUYI7da9EpHIPzoRpwiA4jjqY5R68dXl1ZIczygK/
         rXOrTmDksYEkmIb7GKuZ1h4odB5QoSse/tr6Jk8plhB4QXvTPugPW5lYWSTf5rdCKFyT
         IiBw==
X-Forwarded-Encrypted: i=1; AJvYcCXTvib00Dd6lokoIJCtkuC6EJoqUBTqM503jtl6lVKmCPmEt8DEkBapAIsLTht74UyN8zqamLhSK/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJmPzwI3EaPU+3AK2E0xZ6PA2UC7h2dajmM3Z7UhaVA68q1Gk7
	OErk4k7V/sjHChoL+SNHfocILLqgKoQN6WVeSJbJj9nVgVX/mtnmUjlm
X-Gm-Gg: AY/fxX413/Bci9URo+BD7sTvcQDgCXUOjVBkS3qs9FTfCpdWJZ651gEiE754NhEV9ZM
	6424y7uzg5/X+8KXKw1lGBcJcTP9+CWryAfvqSQHgUm580PB/nWzNTme88B9cVcyQBHw1ijQrfO
	TwmABAD91DKopToowayx91mGfnenGUsN6i+GO2hCLh1fDqwkewgfe4ZzqeYKdSSg75bgFoFYBbe
	pAX60QGCz4NF74a+e0FM4bAwPF+S8RVQxA0tF7YbRJhGM/wn9qGKbkcMSmgrilVUquLcCa+N2fs
	RN2CdoGAFf6MqHrdOUlXRslYTS2nIgjl6uObNcrARYGdTa0Sx4HDkCwPPwH8w7GkWmnKOaoCR3X
	jkdgJnMRTCXDXPUySuwlK3p2uRZ718Zl5fQbI8I5ipAgIIxeEHSB/hGVkykABVbbF09/eyvkWWQ
	h4ZTl6nHFsb2+X3U4mzWnwnoaZ5DI7aPW+3+7ft+85HTHkjg1WXcJ+Jo9gMbNlW0p1iPgHQQ==
X-Received: by 2002:a05:600c:5487:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-4801e30d482mr95822395e9.13.1768731099475;
        Sun, 18 Jan 2026 02:11:39 -0800 (PST)
Received: from ?IPv6:2001:818:ea56:d000:94c4:fb0e:28f:2a8d? ([2001:818:ea56:d000:94c4:fb0e:28f:2a8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992681esm16102416f8f.11.2026.01.18.02.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 02:11:39 -0800 (PST)
Message-ID: <91c052abe2f88be12ef9f557120d540373471d67.camel@gmail.com>
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
Date: Sun, 18 Jan 2026 10:12:43 +0000
In-Reply-To: <0ae2d448-06e3-41f6-89aa-8aa3f939d64f@roeck-us.net>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
	 <0ae2d448-06e3-41f6-89aa-8aa3f939d64f@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-01-17 at 16:27 -0800, Guenter Roeck wrote:
> Hi Nuno,
>=20
> On 12/23/25 04:21, Nuno S=C3=A1 via B4 Relay wrote:
> > This is v3 for the LTC4283 how swap controller. Main change is that I'm
> > now using the auxiliary bus for adding the GPIO device (done depending
> > on FW properties).
> >=20
> > Similar to the LTC4282 device, we're clearing some fault logs in the
> > reset_history attributes.
> >=20
> > Guenter, in [1] you can find some replies for some questions you had in
> > v2 that likely you don't remember anymore. Regarding the regmap story I
> > ended up adding a secong regmap for the 16 bit wide registers which
> > seems like a clean solution (if I'm not missing nothing).
> >=20
>=20
> Sorry for the long delay.
>=20
> Actually I prefer the solution used in the lm75 driver: Map all registers
> to 16-bit registers using a regmap bus. Would that be possible ?

I do like the current approach as we get the proper i2c functionality check=
s from
regmap and it actually maps the device register layout. But no strong feeli=
ng so
obvioulsy I'll try the lm75 way. However looking at code, something come to=
 mind.
Won't the below break on big endian machines (assuming big endian device)?

https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/hwmon/lm75.c#L594

Sunday morning for me so I might be missing something :). FWIW, if I'=E1=B8=
=BF right about
the above, then regmap i2c has the same issue (tough the issue seems to be =
on the i2c
API - at first glance).

Will also look at the below feedback.

Thanks!
- Nuno S=C3=A1

>=20
> Other than that, I ran the series through an AI review. This is what it t=
old me:
>=20
> =C2=A0=C2=A0 Identified Violations and Observations:
>=20
> =C2=A0=C2=A0=C2=A0 * Alphabetical Order of Includes: In drivers/hwmon/ltc=
4283.c, the include files
> are not strictly in alphabetical order.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * #include <linux/hwmon.h> is =
listed before #include <linux/hwmon-sysfs.h>.
>=20
> -> Actually, linux/hwmon-sysfs.h> does not have to be included in the fir=
st place.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * According to strict ASCII so=
rting (e.g., LC_ALL=3DC sort), hwmon-sysfs.h
> should come first because the hyphen - (ASCII 45) precedes the dot . (ASC=
II 46).
> =C2=A0=C2=A0=C2=A0 * Documentation Discrepancy: The file Documentation/hw=
mon/ltc4283.rst includes
> a section for "Addresses scanned" listing I2C addresses 0x10-0x17 and 0x2=
0-0x2E.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Inaccuracy: The driver does =
not implement a .detect function, meaning no
> I2C address scanning is actually performed.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Guideline Violation: The sub=
mitting-patches.rst guideline states that
> only specific I2C addresses (0x18-0x1f, 0x28-0x2f, etc.) shall be probed.=
 The
> addresses listed in the documentation (specifically 0x10-0x17) are outsid=
e of this
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 approved range. Wh=
ile the driver doesn't probe, the documentation
> misleadingly suggests it does so on non-approved addresses.
>=20
> -> Please fix.
>=20
> Thanks,
> Guenter
>=20
> > [1]:
> > https://lore.kernel.org/linux-hwmon/0765a0b89779331c62a3f136ef030f7f2f4=
0ea47.camel@gmail.com/
> > [2]:
> > https://lore.kernel.org/linux-iio/cover.1761588465.git.geert+renesas@gl=
ider.be/
> >=20
> > ---
> > Changes in v5:
> > - Patch 2:
> > =C2=A0=C2=A0 * Added a secong regmap for the 16bit wide registers;
> > =C2=A0=C2=A0 * Add default value for rsense so that we can probe withou=
t FW
> > =C2=A0=C2=A0=C2=A0=C2=A0 properties;
> > =C2=A0=C2=A0 * Make sure to give the right file permissions to the rese=
t_history
> > =C2=A0=C2=A0=C2=A0=C2=A0 attrs.
> > - Patch 3:
> > =C2=A0=C2=A0 * Make sure to get the right regmap (given that the device=
 now has 2);
> > =C2=A0=C2=A0 * Add error handling for getting the regmap.
> > - Link to v4:
> > https://lore.kernel.org/r/20251204-ltc4283-support-v4-0-db0197fd7984@an=
alog.com
> >=20
> > ---
> > Nuno S=C3=A1 (3):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: hwmon: Document the L=
TC4283 Swap Controller
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwmon: ltc4283: Add support for th=
e LTC4283 Swap Controller
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio: gpio-ltc4283: Add support fo=
r the LTC4283 Swap Controller
> >=20
> > =C2=A0 .../devicetree/bindings/hwmon/adi,ltc4283.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 272 +++
> > =C2=A0 Documentation/hwmon/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0 Documentation/hwmon/ltc4283.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 266 +++
> > =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 9 +
> > =C2=A0 drivers/gpio/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 15 +
> > =C2=A0 drivers/gpio/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0 1 +
> > =C2=A0 drivers/gpio/gpio-ltc4283.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 218 +++
> > =C2=A0 drivers/hwmon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 12 =
+
> > =C2=A0 drivers/hwmon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/hwmon/ltc4283.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1766 +++++++++++++++++++=
+
> > =C2=A0 10 files changed, 2561 insertions(+)
> > ---
> > base-commit: bc04acf4aeca588496124a6cf54bfce3db327039
> > change-id: 20250812-ltc4283-support-27c8c4e69c6b
> > --
> >=20
> > Thanks!
> > - Nuno S=C3=A1
> >=20
> >=20
> >=20
