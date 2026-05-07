Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4DB441032
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778182752; cv=none; b=WLv0ULAmqWSaX8t49e/qeGr2Z/QNoBCE/XB734yoP7AEdR0lSNmKpnyC2sDAn6EuV7ML57xZ0qDYQdg17V4A/N20vUcP4/J540KgW0mPLZMDHk7V/P6oxwfwVw0/qnRpVFJdxxUipdlCB2LSODcc8iHjTddLUWRo1wkVOBXSbQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778182752; c=relaxed/simple;
	bh=jKnGNKLqkB8e0df/XKOKodfYrWmIj9cCVvEjPQpZrkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUc7SpeE+Reol+oJuH7n4OVQ2ntoclnEMRJIjV/IZjybK+U5mpHPK0wtrz2+xCISDuDrvujhSLUWLgkcJleh8ic5TwPbXkhGJ3fvq8LG1A7mUmdCR1Ihewvsff3lZfwQEgWivZhwGyiQ/m19Iyo5TMLXH3RlGD0s7pjmIfhoXAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CspOxCzI; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CspOxCzI"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bba0dde4f43so177155466b.3
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 12:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778182749; x=1778787549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HtUJyWhJ561fYSVag2QyjsbPKhV41JyyzBoUWpnRnL0=;
        b=CspOxCzIqfROLf+4CckaCs5hMw3yebEWWKkwREfo/8CzFRLP6/EMaVHyvXWHv2JkQ0
         wFjsyX0WqYdCOdpuQeAHg5oO1p9+wJd9bv8aL/8z0DdCA79ET8YEASxuKGGnYIzQutDP
         iNGgLC+au7l+P42D5SHkjuxez8eSXoNUGk9gQh4p0EWdfPlEtXKFOxPmKNGAj2zJQUTB
         74YXUPABMCj2b2KjwbBGW/OJzPtu9NRzL+2qEent+58w2XMvSvFf+PBhUwDPFI4USwd5
         MsoI2k0Q6rvMK/2Gsb7kCI+bNaelvHUkUzAlfzlW4bEoNqteFqtiNnTXJGKnWAA/FJsB
         jQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778182749; x=1778787549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtUJyWhJ561fYSVag2QyjsbPKhV41JyyzBoUWpnRnL0=;
        b=LCGMFb4NhjNm8YgAj5u1S6ECNmUfT6l0/cn77rpy7xsGCSWt3gpB3OcU9YxsUxHRyz
         FJ4Ua4RT/RmAapEjOhxf3xNv8zu3Kfuz7ZlP2L+jmZsqtvO4peFkbEEk1xVYS9/DrYB3
         TYEPc+dHbqKXasqiCNSDadV0DHHO+9kQu+XlhASg0hK6Vta/cBy8WWgBBBMA6jovgkYU
         YCnDcMBj2Cnxg97oxBHyeKid8IbkhXC5QPY06NNMxjMi2jCiIP6UKguTYYgBv1QgLrkf
         ciY2G/R2Ttm1IbWeZl8M56qkIdTndWmabXlSCvqQ7ywif8T8fdDUgGFuJstsLaBH50Ef
         RoOw==
X-Forwarded-Encrypted: i=1; AFNElJ+TIw/mN8qCtu6yojwMNUC621gNu3sxwDHjsQkFyyFZS3J5QhwER4WlGcop/8n4AImkRkA5c2yscfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaiTXcR6/NC3dHYnxBvOYlg9tqLj79covnHyfWNmxBKGTeq5jH
	cAa0Jafp2zLEXb+NZ8djUsJ2AELP4myxEo5bCHr0X4Gcfymqro8JJgXE
X-Gm-Gg: AeBDieuKSGl8OhD7CNXsn0b6//aSCOeS0Xa5MLx4g9EqYoQ7Pmm3HPaRRQfqB7HuugA
	bnb9DriQnLpoNVcRYGmq7fGF4HF7CAVlpnrdcM4K8b2QNHzscandlw8akbTzZnL27hZAVQ6vSJE
	7OU8hwc8FP2osdXGcwID67nz4H6a7BgJUTVbZ0Oe8Nui6XjycRCR35SUD6/mtyD1PtfJG4bdUkB
	pmWacuxgOQouF3N2Ni5JXoGHq6oScoNR1yuugMLdkkf/JxQid7Jkv08vnVgkIgwco3QJYSCP6LH
	XPgBv++Z5/XvI5ROMCSu8XLN51cYvljAeH7Rdni3j2AQ9LS6W+89iav0JshVeN+Xmg6tRxjnYlw
	JZsEwiTRNBMWtxYJT/frcNpxPRxj620K5nTsV5T1lyUWga6HOuJLnZhBP+6QigRzt4w5R+BRM3j
	xqxWAkkMJnmqqxBKdFNGOqAmOgjMEQAitKLOHo2BPYNaAHYg==
X-Received: by 2002:a17:906:6a26:b0:b9d:e301:20db with SMTP id a640c23a62f3a-bc56e316a92mr576277166b.25.1778182748538;
        Thu, 07 May 2026 12:39:08 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca578b332fsm20347966b.33.2026.05.07.12.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 12:39:07 -0700 (PDT)
Message-ID: <80d85385-f5af-44e3-b9ed-d4489542d4da@gmail.com>
Date: Thu, 7 May 2026 21:39:05 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] leds: flash: add support for Samsung S2M series
 PMIC flash LED device
To: Lee Jones <lee@kernel.org>, Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Nam Tran <trannamatk@gmail.com>, =?UTF-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?=
 <kernel@lvkasz.us>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
 <20260424-s2mu005-pmic-v5-7-fcbc9da5a004@disroot.org>
 <20260507164654.GS305027@google.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20260507164654.GS305027@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lee,

On 5/7/26 6:46 PM, Lee Jones wrote:
> On Fri, 24 Apr 2026, Kaustabh Chakraborty wrote:
> 
>> Add support for flash LEDs in certain Samsung S2M series PMICs.
>> The device has two channels for LEDs, typically for the back and front
>> cameras in mobile devices. Both channels can be independently
>> controlled, and can be operated in torch or flash modes.
>>
>> The driver includes initial support for the S2MU005 PMIC flash LEDs.
>>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>   drivers/leds/flash/Kconfig          |  12 ++
>>   drivers/leds/flash/Makefile         |   1 +
>>   drivers/leds/flash/leds-s2m-flash.c | 358 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 371 insertions(+)
>>
>> diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
>> index 5e08102a67841..be62e05277429 100644
>> --- a/drivers/leds/flash/Kconfig
>> +++ b/drivers/leds/flash/Kconfig
>> @@ -114,6 +114,18 @@ config LEDS_RT8515
>>   	  To compile this driver as a module, choose M here: the module
>>   	  will be called leds-rt8515.
>>   
>> +config LEDS_S2M_FLASH
>> +	tristate "Samsung S2M series PMICs flash/torch LED support"
>> +	depends on LEDS_CLASS
>> +	depends on MFD_SEC_CORE
>> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> 
> The `|| !V4L2_FLASH_LED_CLASS` part of this dependency makes it
> unconditionally true. Was this intended? Perhaps this dependency can be
> removed entirely.
This is for a reason to allow building the driver if
V4L2_FLASH_LED_CLASS is turned off, or build it as a module
if V4L2_FLASH_LED_CLASS=m. You will get nice explanation from
Google AI if you type just
"V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS".

See e.g. [0], which fixes undefined symbol error by adding this.

[0] 
https://git.paulk.fr/projects/linux.git/commit/drivers?h=sunxi/cedrus/jpeg-nv16&id=dbeb02a0bc41b9e9b9c05e460890351efecf1352

-- 
Best regards,
Jacek Anaszewski

