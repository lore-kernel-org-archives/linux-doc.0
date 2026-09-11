Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B29B2FE59C
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 00:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088208; cv=none; b=RfyDoZKBHZ0WYuZQRoZq75Jlbn6HsNFguxVOwtTEPZr98Ht0leK+Ck+rAV6YLYUx+yzqarzWAYshTDjKzk3pLbiOWp/H45loBU2x9Sa70Rj05CNI0vpU5zUz0dpEI1cUn2zv14RmvIY0t/9psh3vdPTUNu9SheX9uKdHZNYVWP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088208; c=relaxed/simple;
	bh=nKNuesHM0VjAY9kiLoRrBVVAoGMjPhKuxQKlQzK44GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDOZ8P2QPZolcNXKlQaB3HznscWTuvjT+J7I9/0yhSSm/h1049Xzw1HtQSukGTmGwXaqp4MIZHrRmkmXJcjrggVYjkhFK5iYg6OSu2bLcZpxCHDNsJsA2ONfHejpYQyTZZpIThpxZMo5pfdaJguF0gdrAHqvCkSjgHMSOkTVrSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rTQrcI7M; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTQrcI7M"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2dd020a2e44so3190025ad.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 17:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088206; x=1789693006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ogc/WBlD+uYeOl0wYLOQ6BjMKr9zLaEHN9sUG+KrTjY=;
        b=rTQrcI7M4rvzowPDLuCFIewU2aJshRdTX8R4MF1ECs/rm6Q6XUOrKZrwZImHV3c+Wh
         4faHXTrKkFOx3ztHoy6ymFYEHEri+5mCXsMYAV6i6S5spUsSiD2HFYZyrLepdUdXq0YE
         w5X4R/UL1NGgAA5cB/6OwRkw3Fy9mNCuMa+jOKkqEBcew+pPWo1tSpZeW3ckn4fDc8lC
         sU7HGK2sgte3c/3FKK9/yh7OWRuR6Y9rW5dKfAansN0jcHgztpLCQ+hfNG3EpwI95H/D
         7caY4/zY+kheuzxz+1KmuSH9okkRkx8uEOviHDCG91fcX26O20bzA85y9/smNGE9xSFE
         mi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088206; x=1789693006;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ogc/WBlD+uYeOl0wYLOQ6BjMKr9zLaEHN9sUG+KrTjY=;
        b=XFblvTFOK8kyoJOPMpwU3/pmROMOQJa0L4yb3gNLSnowWRw/YVyESAEC4mUABHsaPP
         +oHfXInUTgxFT1iySlSzvR4+mCJ2zD4pXFHUnRPWttMFV9EGWQLwChjdpwZSR3LYvFAB
         devLrJTOZ+4MLQJDEPN+ufY582mF5NyLiN9ONBOp675Ae01vBrgLxzwBPlIFdKECdrbZ
         p9BbQF2Yg1x80A7yslhXmVEjjBcc7o2fywrP5EcEwKUPn3rfIPNbuDdVXbS2TdhCHXgW
         e9KWzUoqvTfNnj4sSA0KnV4wiKORCGOO8B4eXIJtvcYbb82iEwL893qJUMKTrjMhlkC3
         +ikw==
X-Forwarded-Encrypted: i=1; AKwUvBzx8vbs66apdp+xfAi8uPiD8/UiGh9PofsBhFD7HWd++I8yiUnKcRywXp9NIGLGITC9jCdX3Nr2jVg=@vger.kernel.org
X-Gm-Message-State: AFuF++kAIoWyS/IwHZddx90YclAm8C0RJncI4U5q2FnVg9ODLXBQEdNj
	mr/p38CvEtYNqt3oqUUoDJfEsRmCsZkpsVxRsGN6Z5ZcPLoYsjMNL8Ho
X-Gm-Gg: AYBFou29zByqF6k70LBXXaqdEQwZ8TZJoq4IgnqYbmGcQaZ80pP2wACddRdXQrTx6By
	oWnFRcC4jboKhMZEINFOq8Sx4WXEpvLmDglOkPTuc6qnwlsCAdUYGdi2YJ0OTc6CSlaGjqXKlbc
	TrMb0MWW97NUCrjS41ThOUQOpQKSAJgitR7S0TUmhfrGUbov4cEKw1yRhimmauCZwfAD9aZ8ICL
	ziCWfkAJtY3gb29ZaT/JNU5u5tAsEuf+DhDASxyRSci2uL6zSUJWftJRc/aNlmRVu24lCvFqhor
	TRQxUBs6Ax+kerUEOax5ehnRNPpIluUlz8OZWdOifaxbu6oI8QKwrFxMw4HIlp2xGr604dko4zK
	urY8xFeb1PqlC7psb2wtlS+4Eh9sFpoXKaEO52XRJ4x+xsMMP8QYhjdFwmn0ZMq3kLV3/NxlLKR
	G33gjUv8ucwn7e0B6JtppNmi1o12YBVum1WASrKHW/krdCwTnPDSaWphNoWtzAP0dpntm1wxpNy
	YikYqz0uUab
X-Received: by 2002:a17:90b:1d45:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39d9c21cf40mr2318273a91.20.1789088205743;
        Thu, 10 Sep 2026 17:56:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365bb6ba0sm2006097c88.15.2026.09.10.17.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:56:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:56:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org, linux@weissschuh.net,
	arctic.it.hk@arctic.de, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: arctic_fan_controller: dual-license
 GPL-2.0-or-later OR BSD-2-Clause
Message-ID: <c640dcbc-784e-4847-a5c0-ec6ab42fde49@roeck-us.net>
References: <20260910050401.279868-1-aureo.serrano@arctic.de>
 <20260910050401.279868-3-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910050401.279868-3-aureo.serrano@arctic.de>

On Thu, Sep 10, 2026 at 01:04:00PM +0800, Aureo Serrano de Souza wrote:
> The in-tree driver is solely authored by ARCTIC. Keep the existing
> GPL-2.0-or-later grant and add BSD-2-Clause so the files may be used
> under either license.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

Applied.

Thanks,
Guenter
