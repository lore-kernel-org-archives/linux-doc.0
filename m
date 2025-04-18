Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C278F26FD90
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 10:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744971051; cv=none; b=TFB0o3PisXaykeF1z5pexzEl4PfoPNJOijtWby4ALkGFnPgl+dGysYmAJRbVXCNUEJipCNttwz5OFyktWwHhllybidG840Fum6rcJKQ4aTOGuy2E/y4FkgzolVFDHPFdIWIIE4tHCR7kEvnEZFDzGlZEnNK5groGdqDphLbTv9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744971051; c=relaxed/simple;
	bh=oxo8zJvG+XexDH4GV9ba7u6yzdBoFEqWEzjIqCoHiyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNvuL8SHuk3/KJ7kElyzHxR5YHvCeEZjvXA2SPBKWAk4GmfkLrBhRgb5pnrC4hw7YLoMd4YSJqSHL6rLb678Df901Ghd5//TUmW7bR5g2SCc/RkWhd9H9+hcYn5Osyd46waByK3lQiqidbWxFYzUg8GFmoYFgXq5nFCDTp0w0Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AeueT/YR; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AeueT/YR"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3913958ebf2so1606084f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 03:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744971048; x=1745575848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ozue1u0UD/lMowwm+i9KBTDQgenusJImLUvjM+8MVbc=;
        b=AeueT/YRylIPJ4g7w6ZwgV6AQL7LGieRpYSklr8yT3XahUT6A+CLnlOkEHkhSbQ2tD
         5w4A/NeCYYu+iFcDCzmuvGGiekZ1mmmj4OC8qGP1PuXUwfMFWCbGqwfoCsfMQQ2KBqQK
         ScLmUMDtaJgEeuGiMQcA4Gkp/MMXblHmgfCrFfVB1ULR3TShILgPmTURHMZWUCs0SMuJ
         JIlPM0M3uiCv40EnQ+ySuxnb6evXCm4/vjVLLez95dKtspZhl8yJPQqNY9ifwETSNAS8
         rFx7Aw+ZkW2uRb4tdoS4vu15aHYOFE8+M4mJGw1427BqruQPTYnuH2dzkrtil+msdrl1
         f9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971048; x=1745575848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozue1u0UD/lMowwm+i9KBTDQgenusJImLUvjM+8MVbc=;
        b=mdBltJEb98FiWZr2VFDpH5gyzpBz9WpHEzBkSTdVldyNne895uqbg3o+xGc5MfJ/Xf
         RmKmj+oDJ38i0+jlI/dzQIwymGD/vHZ0bFH1fehsbp01VKNbNgskIiXVa8oeARsDQ6k2
         cJSa0jG9NMD8PlMGZYqjlEBp08BqlX6RMbZnL7/kefLB1BHMjK3LSOI3poKS/fqCUwGC
         3nZ1Ntd+FzEw3u3snPats7GxaKXuJJOWsDInXopL2RuP1qWR/9JN9kKdCfPUqWN9rk4T
         PIimldhh334RwkBU6L+tQoCBhScopEEBtR0eJ5uNdq4wBG1VJc8EfnGD5yvIq6emoqdI
         qnFA==
X-Forwarded-Encrypted: i=1; AJvYcCUprrBpvips9OiWJZPY0OSwj/fC2rw94s7wQrFwUAn1ClnXnTXnVfOQ4LvrMHX40ibzfb0/lBfHNgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPEU1Fas4GkHzEBWXwcxw1X247v6ir36jtvRf+dvQh9sKQES7g
	pnR9VvVU0Juj7OR1dNp8UZAU4lFfiOw7E71PzlSmTgGhOq+0bMvV4mRrPhG3TpA=
X-Gm-Gg: ASbGnct5fRTI+VvTdCqbl+ei38P8A4ubr+TeuWwWbwJMycyIUFxzLzNXT1Oc/N5AAO+
	I4r7NtRVBhf+MqHdwV0wbohEMxbQa/2a0Vecimv46UaOLHj8PyOZGBur4zDkkg73ZdhiYT1slW8
	Rv3mWQ0pys7pkxtW1e2LGJlKu4VrwKZUL/krRn8PiPYKHWc0YwwXGbszWZbbaFYk1Vsmu8rUsti
	QTTZx5v5GLt2cFc8QXdidRj2UTy9TAf+niEyTYBdUKL2mwzbeZn0/BUq+BBBZJNpAwoa6paGert
	zBfmNqycqNGXbRbooH7wXbtgs0Y4ySY8+GFUCFJS1zOERmteOfTYa66AE8QMC8DA7dDdOVFyq77
	7x1E=
X-Google-Smtp-Source: AGHT+IGMO5NilTQ/i8XjooFiGASJrvfFcSDr2VmmYPyU7LJt3JOcj+Z5vFGa9j6IQlSeom/a+LiTrg==
X-Received: by 2002:a5d:6da6:0:b0:39d:724f:a8ec with SMTP id ffacd0b85a97d-39efbace5efmr1565326f8f.44.1744971048079;
        Fri, 18 Apr 2025 03:10:48 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5d69bbsm16142205e9.34.2025.04.18.03.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:10:47 -0700 (PDT)
Date: Fri, 18 Apr 2025 12:10:45 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Petr Mladek <pmladek@suse.com>,
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
Subject: Re: [PATCH v2 0/2] vsprintf: remove redundant %pCn format specifier
Message-ID: <aAIlJaZlBxympZDx@mai.linaro.org>
References: <20250311-vsprintf-pcn-v2-0-0af40fc7dee4@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-vsprintf-pcn-v2-0-0af40fc7dee4@bootlin.com>

On Tue, Mar 11, 2025 at 10:21:21AM +0100, Luca Ceresoli wrote:
> There are two printk format specifiers for clocks: %pC and %pCn, and they
> print exactly the same string. Geert confirmed the intended reason for
> having two was that %pC would act as a default, like some (but not all)
> formats do. However there seem to be no advantage in having two instead of
> one, especially now that there is no other %pC specifier since commit
> 666902e42fd8 ("lib/vsprintf: Remove atomic-unsafe support for %pCr").
> 
> Definitely having two without properly documenting they do the same creates
> misunderstandings [0].
> 
> Since %pCn is used in a single place, replace it with %pC and remove %pCn
> to simplify such format specifiers implementation and avoid
> misunderstandings.
> 
> [0] https://lore.kernel.org/dri-devel/f8df2b5e-b005-4ada-8108-159b2b94a72e@nxp.com/
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---

Applied, thanks

