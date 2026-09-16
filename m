Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DE55AA695
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 16:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577624; cv=none; b=NG53fSMZsq64kmpM8KuDkP2CQ71ioE6P4KzdhspKqiLoehcdcrKwmbhvuaEKtA3f2Ce/o4AYx1EWsT44Fx1M+SH7wl6Vfcak2qeF7sQxnJ4cdBa52rdxSVgNlrj6FMqQtGGsdKVnkGtzYm/tKgnI738BRFNrNg1lqsQI4SXjq8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577624; c=relaxed/simple;
	bh=A8OUnScFkntcgVv0El+XRQhsZJJugzhrkrqucm1xVqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mRmXQtTbLV0dqqhVSSy8fvNgpMDm+jwz7u9287j4bbO9gsydkIXCV4NMSzH25zWGOxwu0AEUD2Z4I9K+S2wc7E1gQHBuobbNumXoxa2RdGz4XxOMTVPCjdal4g8zBCvyX32YL2W2Ar1Dhz7mRtAggQ4IS0z3eMKikG8hDt73urM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUE3V6RK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUE3V6RK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFA41F00A06
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 16:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789577607;
	bh=A8OUnScFkntcgVv0El+XRQhsZJJugzhrkrqucm1xVqI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cUE3V6RKXPLAd8JtFnK7DChT6zs+bsnpuXv0tsfjKNVAikevV5TRpRXdb9jJJU/ip
	 9wqgH1zLctVj4nHp/7H/ionoXf5dsdltc2CI1EweAuP4L58nyQABI/ItRez3oKD6QF
	 4S5KueHM9D4wwpTQRNXW5Or+gjm0F6VBgCiWQtLgvR6WFCVXwy7R8bVAF6aTGsUn2j
	 QNkJlrCwohi0rM0ZjAPtOQovdhfa++UovqRvpoJWA/BnSWn6zH07JBu1caaQ/Mts5m
	 1F1HNJMUHuMv+YijC50cDhbhGxBVKSqjBQjEQtUoMH7SrZbJ8rY1M4++hsa6g1QTzu
	 Arp8OfiUwCMrw==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso2770111fa.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 09:53:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwY3CCcffeyR6WjGK5nkNBLtLZEXZ29YsYvDfIN80vOWuFdMFFJSgL3Qo9DBdnlnqKzsc8i1DcbGl8=@vger.kernel.org
X-Gm-Message-State: AFuF++k22TUiXcG2Dh/+vbi7M39OUR0t+VZu25xvBS+XlgnJ9Me05Q3b
	FhFMrdMsydmHPeVPmWvted20dfDK0battbDuWobR8ASFPs0OGRN0iVjK0OJTmKxxlt3Xzkstmjy
	90GuWFpZNDBB+B2FlQOAdIXd4hN6tMv8=
X-Received: by 2002:a05:6512:3e07:b0:5b6:95e:87ce with SMTP id
 2adb3069b0e04-5b8b660a94fmr1957280e87.2.1789577605581; Wed, 16 Sep 2026
 09:53:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909132153.1596191-1-arnd@kernel.org> <20260909132153.1596191-15-arnd@kernel.org>
In-Reply-To: <20260909132153.1596191-15-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:53:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLk-e58uiZ5JfiKtW+4tKoVyCXrEz9n4W52PnmtKLqQrEA@mail.gmail.com>
X-Gm-Features: AcwNN1UPBZKZl1X4uCVkQyjhp-cH_klICrLDEiep9UNQdzrrNpZtksTPMzubFl4
Message-ID: <CAD++jLk-e58uiZ5JfiKtW+4tKoVyCXrEz9n4W52PnmtKLqQrEA@mail.gmail.com>
Subject: Re: [PATCH 14/14] mfd: remove unused iPaq micro driver
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	Support Opensource <support.opensource@diasemi.com>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 3:24=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The iPaq support has been removed from the kernel, this driver is
> no longer used anywhere.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Also delete the header as Sashiko says, with that:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
