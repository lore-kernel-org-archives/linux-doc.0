Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619F93DC4DC
	for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 17:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774891489; cv=pass; b=u37u7eV6RvClUmAuaukz3wJIue/FxpkVoUIgcK0Rli+5a16wBKku1CTjoob5paDfXBOX8RaTyeq9Enf8gtOVI05/H/X0iUHxlXs+MUWXxp5XTuLM2Jtwy5jNurLJeGQ8/W03V1RFfCf6WivkP5IckbMbWdlKwWwygwbym1KJz3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774891489; c=relaxed/simple;
	bh=/POCNtVCVgs8Wz8mZ9O1D8ykDMaaTk6zJm6BSwE9+PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoyIabx1S/+Closu2Yhd2YB+xK1vhJh3PPdYLw+EYY36oj5mggOviL7dX6xuFZPbGIrM+yq0pZwzIRWUJoRucliPt1Y+posZyscrYasuuOtiHNVTlITDJKzj4aPtrvSRmo05JmmEkUFLDtWRSZkRu2Byqtf2nU6ACyLBcZmY1AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V76BZqIs; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V76BZqIs"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b982b0889d8so565750966b.2
        for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 10:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774891486; cv=none;
        d=google.com; s=arc-20240605;
        b=M63DKIUnHkJLoYoO4CFcz8BwcSXAJEfHMGLuIgXOHkyC/lfbJJoPl5f80fqN8+TLl/
         lqug0bT/Odt+DTTwVPEXnfnj79Bc1p3ATSUynJlbzVqIL5pQSjDVDRSKl45zK+2xYwXk
         JKIEtupuhvrZF7kJ8Fnu6JEVjrmLXPtkL9jTLBP8tv0h7lzV4pjsdBWYJ/bXfO3/y04f
         vZo0ZXqM7nOEX6+yVNfVRYtLD/M4BFQa+AsISbenSVkDx3ltuecuKKUzSyPD10DdtTW8
         uKXbIkqW7YeXcKY77jknpkhYKN2CSljEJ+32b2TB77UAut3/b5WlIiZxvphuvTC48IM2
         c0EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/POCNtVCVgs8Wz8mZ9O1D8ykDMaaTk6zJm6BSwE9+PU=;
        fh=rT8Wuo/UpZyB8b+mFwcefEfFjo9XIJcK2+Lgu49I7aY=;
        b=bwHHLBlNxGwoa1feEURTAO72PaVCOHcFu6KDNs2mrMEBgnEwm5pLHOZ9zgkBl91bZ2
         JKYvCaYwTmBWYTLw0q9nMn5qD0NwTPazcZp6UPDw5CyU1uXeugTPgTun9OridtZy7Wua
         fEjE6u2R6dQCTIigpWLbZz8dJgus6IovxPxDtB4nbc/CbVT60lEvpy1QsdjoEWz4Z4ii
         7c1+UGYd+qMpzXKAIAQ/pYRAnuF1y5zNSOhG8puvURsQqaZQBhzDEg6D6k2tJwZ0Y1hg
         bYmnI4rsLylAkAfIgyhO+cyUfU0UCM02DRKJ65TiEmKeKKMZ6u5/cT0/MzsgHc9FIc8B
         E/DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774891486; x=1775496286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/POCNtVCVgs8Wz8mZ9O1D8ykDMaaTk6zJm6BSwE9+PU=;
        b=V76BZqIsg6SY28n+CDDu+IH++PLSb8MJSlRIvY02cnLUWXpaxB91LN/qlH3xzlIxCx
         OJpm0KiBuf6pIWl4hS1tBcqhmkha9q0QN7jpVlN/RWZSajGpxmqtZstQppDr8zTLHfCl
         7/3yLIORDyGDv/FwB7cjm/RynB6KgTd3CbCbcKooE15JDQcnwXYC3TG/cD+TSmFNry9y
         qase5dwhuuHQDJ75vNqql1kmgBxzGIcszCChHk74hP53Qdi5sFznMywjfIRhJmz89xoa
         FPIC0Py+qZ9XjashK4KXSbxEdCIEca9UEaypsvN6Gb+8PtPdnCYX4WzuDT0B1re+KOEK
         PpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774891486; x=1775496286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/POCNtVCVgs8Wz8mZ9O1D8ykDMaaTk6zJm6BSwE9+PU=;
        b=cdtXaKOmnjZB6nGhKEhlQtF5QgbOdo3FUgZtIPZhYuAmPgwoxxlSD1ew0zlPVaaaIz
         dkJLKDQ9KBPOH10aqRCvdTj7YAFnr7Te7gQ6aXCZ9+DmP9KwNNamzUy2wJzVqcExEUMv
         OvgT6keHHt9pjKwtf5fm8yMK/KrCpOblPJScN3XjKe/xgPJLDSMCs49PXH1w/Vovajl3
         SllX2rc8UqaJoocSRhCdfwUyCLTgoMGDXIYYvMl4ViNISG8kYxgn9cMUKISXdGFFn/tt
         bi/vcy3zQcG540MDYv0z57bmcZnwazPTMWbF8T67MNud43umof+W8Xia8un0XjUNTDWS
         GUeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUJnvP3F9raLyoJSf429BWvZu98cVLmYlERLP4asbg6eoDYztv15Sfrg0Kn50Vlh24jx+0B2hsZ3o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywab2YYJn7gSgAH64YtfVeXw/mVmkD9b75phfMDK9mgkahP1gcK
	r59XoYgFWXI2B+GV2Y6MQbJrRi9rPACXcW2jUQDKn2Wei0gNPUDOOYqFkVXQICS20F8Ye49cFEm
	03GEOMoxJ3ldGraF5LlahHMdbqVwUkOs=
X-Gm-Gg: ATEYQzz7ZFuSNnpbDlvfQl5qMqLyK06uSPWJEcSTvc+rpeI7Sj0qnI3IEUAZx+6KzIu
	XkhO20i2XdCL/+Pjb032ZxQQR0sbNIZqrl0lBJQhfuOtKo36tx20nojq6GMZljhjaSgoKjjGFSf
	LIS42nyuekG1lQJg/jWEYEMwt0gizRK5VaL1BOm612uIjhfGqnpsLEh8S+40ksb8BjOa3T2siiV
	pOh56bXaxnICqg9B4Tu3vVu2i1XA8FUW31Ve28YluUVHEKHtHexAloCoI8IPlNT1+vUkXn6uTkm
	DflEceQve0Bptpkx17ydU95W34AlHslgHbgGffMTAe1NY5xv/6bD3Pc/I9HT6H06GW1rIb7mT5R
	kcTJDiKo=
X-Received: by 2002:a17:907:9626:b0:b97:554:f12e with SMTP id
 a640c23a62f3a-b9b50350860mr690721166b.14.1774891485468; Mon, 30 Mar 2026
 10:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-ad4692-multichannel-sar-adc-driver-v5-0-11f789de47b8@analog.com>
 <20260327-ad4692-multichannel-sar-adc-driver-v5-2-11f789de47b8@analog.com>
 <acZrthJYQX-h_9p5@ashevche-desk.local> <LV9PR03MB84143540CE505514E1CD84B4F752A@LV9PR03MB8414.namprd03.prod.outlook.com>
In-Reply-To: <LV9PR03MB84143540CE505514E1CD84B4F752A@LV9PR03MB8414.namprd03.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 20:24:09 +0300
X-Gm-Features: AQROBzDi52qTqIm1Vf3lVJqwmlc9iA41VGN7nD3k385cLEOQCXsLlg-VEZ4M7zs
Message-ID: <CAHp75VcUCM8aeUpNaFEXnS+Cm08Mq5j+Qp2gYqWP9vCO+9CtQA@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] iio: adc: ad4691: add initial driver for AD4691 family
To: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	"Hennerich, Michael" <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, "Sa, Nuno" <Nuno.Sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 5:20=E2=80=AFPM Sabau, Radu bogdan
<Radu.Sabau@analog.com> wrote:
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Sent: Friday, March 27, 2026 1:36 PM
> > To: Sabau, Radu bogdan <Radu.Sabau@analog.com>

...

> > > +#include <linux/bitfield.h>
> > > +#include <linux/bitops.h>
> > > +#include <linux/cleanup.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/device.h>
> >
> > Hmm... Is it used? Or perhaps you need only
> > dev_printk.h
> > device/devres.h
> > ?

> I have checked this out and it seems device.h doesn't actually need
> to be included anyway since spi.h directly includes device.h, and since
> this is a SPI driver that's never going away, it's covered. Will drop it!

No, this is the wrong justification. IWYU principle is about exact
match between what is used and included in a file (module). spi.h is
not dev_*() provider and may not be considered for that.

--=20
With Best Regards,
Andy Shevchenko
