Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A1A40A93B
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 21:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785273434; cv=none; b=olXd2pcDm82ssPprEnnUg09hmJDXOHZiORMPWwZNTO4WgHgbj8fBLD9Yub/gNc1mxMm33vyBIr1HsdLf8tI2XYjkbyz2u9zCl0/u/O9WJuXHaP+H2fK+GUDHrmyNIx9qhAhnT9l7RcCitYO6PL+oR2M+E/1hn0o6iajKpAQriM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785273434; c=relaxed/simple;
	bh=KsrSd1GDRpCKx2soRF7QGqJUiFXPijS9GA3YqzvMgXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7aaVYUjqLTcvdGT0rfEAikiI+iAt6+xT8iPb7r0/4kEpYZcImG4hyGNoqI+tIf4ejCexe7Cfqz306zvyUCnwvk+XGEY1J2mUbKB1kZT8h/pyhS6HPAxTCzW3zlEogI8M/LWGwS8Rz5d9/tNEyJuG8mGOFrCf0b7pIcrEJ7JEJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iii6A/Bt; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iii6A/Bt"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381b831d535so353913a91.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 14:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785273433; x=1785878233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ftm5XLIxNthIvK126OWJRqMXekUTgdSJ4NeDzXA2YbE=;
        b=iii6A/BtBC5zq92y6z6THc2cqjQMahS5lnnjkRlh825LwEGJHS0A1je3/vp/p46vTG
         NqEKfNxRHYNludpeK44G+e7AmCtP9Ga6J9oEaPzVgN1FqffX+mwYDxKEGrGaYTAsnk5b
         QnVhv5YU4K1jREFT01DcFIndCOnen0L3RT5zg2k3qjaRnTKKGqRViUcrgcTUhHB7rWf9
         a385sQwV5QD0XpVTRqLXM90GaAxmp77RWmZ3hVShUxouWOhvDqARsyuTWKXgqG1IpauH
         ia8ZiAQM2qwmfC8mVTJ3+dAc0tw5Q7mBBY1dZpBnEzjPx5UFJBvNIfW19EzHRXcTrS96
         uPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273433; x=1785878233;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftm5XLIxNthIvK126OWJRqMXekUTgdSJ4NeDzXA2YbE=;
        b=NQMZLHincCA24Fgd7SEhxexOpry0gi6xo3D8WSw6YeWfee4NqcrMNM+BPcrYd0Fyqu
         1cQI4dHxJhHuwMAOu0R/+fQt3IegZqwp2K500NI1uypwCuZj4NBtoHHRjm+TzcOAlsp2
         1fC7hFjTy9zC9bZ0AhVVvyWwX+8v6lesF48IzoDDwYa/EqaYaB5K/Mn4gMvHYtyHd6Na
         xudj0uquvJOKZ7LGHiOw7Sy44dhycUOqYzM4YDPTd9RcrNf8BDetfOTUs/XoYecam5Gz
         0V5gGJ82tyU6T5lG5ThUDn8j0k7vEyojzWzOqBM66Kl0nMFpETeaWq736DpuH3Rh7fu8
         rcgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrh+uaMQi/zMdHxhB5roHgZkd2dSq7LxejZP3lcuSP0HiE/Urr6tgzGhO4FRQmNcgCouIxtuAyL0Ww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz36ivMlF/64JUg7DjrmBk4X3zRPD5pN9sXbbgUO+4C4nDaq8Pf
	2C1o3iQFvLAr3Zv0waK0xaD8c6wii6GcUBpVz/KldEiSsE90aYZUSFcp
X-Gm-Gg: AR+sD12vsyyOGc/+YkQL9QC6BU7fig9zglvrrNit2p3Q0fsOnCwQV3T8sys6sjjAOMk
	TIFaX0ikRiZU0P8r7oisv7AYWQDvVIEeH3Ui063KxdYxDNXpaMyfF+X8cuoGMNqzLAS/yCxLx7i
	ljp3X+WXRN5btGCHtk36856DDEMnvR4hAJrp+WPOYxO2Klw6GlNatccTKJ6ZVjfCWO488DBRch2
	cixpHkYRjxhdvKwtBiVgiHZTtlqAkOQoAW0aJ0JA1Nst2b7yBQEOXqloMN3QHIaPcfOeYFU1xo7
	sYbU+FwsBqLMRbcnHGkUMWcyKhuP9dx2rjf9M93Nub4egs/l8IXYJussr/kS8egl2e9cvwe80ZL
	2UF282Cyb1GnU4jjr0d5VRTUr96uJRkSzQLnQqOBmjcUr1mALPLA5kEAthNprchFc0Z7zsIj4Ke
	xSQrABM6hW9H1eMI0wHD4Wr1uB79JPjXQKjP/dd3hHbrgrWUCDdNRBtoWJJwiWSidAsRCC4viq7
	Q==
X-Received: by 2002:a17:90b:390b:b0:38e:2f21:3bb5 with SMTP id 98e67ed59e1d1-38f6a4e3667mr4424289a91.21.1785273432741;
        Tue, 28 Jul 2026 14:17:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f1353fdsm443956a91.8.2026.07.28.14.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:17:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 28 Jul 2026 14:17:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sean Lyon <sean@seanlyon.dev>
Cc: Jonas Malaco <jonas@protocubo.io>,
	Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nzxt-kraken3) Add support for NZXT Kraken 2024
 Elite
Message-ID: <2588baac-e7d7-495c-8a6c-277746e9959b@roeck-us.net>
References: <20260728031127.26553-1-sean@seanlyon.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728031127.26553-1-sean@seanlyon.dev>

On Mon, Jul 27, 2026 at 11:11:24PM -0400, Sean Lyon wrote:
> The Kraken 2024 Elite (USB ID 1e71:3012) is protocol-compatible with the
> existing Kraken 2023 devices and works with the current Z53 code paths.
> Add its USB product ID and map it to the KRAKEN2023 kind.
> 
> Tested on hardware: liquid temperature and pump/fan speeds read
> correctly (cross-checked against liquidctl), and PWM control of both the
> pump and fan channels works as expected.
> 
> Signed-off-by: Sean Lyon <sean@seanlyon.dev>

Applied.

Thanks,
Guenter
