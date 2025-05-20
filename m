Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAEE2417D9
	for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 13:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747322; cv=none; b=komrsia+9GCr/xcAPDMbuoOtkDL7hdeF+ZNs+u5U6DHC/JcSyZBQ+E1cAYv3tZpK8igdekAq/MhcLdpDP9oVinj+wnyI/UUxH0/hWT9fZUt9RQsjV396r0+c+sN8+aq0Bp4KmY7qWD6RKiQT9MsDxZquFv4OMNH/vYT909b6iXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747322; c=relaxed/simple;
	bh=j8nOo9ZgCK2DEIuwn9V867mNRDlvnz48elcUZW9APXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWzAtuGlTVrHHFBWb0G2S44otlZQm3TMY7cZ4jhTHvSlEIjIG+tQ9aLafR2ztwSiloydM89Itql9ZDb/p/nm6uzQCKeGIb5MDifyo0CG0jMseGBUHh4lV7P1diFy9jA3oKShizmjcklS1BZZpofHcma943DR9VvBQxlEVGV5fE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CMVNQD7C; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CMVNQD7C"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf680d351so39731535e9.0
        for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 06:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747747318; x=1748352118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WjE9NuES4ZYHcQwH+LLDtRp5dcXqipSvO8/PRsW1OSk=;
        b=CMVNQD7CcqXZqstPgV5hu3Tyh/qlzlgXJaRwQVofRLuYHL+eN0gdQPZ6pzebRxNk50
         +/m2RvKAo6fTw5DOjQuQwsJDpwXMW+MtPqJucDyJouLKf6rtzFlSEdX+OEAtsZTPgyfp
         HmlfSH1lyWtvimVsxgAQyovNu8CJeqRSmHf3ZXHgyZqVRAUmevJ89RheUwUwlT2TwaFA
         ZXFsYJWd5oSoaBjutWlWZ7Zm3UyAMw7vutP+xcLsYKU6qo/yqZSFEo/t1dnjj7YrJ48s
         rt3/q33j1sXuYXKaRQSFgcQoYwJvXVCN/7cSlALOMGkRXrT6Xl+oGWWWLfMdMN+8bcyO
         5ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747747318; x=1748352118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WjE9NuES4ZYHcQwH+LLDtRp5dcXqipSvO8/PRsW1OSk=;
        b=sP4aeDbxgR0Ome7PPi/OQZw0u+99GqpnR4F38LG9ty1WKek3bZoNU9hY6Gfh+vW3bl
         1ZUfPnmI2TTkqclDwylhTtTv82f2QvXJSHWSKTjbEsx5R65JO4wYGru/QabcfYZv6Zzz
         kQbeFzXySc5X5tVaoQEOn7+1MTN0/WzEgWflwZc6KAzBCgwbVBsMIyUQf+e/bgkMDrT/
         UToz/+zR5UUuvpn3nO/94uMwsOh4BsNPitkFz4Dp1OUEP4n5hXxgHE15V+kzV8Ic/Qo/
         0cOFB0SUGpwn4nE5x74Ap2tzc470drrRzKd3we+3OVjlU1DRAMFwgjJlBQdGcKe+iu8I
         PPlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1LtEhWg6HTKAGZ2ETAbchB4gsLzTbdMe5ZIkCoWnWGVolgJEi7b9hYiSBzkQtbT8b7NV4CDApXjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YylGVUpanIZ+sO7P0FBlmey2Gwn3d6K9SNij4vJhGQExF9uobcX
	JG7xCueChpsIA2BQXhMGEVem1bOJdkCLa7h0hcesQUMtfzz2frwgX2sfp42aqG2eJDw=
X-Gm-Gg: ASbGncsBtfeU1zRlssblsjcK8EDeexuVG1by+zcI8022BQV00+JFi5u61DswkGzQY+y
	t/3KPfYSplS1u8NsyzYZmbYgUDulaENhGjnha1DdpwblUGzj/DMoB3+ZoFdMoa5g0mLe0cjN2Ae
	dxc6kB5wO0umKLA9mt9+hreKUxo3+3H5KWHzTFjirJOA8KTdA2gLUSEeHuckx4ziDD+D3Rj6tUS
	SZ9dRdPzqUEKCpAp2YZsdzuoRIHuu2RxTwKl0EB9Lp0tntHbYAnZXgi2JLVVMLTuNlgJ4X8F19A
	tw2uVU1dUMFpoS7bJ64pqxxzsDhMiNWWgu2ZaS5DmzsfDW7V9q4YjBKP
X-Google-Smtp-Source: AGHT+IEfO+pch615avxbBD4lcuwANYfZy4jBF+ULIb5f9fJUkNFZOMIfa+edi4Ii8A7sRlYdjSjFnA==
X-Received: by 2002:a05:600d:19:b0:442:7c40:fda4 with SMTP id 5b1f17b1804b1-442f84c209dmr181938415e9.1.1747747317684;
        Tue, 20 May 2025 06:21:57 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb7fsm29898455e9.26.2025.05.20.06.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 06:21:57 -0700 (PDT)
Message-ID: <4b57da72-7f30-48f7-8458-d1f1e27a28f5@linaro.org>
Date: Tue, 20 May 2025 14:21:55 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
 <20250506-james-perf-feat_spe_eft-v1-4-dd480e8e4851@linaro.org>
 <20250520110450.GN412060@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250520110450.GN412060@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/05/2025 12:04 pm, Leo Yan wrote:
> On Tue, May 06, 2025 at 12:41:36PM +0100, James Clark wrote:
>> SPE data source filtering (optional from Armv8.8) requires that traps to
>> the filter register PMSDSFR be disabled. Document the requirements and
>> disable the traps if the feature is present.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   Documentation/arch/arm64/booting.rst | 11 +++++++++++
>>   arch/arm64/include/asm/el2_setup.h   | 14 ++++++++++++++
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
>> index dee7b6de864f..8da6801da9a0 100644
>> --- a/Documentation/arch/arm64/booting.rst
>> +++ b/Documentation/arch/arm64/booting.rst
>> @@ -404,6 +404,17 @@ Before jumping into the kernel, the following conditions must be met:
>>       - HDFGWTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
>>       - HDFGWTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
>>   
>> +  For CPUs with SPE data source filtering (SPE_FEAT_FDS):
> 
> For alignment with Arm ARM:
> 
> s/SPE_FEAT_FDS/FEAT_SPE_FDS
> 
>> +
>> +  - If EL3 is present:
>> +
>> +    - MDCR_EL3.EnPMS3 (bit 42) must be initialised to 0b1.
>> +
>> +  - If the kernel is entered at EL1 and EL2 is present:
>> +
>> +    - HDFGRTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
>> +    - HDFGWTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
>> +
>>     For CPUs with Memory Copy and Memory Set instructions (FEAT_MOPS):
>>   
>>     - If the kernel is entered at EL1 and EL2 is present:
>> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
>> index ebceaae3c749..155b45092f5e 100644
>> --- a/arch/arm64/include/asm/el2_setup.h
>> +++ b/arch/arm64/include/asm/el2_setup.h
>> @@ -275,6 +275,20 @@
>>   	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
>>   	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
>>   .Lskip_pmuv3p9_\@:
>> +	mrs	x1, id_aa64dfr0_el1
>> +	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
>> +	/* If SPE is implemented, we can read PMSIDR and */
>> +	cmp	x1, #ID_AA64DFR0_EL1_PMSVer_IMP
>> +	b.lt	.Lskip_spefds_\@
>> +
>> +	mrs_s	x1, SYS_PMSIDR_EL1
>> +	and	x1, x1, PMSIDR_EL1_FDS_SHIFT
> 
> Should be:
> 
>          and     x1, x1, #(1 << PMSIDR_EL1_FDS_SHIFT)
> 

Nice catch. It was probably always true so I didn't notice it not working.

>> +	/* if FEAT_SPE_FDS is implemented, */
>> +	cbz	x1, .Lskip_spefds_\@
>> +	/* disable traps to PMSDSFR. */
>> +	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
>> +
>> +.Lskip_spefds_\@:
>>   	msr_s   SYS_HDFGRTR2_EL2, x0
>>   	msr_s   SYS_HDFGWTR2_EL2, x0
>>   	msr_s   SYS_HFGRTR2_EL2, xzr
>>
>> -- 
>> 2.34.1
>>

