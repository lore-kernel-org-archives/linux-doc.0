Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C775599A2F
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 17:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889629; cv=none; b=aPw6us0lEi7xDHLL+H+VxEMGEtozfwkPUURlcvwJP6PfFPWByAPXTV6xRQDDtOZ2WH6Lrxbs8MqYAMrbN1ZB5MpUIIpx97onUN+iYNKqC3qyvmZg6+TZsVcalLT+vE7l71A0oTCIF8Mo0JdHv9/Tic8QtPyo6A6PgQFyjKQB1yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889629; c=relaxed/simple;
	bh=f4UIowynbF07Wy7Vh7mDdrS3+ucFbjTlgVg501LnxLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAe+omGbl+nGURMpKQOPdFgIoTD8bNI5C40ulGr7Ps8HrfNFp7MPXw+JX92M66sPZT34ltk0zj4iaRkoUo98l1NLRj6PS0nwFVOBrzFtWDQRMIxM5N9qIjG1qz5iNEY6edEZeHAr7cFzxBvGY1ts8iO1PgpQ/XoYxLlDnvTxC2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lU+DGmG8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lU+DGmG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24B81F00A3A
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 17:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889628;
	bh=f4UIowynbF07Wy7Vh7mDdrS3+ucFbjTlgVg501LnxLs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lU+DGmG8pEakhdiNNxqbi2bvLrH6h6KIGnU5HJDVzidc/ZuStDaF2aSYnfIbfB24u
	 GpQ5L0izwY3jXoIC9+xcP4+bGlTrejpGokbG6/u9mIxGjWJqdd8G0c7iFDuQ53oCQ+
	 rsRZLB3aGx7N932wNd0USFpGobST2DU7IU+NWg8ThS2W60nVstvmexHBn7uiKj87+D
	 lUsfAOpH0cNPCPgvcMiJh1t7qRuhgrZJNHCdsRDlSB/u4RXMDS/X67JcS3opn+3yQQ
	 8ExVtXeQi1AM+KmSoE/apXY6KqZTP9xNRGv206p14HHZw8VTPi7duXAW460FN0CTmJ
	 BUFMNtFBC8rrA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b4af4be667so4900845e87.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 10:47:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxmGoOH5c3kJt5uFhHsTOCaHEd2OyYl9hvTELA+miumd/n6jYdDPwMEt2CHXINaK9YKRww5zi0pBFA=@vger.kernel.org
X-Gm-Message-State: AFuF++nFdLRhOkP+V3ZTXXGnKGQApksPo8DRY5egP0IRDvdTjZvNe6mt
	IZzT/ZoPq2HB+eVjt/kYDIkEdFbS65u46MBFrR9eVda07b+3Ul5KiuNHHN6wtkGRaez16VdiW1Y
	Wgl7zqCzy3DcLOEPojN6Uu1+rTryjqKo=
X-Received: by 2002:a05:6512:3ca9:b0:5b6:183c:5c87 with SMTP id
 2adb3069b0e04-5b6183c5e04mr5069176e87.37.1788889259016; Tue, 08 Sep 2026
 10:40:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-14-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-14-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 19:40:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLndhdr2XYp2rYvngPMr4hkCtX3Xqv=bs76kuEK5MAq91Q@mail.gmail.com>
X-Gm-Features: AcwNN1Ujo9rjMuk24CQogLFJvH7ujiRz2lorQ7l9osv6uL8Ek2VIq58WljFfaCg
Message-ID: <CAD++jLndhdr2XYp2rYvngPMr4hkCtX3Xqv=bs76kuEK5MAq91Q@mail.gmail.com>
Subject: Re: [PATCH 13/13] ARM: axxia: remove entire platform
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Anders Berg <anders.berg@lsi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 5:30=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The initial Axxia port was contributed by LSI in 2014, but never complete=
d
> after the sale of the business unit to Intel, which kept supporting the
> bulk of the drivers in their own downstream BSP.
>
> The downstream work has also ended now, and there is no realistic chance
> that anyone would rewrite it all into an upstreamable port.
>
> Remove it now that the 7.3LTS release is out and can be used as the
> base for one more downstream rebase of the downstream patches if needed.
>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> Cc: Anders Berg <anders.berg@lsi.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
