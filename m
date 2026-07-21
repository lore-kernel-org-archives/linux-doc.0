Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FAF33F585
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 03:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784603296; cv=none; b=lDtEmWU4PgCU7a6qRXZLKfOXaNA28/hfvMd6xuxEh72tK/RaBUSELsPjfLv3Jq2WnO8mBxe76KzGMZwSB9nsRxtj7vLny/z5/ByiUZ+SKJmROK9/leoD916FPgzDjQ/Gn3yhfEEorQNANIgQU2KT3cBRNEwWas6kSUYU00w1eQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784603296; c=relaxed/simple;
	bh=Ne2iuDjiuVXRvnwTMWrVareFyl4DUbiMhJrmz6+Oew4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WdSfJLjtBCiT3EKdNlvOuTNyLcEXawWrX5zNh4KMBUYjls4hK+oB02EnomTZm3eiilnE+bkpkJT2zCsm1QLNQwLhfc3vzO6y8TfEl/De3cEp7QCyFCkT/DYYvexbuGYjTDbWk91pQnv/evqYWsCfBGWgimb0N1qwpQM+LqNz+Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZR7yunx+; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZR7yunx+"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cad8076b01so130145085ad.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 20:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784603295; x=1785208095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8o57jIUac7gEOQAej8Y91pT61byF7IYHrKZJcFBk5RQ=;
        b=ZR7yunx+brW80FHNWNnSxt+3Ludp+M/FXAqlmRRrAZDjZwRS3wQ6fcDFDGFSZw8yGO
         jW45AtDB5P64xjvok5vAbSxjugZMahybrZ+UmA4Uztw/CujFJ5K+/IQ+yvt9fZ/2xeXV
         DM/wx8in5rEqMT23odW23o/4dvF2FVmhVWX9n1ZOQkK5xFVrz1yW6+ZF8wAilR2lCvzY
         azda1qphjTmdE8yCt3064M1JGG23dC7lmAqOxykKB46tStzS/38zjvYldmz4LfdPwn7S
         QljBjU7liJv7wpiTAcizX5rqMrXH3BmNVjfodJvcSvZF/0+Ztu37Seaf1dw0xQLN49k/
         0ezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784603295; x=1785208095;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8o57jIUac7gEOQAej8Y91pT61byF7IYHrKZJcFBk5RQ=;
        b=JWGyomZU9ruFufKhhzrQzH8xTjn4kAIuhxfGlcbvoLm4VTGDRcDjmz1qi2awGjXSNS
         k/7j4QegEqrXRzyPVr9V5RBEfwTGGOws0xO1N24+hpjqUEYT90C2A+z1tqb3fvCXkRla
         sJyVa65aKOGcu8QMrCQZhECzJiEsOjjiwyY2oZITpfIZgPr1zYGQKFXdVrQLDHFkrlZA
         KBzC0gEuALKaOOBSsnWjIGU5t/1VLqbtpHMTsRTYwP/IGELEBYAULWE5pEl9GnoR9SJw
         xEdjWE+0m+wz2VZC/bqgJF/V/S+EhVKgdkPcyRoYE71zqoAkbSxBdo9Rjl4g4eUSmUei
         0l/A==
X-Forwarded-Encrypted: i=1; AHgh+Rqh3aa5BlIKzy66QUHmwCp9H8+rlC5V2B4lmBKRujQCzMLJCyA5m3DoIW7Je7hABAPoUvP5olmKs9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YytW3jAPWv+e/HiBaXSwdkdqsFNIwyOJMY5Ed8/Nk4yoyDNng3Q
	cnJlKK7URJ9+FpI3+h8ke45EOai6dIm69+2sPGHowj0LiZH0eLJS4NMj
X-Gm-Gg: AR+sD105GJGQFpTR/WfCaKajRgWHqTu2qQdbZnKGM8uG2gWpcJ6LrS3uqch3YlupIt4
	pj/wva0pKKwayMujqKCplJmXGMaSH6C0VOiVr+P0rLLtqLXSpgD2GMt0KRx+CdIolYGvq8Auo4H
	SHmdj1QIXEuMqvYECagvZNO8xWsl3DDwxUtTjkqGzQyKs9IRxFLrUSN4yRYkwnV9P/hNxwenTuY
	xHrmlV5cHu/pzc5fxaqGCkzoETSoPp6KOen5V+/tWC30ARGwgYtv24bqF/w8ghiz9m0sfQLnbJA
	SMzbvxGFHgPS6PoNj+IpRVcVpDMzXoH4lW7JKf0F2bT10OXwuaSTCG/YKdF3nPNu4rpy+j6djiK
	xNa+EZHxuJALTRJh2WHBMdZ15TPtEJTuAH6b/irbqFGxJ404y9z/Y6wauW7Vlp2JNA2m67eKD2U
	WzFFoJ3JGuRh9p/1r8X2KTKBVYG/OPkUO/edGe4IdR8cnVq+0Lnf8=
X-Received: by 2002:a17:903:26c4:b0:2cc:f1e7:18c6 with SMTP id d9443c01a7336-2cf34821a56mr179306445ad.2.1784603294818;
        Mon, 20 Jul 2026 20:08:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3471557bsm66118425ad.58.2026.07.20.20.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 20:08:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2c99fa33-515b-46f7-b2b8-b7a2b9dcbd84@roeck-us.net>
Date: Mon, 20 Jul 2026 20:08:12 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
To: tze.yee.ng@altera.com, Dinh Nguyen <dinguyen@kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <cover.1784599864.git.tze.yee.ng@altera.com>
 <c8f4fbc1d8c3b1d161c94f66feb2ebbc038dab6d.1784599864.git.tze.yee.ng@altera.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <c8f4fbc1d8c3b1d161c94f66feb2ebbc038dab6d.1784599864.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/26 19:18, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Add a hardware monitor driver for Altera SoC FPGA devices using the
> Stratix 10 service layer. Sensor channels are selected based on the
> service layer compatible string.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---
...
> +
> +static int socfpga_hwmon_sync_read(struct device *dev,
> +				   enum hwmon_sensor_types type,
> +				   struct stratix10_svc_client_msg *msg)
> +{
> +	struct socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	reinit_completion(&priv->completion);
> +
> +	if (type == hwmon_temp)
> +		priv->client.receive_cb = socfpga_hwmon_readtemp_cb;
> +	else
> +		priv->client.receive_cb = socfpga_hwmon_readvolt_cb;
> +
> +	ret = stratix10_svc_send(priv->chan, msg);
> +	if (ret < 0)
> +		goto status_done;
> +
> +	ret = wait_for_completion_timeout(&priv->completion, HWMON_TIMEOUT);
> +	if (!ret) {
> +		dev_err(priv->client.dev, "timeout waiting for SMC call\n");
> +		/*
> +		 * stratix10_svc_done() stops the worker but does not flush
> +		 * svc_fifo. Wait for the outstanding callback before stopping
> +		 * so a leftover request cannot complete a later sensor read.
> +		 * Discard the late result and still report -ETIMEDOUT.
> +		 */
> +		wait_for_completion(&priv->completion);

Just like Sashiko, I am puzzled and do not understand this code.

Guenter

