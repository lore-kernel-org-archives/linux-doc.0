Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5904349B2
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895364; cv=none; b=Hf6SKPtldv5y4tuNTUbc7FGLl5Zamqoba8iu2jjEIMLCYj0yig7NFN7Z3UB78eYvRz4vjVlmmn2F8n2mNkUsqL+m2NhugUkQFDj2PrgLqT+i3ufmnNl5rRJL8ToVJMpyNN4HXrNRFkP681lhBZVBC4oTnTurJ2CdPWoep6Uvvdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895364; c=relaxed/simple;
	bh=BL1RUYoOl+2DCnnljwHrTpWKc1vt3ozShPXUSpVHg8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KE4W95nJ9swtp3kACUtbvU4zgEgfzs989Mdl+FsVFrU6eRYPiY+TiZEvsTrYkA8LaXsS8MV0ij8YgkdbNEHaZ8wh+0ksX440jIEiVr03idvx1nc4mwOqUBzTrVMO6nqZXt6J45cJp2xiFeNBZUw6T9scdIJmhIdnoh/vDdhDot0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IldMupf/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IldMupf/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso41216095e9.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 12:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895358; x=1789500158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GVs4+8gm56Wnu6exUObCNgkOQEYDE8t6OW3Oqkq6qd8=;
        b=IldMupf/CXO1fJhcChwVffZ26pAdYEuJJo7n3NchFgpe6wbStMGfI4utvCihSq3+Mx
         QfakSVaL/MJcsyxLgiVpLhVZFiyd8ScB3t8IUALrvbnZWyWN17avGp9xQ9S7P4++LXdU
         LUlfBZMoh7BO7j3i9dt1eIczOoUyh6xGljMyldbvy7aZbl9McjsggHDOzBBQdaTDXM7h
         T05dJ6nI49n7G0r3JT59zHl54FDUVXNFF31hTE4azXp5dODZo1yxFt83JcwMmjJUyP59
         wMfR0iaSQSzgKmfqD4f+FZODJ2rym9Fks8lUDFHOufvKk5rwLwpiVRfU7SdRzD88aQWa
         rObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895358; x=1789500158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVs4+8gm56Wnu6exUObCNgkOQEYDE8t6OW3Oqkq6qd8=;
        b=ZVAE219+6IMPv2SEJsxfsq+hhzeCcWU5BldoEhfEOYRzTSoS7SHBsTd0smJnVrSRo+
         9SoIYI97/Uo6ElKV5sPueazWd9Xvdoi9582bCu2vbslIDhScoHe6meGaJYIWIqXMRYS5
         QfryUSw6rPdcqU1toL0mop5nSOvR+ywP9DgRxIMBggRbflRtzYtasYjsiP3281F2xF+7
         K2s7q20T9Vgo3Yhus8JejHN/+8A075kRt4lnhT/5dy3jdXkT43W5/6Q416QHCEhXcqft
         SLZtcVddsUkRwFAX9TzgmvTkUcRkeZ8JfSrtslqU+UFQ9ihLPfDAf1yFU/1v3igpdeNq
         yPNw==
X-Forwarded-Encrypted: i=1; AKwUvBwkJmU7Kog/KwvI66j8CrzJUJRtM7A9MbAU+WADFESCR6qgDiBTCSrI2lYOg7i05gsoba7Xfe0dIGQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kkUrVhd9cAOxMW04M5wHOxdF18LZuFe9kigN4eoxmOaE6PiUbO
	GwGc8hHEwWQ+xygA35XpV9juSPWVreYcz6mvypq7Szvb346d75sWnfyG
X-Gm-Gg: AYBFou3L0sWXHnaGlZboCvR5MehSAyEDoHFG0Il7hW+cKwJgSnQj7baNfzdFyST572B
	uW+UsXY8myE1OMBpQnChcuYrfOT+PexVzLBenuLoki5AquUjcQoZmqPAgCKRgEJjv2AJRvHLhkx
	sUuU1S9M4SwVEZ4iT89czbsFAtUhIR1qvVZhbfDh+AXBtQ84NIDTiwf8gDID6DImTgRmSX+mE+l
	JMXQQqhEGn83euIIXtlikSn6ZtyV/1CMzZTjtpValJKFxyzYqyDPbg0Y/L2Su8nlDC/2f5irhXE
	ITbhTCgrjXNs3XyxH81aTU/l7YmIJpCyFTdR/vKPXzlHyHSO3o5oH9Hqk9asNZg1+4MPsHpD7P8
	/dNgO91Al0JV+iX7C7J/3o22RW1OFXuF+AqphjkBfnzYp0kMn8u1EZw7fbmez0NWhwyXw/45ZGQ
	2CtZqlVMbiHAEqqXEz4TwmfVgXGU4jdAHR6QET9Hy4hFuCp5J7xnvDUhJqnslTatDx8zROREPa7
	LQicTrTYIRR+VY7Ovpz1rbXDf6BuHkASdacz1oqrHwmJ8lamFEF3gwPawEjkCqIWnjLJl6eeDXr
	ZAKoblyqPl/XuiSq3CL9Q54k1vmfCw==
X-Received: by 2002:a05:600c:3ba3:b0:49d:e79:612f with SMTP id 5b1f17b1804b1-49d0e79635amr157041045e9.26.1788895358151;
        Tue, 08 Sep 2026 12:22:38 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm38080321f8f.1.2026.09.08.12.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:22:37 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:21:22 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Helge Deller <deller@gmx.de>, Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 06/13] ARM: omap2: remove omap24xx support
Message-ID: <aqBXOemS4boakDGt@gmail.com>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-7-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908152808.3928630-7-arnd@kernel.org>

On Tue, Sep 08, 2026 at 05:27:56PM +0100, Arnd Bergmann wrote:
>  86 files changed, 60 insertions(+), 10696 deletions(-)

Note that Sashiko skipped reviewing this patch, because it exceeded
its current 10000 line limit.

> -CONFIG_ARCH_MULTI_V6=y
>  CONFIG_OMAP_RESET_CLOCKS=y
> -CONFIG_ARCH_OMAP2=y

With CONFIG_ARCH_MULTI_V6 gone, CONFIG_ARM_ERRATA_411920=y a few lines
down can be deleted (savedefconfig drops it)

> diff --git a/arch/arm/mach-omap2/gpmc.h b/arch/arm/mach-omap2/gpmc.h
> deleted file mode 100644

perl scripts/get_maintainer.pl --self-test=patterns now warns:
  ./MAINTAINERS:19896: warning: no file matches	F:	arch/arm/mach-omap2/*gpmc*

> @@ -560,13 +533,11 @@ void __init pdata_quirks_init(const struct of_device_id *omap_dt_match_table)
>  	 * We still need this for omap2420 and omap3 PM to work, others are

Stale comment about omap2420

> diff --git a/arch/arm/mach-omap2/voltagedomains2xxx_data.c b/arch/arm/mach-omap2/voltagedomains2xxx_data.c
> deleted file mode 100644
> [...]
> -void __init omap2xxx_voltagedomains_init(void)

The declaration for this is still in voltage.h.

Thanks,
Karl
