Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C709939151E
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744060; cv=none; b=LHT1OcOQ7gtpk2Lr7fPjg5GYvN4j3q0wEO40jApYzJ07dTI/pof0nReF9vuzbbVIVJAvORsdF43itVoUFzYoDA1ahx0NKyePXnbVEsf0wMzgb4aur0yLtOnuhzJ/fOy0CdH0t3DOs1BBK+fZnoWRsY0wUWBuNMAqkt2D6dH/NiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744060; c=relaxed/simple;
	bh=d4KD+yU5s7d45rA5ExgcEGlswfbkgijWZZsbyiom9Ug=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fZJFAbyqYbXz7Z7RhQrM5R75kN/zX9iJDj0kYyf8Nzm5yROPo4LaFjfb3F87oP03Pq5hKA+41rrQsd9NiTUuo1pGXl4warSwg2oZrCUXI2Mdcx7Ki2aLifth040mhwxhdJqDfiVLCNZlfsx4+EE0/vYc4yig2CXKVexwcIdjXBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=G8J/BKoo; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="G8J/BKoo"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso285858f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 03:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773744057; x=1774348857; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d4KD+yU5s7d45rA5ExgcEGlswfbkgijWZZsbyiom9Ug=;
        b=G8J/BKoo9f+EWdZfUu9gMkvuFwkHmjOw4+tOVbNC62eQlglZjwB8z3xjB6TcMoxYti
         u5uE0iTBBCGjfl1/jitKphMYSXRQufoeQvhmU89sfr8dX3+i4XwKXbV8ae+86ZW+2Kkx
         HEDa2AJ1AFamz7an2IN301dUSCgyjIpNsu4ALMxcdB8ammNV4uAQ/WeZT0Za4Jv1yxRF
         SCURgTaccLhh6sh+5bniMYOT8xTY0lFjE76sBXtxs+YnJ/eo6JuKX+nHGP/HHnnI1CMd
         Rv/Qjss3vnNDG9QYUJB9/N1I0e3qShMBqbtiIupEIg2YSQZrDYPJvqNIqaITMP9bbiqi
         f4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773744057; x=1774348857;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d4KD+yU5s7d45rA5ExgcEGlswfbkgijWZZsbyiom9Ug=;
        b=sanCYFMxeLluGh7wI+HG7b0ruM17ogAymtPnkCN5DNdHqN2OanHVYgqMk3n3IaoVEu
         ZedGVi27KNeg9juL0p+QDWe8nCca5Oi6LJP6Gwk029pmMI0D9WxvwVgNBkztNcBOZ5JE
         52Lz/u05ta2quCWLDmM7si3tugYlYJeJZJI17QM3K9xYLqbJdsoHx6u3mB2TzVHZ+PUv
         Ozsr7s359jsreGwBK2b57LgBO5yBW7m3zONmqALKq8Q4nAlHll4uuGUmuLJM2jHmIUP5
         Z4t2BJQ3QsrCuEyjgo894bjJRiuZr2o4XmlJAtBhRTf7a5eW8ZTJLxgDI//qww/qQVpG
         wCng==
X-Forwarded-Encrypted: i=1; AJvYcCWq2qA4nPZGLJ8g88GYpEGIUcVNQTwFL/0lolH+FL4rg7UO0kTdFwcUUWTa6q76auXzP3A4qCfzmYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxidMaH7PkCY4i3gIU+HHb9EvVozVYGvK9NofkBeL4PMJ7762H
	kfpdifdSDHzPCm2OiZRenVnh4mjVjgn76nBo7KsBqDA2+FFNfmNbB7OfzHAeab+VemU=
X-Gm-Gg: ATEYQzw4NNkDQzQ/PrYCXL6I8/F1l8bNcJiA8TjLIWL8e7ci3QczQz4Gdca0l+iKKre
	9CP8za48CSDOnFtFcmX9VvWEVMrXqoOG4xsslJ8DD4mxjXC1RlCo2yXH3E6+6rbj9Gds7y2LBRY
	rRS/gbFscKsDvHwPslehVKvgk/wuPk8gRdwE+e3cTaQI63SYp1B0FAnnkF3nkIE2UN0UAjF1pla
	9C53lU8RcHOicVPfeecfpMAOl3ktHZHWLUQUpTONoho8cnpmeVOGJX3ORA7lMUs6WDTP5vglya0
	2w0jDOWqMHBykExeIU9O7KZ99J6nCTBSCBJlo4TjwZ2tqTt1IuuYHYqCdcSHqT5Q2ywlzfBKhIC
	R17XC471wZBWE3QKg6Dq/4k5cAZI2aSAx6t724CUd0uf/EWYFszmXAVrSWpOqz8TnTUlgvKWKCm
	AHKkEw5Qk=
X-Received: by 2002:a05:6000:2283:b0:436:3707:2bf0 with SMTP id ffacd0b85a97d-43a04db7556mr30851486f8f.35.1773744057079;
        Tue, 17 Mar 2026 03:40:57 -0700 (PDT)
Received: from [10.128.148.212] ([151.37.253.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b41dd93c0sm17716128f8f.10.2026.03.17.03.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:40:56 -0700 (PDT)
Message-ID: <1d268ffefd2a035331fd4ab7a920559fdf11cdda.camel@baylibre.com>
Subject: Re: [PATCH v7 4/6] iio: ABI: Add support for floating-point numbers
 in buffer scan elements
From: Francesco Lavra <flavra@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko
	 <andriy.shevchenko@intel.com>
Cc: David Lechner <dlechner@baylibre.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>,  Andy Shevchenko <andy@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Date: Tue, 17 Mar 2026 11:40:54 +0100
In-Reply-To: <20260307125150.3bc60a45@jic23-huawei>
References: <20260304080519.2844101-1-flavra@baylibre.com>
	 <20260304080658.2844434-1-flavra@baylibre.com>
	 <70f25902-5c79-46f9-8c67-99633b22b5ac@baylibre.com>
	 <098886563f5fdcde837989d0556ed9a2d8d3203b.camel@baylibre.com>
	 <CAHp75Vdni=OgHiDi8G5s6CgBFZZuypOyJSo5DFjaKYFkLGPqkQ@mail.gmail.com>
	 <dd6d1436-d509-4233-ba1f-5a3f870f35fb@baylibre.com>
	 <aarED5TAWg2qFtxi@ashevche-desk.local>
	 <20260307125150.3bc60a45@jic23-huawei>
Organization: BayLibre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-03-07 at 12:51 +0000, Jonathan Cameron wrote:
> On Fri, 6 Mar 2026 14:09:51 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>=20
> > On Thu, Mar 05, 2026 at 08:37:48AM -0600, David Lechner wrote:
> > > On 3/5/26 3:23 AM, Andy Shevchenko wrote:=C2=A0=20
> > > > On Thu, Mar 5, 2026 at 11:09=E2=80=AFAM Francesco Lavra
> > > > <flavra@baylibre.com> wrote:=C2=A0=20
> > > > > On Wed, 2026-03-04 at 16:45 -0600, David Lechner wrote:=C2=A0=20
> > > > > > On 3/4/26 2:06 AM, Francesco Lavra wrote:=C2=A0=20
> > > > > > > In the data storage description of a scan element, the first
> > > > > > > character
> > > > > > > after the colon can have the values 's' and 'u' to specify
> > > > > > > signed and
> > > > > > > unsigned integers, respectively.
> > > > > > > Add 'f' as an allowed value to specify floating-point numbers
> > > > > > > formatted
> > > > > > > according to the IEEE 754 standard.=C2=A0=20
> >=20
> > ...
> >=20
> > > > > > > -=C2=A0 Format is [be|le]:[s|u]bits/storagebits[Xrepeat][>>sh=
ift]
> > > > > > > .
> > > > > > > +=C2=A0 Format is
> > > > > > > [be|le]:[f|s|u]bits/storagebits[Xrepeat][>>shift] .
> > > > > > >=20
> > > > > > > =C2=A0=C2=A0 * *be* or *le*, specifies big or little endian.
> > > > > > > +=C2=A0 * *f*, specifies if floating-point.
> > > > > > > =C2=A0=C2=A0 * *s* or *u*, specifies if signed (2's complemen=
t) or
> > > > > > > unsigned.=C2=A0=20
> > > > > >=20
> > > > > > I would keep all of the format options on one bullet point.=C2=
=A0=20
> > > > >=20
> > > > > That's what I did initially, but Andy suggested doing differently
> > > > > [1].=C2=A0=20
> > > >=20
> > > > And still I think it's better to not mix them. The floating in the
> > > > same sentence is confusing (along with 2's complement mention and
> > > > sign).=C2=A0=20
> > >=20
> > > Then I would split up all 3. It is strange to mix some and not
> > > all.=C2=A0=20
> >=20
> > I don't find it 'strange'. The integer are grouped together, floats do
> > not
> > belong to that group.
> Maybe two paragaraphs in one bullet point?
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* *f*, specifies if float=
ing-point.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *s* or *u*, specif=
ies if signed (2's complement) or unsigned.=C2=A0=20
>=20
> Though then we'll definitely need to check it didn't break the formatting
> in the docs generated from these files.

This does break the formatting in the HTML docs, where the two paragraphs
end up in the same line.

> For me any of the above are fine.

I will keep it as is.

> > ...
> >=20
> > > > > > > -is [be|le]:[s|u]bits/storagebits[Xrepeat][>>shift], where:
> > > > > > > +is [be|le]:[f|s|u]bits/storagebits[Xrepeat][>>shift], where:
> > > > > > >=20
> > > > > > > =C2=A0- **be** or **le** specifies big or little-endian.
> > > > > > > +- **f** specifies if floating-point.
> > > > > > > =C2=A0- **s** or **u** specifies if signed (2's complement) o=
r
> > > > > > > unsigned.=C2=A0=20
> > > > > >=20
> > > > > > same here=C2=A0=20
> > > > >=20
> > > > > [1]
> > > > > https://lore.kernel.org/linux-iio/aZ7dCdLs5xcJ4UGW@smile.fi.intel=
.com/
> > > > > =C2=A0
> > > >=20
> > > > Same here.

Same here.
