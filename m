Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBF03A4F21
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676068; cv=none; b=lAIR0qfXROJkijXjhFr4TTZ+CcrA9O/WDNlLXQ3BsjA0kEzbpGeuvcAJ2vP9mUzkx5q7U8u+oRVqPxIBKe+ALhsF/yCMhI7dn3xOvyKhkyynQqNL68sw98jaHWrMggMWNJSNfadjj6DnsHW7KYAFngnTOy3HmJOn2dLc9vI7OiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676068; c=relaxed/simple;
	bh=mt7njM8AMm3366rY9bZXkt/iQj9L9Y+U9ts2fzBUnT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ma+e+QlVD9tvr99qNns/mB5yDTIRQUXFi3wFpcxhy32fiwqdl8JuNqef9WLM86XZwouGdQIw7ion0YZZ5vcwIKvsZXrS/cZxLlL7+krdwo9KgCYJa7MtjHYMrNY4sPGjx7xjGfRjgBC4idWQ16z/wJBHxbyR0uVLCVqD2bdgMNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIp015W9; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIp015W9"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so3012062eec.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 08:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773676064; x=1774280864; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KIbl9qFxJrmkiuonu3RjguYUay2gXS+vKFLd6XX8oOc=;
        b=LIp015W9YoJTicgjk8ovsupZRgmsJQjS/JWd+D3F2zRM8dRflWQ9O8pcbzHALWr6ay
         9cQF+ZcnVTSrsFqHkIIHNFqWfZaEq+1lgy4XIbG6ieETcUgYajTiN4QvZh2gaT3qucd1
         Zg4H3IUGbStHSpwJPOJLvOHPdeSScVPe6T+wSdv4BbLUcLgpGd9yzKuMFr7BhgbrKOSQ
         NH/CGbu2DnWSeBqhTQnok+jjBh6NuXn7lnBMsNk5bp+JwKbGPddB69ZM5hIGyYZyF3fM
         5nwh/APwOD+TjBxorMJ++ysRR9ltIxDKNlrjea7DuZtZcquUMscD4y+bJg7qqjc2QWxu
         h0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676064; x=1774280864;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIbl9qFxJrmkiuonu3RjguYUay2gXS+vKFLd6XX8oOc=;
        b=of93THaZJWtilyVWNuXjYnIPO0zaoAP+Av3GTS4/+9zyOPRCWRZxgQndRjqNiNJ7P1
         s3Pe0d8hZzzDk+09EdqBGgzjg7RlazdaHq8zC3tTmu9Hg4aNFHGfjBofP7kvS2u40O6T
         4275t1mmn51PlJ0T6tg3cDf61H1QXkQYIrKLhLRNr5WuxbWn7KRk85+Jh6iSzBA5yLGM
         s4OESFxDN2E3BbqszrRQ91VlQLhxS+OasvLM5aw7bCKToSOn6kQzXYxpfu8/COPJPtkn
         A3kSMq222xtG6mhOSci3RwdED+/Pt28XniRz5qcv0DYNg0VT0+8wvwkRcQILuuJ43149
         Tbwg==
X-Forwarded-Encrypted: i=1; AJvYcCUpnFBAMiYh7t9jxB25xANZBpButm3mnTPn7/G46CZqBKyGygbIhCn1UkEj30tHIqc9JEbAOguF3Nk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT6k1Lnma/aCUMaTfqaTZO3LYCmss/7RbkqMi8Aj6GJqzRddg6
	I/x0OiAjM2tDkZHToKpoSSxKWixt15yF86ED7BKiPsOfckwsCuDBVNhK
X-Gm-Gg: ATEYQzxF382gjCSWdywL5YXA8w++O605Idvp1Z/SjMBDY0MenpDVrjmwJCP/F6DrO9u
	hXo89DhVz8LvjIf2KsULfQ2YQi4euDs1HQPSf6iyfHtfBxvjo8RSMgLWdED/19vUdS/i+yGHQQM
	dheGFzs4uT0LzDnHEwquxCGyJe3wDbcA7yPlnhJBaKCy46KJkQHKYSKD5qeDwq30Sa7CMGcY1Ik
	lJp8Gq59OIf5qMs1JBcbLrNLnE7kEBs6qSEksL7cxB81BEMTj8IgfsGN9T+pMr/z+ZSja/3TF2r
	bBvVKzIP1qEJOHC3SgZ0IxT6/ysx//Wy8RE3nMSst3zA7mMKKzigSQG1MZZVbiXncd8iZR9zf1A
	ayRmEuNwwZf4Zx50vBfaggA27OREZlwaO7p/35zQdhy5AvNz4qpVXdj7pHaXvwaEoY8GA4IvQ0z
	JhFJd2jmRwmoL//GpL6Pm+oLxlpOI5svYIauzp
X-Received: by 2002:a05:7300:c9e:b0:2ba:6b03:909b with SMTP id 5a478bee46e88-2bea558f037mr6495235eec.19.1773676064417;
        Mon, 16 Mar 2026 08:47:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0b1fc876csm9911380eec.29.2026.03.16.08.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:47:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Mar 2026 08:47:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, grant.peltier.jg@renesas.com
Subject: Re: [PATCH 1/2] hwmon/pmbus: (isl68137) Add support for Renesas
 RAA228942 and RAA228943
Message-ID: <35c39de7-773a-4f94-b495-97eb25555a71@roeck-us.net>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260316053541.3903-1-dawei.liu.jy@renesas.com>

On Mon, Mar 16, 2026 at 01:35:40PM +0800, Dawei Liu wrote:
> Both RAA228942 and RAA228943 are digital dual-output
> 16-Phase(X+Y ≤ 16) PWM controllers
> 
> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
> ---
>  Documentation/hwmon/isl68137.rst | 20 ++++++++++++++++++++
>  drivers/hwmon/pmbus/isl68137.c   |  6 ++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/Documentation/hwmon/isl68137.rst b/Documentation/hwmon/isl68137.rst
> index e77f582c2..0ce20d091 100644
> --- a/Documentation/hwmon/isl68137.rst
> +++ b/Documentation/hwmon/isl68137.rst
> @@ -394,6 +394,26 @@ Supported chips:
>  
>        Provided by Renesas upon request and NDA
>  
> +  * Renesas RAA228942
> +
> +    Prefix: 'raa228942'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +      Provided by Renesas upon request and NDA
> +
> +  * Renesas RAA228943
> +
> +    Prefix: 'raa228943'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +      Provided by Renesas upon request and NDA
> +
>    * Renesas RAA229001
>  
>      Prefix: 'raa229001'
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> index 78cff9712..da2484d42 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -63,6 +63,8 @@ enum chips {
>  	raa228228,
>  	raa228244,
>  	raa228246,
> +	raa228942,
> +	raa228943,

AI:

  Is it necessary to add these entries to enum chips?
  Looking at the rest of the driver, this enum does not appear to be used
  anywhere. The device data mapping seems to rely on the variants enum
  (e.g., raa_dmpvr2_2rail_nontc) instead.

It has a point. 

Guenter

>  	raa229001,
>  	raa229004,
>  	raa229141,
> @@ -478,6 +480,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
>  	{"raa228228", raa_dmpvr2_2rail_nontc},
>  	{"raa228244", raa_dmpvr2_2rail_nontc},
>  	{"raa228246", raa_dmpvr2_2rail_nontc},
> +	{"raa228942", raa_dmpvr2_2rail_nontc},
> +	{"raa228943", raa_dmpvr2_2rail_nontc},
>  	{"raa229001", raa_dmpvr2_2rail},
>  	{"raa229004", raa_dmpvr2_2rail},
>  	{"raa229141", raa_dmpvr2_2rail_pmbus},
> @@ -529,6 +533,8 @@ static const struct of_device_id isl68137_of_match[] = {
>  	{ .compatible = "renesas,raa228228", .data = (void *)raa_dmpvr2_2rail_nontc },
>  	{ .compatible = "renesas,raa228244", .data = (void *)raa_dmpvr2_2rail_nontc },
>  	{ .compatible = "renesas,raa228246", .data = (void *)raa_dmpvr2_2rail_nontc },
> +	{ .compatible = "renesas,raa228942", .data = (void *)raa_dmpvr2_2rail_nontc },
> +	{ .compatible = "renesas,raa228943", .data = (void *)raa_dmpvr2_2rail_nontc },
>  	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
>  	{ .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
>  	{ .compatible = "renesas,raa229621", .data = (void *)raa_dmpvr2_2rail },
