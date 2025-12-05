Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3B332ED2F
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764936163; cv=none; b=tqKnikSsG8JWgMJYHcAa/S9/rusmV11MGb02eeNQ/rWQfnerIvolXOhdLD4KHSqsQ7E7wJSw+id3PrRVGzaxatsrJMnwJWMXFeEmVFxOQiLwgEWQxkCPDYyRHZCvK4WtvsxodsSLxKAHqMdmlzp0o3v7znDaQ22zOjR9TBTXh3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764936163; c=relaxed/simple;
	bh=bgYeGMAzm6Y6sfhlpNRYEBYM+0aMUuWk/NuSWaFkkTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/liMFMPKEWSlx3xe4TVVuRtVvZ0AHIC6gwhQfjGCLE3UGkJVxW19mmvuaEcuPc5/OwU735siRckByAUYcSB0AypRnWthToTkHrakZEaCtLcMkN7M1j3jZkXdqe+AkTrOPbSh1GfI5bKw/nbI2+k2QqEr6fbY7dtF1LhnJDZ9d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMt2ahl3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMt2ahl3"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b735b89501fso232472266b.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 04:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764936158; x=1765540958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgyaUQ07yV5AbaD6jWa5R2iO6mlnxudcEFZdveJPHlE=;
        b=WMt2ahl3Go75Px38hXZd/4f7k5fSV4uIJHmp5qLW61Gdy06MSZIRfVgVrkeTdQXdyg
         V9xct/0yL7Yn/Y3Eh/vn1MTOXHc7N2Vdzg2dtMxwQJpISsFDLdeQdtRF3BGp7neiLsTI
         kWmnazS6cmIQ2pJxX1ytEfm7yPHMCfJ+GxX7Gh32ttxO847xtad/+PxmepZf9FbIEnVv
         k7NH8FPU+1pfZxjG3+crlTzmj19EllgpR+iYzZgbt74Qia0It84Dvpi4gSXiT1uE2ljW
         nXarr9fnXxBEErW0fw8X5UowjJD7OMcx1P9pX2Yr0kOIp+qfUDYE6LVJsEA2lKy0sMiY
         BcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764936158; x=1765540958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VgyaUQ07yV5AbaD6jWa5R2iO6mlnxudcEFZdveJPHlE=;
        b=L2zeOFU28ScEGvJ+nnATXSK+5hmzuqGkrtUXpNFggRTZ1MRAr9mA4zjzLgOFPcT0P7
         di+w5Mv8TAKE5tkjFihuXvGBcZkCM+0aj3KEOixTB9qWhzrzuM8C2LFbmw62sJTl48H6
         eBiQF2UNjfUR6mzZh1wI65fG68HEHTDJYQuFlDJyep9ZoWcpAjuN3TtMyZuVz6z+ko2Z
         tYhTTWYPUse/bNXKz/aAGPHVfD24WMllERMEhAa/ecfaYAq8yN2WLYaPFR7sIxUKKMFt
         NmatGE8FQqZKKoVIWCVe1/+3y6rYznj6DtbNDTyFazFQbYy5k0/YKTLDjYO9hMlkP3e2
         KBBA==
X-Forwarded-Encrypted: i=1; AJvYcCWTuBfDF3rpnRsKc4xxW8wFQBTkE5nb5fAF0fuvHeKuFg5mqEU5ORsm6o1uKn0tViecS5LPwSr2N70=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkhR1U/T7lUJx0MEax0WNg0R8j8bbyRaxQLjE40j1dk3NYCDIA
	NnakeB7swrUJ9QRgMEBobOh7StIHttt16KPY6WZPi2re/4OAeMu5j0Ejtj379wOfW64pyoSk4E9
	DeWsRlOFWzSSj12a3ByRHEd8+CwoCm5c=
X-Gm-Gg: ASbGncvQliXx9tzpVi8edYY5O4GOLL5+KHLHwP4NWL2Go9xF4tU9JrFmVTUvnADRH6b
	V9AM4QkDtCizrzpzHkDQTk1i0JGY52k/PLTYm48y4UICBdlkUkfz6/wBBFlzMpK/AOCCLFl9qWn
	fgGE/2ic5znw1BI3l4L5BuyndWqMB8R7hr6RuRa9p/2YjIF6Q3g4MvGzV/op5rFQ/6YyylS0CtX
	46qx4DcCpNYETbb8sge8uuMPrecivl9Q038XJAjVjy2KP5xY/vJNpgQAmmoA7jdvPn9vaeQEZ1D
	+eDxn/WWCrjlJVl2gbvszKaQreFXg1FoZ38TIUP+tXKz4AWp3NraE3Ko7x/xDFBoGE5YS4Y=
X-Google-Smtp-Source: AGHT+IGBQ0GhvwVKLqSDdmB+0hEDhHnoYfYYmLqHuYVoO1l7rAv2wXtwBjAHttKeBb0IocJiCANgCIPU3cmgESB5dxQ=
X-Received: by 2002:a17:907:7ea3:b0:b79:cec4:f1ad with SMTP id
 a640c23a62f3a-b79ec6b93c7mr675997966b.40.1764936157439; Fri, 05 Dec 2025
 04:02:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-staging-ad4062-v2-0-a375609afbb7@analog.com>
 <20251124-staging-ad4062-v2-9-a375609afbb7@analog.com> <aSQ2JUN05vmMQC1I@smile.fi.intel.com>
 <rk4hmupbrb5ugxft6upj7ru43x3z7ybrobax45rorpwbcwleh6@vzxrr3m7r6ep>
 <aSgX9nMBwBtAlSyj@smile.fi.intel.com> <3izg5lyxjye24pvzoibk4tmnxbdfokr53abkpbjo5epqjoz55j@6wc7i4wsgwkt>
 <CAHp75VfLd46xt_2W35gjoTCoh+PqExL-faZ8snhzfOx=65qXWw@mail.gmail.com> <egl65ctlz2umzcdzf7ke5c2hnd33ghudklmf4pdgnp64vnzjg3@rpqrludyv4p2>
In-Reply-To: <egl65ctlz2umzcdzf7ke5c2hnd33ghudklmf4pdgnp64vnzjg3@rpqrludyv4p2>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Dec 2025 14:02:00 +0200
X-Gm-Features: AWmQ_bnpd4_oFl4c5azPbk7HXaspqhnY9oSEmM6KqrHSmwBU-kDUBFomCH8ufok
Message-ID: <CAHp75VcJZavRo7TKXAZagDc8Vt4-y-zm+EySyugRtSxSLMGX-Q@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] iio: adc: ad4062: Add GPIO Controller support
To: Jorge Marques <gastmaier@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Jorge Marques <jorge.marques@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 1:53=E2=80=AFPM Jorge Marques <gastmaier@gmail.com> =
wrote:
> On Fri, Dec 05, 2025 at 12:21:31AM +0200, Andy Shevchenko wrote:
> > On Thu, Dec 4, 2025 at 11:38=E2=80=AFPM Jorge Marques <gastmaier@gmail.=
com> wrote:
> > > On Thu, Nov 27, 2025 at 11:20:54AM +0200, Andy Shevchenko wrote:
> > > > On Wed, Nov 26, 2025 at 04:55:41PM +0100, Jorge Marques wrote:
> > > > > On Mon, Nov 24, 2025 at 12:40:37PM +0200, Andy Shevchenko wrote:
> > > > > > On Mon, Nov 24, 2025 at 10:18:08AM +0100, Jorge Marques wrote:

...

> > > > > > > +       return reg_val =3D=3D AD4062_GP_STATIC_HIGH ? 1 : 0;
> > > > > >
> > > > > >   return !!(reg_val =3D=3D AD4062_GP_STATIC_HIGH);
> > > > > >
> > > > > > also will work.
> > > > > >
> > > > >     return reg_val =3D=3D AD4062_GP_STATIC_HIGH;
> > > >
> > > > Hmm... This will include implicit bool->int. The !! guarantees valu=
es 0 or 1,
> > > > but I don't remember about implicit bool->int case.
> >
> > > I don't think the implicit bool->int is an issue, grepping `return .*=
 =3D=3D .*;`
> > > matches a few methods that return int.
> >
> > Yes, the Q here is the value of true _always_ be promoted to 1?
>
> The relational operator result has type int (c99 6.5.9 Equality
> operators); and when any scalar value is converted to _Bool, the result
> is 0 if the value compares equal to 0; otherwise, the result is 1 (c99
> 6.3.1.2).
> https://www.dii.uchile.cl/~daespino/files/Iso_C_1999_definition.pdf

Okay, thanks for checking this!
So, let's go with a simplified variant then.

> No conversion warnings even when forcing _Bool type.
> There are many usages like this, for example:
>
> drivers/iio/accel/adxl313_core.c @ int adxl313_is_act_inact_ac()
> drivers/iio/light/opt4060.c @ int opt4060_read_event_config()
> drivers/iio/light/tsl2772.c @ int tsl2772_device_id_verify()
> lib/zstd/compress/zstd_fast.c @ int ZSTD_match4Found_branch()
>
> I cannot find many legitimate usage of relational operator with the
> double negation.
>   git ls-files | xargs grep -s 'return !!' | grep '=3D=3D'

--=20
With Best Regards,
Andy Shevchenko
