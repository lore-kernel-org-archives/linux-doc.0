Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A873537CD
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137514; cv=pass; b=RHYzORICgmtEPs7fqjWCkkN8GlVxT+Q0fi4y0ZiA9d+dbAWzfsbWsbmctbn4MYXOzr5XnnJSoXKTxWzYPg4kvi+RRMZ9usA95si8zuG5VQ5oY7xzWdzUjjiUwsn3yzJDYc3Ywt00ilHbduX9kNsDjOZwdnLeZaRuTlCpx2RY7qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137514; c=relaxed/simple;
	bh=XLpKjuu4srfrU1du6/lAaUzD7jl948KYiIqSg/FlWVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C8AUajxE8QFK0F8L73yel1HVvjzLsn4Id9Tbm2wHCW7AKoxYi6Y/9eRyCkRDpL3LthDiNMxqEecF8jhU7I0nQLERmgY0xrrg/bWGhy4acH6RrxqYTHM+Erlzo3MFSbjk7GaVxBZUZjiRv8e0IRvCPsNBs6q2e2QKiQ2+m2vJ0Hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=HB8Y+RT4; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="HB8Y+RT4"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-836c4474028so8714467b3.0
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 07:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789137507; cv=none;
        d=google.com; s=arc-20260327;
        b=A4CQJK3gQcGmSDB9kvM+FeBthv70tya5Svrlb0rZPcy/N9DsVdkQFqN5yC3mWV56cG
         Cu/gUd5BUvyw2BT6BJhX+skFxDJCcjM7SxJkYi38PyGTwsKXyZwkForE7S4DXhK8OhgE
         ZwUwWoWRz/xfBcxH/RvvvBzCDnUy3If+JyvvNdh3wN2cFn8hCu6NVAkxudJiHVArRSNG
         1cYsT31TYYGcDiaV4ylUQi6jIODbyQt1zsXWPEyZyxCEWN+K8DqdvrI3WGsHTwLMcCOJ
         43ON4AQtK30Uw9XQ1L58L243VQYe8NQMmmrVfC3xKWipYJXKZ9GV+ANhwcDg2m0Vo245
         rJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jpJbb5DSDD0uOBnoN5sYAo9U83labpJz6g7jqXOS7q0=;
        fh=vq7GBFInX4gAAQ7S+QcyYsitgs6BGnLL99UY199cRwc=;
        b=qVEFRMX2YXg8QvA7sX0x2aFhwYjl4RKA2jHo8R9YZJLQO9aKzU/f28lcMouUDXPyIf
         FljHwPRe+3RmqhX197roCCWexNQNeqhl+UI9NvD4+Dtgre1S3LVifBUqo7V7zG46PUsA
         zfHXWhbi6iyfGPQDg6R1j1GAMiHuD3RrwNl+OB4mdZqMXb8x90CWgm+lHjwi9ThRt1gT
         o2XZEjLCvjf4RItK9CFIlC20MfYJ5IcHiLr8sZJMQiT3SbnevTWymZEMEyDeisOLNnk6
         wvBkFONSratzoafhBeE2tXHweh0U9w5dLTuONibBOX9wkwZQFUycjA0UVuMg5RgLn/LC
         kx3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1789137507; x=1789742307; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpJbb5DSDD0uOBnoN5sYAo9U83labpJz6g7jqXOS7q0=;
        b=HB8Y+RT4TRPooM8mqpi8DeLFRTPVsBx9aCjZB/tdFSV51HaKr7YUqtjHQkphkOVbT6
         uuwIWKH3SAN0TzGoi7GXFe0YJRT5iKtXrRz5k8GxzTLnZPeidsaT8lGynlHxy7GjzZ9r
         wzrI72QggorLaBikBSbsEG1noEYrmgMFuOan4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137507; x=1789742307;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jpJbb5DSDD0uOBnoN5sYAo9U83labpJz6g7jqXOS7q0=;
        b=IQhcubj2vfqjDSYAM0pdWP7GSUL532dsj5k4XWcPAl3dNkmFHTeV8LCOOnC0HyXIGX
         DpsGGyao8S3mjcVA0yVp0djOqQHmYgCNwVF/8ypQR88tv0ZfB+Xe6m6zShYbsMqaEXos
         qdJ02Qfb7szMmu5i0vmotiSQ3/N2sENEVIScfGjL9qxq1iuy7sEiO3HczsHTz5kdewAb
         4wyurpilQfOdJj4cjqUyjIvThghaHHR5Z/l4LPhBPyZVpFWbja7/owiPdcVUMaQZrm83
         RNyaTt6+NPIsHcCAOS1AWVzN3ayNhHJr4PvnLOkh9DUOir5Nm5cF3Xd6YypJVbpkY+2H
         vqAA==
X-Forwarded-Encrypted: i=1; AKwUvBy9vs8eokkdTKt7p2sdFXYRfuLWamIJGFwM5dlCf1KQtHeuxm8DbfInKNqKWITCewSHo+VKIXNcKcg=@vger.kernel.org
X-Gm-Message-State: AFuF++n/KB/5qdTObOKzftXKclVGuqIviddp2o2dnx4F23yUFydVc1Kc
	/iYUlwy8+u/SuEVYXIppF48938LllpApGA/VtD73AcxNlQMirMVPnJ+/Sc4qiGXM7fcNhZ5OiGh
	dEiLxKcgTrnG5fmz0L6QoSLKyZUeMKLhLVT7C1xdWCg==
X-Gm-Gg: AYBFou2By01Crl/fTHFWNCQACelmsITSD78Es5hDieH0l5FhxmAIr/csapZqh+PVghQ
	4Kk0TOwrUfvVbu+722eq0lpVydsYnDRzbkU2jqkNuz57l4630r9VlAbxqP+uUVx1Lj8SNO/s881
	jN4jn6/9VNNTmgTBjYiQpVBPFEjSIOsdjMuawtmME7SI2IH5+5q5mM4IfU0wkqabe34VN/RL7rG
	sNXzKwH6+zSrvI41y0FpUYcn321v4MvVzyBRCgWbIw9UE3RGfEwZrddOYvwOKvu9SfT9EVutu62
	BiV6DJUrLZgVv0Wf6srNYPLU9k1WOGBBqVwNqx0fsmsygCNYXiZNGbq6qpG5Us40
X-Received: by 2002:a05:690c:399:b0:873:5bb2:6c10 with SMTP id
 00721157ae682-884b7316b4dmr14810657b3.58.1789137507274; Fri, 11 Sep 2026
 07:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com> <CAD++jL=ysmPgs8yKH5KBobuv-eeCHHgZwvo1kvHOFuTwhkaOew@mail.gmail.com>
In-Reply-To: <CAD++jL=ysmPgs8yKH5KBobuv-eeCHHgZwvo1kvHOFuTwhkaOew@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 11 Sep 2026 23:38:14 +0900
X-Gm-Features: AcwNN1V8w1uOymS_yob5PvYfeWzm1NprI6fjxQoUm4Mlo3gyAoZUnypuVT5lDl8
Message-ID: <CAFr9PX=_FmMdR4TeP+tqURZdZCTjw8UYxAxeszs_vcpTbX+_aw@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Linus Walleij <linusw@kernel.org>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
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
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo <shawnguo@kernel.org>, 
	Karl Mehltretter <kmehltretter@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Ian Molton <spyro@f2s.com>, Jens Axboe <axboe@kernel.dk>, Helge Deller <deller@gmx.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Fri, 11 Sept 2026 at 18:11, Linus Walleij <linusw@kernel.org> wrote:
> - One camp that are enthusiast like yourself. That kind of people
>   are running the show inside arch/m68k on Amigas and Ataris.

I have SMP working on m68k (dual 68040, real hardware) among other
oddities. I think some people would get a kick out of seeing it but
also I think some people would also ask why we can't just delete
everything that isn't arm64/amd64/riscv. I'm putting off sending
patches like that to avoid everything getting deleted. :)

Cheers,

Daniel
