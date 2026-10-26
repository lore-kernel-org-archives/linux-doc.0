Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974288;
	b=T4nA63s8qbXZ5QxdymTMZvjGVughv5MCX1TWuD6uKT8oJwee+bPw2/8u45IJW7n722c8
	 NOV9WcUN5QA9G/wNPd1H0S5+CuA8yu2hvHwUr+UrFLcfSlrg+Z5Q+6amjh925rTcnuRlN
	 yCw4BkLLqet2hVfOFUyKgnvvu+eHMmFZQx8xodE/pg8WJBPdnM0qFPBOGi/CIbzfJISD6
	 u3lIMNifX9UZFME+u/A5mx6aRZD2UQFkVNwjJCdm+Y8gJ9bkkF2U+JP7iYBDmc6qSC7uf
	 DW6PP/u9Wh6DdewVIgsRDTPcPnl0jggMxsUxmXbWfix2RTHCIGMjMvNJrLNRwlspojg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HV83c2/+fbkcmd4e8V3tUmbhGiJJW07WJQ5LFrvg8bc=;
	b=pu1/MbyMaJgZq0vd250f5ii9mVKB6MgLya15NUvfx2hN1X2zu8PgXqY0haNAP3mxf6RY
	 ikwJc62833e5AhXhQ69kqTCX2mRKsFPIfQu3JRIBCz5Pf3SF/Ix9CQ1eoRWYBSrp6d1hm
	 5cJV7prP89CeMzuf2bnIdEUjhXuqPCfbo0Q8YoiseVB5DgvjN3+ETEtvrRJGZ46uQHaT3
	 KTvyThIpPQkzaDWtluZCnOdPVUH0GLoU9Iz79cBZae4qeDMfzcUxkhErv+dIK1oJdRyte
	 UAHo8sU3+1yFkWMhtKFmHvp+0Pr7942EQG+rLXGLSrIQBcRuo4fZ2bpGVUO6Ahbo72w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QMARMDKn;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8523A606A31D
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 00:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8523A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QMARMDKn
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8246b13cbso21518685ad.2
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974288; x=1793579088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HV83c2/+fbkcmd4e8V3tUmbhGiJJW07WJQ5LFrvg8bc=;
        b=QMARMDKnwV949KW4/7O7LSMd6V/YMqHz9ZlzpWPQ+s6TZykn3tcjCrDcHALhy1p1D9
         zqqj/8P2iA+mT9qEVy+OTO4BJMmNn57xNgP9cUxA94uldrS4V3XktyXb2Npr40PtGPuy
         km/P3oDXSbst12pKwgiayxeyY4umhESjvW8vcI/lsH8231KYo2AEuYpPYCEs9G9OqRi5
         ILdIktl2YHjxn/ILB2eQPo/HJLGk1XEysxZ7njT+GgD1zhFE4eCvQVj3jq9AYneT4VqA
         n4shNZ80DPL984vmHjsFDb6Jg3k0aVHR1+XFwi0SpyargLeisyh4sSxPIXy16x4yeHfU
         TTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974288; x=1793579088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HV83c2/+fbkcmd4e8V3tUmbhGiJJW07WJQ5LFrvg8bc=;
        b=OsKRoc4k4m4mYTufF5sMS/qnbG9bMVJDmMpp3TyyOnDc1pQZzM6rNYFJq01I1a9Snw
         TFvpsgX0scTDk+M6tslFolC4kq1ZSPjbDaMfo7WXSm11LSJ3d4PvQ7rRy5t9CUK2SxcT
         fwjz+b+NSp/i9nm6ZLd1xr0uXCoV54uhaLPUoRjtFo6AoLd8E9SIQM0dpbBEpp3UMx2S
         mLjoLR1nTT9rk530/0W58lJ3q14MDueovNwapxh78zHwo+0huq0OfxuOTknuOziasGkY
         wZ819dbqTrXLeRQ37BM51R4O0V6PwZVZL/xw+Bk/zGGYi6qqaW7MG0nU+IQGNRj4yx0P
         NlPg==
X-Forwarded-Encrypted: i=1; AKwUvBx4uQNVqvhyUbuoVjoF/Naj24XBVkgb0Wmgx08LBmnBeislVvDPl+5d8WQaeILxbz1nUgxiSejc7t8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcGDwZ1MlVRTEqb46z5XKgDmLhKIqCbR7ta53VbFKrNSuqForY
	vrkz8ZmXIh/hmUFGJ13PB6VsIDJGXhRhPrZbHt2/f+QShwBt/8jihzg4
X-Gm-Gg: AYBFou0BiVfTS0uLoXxRHqEeXDqqzIp330fIYIas6xEgw1pTq7hF+7K1OkypghBSB1z
	RiiKKacfLsQ4LV2eOeN2az0CfPwKgLSuhS5PbJEo/CjvcQdE1dlyjTJz6IL40wx1XPWSjAwqtgH
	iovgRlYSNUTqB9pfNdU/S3+OoMLkhkvjoPMBAgtR6MxZRErgH3utoFoMcqhYM6gFD21pemMvXFv
	IjLEnsl9dxI0kX6yVvhpGz9k4qCbmWQelyLPVvkfECyfp2bKqieC8AXSZ5Y+o+PUPKL4cruVi0b
	Jkla/N5zXu3cRv1nPjSR2rQUtRpC9/nwrHCxo7hvGwlcls8oim0N1WwpjKG0ebcFtNes5lnmVZE
	3OIfjci5eem9J/GG8zAbu53oAfO5k9N3/niMAo4O+ItfHIHCl6qUJBEaMfAPYOVh8VdO6oFo1pe
	qoRIfAxmH58JhdxgJ2gd20i864oYFAwDcWcMws+ygh3nanAYfgEjShypE9AISeHaOzJ2b1/HTRf
	B6Zu7BwJDF3+zTl1Q2JQ3AeBKsnqbobkCO+c4VFV/WMnMLVm2uS2GyjAuqTjX7MrrlxAw==
X-Received: by 2002:a17:902:f705:b0:2e2:c602:2072 with SMTP id d9443c01a7336-2ea9c6c3363mr43122285ad.36.1792974287852;
        Sun, 25 Oct 2026 17:24:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b12104csm10407525ad.19.2026.10.25.17.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:24:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:24:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] hwmon: (lm75) add MAX31875 support
Message-ID: <9977952d-339c-4ca0-b11c-9df45b6c7b65@roeck-us.net>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
 <20261023091550.1494-4-johnerasmusmari.geronimo@analog.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023091550.1494-4-johnerasmusmari.geronimo@analog.com>

On Fri, Oct 23, 2026 at 05:15:50PM +0800, John Erasmus Mari Geronimo wrote:
> Add support for the Maxim MAX31875 I2C temperature sensor by
> extending the lm75 driver. The MAX31875 features a 16-bit
> configuration register, configurable resolution (8, 9, 10, or
> 12 bits), and selectable conversion rates (125ms, 250ms, 1s, 4s).
> 
> The MAX31875 has no alert polarity bit, and the bit the driver would
> use for 16-bit chips is part of its conversion rate field, so skip
> the polarity configuration for it. Also set the default resolution
> and conversion rate at probe so the driver state matches the chip.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

Applied.

Thanks,
Guenter
