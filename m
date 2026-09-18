Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FA74F0523
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 15:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743725; cv=none; b=iZU6h9S7mwOx6+JnFfuj2Qh9mbN064GkOV0AG3XNZ41JcsbC4h+lPB0ngjsMD4kYnW9rMjyoxuWaf/Fgla/beoZiG8oKzWHWW4c3kKdGln2GUt/YqKb0EHvgcVGm1ychrMRmoQyZtnvamEXXH9+9cIyk7pQC2avui/4M7BZAvuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743725; c=relaxed/simple;
	bh=JBX9sjk5h5aKyEfjTf+HGrmLEC5fsig/TxkkPbQjqYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5bRLwgu8RkRTMDokxDpeXmhvOvNo7rcasR+l+qJpb9Pcrwn7XXnPub2Wq2swWuJqeHzUdozEj3KK8YcFaZQPEGrW5p6oIGsHky32T5t5MGhYcrzXvX07YFpGQutfp/3OEkcZTDgbNnJ+P77nQseWe9HkA9rPc4cEakJC/rzNhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZ/FGOlR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZ/FGOlR"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so6066035ad.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 08:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789743723; x=1790348523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSuAPMHh3HdKINu4DnR6P6a9C3K3MaRkYohJsQ48pe8=;
        b=UZ/FGOlRFVZaNC4UBxwEB+20L33f/oSRiJKRjI5tGxFLB3dmpCbP7s3lZkMvfWGhVl
         v33lVrNhLu9chm2FlmBeYonObSYIm6FVsuH1n5ESiHdtJCBRtAIndUhlMKsxxaNNIaMn
         f/dFhWeO2n21/ehlIdl8WklNN81pxW8nYEIDeyexuHvv0u/F7a9orNQj4/ST321DMdYh
         rba271dlQdmwMXv3RLA4hjr//VwYvlZNiLhc0ZIjqTWiqMVaLXFOJqgeLAAIJMWAm5e4
         gl1UsmnU6lCA2+Q2+M5yWpc+FAxOtcbhNhd/NQSKQ3EIrS8IT8QmV0uBv/nmdkX0Eabo
         Cq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743723; x=1790348523;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fSuAPMHh3HdKINu4DnR6P6a9C3K3MaRkYohJsQ48pe8=;
        b=WF1aV4XN+jLkOy5goOHXdOb/7YZYvlol/ueqvnScleplQYMYVOnf2AK2aNtc7QzQvs
         z+4ZsDPFbhI6CCvktVDxx+kHDSSEhlmpDaXqdGqm6BPJtPBlYmnf7HVmXA/Vfm9e5pQz
         js5uljKvhWB4KzgBLtXRj9wXCgkwvv7ofAxE6bAh8ivN5aUVc/WcdFehYl815+iY2qeF
         NMlNQAcDidRz4FNm8/3Sn/kdsSnZQ8mB3Fg+H2xLkh5Ci2MBOWE486iSiIEUSvLSWhqp
         EPn2qvFaeU+74TlJ/TX4RxHjakURXMvqzTNZ4R9oArs3runQP4QZYL5mRy1LnCfLCiTb
         i09Q==
X-Forwarded-Encrypted: i=1; AKwUvByE/PNkG7pFrKKLWnmGosl0yP0Ktam6iWDMxtbVlyMWLMF4XxSrBAZcKNxQvDT3FNcoVAGBstxQ3w8=@vger.kernel.org
X-Gm-Message-State: AFuF++mBR1hrkd6EeCbCvzHJgRx6yhC+jnG9IREBQ6AP4qcwFolaYFRv
	P2tTt0i/2CA4hyiogeLBzUvE+jMSIzN+4iNAXJASXTJNXdhSXwwA6gZx
X-Gm-Gg: AYBFou37O8C1S4VsB9owE5w9Q0yW3n7P2jsN6i5ObaS19DMTSDh5NyUHqV/YZw6vJpH
	+S+hEkw5V69q2L7ixclyrnPgeAgxHXlVrkrkaPvCGpkvT0XeHE5tk0xHRF8OWQLSK2N59cEo/Bi
	Tov740srhEuC3zAsopR9Ewp6QW/5lpfeW23mUJDJiJlQjDncLJjL0Zch4TSA9alszJ9supSairC
	zP5s2xAeL9k7xhpHsVaKqBqw+Qh5pmmNGYha9idYsZ7D+GZw1lwdZ1aAjdpzc4qdAfdsAoJ/9vx
	65zN1jFjKNmbDFRDyp0h5c4LPlFysnt80tXLvuNmIgWlIE35OH3JFKF8YMgFNVzqPUmqDJPXQrt
	80xcGnaceDxbJ5GhTLZPqMI3VyDEwsw3iTSdRfEGIpkhsE07BQgHhiOYsbEVTTWqk6fHWMT0qTV
	Njtw0cUyDq8go94lVSaoTrcGN3/f9yAHXvYaQfZS58Ur/Ppen27nY1Is1lDZN4Dotl5msR9Vo6d
	xFzTvVxC6r7AcKUVWi+znSnDVsTi8mLiuY+3x4e0Drr8GIyNNnlqC8uk2M=
X-Received: by 2002:a17:903:1103:b0:2dd:ad7d:72e1 with SMTP id d9443c01a7336-2ddad7d753amr51964175ad.24.1789743722329;
        Fri, 18 Sep 2026 08:02:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb73dad31sm10106105ad.11.2026.09.18.08.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 08:02:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c58dbf68-d94d-4116-afa6-ff2792d677a1@roeck-us.net>
Date: Fri, 18 Sep 2026 08:02:00 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hwmon: (lm75) Add support for Nuvoton NCT7715
To: hsyemail2@gmail.com, linux-hwmon@vger.kernel.org
Cc: Sheng-Yuan Huang <syhuang3@nuvoton.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260918084042.19541-1-syhuang3@nuvoton.com>
 <20260918084042.19541-3-syhuang3@nuvoton.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260918084042.19541-3-syhuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 01:40, hsyemail2@gmail.com wrote:
> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> 
> The Nuvoton NCT7715 is compatible with the LM75 temperature and
> limit register layout. Its 16-bit configuration register shares the
> TMP112 configuration layout.
> 
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>


For my reference (waiting for DT patch approval):

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

> ---
> v4:
> - Correct NCT7715 conversion-rate initialization during probe.
> 
> v3:
> - Reuse the existing TMP112 handling for NCT7715 configuration,
>    update intervals, and alarms.
> 
> v2:
> - Use the standard SMBus word representation for the NCT7715
>    configuration register, removing the NCT7715-specific byte swapping
>    and updating its configuration masks accordingly.
> 
>   Documentation/hwmon/lm75.rst |  6 ++++++
>   drivers/hwmon/lm75.c         | 18 ++++++++++++++++++
>   2 files changed, 24 insertions(+)
> 
> diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
> index ca46754e028b..fac0b8f29ddc 100644
> --- a/Documentation/hwmon/lm75.rst
> +++ b/Documentation/hwmon/lm75.rst
> @@ -150,6 +150,12 @@ Supported chips:
>   
>                  https://ams.com/documents/20143/36005/AS6200_DS000449_4-00.pdf
>   
> +  * Nuvoton NCT7715
> +
> +    Prefix: 'nct7715'
> +
> +    Addresses scanned: none
> +
>   Author: Frodo Looijaard <frodol@dds.nl>
>   
>   Description
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 2d2d752aeac9..6b482f688c9f 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -39,6 +39,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
>   	max6626,
>   	max31725,
>   	mcp980x,
> +	nct7715,
>   	p3t1750,
>   	p3t1755,
>   	pct2075,
> @@ -259,6 +260,16 @@ static const struct lm75_params device_params[] = {
>   		.sample_times = (unsigned int []){ 30, 60, 120, 240 },
>   		.resolutions = (u8 []) {9, 10, 11, 12 },
>   	},
> +	[nct7715] = {
> +		.config_reg_16bits = true,
> +		.set_mask = 0x8060,	/* 12-bit mode, 4 samples / second */
> +		.clr_mask = 0xc080,	/* no one-shot mode, clear conversion rate */
> +		.default_resolution = 12,
> +		.default_sample_time = 250,
> +		.num_sample_times = 4,
> +		.sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
> +		.alarm = true,
> +	},
>   	[tmp100] = {
>   		.set_mask = 3 << 5,	/* 12-bit mode */
>   		.clr_mask = 1 << 7,	/* not one-shot mode */
> @@ -417,6 +428,7 @@ static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
>   		if (attr == hwmon_temp_alarm) {
>   			switch (data->kind) {
>   			case as6200:
> +			case nct7715:
>   			case tmp112:
>   				*val = !!(regval & BIT(13)) == !!(regval & BIT(2));
>   				break;
> @@ -486,6 +498,7 @@ static int lm75_update_interval(struct device *dev, long val)
>   		if (data->params->resolutions)
>   			data->resolution = data->params->resolutions[index];
>   		break;
> +	case nct7715:
>   	case tmp112:
>   	case as6200:
>   		err = regmap_update_bits(data->regmap, LM75_REG_CONF,
> @@ -848,6 +861,7 @@ static const struct i2c_device_id lm75_i2c_ids[] = {
>   	{ .name = "max31725", .driver_data = max31725 },
>   	{ .name = "max31726", .driver_data = max31725 },
>   	{ .name = "mcp980x", .driver_data = mcp980x },
> +	{ .name = "nct7715", .driver_data = nct7715 },
>   	{ .name = "p3t1750", .driver_data = p3t1750 },
>   	{ .name = "p3t1755", .driver_data = p3t1755 },
>   	{ .name = "pct2075", .driver_data = pct2075 },
> @@ -972,6 +986,10 @@ static const struct of_device_id lm75_of_match[] = {
>   		.compatible = "nxp,pct2075",
>   		.data = (void *)pct2075
>   	},
> +	{
> +		.compatible = "nuvoton,nct7715",
> +		.data = (void *)nct7715
> +	},
>   	{
>   		.compatible = "st,stds75",
>   		.data = (void *)stds75

