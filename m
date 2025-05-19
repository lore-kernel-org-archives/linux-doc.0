Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0241E267F51
	for <linux-doc@vger.kernel.org>; Mon, 19 May 2025 08:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642618; cv=none; b=J1BRuOYRfYPZlr3BY5ebFENnD16KAdRo/TCmmwLc0l89Ikozrj/W4WgYaU42MjhoPpbMlQeZ/dTc4yDp92+4CqxO9DQfcWZ8zFj8jqCF+y7uCxuO0Fz0vv/NnCCmw3xGsBuWjBQni/ckdBI9Xc8R84+sh5M1feLE/ihWvRbC3rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642618; c=relaxed/simple;
	bh=H8ajxtmiTCjvOOIE2ApRVZ9momS0HTXG8Sy481IZrjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjIGU1u8RxfHoeFDPYl6UzRZ+oXGBEpNdu2ddy6qmqHBKY00LYbI1TnJjWU+f0Z9yDovg8j9+FoC784Ekvbfc2DOf/GikXLT7H/a/wkkUK9eT8xIWMvPoIb/xIdzh6mxO+86IqZ5ky5nZnWtN3nLS1Z1otOyzGPHQ69V33W3eoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gXTWb3m8; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gXTWb3m8"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so906758f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 19 May 2025 01:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747642613; x=1748247413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUL9QUi3QxO33JzaB+qq5zCH3BOr2BvD/SOLCCy++Kg=;
        b=gXTWb3m8+DxkSvlQoHuyrSofaHzPX8tzwlt/5WgQBGDt5+d62bx8K8mj/CrvtM9sPP
         jy7W31BGaYKqb154FVdEFfftsbIkqflvvNc5u3Oc3FismUyCV4mRYpdaRtyNRnMUwZdw
         VKUUw97RPtCJxnfH77GTmGOuS1lPCwBvnDtcKR9xQmOlhAyaQtzx2P7WBV42zyAAopC1
         /6yzmiVKgTHciw3diIb0lczJUqukmRU3HvU5F4AZVG6VpvXqGc3/uSkZVrLp/K3yEmYr
         LHxoKcpJOstyiUysxdbvuI1j4j9JOAotrMzUxhh7BbqOfMANVldNmlSG9k8xn0wMV7L9
         +9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642613; x=1748247413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUL9QUi3QxO33JzaB+qq5zCH3BOr2BvD/SOLCCy++Kg=;
        b=UUw52qO18dhHMgjcjIKMFUwfopZfnH5aBmLNjM/JhoWDFHRyhNW/5cQLq57uB6DUqk
         D234jzurX3ggmysD7NDJw4T0E/+pVGf3js9jd+FeDi/P0sLpvumOE51hXnaMOk/7axn8
         Psmc2IseD1tvKfkBBkw3xc8CAFRQY5U2GjEdurRRWuKLJ1hd6u4IJwL8zAxQ+iSMlGr2
         03FCqd1EQwBlwYMe4kW3NPxPDvjPCBTI6adb6nyh5IFnX865j3MXPLisTfa/WYWKnpjC
         FXWSvWLRkVoWmPkPtJ+hH2x5YO/1vfVu19/ALvAfYmEu1YEHPA2Nf9kGcc0IhIkmaXVS
         HsIA==
X-Forwarded-Encrypted: i=1; AJvYcCVXiCgHNkKw7i6UP/vvgI6kUwIv0PINQqZAGQTL5Tv7P4u0NImVJ95uEB0vdfl3n1JWbcLsEjbHE5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV/m/JwwGDcx8lhBeuzGJp059w8RX5eXaQBV5a1d96dBDFMc4H
	LvcucZXGn78tPkO0FTPgnzTrHezwA0se0aya9njZm2LFgQjp/6X0ftoa9cS36iJKYHc=
X-Gm-Gg: ASbGncvO/oSr1vO/NEpa4c6P4KkNhFMXIdq1Pnw5QCeDfUXIP0X1fobRIO4sPkGpKKf
	6JI8QqcMA6JE5X06Ms2Dor9DzY7Brbn9XpUafGgTPjq3FInyCMWK3c65QXm5jX2fuFUSGw7lKHI
	BN4knlqHLvBtZEhJz6cJYaGWvmAMUewwQaz0gnYyaXi0gWFGn64NuYamXOF2Ae2pk45poFsqxAH
	GdeNzBPSO/sRi7dA4ah+M8BpKlw6as2HywydtibOfzmk2lYU06sMn2gdKHizukBV1Cjh3WukQ5w
	JtP7VcCt6Db/NpRDmcqbnMT0U6CL2aZ2ePEx8OMOLiFirkNqwXNCaj1u
X-Google-Smtp-Source: AGHT+IHSO1KA4bNQxfQbc4te6baDy9fxE6Gyb6malS9UHm7L4qyXIFr1J9YNRKOGPiR0u203LvVC6Q==
X-Received: by 2002:a05:6000:2911:b0:3a3:6bc1:f1e7 with SMTP id ffacd0b85a97d-3a36bc1f466mr3082730f8f.52.1747642613267;
        Mon, 19 May 2025 01:16:53 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4a0a5dsm132048605e9.0.2025.05.19.01.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:16:52 -0700 (PDT)
Message-ID: <8518b861-326d-472f-b6ff-3cda41517587@linaro.org>
Date: Mon, 19 May 2025 09:16:50 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] arm64: sysreg: Add new PMSIDR_EL1 and PMSFCR_EL1
 fields
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
 <20250506-james-perf-feat_spe_eft-v1-1-dd480e8e4851@linaro.org>
 <8634d4fwnb.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <8634d4fwnb.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/05/2025 3:38 pm, Marc Zyngier wrote:
> On Tue, 06 May 2025 12:41:33 +0100,
> James Clark <james.clark@linaro.org> wrote:
>>
>> Add new fields and registers that are introduced for the features
>> FEAT_SPE_CRR (call return records), FEAT_SPE_EFT (extended filtering),
>> FEAT_SPE_FPF (floating point flag), FEAT_SPE_FDS (data source
>> filtering), FEAT_SPE_ALTCLK and FEAT_SPE_SME.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   arch/arm64/tools/sysreg | 26 ++++++++++++++++++++++----
>>   1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
>> index bdf044c5d11b..80d57c83a5f5 100644
>> --- a/arch/arm64/tools/sysreg
>> +++ b/arch/arm64/tools/sysreg
>> @@ -2205,11 +2205,20 @@ Field	0	RND
>>   EndSysreg
>>   
>>   Sysreg	PMSFCR_EL1	3	0	9	9	4
>> -Res0	63:19
>> +Res0	63:53
>> +Field	52	SIMDm
>> +Field	51	FPm
>> +Field	50	STm
>> +Field	49	LDm
>> +Field	48	Bm
>> +Res0	47:21
>> +Field	20	SIMD
>> +Field	19	FP
>>   Field	18	ST
>>   Field	17	LD
>>   Field	16	B
>> -Res0	15:4
>> +Res0	15:5
>> +Field	4	FDS
>>   Field	3	FnE
>>   Field	2	FL
>>   Field	1	FT
>> @@ -2226,7 +2235,12 @@ Field	15:0	MINLAT
>>   EndSysreg
>>   
>>   Sysreg	PMSIDR_EL1	3	0	9	9	7
>> -Res0	63:25
>> +Res0	63:33
>> +Field	32	SME
>> +Field	31:28	ALTCLK
>> +Field	27	FPF
>> +Field	26	EFT
>> +Field	25	CRR
> 
> These are described as enumerations in the JSON file (see [1]).
> 
> 	M.
> 
> [1] https://lore.kernel.org/all/20250506164348.346001-7-maz@kernel.org
> 

So they are. I'll take your commit and double check the other new ones 
against the json.

Thanks
James

