Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869021E32A6
	for <linux-doc@vger.kernel.org>; Fri,  8 Nov 2024 11:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731064126; cv=none; b=aWnXcanHUqbH0KfDgCpKqSAMb8T+HH9BqSjvTWNXBTPrVb8R4sr9LWOreQwddixceS7DG1YTuD5Em6vTLDPm0gHyWBCruFlyH60FsgPeXZfG+MB3YtW09lKZvJTSqKRCK3XYy9NjZIpgTOv5yUaKj29nPGxjrO3WcIbU14/2I4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731064126; c=relaxed/simple;
	bh=x2rWF8xSiioHF52bAADo4nEdsFYbxG0f5o7nh2o6zwE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=fGtKLOrFqU3YSUV8eApV0F7GmVQ39OPoDjmjSLebclOztLwNjEDsiYaqvyCKR0lU9XkF/+T4iRvRbFmPPXbaLjiA3LEaHAPt4ILPXO1qBap2CSUBfjwwYLczO0gNP/jFXU5FrHZFBf8moHF+5I1yiQKEyolCAdFUHXkDFoZghhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qB7OWp97; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qB7OWp97"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315b957ae8so1050295e9.1
        for <linux-doc@vger.kernel.org>; Fri, 08 Nov 2024 03:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731064123; x=1731668923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YL1Rgp45aNCeqluD7CNTr/BqOhZWdGker07rC0pXvB4=;
        b=qB7OWp973bBEvABqMWK5oPjPRqRAal+klKe3AZJsVVilMczGOEOPDXYrt4G60Rddo8
         n3RXeKK2Dkq475yzCABiuQCfxl4XionCd3pOtdViMj99+5QbzWFCOH+7Obbf+I9ff6YZ
         5ByIyObBLuSE57FvZsYFxItWmJkpP4knbkOmc/EPkHCaUFN3KpwDHx3X64zj8KaSiF3c
         oQwBPaNGUYwboJOIfE0SUpUvdguGfyGoWsuAiFRtQAxL7jchs+VHTDz+f3ypJCJTdCGp
         pql4ZrtHADplOakKrY1dp18mD8r9KO0cr/Yo0DHfVv68v2Dr8srV8BkFrfRP6tD5huEb
         w1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731064123; x=1731668923;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YL1Rgp45aNCeqluD7CNTr/BqOhZWdGker07rC0pXvB4=;
        b=i5Icx6ix+qrY2Nb4RvL0+92fM+G0CvnXW8rDxEQIZ9PATrwnytEYAZ0vglyT+N0e/2
         trZeJ1ikwo6ijZ2bYr/1H12IKfcKoNuKecgPW0h48EFhvCcTx/5pwENHwzfhBb235qgQ
         LjRgGQGjGE38JZYPQ+J278KY7okXJH4DRl8kyu6apzmauJHkMQpzDRrsts/iQL4ho2n9
         hZ8a2TMwCn2iF0PcayU3EJJWo26H29/BKMutpG0K4VDI/rpzYa30PycYzG5GsKchpuT/
         ZArHZ1XYn/4W2B2JF+rJtflizHN0wj7/jcc1iQSeoSw12SvNG7VNqE2P9hSmflyghzqb
         EMhg==
X-Forwarded-Encrypted: i=1; AJvYcCV46Ve3b2v/RIjL6lG7Xdvx1UCS9y7kkc2pmNM5r8tvKiTX4An/Cjovfh5bSG8uZ7jlauUn9pHMdVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL5V5yU7l8fOmOK75cWqARRe52xJsC8as9zhziTdTWu/raspNv
	t38Jd5hWBu/pPyKsL1CYquFMpCrQgwyxLub93rx1oWZrLVtZG9/5r1JE2Dzl7jI=
X-Google-Smtp-Source: AGHT+IGj3BOQZ14AiQY13aS/5gS5f1lxEfbLYLKCMVX8PhMYJaBS9XktQAJj1VkL3pEbWfTw7n9xKw==
X-Received: by 2002:a05:600c:4e90:b0:42c:ba6c:d9b1 with SMTP id 5b1f17b1804b1-432b77fde6emr7620575e9.4.1731064122872;
        Fri, 08 Nov 2024 03:08:42 -0800 (PST)
Received: from [172.16.24.83] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa70a234sm97153065e9.34.2024.11.08.03.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 03:08:42 -0800 (PST)
Message-ID: <c50d36ca-2268-4149-8bf0-c44fc1786d9c@linaro.org>
Date: Fri, 8 Nov 2024 12:08:41 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Yoshihiro Furudera <fj5100bi@fujitsu.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241108054006.2550856-1-fj5100bi@fujitsu.com>
 <20241108054006.2550856-2-fj5100bi@fujitsu.com>
 <f66a649a-60dc-44ba-b8b0-b049c9e357fb@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <f66a649a-60dc-44ba-b8b0-b049c9e357fb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/11/2024 12:03, Krzysztof Kozlowski wrote:
> On 08/11/2024 06:40, Yoshihiro Furudera wrote:
>> This adds a new dynamic PMU to the Perf Events framework to program and
>> control the Uncore MAC PMUs in Fujitsu chips.
>>
>> This driver was created with reference to drivers/perf/qcom_l3_pmu.c.

This confused me...

>>  CONFIG_ARM_SPE_PMU=m
>> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
>> index bab8ba64162f..4705c605e286 100644
>> --- a/drivers/perf/Kconfig
>> +++ b/drivers/perf/Kconfig
>> @@ -178,6 +178,15 @@ config FSL_IMX9_DDR_PMU
>>  	 can give information about memory throughput and other related
>>  	 events.
>>  
>> +config FUJITSU_MAC_PMU
>> +	bool "Fujitsu Uncore MAC PMU"
>> +	depends on (ARM64 && ACPI) || (COMPILE_TEST && 64BIT)
> 
> Missing depends on specific ARCH.
> 
> Sorry, this looks like work for some out of tree arch support. I don't
> think we have any interest in taking it... unless it is part of bigger
> patchset/work? If so, then provide *lore* link to relevant patchset.
> 

-ENOTENOUGHCOFFEE, I see now ACPI dependency so there will be no SoC
folks for this, right?  Then anyway split work per subsystem and send
defconfig to Soc maintainers.

Best regards,
Krzysztof

