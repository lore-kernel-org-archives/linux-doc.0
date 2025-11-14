Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15BB3168E2
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 11:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763121339; cv=none; b=fg6ESgwG3151qLgYfVVCW54KZMdSkk9bJKkwfSWCxSjkzGbkbtuJHD0U5X6lsyq1NgANQl1gzL+KRG8BotZi6bquScP3JyKXxsbI+x/nP76UT99nyLeNmpE30TS6WifuVjuj/zSyXXc1jqgk3xl90YIUQZ0h+ssvRQ5Nfu/H1hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763121339; c=relaxed/simple;
	bh=kSsVcz8630KwHo4IO7LJsqMTZrFWGAD+oaRzx2FLL3w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VEhEntn+FY7ocWugltBUAHODqL0Nk4taZqKOdT0pbIRyJYM45LfIaGG6IUWSlcAEYBFb3jRwqWfOrqmFsER2zz6CI49Z+GisuswN4O3fNlSqrd3y1kW6xVrtVFyOeZc4YBYlsleabnhaA47aodOlspm92d8OAZK/3XTt9OUZAgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLawjDEm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLawjDEm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477442b1de0so12929755e9.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 03:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763121335; x=1763726135; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kSsVcz8630KwHo4IO7LJsqMTZrFWGAD+oaRzx2FLL3w=;
        b=SLawjDEmIkye7FklV/K0NRjVRjISwZlLXhh7NLhMp5I8d6eIDNFW3ENbEsrnKlOEbK
         wP0JiezJ6FXzc0YP0NiJOoRTpo2jTNUHgpttC37nd6OidVHmg+Z64cRg9Honr90y+7fD
         vY4U5+gOET7UBDi2+6m0nE3IHVqTC+n8b2MjOoukKLSqOQdSZcbd7UFfL1zB8pbmmyxV
         nzCfQmH8JdYSC1KDcjNxE6slEewY9NdKw+gPg7Qt9glB4DcEfcCKGThdsdB/7uqtGY+c
         Icm6rA+EMa6fppbBYI178ND65UVjuOU36LmpQdA7TaLx/mqrvylgW2CLEK+1YSXtpTqF
         //2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763121335; x=1763726135;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kSsVcz8630KwHo4IO7LJsqMTZrFWGAD+oaRzx2FLL3w=;
        b=lbRPezFLes4IXumOGBtRdvIFSG4YizTG97dTF0l6BO6mGPE1TCrEL9Nf0YAXqyjhaE
         m0otpOmrtFNt7N1hmGbddoUfgJH/X5ya9q5uzMqkYxj5cf05swNBI1KRwKFcEqNu61DA
         rW9d+QZwa9EgRD08EQGCtSdnE9Rc/h1Gj5Mu9K5+mb4lrYunmx8EhZdX8a68rbpNlpnE
         2Ci9433Glkr61uQN3XJJTl1wYROMfYrTlarWcEvC49gNiOvKd482m7MnYKIfQdsd3ngs
         1DpDZ6TtdEXDAD/RLhpSZLdArdHHIyClSrKZKg5+IpPnFEzyWzurv94BbR+HK6x6ytxR
         PpKA==
X-Forwarded-Encrypted: i=1; AJvYcCX/b1DJ9oYgAxodkLBpBTaEqCRPWhyQGTybwOhJ3oKy5bjj22gziDBziXyDl+EzhB8Ybgf0PChao3A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+thgHXtwepQFYXfy4oiicbhjuSTYDDLLh0L7kdzUvwKKkzBqi
	hi1qymGBJHbfIud2IfMd16ASBBXKnrUllrAackdIMmfFqHWubUPBxzInTYpYy0k8BPk=
X-Gm-Gg: ASbGnctYfkrA3KjqEQz48TU/c4fsbRtxNtp7yejOIIhb2/WVWSs5v61hy5xKXLFYySQ
	Rqq4BrwCFngB9pPMHFYm/YmlJEr3kXCK6shEfhjNc3CoUPfnKvyVsZe/d4F2+wrR0tTM48Ct+l8
	JBf//Lenh5jNviK5Ovvx7sXcqu59PpB70rlWRSNU07rKxrf3G4cQaxniyTHExIIFppxb2zPWSkR
	EzB3vX6oMJYPJEugU+zNQucsJQkRTJIRDVKZypCu1Rf8sRyKWx535LaKqhtPHmevcQdleber5Z2
	IQbBhyWtwnixMx1hmGjDLhEzjhzr02qF/k0xomNzaXaMI9syl7dV9f/qWlCHSfXqvPX5Nl3vrxg
	3H8o2zv9VFmGiPmDM3TA3D13RT8H5cjDyaGtXnkpHGZDP2lySebJk+l3/47VhAabLaP9mCNAsGa
	aORrBeng==
X-Google-Smtp-Source: AGHT+IGaX63VyG7288bvhFhh9mADvgY7EJnU+zr1vNcvBNVERTkgMmla9vn+invb7igtQmyDtjSXdw==
X-Received: by 2002:a05:600c:1c16:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-4778fe49c3bmr26839345e9.11.1763121335290;
        Fri, 14 Nov 2025 03:55:35 -0800 (PST)
Received: from draszik.lan ([212.129.74.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85e6fsm9688761f8f.18.2025.11.14.03.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:55:34 -0800 (PST)
Message-ID: <6479a8d84052b326ffeb5609959aaf3a1aac9ff8.camel@linaro.org>
Subject: Re: [PATCH 06/13] mfd: sec-irq: add support for creating multiple
 IRQ chips
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Kaustabh Chakraborty
	 <kauschluss@disroot.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo
 Choi	 <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-leds@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, 	linux-rtc@vger.kernel.org,
 linux-doc@vger.kernel.org
Date: Fri, 14 Nov 2025 11:55:34 +0000
In-Reply-To: <20251114075004a444bff0@mail.local>
References: <20251114-s2mu005-pmic-v1-0-9e3184d3a0c9@disroot.org>
	 <20251114-s2mu005-pmic-v1-6-9e3184d3a0c9@disroot.org>
	 <20251114075004a444bff0@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-11-14 at 08:50 +0100, Alexandre Belloni wrote:
> On 14/11/2025 00:35:07+0530, Kaustabh Chakraborty wrote:
> > The current state of the driver only allows creating only one IRQ chip
> > per PMIC. On some PMICs, such as Samsung's S2MU005, there are multiple
> > interrupt blocks, for which the current implementation stands insuffici=
ent.
> >=20
> > Add support for creating multiple IRQ chips for a PMIC. Every IRQ chip =
is
> > given it's own index, which is used by sub-device drivers to request IR=
Qs.
> >=20
> > A macro is defined which states the maximum number of chips supported.
> > It's set to 1 as currently, no PMIC requires more than one IRQ chip. Th=
e
> > value must be changed accordingly on adding new PMICs requiring multipl=
e
> > IRQ chips.
> >=20
> > Moreover, adjust the s5m RTC driver to initialize IRQs with the
> > appropriate IRQ chip index.
> >=20
> > Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>=20
> > ---
> > =C2=A0drivers/mfd/sec-irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 163 +++++++++++++++++++++++----------------
> > =C2=A0drivers/rtc/rtc-s5m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 +++-
> > =C2=A0include/linux/mfd/samsung/core.h |=C2=A0=C2=A0 5 +-
> > =C2=A0include/linux/mfd/samsung/irq.h=C2=A0 |=C2=A0 14 ++++
> > =C2=A04 files changed, 127 insertions(+), 70 deletions(-)

Your patch reminded me to finally send
https://lore.kernel.org/all/20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org=
/

If applied first, you wouldn't need to touch rtc-s5m.c I believe.

Equally, I can rebase mine on top of yours - no strong feelings.

Cheers,
Andre'
