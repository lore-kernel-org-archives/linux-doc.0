Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425420;
	b=xAzTSEgS1tLnUjxONDsh/rd5a8/jW4Ict3nYyJNxB9ItXHnZmDMpURCIOcugnqGdyrzx
	 fKoGM5qrmYupMSJED8Rso1+uXSKR0/nvFfyQJTOfsIDfR6Ky1H9k8tQX8tWS/4JR2zEd1
	 CwKd26f8jmhgqnS3rOz9BLp403Ck2cgs3uMgcry+55QRPgfigrlItSsGMmQB6HnbOaQe5
	 q5rrFG5XOynLk+i4kd0+c/coClxWOwpHIT/jzBHa8b5x4hBs0jwO567BFDq1ibTqis2IJ
	 3ch+CBwrPLdSwBFP/hB73ThR9ywAxImVPhMHSKv7MWvpGyjdaJLlKjbT5wcHOwSNO5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KntknVNj068zKgAq+zdLaDv094kaGVDF9/OJXVQRtwA=;
	b=Ff+/5NjRNlt6t6LQtkg04F+x47FS2qwyB+np7yOwY9jeirL09r34aNhd8XFaxhyZgJ6U
	 1WDF+6mv6EMunSfJI2X7efmkSZAnwia0s2iCO34Kunvd8ReB6TIv+2gtxkWm5wNfk1m+b
	 2FSLjQBlznJ8u4ekMU1laWplEA6Z3wMmua0NGceUeQTcuEEjuqUCvV411Z/DKDgY55Ac0
	 hfWxPwycENU4qkX+/rhWIJ045G/7CUnydD6kCfxllF81oeqcUajM/fV3/tg/zXLysWt7u
	 NikCS7udWJjE/cXarDApv1/DKOS1h+opqwa2cGz8BaM8JSQBc3oAi4/c+ebvnOgymiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SujOSC3b;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DABD606A327
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 09:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DABD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SujOSC3b
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a357b1c649so1759408f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 01:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425419; x=1796030219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KntknVNj068zKgAq+zdLaDv094kaGVDF9/OJXVQRtwA=;
        b=SujOSC3bJ6T5qZYnGcOUlGfGb/XPzEz/mcEywcTIoGYC/v/096w5zQui8EIrk/p2Cv
         cKCrDJV3hNKyi4Q+XaH1MbeqOl2FjAJPbqvclju5ti9weuviulXhw7yJ6g9cD8SnB+EY
         NiRHE6rL1xTY7zHCjnfM8vjPsa+ffWVQI+MXLuMxh6zoIGTMDPrOFTgpO0ErILuJt+pE
         Eq2bhuFgPdWjpQq+YtoYvEh8QCknNuwPr/4YslboIRW6Tb6Q0WlwOiizJDnAwN30eCzO
         yJ09eoWNrpIrDwPh1vIqEcRloBzHouFWuo6mGf1X0BK+tC7e3DB6KWGRuwLm+GgwrSnW
         o16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425419; x=1796030219;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KntknVNj068zKgAq+zdLaDv094kaGVDF9/OJXVQRtwA=;
        b=Tus/y1R92d1hojGerPtv1dD6sIH3Bg4sijprJx40K1yyV/Q9tcWEPYxlzfqnwaASKx
         cpo8TrTQjtAqm8D67mx4Y3NWDv63IuY0VzIMVRd3riXRdnay67kKRaUpDRyPcbuVdpcx
         byUtoYgHhM2FTvDlCaOgEuZ2RC0h+aRlHsiWI9UoKlii9FKUuCBDN+DsPEIcaPBIPZEk
         4Q5JhaZC02y3caAXS8jPNUozfKKcDspfFXiFNg3bB9rrL4zLaYG8Hz3ITZHnQJY6dvee
         0g8dpmg+hmmK1VTT5q2TkC5PmV9Q8gaSp0gQ5TbGsdQH62ZQRPlbwuPtMU9PIKhgcHlF
         49Fw==
X-Forwarded-Encrypted: i=1; AL+hErG4/vOfFr0hDD+YhBQ2aueWRutsqfGtlxRUdvtZllVHyuMjbtEXqUnr9lrACF/VydxOGdIaiH9afhw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wNP2jHUzLJyDQYReeJ1wA2M96zanMOpkS3OOtVnMRS2a3yf8n
	ctcld1jjtg1HvaBRdBY/xS/Plkoo1rlkqtWlPFm7KsFFssV+YE4ZuMzCOLXwkBJP0x8=
X-Gm-Gg: AZFdTZf7+OIbZ4J6vib0xaRjuOWx4gY7JYoSnQWd/FvOUtv6zNERI3wV05T6gqU4A/n
	Qqav3e0rMJQZJoo8XvJ8wOt9whzXLGiD0MIP5wfndgycExyJfLWkXOPwTgKwN2Uj//M9pW90vtr
	x6FjD2FhBhkErdHqdANyGwqLj9b5QB/zRCtSCHbWugmrQgnstv8dggHt6R5g+MGSTB9f3tNLH8+
	g3++2fH/P/C9QcublAF1o6JY1tBLbdoCAz7jC6hcax25OXu4Uqrnl7WY00Hh8ACjqOL92jmqTTy
	pzh+upwTspzqQ1qGo2kgxKVFmfg/R5pTDW7/gwh/cluGa8ay/v/goHpUtoOw17zdrt1moOEBcL2
	rtpiE0wK5TXKuSM4y2p28yIhfHxjWNMTcPKcYOOxm9G71W6RBfWAsF5yjOpz3VveE809nEf3eG4
	8Z/hnBTE8SOUwwZH4LH6WuKRuJSyxWBM6bFD2VwCRBGVSV+ytMN/kHYzOOncgzcsL6tyrx0zX8k
	T77NkjsVGZoNFXOxOkO6pDib7XPUEa5uw1NPHx3jG24d/r49+ZS6kJhSfiCAJBuJr0hGlUZUtee
	OXY5j9aPSNuu54fVtNr43hcP552+TOqRdRB7jH/Qt5iTjBih0roLlT5fDSGwYR+1wYW7Axxco3t
	wx4FVjPGLhr5u0Z7rWWY9ulef9LpeVmVSngFd4A==
X-Received: by 2002:a5d:64c9:0:b0:4a7:69c3:94d5 with SMTP id ffacd0b85a97d-4abb0e469cfmr20062459f8f.28.1795425418389;
        Mon, 23 Nov 2026 01:16:58 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab69bf61e8sm22313933f8f.11.2026.11.23.01.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:16:57 -0800 (PST)
Date: Mon, 23 Nov 2026 10:16:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: yogo.0917.sabu@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, 
	soc@lists.linux.dev
Subject: Re: [PATCH RFC v2 08/13] Input: add polled SiRF AT550 resistive
 touchscreen driver
Message-ID: <awQEP9bHA0RPfRUA@monoceros>
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-8-b0309d0789b2@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o4xfpqjjox3khpoi"
Content-Disposition: inline
In-Reply-To: <20261121-at550-rfc-v1-v2-8-b0309d0789b2@gmail.com>


--o4xfpqjjox3khpoi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC v2 08/13] Input: add polled SiRF AT550 resistive
 touchscreen driver
MIME-Version: 1.0

Hello,

On Sat, Nov 21, 2026 at 09:43:18PM +0900, Yuugo Yoneda via B4 Relay wrote:
> diff --git a/drivers/input/touchscreen/at550-ts.c b/drivers/input/touchscreen/at550-ts.c
> new file mode 100644
> index 000000000..89c2d2701
> --- /dev/null
> +++ b/drivers/input/touchscreen/at550-ts.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* SiRF AT550 coordinate acquisition. Layout cross-checked with AT551 draft. */
> +#include <linux/bits.h>
> +#include <linux/input.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id without the
implied dependencies you get by including <linux/mod_devicetable.h>. So
please drop the latter.

Best regards
Uwe

--o4xfpqjjox3khpoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEBIYACgkQj4D7WH0S
/k6Mogf+I4t6gj7ob8tkta5kHm+YP96+f6rsROw+nYQ5NXBDBTwdaHgtuxTw/3u3
9TSFi59BI6mt1CJkV2ldOhel8Do0lFyFlVyx1+tlaLGNAjrt3f8m2IWJcvQU4hQK
qCxr790Ac2+n+6M13QHVHO8E7+V5Kxu109uuNUNUWIsrjawNdIUx+lqOywM9o/JT
s7dUkwPF41vgxb8gPn3Hr9uAImmkTspc70TUfxqNtGVNmQlizkBCtSCoABv5QCdW
mXZx4sl+NJUJpqZ/jj0ehbdZ1DT8xVBRF1ZDrDU0AdqO6EAWVEnOx3tb5+7JsaKI
HSj3Bm7869/tgf+jXQ3QF1Uu7I1vmA==
=UpFb
-----END PGP SIGNATURE-----

--o4xfpqjjox3khpoi--
