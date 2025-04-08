Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CE0263C84
	for <linux-doc@vger.kernel.org>; Tue,  8 Apr 2025 07:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097643; cv=none; b=SR4qQmtuyyq4DAXk5o0eKv5YCUC59Sii6mr+4xfO8R2PiTgWXkUtuZFPSEMR6URA+tbfn4qvVc/cViE6esI2Nhm9bLP6gt76KWvaJsYo5C127HfK29gkkUnrl9GTusYVFGUhRxFX2oEhpFygJcFf8vnckibizEHsuHSSssjY6ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097643; c=relaxed/simple;
	bh=+jZrueS3bdTwyiNJBuV89/uZubp/GRCAmixpmEl+VtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHJ8/0Vu1GSNvrcHcMB+VA1EFwYeK3Qoxuqx5IoAG/oV/hzxh49wvTObDmjQvZQtyGebCmVawcHjdP/cN1yUNEm4eqLdnMdfOGZI5z582yVU20tWgYkUKmuVeTp6QSnnpDG8akRpGaQHAaT76gYMLDPz2m2Nn4EniFU8QbEhxTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cIUXVNy5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cIUXVNy5"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39d83782ef6so193606f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Apr 2025 00:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744097640; x=1744702440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IlfwFDH+X8G+NwPj7Vy2IIvOezxV6eu9OtIzRCGvuLs=;
        b=cIUXVNy5frg2xXz55t926pqT3udjeQXh7/c91WAtXAzDnROI/Zz9izM0fes3emg02O
         HQDamcjzmQBqOEXhfaO3xJ7rh7uIxdND/0/9Ki8Jre9ZWmM1G2/d2ZBhM3csh4MLVdOd
         9J71nD6XexKEnPRm2yXJaK3rALstuhKoMnO5Hl8ToFiOfiMmg0QFowKUVEpWMTDbX33T
         4U6RQvX3grvvMcjMlzp7tfU2anpsWI32rmKoLZEqzuMv9aavt1DyB290yxryFN53FIi3
         ZIZHh3gD+QYJsDZc2EcqRDr211M0i5JLNKRZm58PKzlF5TKTEsHaq0kWIlkbv5U9l0Q9
         09bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097640; x=1744702440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlfwFDH+X8G+NwPj7Vy2IIvOezxV6eu9OtIzRCGvuLs=;
        b=di7pmHemfmZn6iuDoKoSAg9dANrkTcQOsSpq3CJn/fLFIJoS8/my3LQHjNdjARcP69
         trHwcVHh/ulSsosxnC5sCxdJTVgvKOms5QiF6FqpZYbvsd2q9Hkg6xq1CFPcvW+dxYsW
         8Efl4XQTn1ZV5Y5Lj7Zvjp9d9u7B1uPDWjjZvVOX/opwJJZc8ifkxx43Yp9FPxcnMo6l
         uvB+umg0YSJrXe1m06jcyg3kpGQbRlcwRVJ3bmq+zRNi28PymD8r5t4Q9yCD49a0yAA/
         UiUiT9tJdequiD8jxaaeLTJ39Ge0+ODa8lXxx7/yCg448U0BLAEB0GZKDHgSwlhO79Jr
         lbAw==
X-Forwarded-Encrypted: i=1; AJvYcCXDoXAPiVeNVTZBCXc7C850/eAOOSIUXP8R59xfzJNNznu84Gq/4QPrMDNI0jvQKdGyabJaRM9qa0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrZezOzbxbyh6vDG0vkplGj6wxnQoSlbK58XDu0cAJMkiipRRJ
	bksUdW6LBC8DpCGlkYjRjYxG7m6qBBVPT8WUxTUCCAwn+Buk9MvyEaKwwe8hryI=
X-Gm-Gg: ASbGncvBL3ZFT5CoAueulQXW3CiDXe5sa9IYSfUk+cVd66TnMAimFY6OpGcyMEo8ol8
	P3safEqq5IxowXy8xDVgqxtThBvriL7qAua/Nmeqx8GiQW66QWtkGgiePy+UcH1xKX1hPlvqtVa
	/zj6m9rT6c+HUjbPJ/VTH6RK9iAuFN4xv2e0C9SPhB+zXZ7TFCQjo34yRQmusHbE8XS1nrEFMF2
	Mi6o45YRG5JSNwGCXBXeZgNyJJANpTT2LY6fLN4lRTr3M0SWf79euIkuNgAvFrGVegCjV/tX5Vw
	ya+unHuB/RXMmwVQ4vC+S7OuH5vqGwDSWWj9sCBwSnYi2LI=
X-Google-Smtp-Source: AGHT+IH/VksFsEyoBKI9nFdRHY5jYoHhuOC/STuFedynMg/f/yUaVw5RUYHsEjKD7l2EEe/Jqd89dA==
X-Received: by 2002:a05:6000:4616:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-39d821116bemr1896403f8f.24.1744097639781;
        Tue, 08 Apr 2025 00:33:59 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a8952sm151781455e9.10.2025.04.08.00.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:33:59 -0700 (PDT)
Date: Tue, 8 Apr 2025 09:33:57 +0200
From: Petr Mladek <pmladek@suse.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liu Ying <victor.liu@nxp.com>, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] vsprintf: remove redundant and unused %pCn format
 specifier
Message-ID: <Z_TRZSxwzfAZ9u6I@pathway.suse.cz>
References: <20250311-vsprintf-pcn-v2-0-0af40fc7dee4@bootlin.com>
 <20250311-vsprintf-pcn-v2-2-0af40fc7dee4@bootlin.com>
 <Z9BKW_06nLAOzYfY@pathway.suse.cz>
 <20250407184647.3b72de47@booty>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407184647.3b72de47@booty>

On Mon 2025-04-07 18:46:47, Luca Ceresoli wrote:
> Hello Petr, Daniel,
> 
> On Tue, 11 Mar 2025 15:36:11 +0100
> Petr Mladek <pmladek@suse.com> wrote:
> 
> > On Tue 2025-03-11 10:21:23, Luca Ceresoli wrote:
> > > %pC and %pCn print the same string, and commit 900cca294425 ("lib/vsprintf:
> > > add %pC{,n,r} format specifiers for clocks") introducing them does not
> > > clarify any intended difference. It can be assumed %pC is a default for
> > > %pCn as some other specifiers do, but not all are consistent with this
> > > policy. Moreover there is now no other suffix other than 'n', which makes a
> > > default not really useful.
> > > 
> > > All users in the kernel were using %pC except for one which has been
> > > converted. So now remove %pCn and all the unnecessary extra code and
> > > documentation.
> > > 
> > > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> > 
> > Makes sense. Looks and works well, so:
> > 
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > Tested-by: Petr Mladek <pmladek@suse.com>
> > 
> > Daniel, if I get it correctly, you have already taken the 1st patch.
> > Would you mind to take also this patch using the same tree, please?
> > Otherwise, we would need to coordinate pull requests in the upcoming
> > merge window ;-)
> 
> I see none of these two patches in linux-next.

I see.

> Anything I should do? Resend? Or just wait a bit more?

Daniel,	Rafael, Zhang, Lukasz,

would you like to take both patches via the linux-pm.git thermal tree?
Or should I take both patches via the printk tree?
Both ways work for me.

Best Regards,
Petr
