Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6A2F066A
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630372; cv=none; b=PcnB7uCufRSfP9QSrAyt8VWD0a3IoKPohkp8hFiCBMnwwJ2m1ys8VMFLUO7HdOqx3ZBArs/NrUCEiZeoD8gequjDnC8V6y7WVbdX0kswHIP2BiybnOHfrAV3/g2atPFSo3Pz1PEc2pBURSsJybj668fBdaF2+/wjwqezb+AkvZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630372; c=relaxed/simple;
	bh=y5wMycaqef501Ldy2X5EI+znPj+titPOSLVRy2EdgVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgG+hCMbzhZXqo6kysndObUF/hQ8wIDavDbXSgDPKIYF9VKx9RtfA22UoUvodXl7Yu9EQeZDJLZ1M7miH3/dJw7wahnvdtJIKGQ9/iFT8s0eGgpbQ9+T3CLf35bBWW9iL2s1s0rdCXW1p5sbr6yrB28R8ckLmfx0ex8RTddTxsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zYwfHfNQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zYwfHfNQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47778b23f64so3649805e9.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 01:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763630368; x=1764235168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20kuTsLD7mzN21Mbsnm6zJe9RI36sxYDFDB3fVbVRPA=;
        b=zYwfHfNQ4okBDDKviwj/epI3v2+wP5et59yo50TIkeYSpe5vUAJ1BoA84LyipG2H0V
         nTQ0xP5YqvNqWyyUqWh7xew2OSoic08IZkDyOU1OMSiPNQT0aJr1mvNlyAJ3hnV3dvC1
         nq57dLZLz8C6Gu6IS8lYddHS+CfaBfPOrIIFJg240dbD3sZEkGWdO6nVv70CDBIn4+UC
         zhiwOX39e6Hb6QCifCpYZ7piExzL0dmF5dhLn8FRPSAtmObTIFikeVBiJUT9s28zfDFK
         3G7v/T+gpRTn5RPNkZg9peeB7fUgjxgeRATRfEPy8yd9P43MsHcMLVHFAYoq++IPU6Al
         M8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630368; x=1764235168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20kuTsLD7mzN21Mbsnm6zJe9RI36sxYDFDB3fVbVRPA=;
        b=a2RjY6KeBzSiAPcrqR1d40pr33FdLzT92HKqQAl51NvyDTLorfbZXzu8Kq34ya+ltK
         MeuyaBTVjim2p8R8fhHf3GVoFjZsBDRUANTiG2P1B1bzrRNGC+YN3LlqAwzDUm/cRKVs
         whrjkhbAMiF1olRLB5eGvg+h1LcwLnab04/xA+WnhqCkaHFjRY1hAXY4v9W7+DfL2NS1
         Ni/EDh4lVgtw+hVe8wiH9NLP7k5ZxOduMS1Xg3vjCHatukRLNrJbbSZtuhA5WEZ4c9CP
         ewpMSf8vXA+JHKL2c/Gg1B62TOc0vHxnJCHde7gPFa6OHl2P19OgNElTdsOMcK9UrgRn
         6sFA==
X-Forwarded-Encrypted: i=1; AJvYcCXiUHAlyPVjNIVnMvsQnMsQrKrkid+zBrguLM9DcHibdsdmz4Y7cJlqPXM79MQyUhwA4my9Ym0WMM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YysBBQBNbHAywdM8LqKPcLzeGLWEvEBafdEi9vxP8NZkn6PnKxY
	PEN/cs3YatPKHloLufMya06I7gJJh8ZY3BTlEMp2aCb9N1MO2JvBWZyZ20bN7Hf7TcU=
X-Gm-Gg: ASbGncsta5UqIL0c5KeSV4C0zvXZNQpqPSZYtF2kKHNWGllfpKIu1frDH8vTYrDtY5w
	ZQhfxnVJF5Jqz5AvpGmmUPzmquEyOj35KjDekKxCZXSJj2IVSCrbOvKjbL74rrzrSYrYRe/gSU1
	h15035fPzKrLDd6haHcbxhw99ivI/9mKZsorl2e7DHanJeGBxeKqEABRFDQ6qKZWxp76iUUXMEP
	mwXXcyKR5TbJPZZ/KBG//Lj1SXePhJVtacT0q35L+RJjkfGeh7b/EqLlNg7yHWtf/18dNcw28RX
	UDGkby+y7KnkTuBtdo5q2634lMBVTv/AOu/tmI2if8VFgPbq8KtA/UWv9EsCBY3w4LtIBvWYr/u
	mbr9fzryJPtpHWWSVRGN5oFiPt3Ro5KOIqEnEa+RoJhQzkvYyk6jQJdPjgq6w5Hw5stFfGoAf+j
	7XcuTu8d/4mj6ALbdR
X-Google-Smtp-Source: AGHT+IG5tl/whbs/s+74YcG+m53Ghp9OLB4xBZ6tsdMgU8rY+wexmvaqdkIZY2ULXyjStCQ5oVkWfQ==
X-Received: by 2002:a05:600c:358f:b0:477:9650:3175 with SMTP id 5b1f17b1804b1-477b835c667mr30933245e9.0.1763630367552;
        Thu, 20 Nov 2025 01:19:27 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b831ad3fsm36561245e9.12.2025.11.20.01.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:19:27 -0800 (PST)
Message-ID: <d3dca311-5f2b-406f-a91b-0c5bf4dcb7ce@linaro.org>
Date: Thu, 20 Nov 2025 09:19:25 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/5] perf: arm_spe: Armv8.8 SPE features
To: Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
 <aR503-f-ZrnWzZh2@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aR503-f-ZrnWzZh2@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/11/2025 1:54 am, Namhyung Kim wrote:
> Hello,
> 
> On Tue, Nov 11, 2025 at 11:37:54AM +0000, James Clark wrote:
>> Support SPE_FEAT_FDS data source filtering.
> 
> What's the state of this series?  I can merge the tools part (3, 4, 5)
> once the kernel part lands somewhere.
> 
> Thanks,
> Namhyung
> 

The SPE driver part was blocked on Peter's ack for the config4 change. 
He's given it now so Will should be able to take the driver.

Thanks
James

>>
>> ---
>> Changes in v10:
>> - Pick up Peter's ack
>> - Slightly clarify commit message regarding the difference between the
>>    data source filter and the data source
>> - Link to v9: https://lore.kernel.org/r/20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org
>>
>> Changes in v9:
>> - Fix another typo in docs: s/data_src_filter/inv_data_src_filter/g
>> - Drop already applied patches for other features. Only the data source
>>    filtering patches remain.
>> - Rebase on latest perf-tools-next
>> - Link to v8: https://lore.kernel.org/r/20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org
>>
>> Changes in v8:
>> - Define __spe_vers_imp before it's used
>> - "disable traps to PMSDSFR" -> "disable traps of PMSDSFR to EL2"
>> - Link to v7: https://lore.kernel.org/r/20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org
>>
>> Changes in v7:
>> - Fix typo in docs: s/data_src_filter/inv_data_src_filter/g
>> - Pickup trailers
>> - Link to v6: https://lore.kernel.org/r/20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org
>>
>> Changes in v6:
>> - Rebase to resolve conflict with BRBE changes in el2_setup.h
>> - Link to v5: https://lore.kernel.org/r/20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org
>>
>> Changes in v5:
>> - Forgot to pickup tags from v4
>> - Forgot to drop test and review tags on v4 patches that were
>>    significantly modified
>> - Update commit message for data source filtering to mention inversion
>> - Link to v4: https://lore.kernel.org/r/20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org
>>
>> Changes in v4:
>> - Rewrite "const u64 feat_spe_eft_bits" inline
>> - Invert data source filter so that it's possible to exclude all data
>>    sources without adding an additional 'enable filter' flag
>> - Add a macro in el2_setup.h to check for an SPE version
>> - Probe valid filter bits instead of hardcoding them
>> - Take in Leo's commit to expose the filter bits as it depends on the
>>    new filter probing
>> - Link to v3: https://lore.kernel.org/r/20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org
>>
>> Changes in v3:
>> - Use PMSIDR_EL1_FDS instead of 1 << PMSIDR_EL1_FDS_SHIFT
>> - Add VNCR offsets
>> - Link to v2: https://lore.kernel.org/r/20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org
>>
>> Changes in v2:
>> - Fix detection of FEAT_SPE_FDS in el2_setup.h
>> - Pickup Marc Z's sysreg change instead which matches the json
>> - Restructure and expand docs changes
>> - Link to v1: https://lore.kernel.org/r/20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org
>>
>> ---
>> James Clark (5):
>>        perf: Add perf_event_attr::config4
>>        perf: arm_spe: Add support for filtering on data source
>>        tools headers UAPI: Sync linux/perf_event.h with the kernel sources
>>        perf tools: Add support for perf_event_attr::config4
>>        perf docs: arm-spe: Document new SPE filtering features
>>
>>   drivers/perf/arm_spe_pmu.c                |  37 +++++++++++
>>   include/uapi/linux/perf_event.h           |   2 +
>>   tools/include/uapi/linux/perf_event.h     |   2 +
>>   tools/perf/Documentation/perf-arm-spe.txt | 104 +++++++++++++++++++++++++++---
>>   tools/perf/tests/parse-events.c           |  13 +++-
>>   tools/perf/util/parse-events.c            |  11 ++++
>>   tools/perf/util/parse-events.h            |   1 +
>>   tools/perf/util/parse-events.l            |   1 +
>>   tools/perf/util/pmu.c                     |   8 +++
>>   tools/perf/util/pmu.h                     |   1 +
>>   10 files changed, 170 insertions(+), 10 deletions(-)
>> ---
>> base-commit: 081006b7c8e19406dc6674c6b6d086764d415b5c
>> change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99
>>
>> Best regards,
>> -- 
>> James Clark <james.clark@linaro.org>
>>

