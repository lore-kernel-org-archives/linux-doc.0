Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB2E3E716B
	for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 13:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774618088; cv=none; b=Ybl0XhuoZO4LNgbQkrp1QNNRwgPyGqNLFWIl0RFkUqg9bteXBZPR4Hv0KbQBP7cv8/lLwuddlPJc/beMvZLcZw+lOmJ+iliwPOTL9Rk8uqr0OQYzMifR8N7XdFCOEUvppm47fQX/uke29TOHAzmsaAvOXQXyBDS6IImr+El/1gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774618088; c=relaxed/simple;
	bh=++hkBnIAEvloFIQ575XrWS1bjaaVT6AJ+ILFSO/cg2M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dJPHCl03rVGdWuHala9lr0GI6j8KHNg/0X2EBxnn/XMhUj8YqBwpHCvdlc7W+V3t9Zl+qbUQfhoO7wMoUOG5dXSwMeHmvwZKofBZg3p9snUzA62vgd88MsQ2LQxeijxIspz6OmLIx86AJA4EAkocPnGEqmc3tJVPIDEBjohzTTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Is/EO2DQ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Is/EO2DQ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so24324825e9.2
        for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 06:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774618085; x=1775222885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sojWPfL6Z8AVWMTcumjRgckMPGB7q4CLXGUVSk+dCo=;
        b=Is/EO2DQQ//4BrvGojf1/76xa0kisca2CRPn2ftxmwgsmsM3Q9h60V3+pZvobea+cF
         DBU30isrXdsznWBv7koPYVcT6s+d6807190EpC5idJ3gR6CX0hvP+ZPylsSwJnWd0hDa
         8qGkH49b6iOAAkwzbiiqOn145pwSYSSH5jHRhdcNe4BlGHbRL+GC7Yr2370sD2LB7f53
         4uflbX9p0dpCHU2saK3GLmg3Vj6hahyLC3lKmu52sdMmpEpMEjE8Z06ihDiiLwjV1NrU
         tE35bqlKWMmDx/BVGHWoEm5Krk4b+TMPI0RbD+/e4ERuhnslvErCNeJB+gKppFfDmyK/
         8f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774618085; x=1775222885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8sojWPfL6Z8AVWMTcumjRgckMPGB7q4CLXGUVSk+dCo=;
        b=lk3a2a707/J9S/5lIwLko6/RLk0b5x2JPjOdC6drMcwEvBIzniJpBVDOrFhJV/YGtc
         sglRHfkqKPwZb/IUAxiVXI2FgHSPbDhM0VckDIbROjiQMgsN0UJyG12wXifQ4wR8caOj
         Z0IFjat2cTHjwi0cK7nnwnb4GDMioM0JoQ5LK5FOI6oHP1vVvzxQXJzWQcdV+QgvEt8J
         AJohq4zkgkTeISS6Z6N5Au4jWUUrksETMMiJRES39YkIr/x65gliGvYbX0vySgycwnA5
         o/2/b3snejN+usk52/s+ZZ2yll+V0yTaQ6U2ihb+fr7B9Zr9p4Xg9T9R3f6r2NPHM28B
         T6eA==
X-Forwarded-Encrypted: i=1; AJvYcCXH+2q+i1WL9r+vBU0oKnzwRJB2Z4rszbaA4fAArZK6uBh2RE6L2AeENgSmgkpNq1IsSdVM+OJyfxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTO4zP5dyGA+K4IZZWeq4HEL5paX503EXu0kI149xdDPC26uvA
	Tfl2+LwYdP2C/1eYRhDBD7L16AUC635EAMpeeBm02gWGyNCtaVww+nuI
X-Gm-Gg: ATEYQzzSPpuVk1CbZiPtM2hG+u8CQ0akAu+L5s2vrCXI+UsR+0xg9OdE7bZO9zYT3R8
	ZORJfZNZdQo6JX8n/uqY5H1CvMN2aCFEyLxZXom5fYz0xLO0afCj62ESA5Jri/NIgJhMjn48Mvr
	gGfIyhp7CEbfweMMMi+6dmTfJadhbI56yDSujEJEBhCgepFV6VPz6R3NL61QkOQniTLDseWOvKH
	ubOuSLjVT9v0MytdO9XoOVLijJXFHWcH8tuD29cw+yzP2gEpCrqoV09XmWufcE9WvCRI4T9nozT
	3vGkNrNUULTluLkiChy2+MjMNpUJLP+dv1VOSM1Xm9DL0HASLoMKyXI6VF2kBkFVvZyU5QRkI6P
	Yf2hGylLNnMZhhUFriD6lQgPJmW2tch/8w6acCRveE74vA3niIJS1S1c2uxSCeRi8lPYga+Z2Ox
	YNIbnDqGPximnjEzNQ3O3Pt6ZVsqe3uv+jPi/iIU8LKHqJ3nl7Kb3ioCJgEhHjltpB
X-Received: by 2002:a05:600c:4f53:b0:485:481c:e7bb with SMTP id 5b1f17b1804b1-48727ee9b89mr42168595e9.20.1774618084923;
        Fri, 27 Mar 2026 06:28:04 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d2366dsm87955895e9.10.2026.03.27.06.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:28:04 -0700 (PDT)
Date: Fri, 27 Mar 2026 13:28:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, rodrigo.alencar@analog.com,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Andy Shevchenko
 <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v9 2/9] lib: vsprintf: export simple_strntoull() in a
 safe prototype
Message-ID: <20260327132803.1fe51253@pumpkin>
In-Reply-To: <acZitENbWQF7cmDA@ashevche-desk.local>
References: <20260320-adf41513-iio-driver-v9-0-132f0d076374@analog.com>
	<20260320-adf41513-iio-driver-v9-2-132f0d076374@analog.com>
	<acZDneLrIPOmU5ci@pathway.suse.cz>
	<acZLHAT5qJyjKTsp@ashevche-desk.local>
	<20260327104440.079343c9@pumpkin>
	<acZitENbWQF7cmDA@ashevche-desk.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Mar 2026 12:57:56 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Fri, Mar 27, 2026 at 10:44:40AM +0000, David Laight wrote:
,,,
> > > but also wants to have the fraction part be limited in some cases to =
s32
> > > or so:
> > >=20
> > > 	struct float
> > > 	{
> > > 		s64 integer;
> > > 		s32 fraction; // precision may be lost if input is longer
> > > 	} =20
> >=20
> > Are those 'fraction' counts of (say) 10^-6 (like times in seconds+usecs)
> > or true binary values where the value could be treated as a u64 (or u12=
8)
> > for addition and subtraction. =20
>=20
> It depends. IIO has scale on top of that, so the fraction part can be 10=
=E2=81=BB=C2=B3,
> 10=E2=81=BB=E2=81=B6, 10=E2=81=BB=E2=81=B9. I don't remember by heart if =
the ABI requires all digits to be
> placed, I think we don't require that.

Seems like you want this function (untested):
u64 strtofrac(const char *buf, const char **end, unsigned int len)
{
	u64 val =3D 0;
	unsigned int digit;

	while (len--) {
		digit =3D *buf - '0';
		if (digit <=3D 9) {
			buf++;
			val +=3D digit;
		}
		val *=3D 10;
	}
	while (*buf - '0' <=3D 9u)
		buf++;
	*end =3D buf;
	return val;
}

	David

