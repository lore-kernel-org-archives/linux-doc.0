Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C71371893
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619315; cv=none; b=afYJ36ESY2UCCS2QPUV7p9+Lr5bGR4PV4VaeDzIZWdav/BiSL4w1PIufuimv2Q0AhCLBbCjelrcof/DVLEbrf4xdN1g2zZFW4UQClUdkEoYiXtfLmcHxrGbBC+PMLoUQpYGDscR/INf/bXEsnLBKNxywBuD+j3bZt3mk9Ti4VZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619315; c=relaxed/simple;
	bh=nDJmMRWkeOLbn2goHXAjdy5C4LSHSDrkIV++R3Eijtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hDPdrJS3rHf9T0n3z7F+K5i+U9BNfvgpHxBA+aG8meIj0uHqDASTMWgiqJ11kg5cja/P3HAUIflR9blvBto1uDmAewSCIdCizdcZijW3cKk/RfqguhYKcgIrgOsMaxbZdn0nXTI7jgTLX+pY+rUuHQMIed4ynqkZka6Qg3ix9Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9YbMax9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9YbMax9"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c132ac5ec2so46050915ad.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 07:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781619313; x=1782224113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=27t8qhcnA1Ic/MPJoY1rquIFKqlth0zmgwRxjvyFCMA=;
        b=f9YbMax986SsEtGo5/hhRgq8niTpEqSRkK/7mvJ8a28MIDTlnzSc1pcjKvVXwZEvph
         2GR1eB9DDEGKcEchygrxRkwPS2ugBr4ChW3/Keq/BWWxRDnGFsQjDLk+rlBD4j43MHbg
         8TNN35H7HEs4SBd3JHzVVTBL6zt1C26djUkAlCdReu/sXvcGvD0V7veyU4nH1y43wTkM
         DNhRlmCwwV4Dzj9Ra4kxdenLAwiRbTszUULrhH5LQx5uIy7xPcZ1frBeStLqEhWQKVv0
         RxTtiBGHMcZPJtehWOq1mBpXXy5/SP4SpcDstgw8DvKwaqqzzzwhBu7SYvv2N+xjRlV7
         yHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781619313; x=1782224113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27t8qhcnA1Ic/MPJoY1rquIFKqlth0zmgwRxjvyFCMA=;
        b=H87uRFo2GA1Vyt74AH/BVc1r45yA0Ia3XpdxlNrc0V8E/nAAvFexH+MqR6EALw4B/C
         2tC5Hbt5KNBgLo9JO4G27OjDm7OCb860noqlUZhY6jyVX99tQcoTZ8wYcV/Ehda46EAb
         JwUgLZCUAv1VfM0Acd3He6nRaLcGl0zFW74aU0ZSuzPAJwu6CXmVUUaMv4oNJM45ejGA
         1PC5hnW9MIrKDi1/rM0OvvFkCNRRj5qGo1fx/ec8SD1cL8IrKvyR0s0FbREKlp/5cItt
         yYm4fnsYOgIdvqzxWv5DhlUvKA/qrncFGAAO7TLfa/wV97MFKPBuSLZt9m1IixFZJ4x1
         Ln7A==
X-Forwarded-Encrypted: i=1; AFNElJ+obr1Kbm2DdCIPLts4r95JK6TIlVMVwZNZX0Mz1DGDRAwinqN767WPBJtPVi6E4GsxhxfzXWNy9Bg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVKtZ46lutK0wuSesGnrtTEh0Yl2roaMlCKDOdo/Hm5+85JRES
	as6WCkQb9xy28OBrVXtt2nICC32dBjKTmtTdtKxYsP4KrqJRRu16gXJj
X-Gm-Gg: Acq92OHeCMoC1dmc5DZLtVA+jtiUA0874o5r6bEwCg9Jgqp7xr3o0FouBqhpiAe50nr
	GIRRyUHAjdERkeOZr7w/HqbRwzyFhGjvI1C1O5hza0oM5RKky1OPLh2PTxXSb6MvXhgoFdrS+Ce
	d7ahJUBTZu08ljIgi0d8mHwBdAVYIpda4VoluTLZgnjOWWJEbLf+28+DK3+4p0DrB9feSbh8w0i
	WVJKnV6/ZcId9VYUcz49QSrMltoQ1ZKmHFjfo82KDECFUeR0yGj4Z0EtLMJLFP+NPHP3w8D/Z37
	I/jKDoBGVLnkRtXzfj30aoq2pU/ML/P0S9h70lCOV7MHsSzFZa6liVwslgRp478KqTPHG1QYiLR
	Ch87nF9z9pFivfMNr4RjIfQc5CMrrGuJlwviBOH5RWm/yzc7yimI7QrGz8zEpj2EsufehgOtoVC
	jcFexHDJet9VhIw4agpNXOn/WrrzCGHalbnkqQlkOwEcemdXESKSsWSSQQ0ffPE3Oa35TT41T2
X-Received: by 2002:a17:903:1246:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2c664243254mr168453485ad.22.1781619313300;
        Tue, 16 Jun 2026 07:15:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432d86501sm127308945ad.61.2026.06.16.07.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:15:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d66b9de3-db06-4f83-9c2a-b45e341bfc9c@roeck-us.net>
Date: Tue, 16 Jun 2026 07:15:11 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] hwmon: adm1275: Support ROHM BD12790
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Wensheng Wang <wenswang@yeah.net>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 Charles Hsu <hsu.yungteng@gmail.com>, ChiShih Tsai <tomtsai764@gmail.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1781591132.git.mazziesaccount@gmail.com>
 <8ca875d21f2d9a4d53a87b47a5e6efab48266178.1781591132.git.mazziesaccount@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <8ca875d21f2d9a4d53a87b47a5e6efab48266178.1781591132.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 23:44, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Add support for ROHM BD12790 hot-swap controller which is largely
> similar to Analog Devices adm1272.
> 
> The BD12790 uses the same selectable 60V/100V voltage ranges and
> 15mV/30mV current-sense ranges as the ADM1272, and the same VRANGE
> (bit 5) and IRANGE (bit 0) layout in PMON_CONFIG. It therefore uses
> a dedicated coefficient table that mirrors adm1272_coefficients, with
> the following differences derived from BD12790 datasheet Table 1 (p.18):
> - power 60V/30mV: m=17560 (vs. 17561)
> - power 100V/30mV: m=10536 (vs. 10535)
> - temperature: b=31880 (vs. 31871, reflecting T[11:0] = 4.2*T + 3188)
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> 
> ---
> Originally this patch was AI-generated. I did pretty much re-write the
> probe changes by hand, and also fixed some of the coefficient math
> afterwards :/ But yeah, this one was AI "assisted". :)
> 
>   drivers/hwmon/pmbus/Kconfig   |  4 +--
>   drivers/hwmon/pmbus/adm1275.c | 53 +++++++++++++++++++++++++++++------
>   2 files changed, 47 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index b3c27f3b2712..6ebc01e26db3 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -52,8 +52,8 @@ config SENSORS_ADM1275
>   	help
>   	  If you say yes here you get hardware monitoring support for Analog
>   	  Devices ADM1075, ADM1272, ADM1273, ADM1275, ADM1276, ADM1278, ADM1281,
> -	  ADM1293, ADM1294, ROHM BD12780, and SQ24905C Hot-Swap Controller and
> -	  Digital Power Monitors.
> +	  ADM1293, ADM1294, ROHM BD12780, ROHM BD12790, and SQ24905C
> +	  Hot-Swap Controller and Digital Power Monitors.
>   
>   	  This driver can also be built as a module. If so, the module will
>   	  be called adm1275.
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index 838b8827eb76..9e21dd4083e9 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -19,7 +19,7 @@
>   #include "pmbus.h"
>   
>   enum chips { adm1075, adm1272, adm1273, adm1275, adm1276, adm1278, adm1281,
> -	 adm1293, adm1294, bd12780, sq24905c };
> +	 adm1293, adm1294, bd12780, bd12790, sq24905c };
>   
>   #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
>   #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
> @@ -47,8 +47,8 @@ enum chips { adm1075, adm1272, adm1273, adm1275, adm1276, adm1278, adm1281,
>   #define ADM1278_VOUT_EN			BIT(1)
>   
>   #define ADM1278_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN | ADM1278_TSFILT)
> -/* The BD12780 data sheets mark TSFILT bit as reserved. */
> -#define BD12780_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN)
> +/* The BD127x0 data sheets mark TSFILT bit as reserved. */
> +#define BD127X0_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN)

Please don't use such placeholders. Just use BD12780_PMON_DEFCONFIG
for both chips, similar to how the defines for all other chips
are handled.

Thanks,
Guenter

