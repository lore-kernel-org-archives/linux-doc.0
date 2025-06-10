Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C936425F97D
	for <linux-doc@vger.kernel.org>; Tue, 10 Jun 2025 06:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749538399; cv=none; b=oQQHVDK1+GiGJm35JBFOjuo9FptG4lcq9C+JNNHgk0CVP9nuEoPOw0MbBtt1iE+oCemXYMbrgkPw1aFixEVUEH4M+scssVZQYOJBKY/5+wWK44Rg/oXOJubl5AH4XBYRr4e9zibCYCcOV/B3FC/w1xv4p+z4WlVa3hlLG1TpkQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749538399; c=relaxed/simple;
	bh=iyOd4HQzsqPbgprGkTnbglacQu9F+l1LR/UEgFtPOLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieF7LL3wGbwB96OuVdSoGy59H4NdP4Nhn+7+ttvk0PQCIxPj955MaAK+5SlRGwOs0eTdi9wiz+95YWfivNtYAy/XoKET1JkBkNOLtxmhcfhoXc6Zg++RlFPzzkAAiDlezAKACyuCVIGMVy7etcAOHr8bsvUxXNhz2VJ8OR+nUcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HVu56jNd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HVu56jNd"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso47235855e9.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Jun 2025 23:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749538396; x=1750143196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iyOd4HQzsqPbgprGkTnbglacQu9F+l1LR/UEgFtPOLo=;
        b=HVu56jNdzxlULSexBDvIrbnzf4Okj/ljPPA502WJ9rfdhvZq/VWyxi46uWpEcOET68
         pqLN1Ei1Y+7ZQCSv9D02biWQflEviPuw/3Ly76ebzC3hBQQB6NQxxu2JETMYpwVhRAIh
         elSaI6V9vIh4Z+4L0LSNhuQd2wp/b4I//gwhhdb6RKOjjs05Hs6lL/hBVql22YFdcnKU
         mnNvuu/dVAAbwKI3avBA4A7nK8que2dbyH+rfpNHKhMDbKw7OKfjogrSO8ypS17VGED6
         R1q2DnWjF1q0LzONAbmqeoN9YKTFtcCaXn82Cu4kMe8JqD8j9G8o55BVC/AzB/oOW9NV
         K/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749538396; x=1750143196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyOd4HQzsqPbgprGkTnbglacQu9F+l1LR/UEgFtPOLo=;
        b=QBBFAWyYb3BqCOWNDstys1wWku3aTYYGi4pg7LJcIMoGHlR0U3ULzV1m41K9elAaDG
         R7nc0zmmha30aBQS3IhIMKldBTmZr+t9SElJg9nFdw6VDqZu1SdGkB4wFJJhQcHs+w3s
         RF5FMUj5sIrOUuktNbpldI4rwHm12yVfbWkwolL8FF3hmCz4HkPA3/4AEviImzIx7PQ6
         KDQllVh5ZGn8+KVzjoHTN1urzXjCAzkrY9QslyQ/8C0LpOa48NBwiratJPPYe+kH/c7B
         veuPVxOXIVp5IM89zv0UyyjSPFSJ1blSGsSQDznHwUSIkSnbP/5xD8FjmbGgO3EYIc9r
         3mLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUry12P1o3JAznP7McENs8Tg7nIv5ezVdF0v/pF1+d+5Dp7NxmJnyjEzYlBdXnMk10cSqj+8BTDGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMLW0knv56VFqFY4wHrZb0UgAD6S/hpVZ2PxaZHkdpgK/7u5bb
	HMaVU+RGP9eH2XA6qZ6lugENfDz1Ua79LFnmiwM2uSM9lQfYIYCBtvkXbZvW3jgL2cg=
X-Gm-Gg: ASbGnct84TQ80ZPtGNTp7cbCLc4aSsrwFNdXvSTRj8yOCbJQX1ixjdTcAMalHsx59WO
	eHm4K97XIXN3lGfz6d7srgRYZ1HfnaJngcO+J+tDnBZF8XCxY9Sr7cKp9RUcKg4adRiIikkmHY+
	plDaUSmNZ/l+43UE5ZIpLQ9OdRbKE7HHLlBCSG/QuJ9yA1IYAtGc24YwevM/4rw9J5Ztriz+zrG
	4MB3gZ1uAcw5H2Vjz4kPcTAaf18i0IrR4SRATDFt1wKb8zJ+kBgfy6VtyLkyo5FCQA0wu2F6WPN
	06ZDjfaDwhG7PKlTqeQwHedLHMrszmE90oOTiQQzWF4gUzy1WXG4HkDsUc1iJv1ZjjJQIXS1ugx
	7lodXtjbQB56s6RrMGNqk746qso34Emd91mp8EcA=
X-Google-Smtp-Source: AGHT+IEs+YhhJZoR/pGvAaYaeAcRyr5uezaIhHxVp1Crs8g4CqMjqFGehJlm2hhZ0ehAlxYyCfBfbw==
X-Received: by 2002:a05:600c:b86:b0:450:cd25:e68f with SMTP id 5b1f17b1804b1-452014e9325mr128402985e9.27.1749538396165;
        Mon, 09 Jun 2025 23:53:16 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45209bc7391sm133955865e9.7.2025.06.09.23.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 23:53:15 -0700 (PDT)
Date: Tue, 10 Jun 2025 08:53:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, Linux USB <linux-usb@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
	Felipe Balbi <balbi@kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] Documentation: usb: gadget: Wrap remaining usage
 snippets in literal code block
Message-ID: <icl6osl67smwbaytqcelw4iwf75tvy5prkv5wx2t4n2xx2aybc@ec6keupto7dd>
References: <20250610031705.32774-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i3pyjm5b2q23ytxu"
Content-Disposition: inline
In-Reply-To: <20250610031705.32774-2-bagasdotme@gmail.com>


--i3pyjm5b2q23ytxu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Documentation: usb: gadget: Wrap remaining usage
 snippets in literal code block
MIME-Version: 1.0

On Tue, Jun 10, 2025 at 10:17:06AM +0700, Bagas Sanjaya wrote:
> Several configfs usage snippets forget to be formatted as literal code
> blocks. These were outputted in htmldocs output as normal paragraph
> instead. In particular, snippet for custom string descriptors as added
> in 15a7cf8caabee4 ("usb: gadget: configfs: Support arbitrary string
> descriptors") is shown as single combined paragraph, rather than two
> command lines.
>=20
> Wrap them like the rest of snippets.
>=20
> Fixes: 5e654a4655c3 ("Documentation/usb: gadget_configfs")
> Fixes: d80b5005c5dd ("docs: usb: convert documents to ReST")
> Fixes: 15a7cf8caabe ("usb: gadget: configfs: Support arbitrary string des=
criptors")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Looks good,

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--i3pyjm5b2q23ytxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhH1lcACgkQj4D7WH0S
/k6R+gf/XuFME9waQUBbNlezcsZwYX9GBHRc4Tf3As1u1de0Sddp6pGqTQdZnKaF
WRnRPeQ6vLnJEL4ng8q0ZDUSms2Kq1HVO8esuGb2FJxdbtSlh+bE8lFEoH5cxND2
Of8pUR41cvkVYz0keVmk2TqEqM7B1GUotrUTu4mXo10+qwevDDLCSvyZlD271Hwn
OVdakodfZsKZ/0nhiAeBvykYXyuuYLmeKevCQC3pRvLulErjTEA2sXloC3MueFCC
GVdRY9ekj+Q4l6lSuwBrKK8lrXQw1RPOutCfGSJtCCvA+lqjjtIJ/esaR/ZwyfNZ
cwTxQw4fq3m9imucca3lXK0ks1D80g==
=2vMM
-----END PGP SIGNATURE-----

--i3pyjm5b2q23ytxu--
