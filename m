Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826DC3C5DD4
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 07:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669320; cv=none; b=GmI8Bl/OL3ypob8upphNlq0f0SBXXB8BthpeFxH4fsHb02LD+dVucZ0qF9q3SdlImvg4NQWyg03lHYB90IjtabdJvxBz7jGw5/rrVfIVm5KoU7HuejxZJcPECYBUEMQegSH8ILLijXpXL4knMLsrtKUMaVQHwIJ76xdlQQPbn1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669320; c=relaxed/simple;
	bh=T93RY8BFfs4W3gNLpnk8Dup8vZOb+pZgaXNLQW9klgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pH18LYrWsjOtcdD0U2nqDSw2RaPUGfkC4TokhsA5zy31CWNJwSEskm/p6JlpJFVlbQjOdHms+3oo6Q3VI4HPOzH0OLIx6wP8dq2LvE8Gz/QTqXHEP6le0bIUhPwyW/GLLSi2GRNdYAgQ8hEAHrqYSmgd0ZFjAtBPk7fNUcqYwck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dG3mIzjx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dG3mIzjx"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b966dd74so1960645e9.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 00:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783669317; x=1784274117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T93RY8BFfs4W3gNLpnk8Dup8vZOb+pZgaXNLQW9klgg=;
        b=dG3mIzjxQ19XSx7Xh0httDnnSYTYForJ6fciHVx8gUQFJd9U+6XIK1gkvmyHMJ7JDC
         yQoDniERqe4+o5EwKDPugkFXDjxK/XmYJxEsz0GNRXVtm6Tq2/nTLdH1PkQswkt+XjqY
         f9xdAJQqju6rVrPhyNN5YrfhocB91M57MIPDu4jRBYXJYDthnLE1cTYZFNGyw0vP1zwF
         7ojJQKg5MOGGDq+DxSmE00EgzmqbSKiQDyMprTs4aBSRAKIenM9GbhrBKZtVNa4JKD1v
         i85iA51xutw7njlCUdpgve3v1YSoiRjCKzxyRB63kxtD0cZHPRTC5g1N7t76BoqGsd+O
         13Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669317; x=1784274117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T93RY8BFfs4W3gNLpnk8Dup8vZOb+pZgaXNLQW9klgg=;
        b=N131lcbu4mgxQ8/0rz+AlIVuQNCUcP2Nthi7xGzc22gpWgDxW4wyqhkbGsQzsMpS+Z
         FTXM4o/4cjlKOc1uZIRNkBFMtb2ILwRxydEo9a1jR4W4KoqMBjQhrrc827qQ33IGOJXA
         pVpxuZAuvju3nd5PHIednrGPzb4IeHirYpbGiGt27TZIVq+WFO3TmSB6yzDwbaJg0DYW
         Kod0xNIZiP/H2AIBApCVwO1kovD/rmw5oI7//kevqmcWANTmtMtKTXi3NxNDsHixWc6C
         C9RSETl6PeASba2ZwElfQm9mwquP4OXDn6uN8gjGE/0Ak0/h0Na65oNRdDpROJrlkEZa
         br5g==
X-Forwarded-Encrypted: i=1; AHgh+RqEIFnuXF4DC8eUsczFOwSrOZ+MGCDlVqtTxujJc6ddsYOnzIfkDindQKrzV4IGb9I1Omvsnxwlrz8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9A6oDEjtdlHm1n5JOYY0E+YtHd1nQ7yk6x/QVd7N438YJiSfZ
	ObEJP3hD9h9PUOpqmy2e5/hl0Kuz5Gw9b2xDElrcnsAejEv8f+UhHRhHyviZZ4GJHjWWlpCpe0i
	tdH3N
X-Gm-Gg: AfdE7clsJZUo2pjqjtiXPdILcJboNSqmf/tmALUDMECDkVrV2UpjlJFKe2yQcvuUKO2
	w5XW9XSfHDCk5YgqxrzXXnCy+JtNTQlEtr95q2YrdGdXSJx5nwZ1PlHb6fSZbHgWVbipS2QXNzV
	pRs5QyP0wTW3hlAF6OHSxnqZVvQzWncaa7pcgIikBi/CkG62SU5a2DREw/gq+D0GiXgb+AIrdYr
	82CwoVBB/CAuwWWeZ2kFWMtMZ/rdVZqaTsakiLUgzAc8lGKNq9Ta2Jpiygj/Pd+NV4ggRy+l95s
	D0vQnOGedRd1s9Am9z+gx8YjXTOJ4ycLH65+PbAiF7fqSRIuLYMIE0b1t2eCMpm3KRSironsw/9
	+gbB9G/IremhnAXbkiLR63ExVCGy8pu5GpduWbj8VKlOF1czekZW4hoIvLnfaNKYIqljVf5Pe2K
	XmLH9mOjCCXw1Jm6L2Ob7t85eqirIbYQuaBMxjhbN9w6ILyPYygS/XJMS2cILLaLCWOd1uF6xtL
	ku+
X-Received: by 2002:a05:600c:3b26:b0:493:e3e9:85fb with SMTP id 5b1f17b1804b1-493e685f1f6mr105605275e9.20.1783669316966;
        Fri, 10 Jul 2026 00:41:56 -0700 (PDT)
Received: from localhost (p200300f65f47db04fbea22a44ee9ba38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fbea:22a4:4ee9:ba38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6e8844sm130641505e9.10.2026.07.10.00.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:41:56 -0700 (PDT)
Date: Fri, 10 Jul 2026 09:41:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, jananisunil.dev@gmail.com
Subject: Re: [PATCH 4/6] iio: adc: Add AD7768 IIO Driver support
Message-ID: <alCiMwDDBUy4hbt9@monoceros>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-4-44e1194fd96a@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2mdkilrp6cmozhgk"
Content-Disposition: inline
In-Reply-To: <20260709-ad7768-driver-v1-4-44e1194fd96a@analog.com>


--2mdkilrp6cmozhgk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 4/6] iio: adc: Add AD7768 IIO Driver support
MIME-Version: 1.0

On Thu, Jul 09, 2026 at 10:50:15AM +0200, Janani Sunil wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--2mdkilrp6cmozhgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQokEACgkQj4D7WH0S
/k5zhgf/cBqR/U9qN6HSwvEBvsH2YOyi2p7lqn4lGxGpKm0foNPRhW7lOziW1Wqz
oQESCV+7YKOqDOOgBTi5kCK0GDOR/68hQ9jF+IC8vGa4HSRURd5Kgo63T8mOCWSA
AE63f+yQYUH25nYtGDkF2a8Tl1l4A6oCe0IuiDZLx2lLbGWsKHVVdz0shdU+8tAG
9QXbQxmNNlHX9vIlIS4TtbhHo4Bb38pVVGyAyodZyNwEJLvoq7P0ariGNRHIGZLT
rdVbBkVgfUjKWHLpMDTFv9nDJghfDAVMXN5zfeLANW5EeDJvPBPwWFJ7zVdBEDX3
lVGl+K5A3uVTjmu1RkAZq/5JjP+pcQ==
=P41k
-----END PGP SIGNATURE-----

--2mdkilrp6cmozhgk--
