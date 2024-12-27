Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2898C14B06E
	for <linux-doc@vger.kernel.org>; Fri, 27 Dec 2024 08:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735289018; cv=none; b=cfZlkUgHHEaSUEacXRFyaiPb2reO2apT9BC+p1b4XVXIpwgPFtfU9FXzCe290y28r10cnFl3byEUEk2pODPv2+LOrEbg0GgJ//Ci92G7yVT3Xo59KSuA10RZEvOnWzRPUSXiyVvRVx9ol3dg9wjWyzoCrSuXxVhyfQxy1kNxa50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735289018; c=relaxed/simple;
	bh=THrgYM/I/2PM4lB3S8b8dKft+bfxKHUzcX53Lv5NjF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyXn3xgOUyIlhr36Br1CuIM0maEh+eNQpknxTAQEtgsG7h+QZQdyXW6C+tIgbi8+K2G+fJKCJbDyDg4aGDA0SXWegcBr9uRKG8RAPxDHB/t0MOFkq2nFoJNYfrUESQy5GortrTMGX9uGy/omWyK61VduIqijxLDWjfAtrBD20H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=K+gKAQwx; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="K+gKAQwx"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so11264586a12.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Dec 2024 00:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735289014; x=1735893814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=THrgYM/I/2PM4lB3S8b8dKft+bfxKHUzcX53Lv5NjF0=;
        b=K+gKAQwxGxYrSj5qRyju2TU+O4PL5l0+n59Q3DbJMjBQ9tAAaB59yO45a+f0GGz5qG
         MGVpaIaWjuEtURw1iN01pg6whJV6NmEpz1boPuoCzqyP/cRROoLQjoyLN2+zr6YEQITj
         VT9qgK+nZ12c0MqZD9xRV6+eL9IaeWKeH/D4oWEy6j/hRO62sxbITpCM4RXZ2ROaTxR7
         bqdCmwRnxP/Es0ylzX35X6yt/KIdbVKWvupC9WODtiG4EW+1CRdUnw7iM10DCRrLxRRe
         pKSopcFaY+oGhynQZQSiMA/iZLUmGKFWciDjopLnNoSb6U81fuBTyAlJoSQcdAJhnzK1
         QZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735289014; x=1735893814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THrgYM/I/2PM4lB3S8b8dKft+bfxKHUzcX53Lv5NjF0=;
        b=Ywx2MrP6ALCLvKblTaAlRh873ZiccI/C4FC/es9x+uljCTEIIkokWYruxfKAzGmXRV
         /cpUsnI3ApnOO3OL8LGWerPV+mIDrTfzy9gkY0P648aywAkSaMhQj3Vw4L49R7RK3rUQ
         2aHHzy41Pts2U26kfanWg7lFljMHivHn6xuuPrBnCaebWpRSU6Odg/PVKAKPmhklVRIx
         DJHSBzsH6BMInUAyfxhLPAZEn5+Oq3hA4OU50aCFuRY/4RxqMlFEwYU0OkdRUKp0Mgdy
         mVdp59R2yvScSzku0pVlsTTa8VnFENsNZwazCe8o6s295Rfs+ruGDlsgeZDLsMszgSwc
         toSg==
X-Forwarded-Encrypted: i=1; AJvYcCVLsTBpFYjwXvX9X13VxDoDNsF3j2p2T7GxEIhP34IFp48OAC+cFqqG+tcMD2NPOk8jYgki65zbMBk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn1rOdSxWeWV9K2J4dvaKH8sRrgixXDLg0uL8fgX+TMTHjRElI
	RXKWGbcSvS3NPFsCo9GCGgmEfG84QSkwl7qaKAUvrUngdaR5Ocq1+fluWBkFyCk=
X-Gm-Gg: ASbGncvn84HChu/F4cu8C1jLANXw5S5T2a/ULse5xU1J9gVI0SPXPUn09o/PGrgV4WQ
	ZbqrVzIvpu/vygdg5eUNaaCa5kbxnz4KoNqM3gKYVM1OdOdY6Ge7a+H2/YTIfxnKz9qQNlssvfM
	q9jm75NVChVe9hgMIuBMIDSpxGSG0qHJzc3zyYVGrTfjj2WEINvxS6cybOC9gI8+voWHv+0/4Bd
	sddCdMPWpro2omASF8EXBGPbL5yGFyNk1wrXNOF4l7S8ve6RTBJv1dGOJbI/ZSplid76Ql+MQML
	wRdpLLKx7w==
X-Google-Smtp-Source: AGHT+IEzQP44dmWbe1VSp36ZAsJ+DOZkSE6XYi7+YrOQ6d2vRkiz93oSKK0gDB75cG4aLLPyuPlKHA==
X-Received: by 2002:a05:6402:26d6:b0:5d3:cd5b:64da with SMTP id 4fb4d7f45d1cf-5d81ddfd841mr20516135a12.23.1735289014387;
        Fri, 27 Dec 2024 00:43:34 -0800 (PST)
Received: from localhost (p50915bc6.dip0.t-ipconnect.de. [80.145.91.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679eeb1sm10465468a12.48.2024.12.27.00.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 00:43:33 -0800 (PST)
Date: Fri, 27 Dec 2024 09:43:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/4] iio: adc: ad7380: do not use
 iio_device_claim_direct_scoped anymore
Message-ID: <befxu7wle3sq5egcwqhxx3qkvnye6cru4shufngyqvp6uyurkh@6d62xfzzuqss>
References: <20241224-ad7380-add-alert-support-v2-0-7c89b2bf7cb3@baylibre.com>
 <20241224-ad7380-add-alert-support-v2-1-7c89b2bf7cb3@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ladguza3gb4gzncs"
Content-Disposition: inline
In-Reply-To: <20241224-ad7380-add-alert-support-v2-1-7c89b2bf7cb3@baylibre.com>


--ladguza3gb4gzncs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC v2 1/4] iio: adc: ad7380: do not use
 iio_device_claim_direct_scoped anymore
MIME-Version: 1.0

Hello Julien,

On Tue, Dec 24, 2024 at 10:34:30AM +0100, Julien Stephan wrote:
> Rollback and remove the scoped version of iio_dvice_claim_direct_mode.

Is this a preparation for one of the later patches in this series?
Mentioning the reasoning for this change in the commit log would be
good.

Best regards
Uwe

--ladguza3gb4gzncs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmduaLAACgkQj4D7WH0S
/k4ycAf+L+8MLST1YxuzyDcCM8wCXQdBnINZIVBTwtYe1wqvx/Zt6U43qIL+ECPz
O1hp7WSek8TCvNBExaUsMgD2bbKKSil9ASqWHuqQB2hHZf1I9SUJXEA3kmVi8xmi
TyDZ5Mp1T9f+Ra7NOJn453/FytLa9E9LF2apsKTSUO0P4VbDURPmejHkkKS4sNHY
8xE1wggOyZ90GSiMzhpWPC2g6RuHCCI7N95+HALO/wi85gaNC8DBla26fivc9w1x
Zf6PG4TgfnZpPyumbJtOtZkULR2w29lVLdfmwX9VMo9+345nhK4s7RPYRaHs6f6F
ZS/Km9i5VWNiRTUPWNMEJsycPZE6GA==
=+XKk
-----END PGP SIGNATURE-----

--ladguza3gb4gzncs--
