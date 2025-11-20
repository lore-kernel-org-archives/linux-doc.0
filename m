Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E8429ACF0
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763639619; cv=none; b=SPgVboeb3/oDBJw0rG7Ni60H0HJUzujEX9/A7OyPzqLSOmlOcNJyeuqcOtKQ11vUbCCl1+XfhE8CEIVvuzI7TOI86xJATc6IZBj+cSg4ahsy3vm3Dl0jNhw3AKUX9LC0td1Y+XjyLUcq1FY1b0fYtcXUjZhG7WSIhxnjOAoWWnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763639619; c=relaxed/simple;
	bh=XEYRAOgPzU7WPp+njMSNI6lst5cQE4m5vt5S4LH5rcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RluO2Aabe1aj1jy8QcuhjBfqv74rwROeFPnDGg4M+TG9NwnExULRHaORG+qs67jFwu/MTDLEgrtKA/vrdFJWRG8dY10rbznj0tHSAnqD2AmnBqpxtXYdfQKFY54aa3oA9Ldsd3hZP7mtfNeLc+30SRQDSUiuKTNU1wftCcJSoOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zkywA0Lo; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkywA0Lo"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so489588f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 03:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763639616; x=1764244416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FlqEVS0+MiGt+zpPjfFggE/AaavkPH2p4yD9Xw0jlrs=;
        b=zkywA0LobjO3dXEOYMRRwvVQfrA6qJqWaedHI6BwWRtlxFVZMSphb5wjXEvIfK8T+V
         5+P8VgEtjxCMH7TGKSzMUfyn3oyUmc86VWLmakSqbTqqdb4hMB3bhUJuuW3/0Wcd9vJN
         6y4VYYdDflFB3ErOoXbOIxt9tLJaCMqzm3ASLtSXvf7SQrJT9khh/Gmugzom/Im4uhoV
         W3lRtUfAjZ2j+CymTas8OsrWJNAPI16lxOhf+VhVnb7Tw1FBtLyYBq3nRl47HbiZ4czF
         frx/aYcM5BwlQqOuRQnt1TdwLfmcTS8B6VrLNBQWSZi2CcrQoEd2IrLUR7mooG2UmJlZ
         Azbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763639616; x=1764244416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlqEVS0+MiGt+zpPjfFggE/AaavkPH2p4yD9Xw0jlrs=;
        b=g237XcAEJN5+mWXOGS3XK3zsNy7JSnWdcfktzZtxAyL1Xv+2k4a0rz3CL2o9utV5eZ
         1Bl4iCcJtMMCt4R00JnVWurTlsqdZKp9NszcwwTM6+n64QHLYN53pUSyjUV3gmU9F78B
         HvSJEqUnfAZty8NjpeTuIcFfRgWKOToksqDe+3W50xADbvjbz4G9LhOMqesxeJLOHza0
         d1Jfak7Q/bwJyZZAkIpfhrx0PRhzt0ylQH4JxRdPtxBV6Nrf4hFlfFo5wc6GpJepv6u2
         KWz3OKM/ZGSVZIjq7x+Eej8ylJe/kvgiDmsxEDPhqGgSPXrHCfSX5qCd1ZCbJS4MOyXJ
         5MAg==
X-Forwarded-Encrypted: i=1; AJvYcCVthrXpzyrbz0GGjceNdjyZP06v7ZnOksAiyNHm06jxbqHjnpoZ9gDeNUbgyGdVg6Djfv3hQPerV98=@vger.kernel.org
X-Gm-Message-State: AOJu0YypC1gWAdlrgjPz9BOsmW81CLqR4B2IFAl6XYlh5z4KmQGBd2CT
	/9mal+D4vyASidYgN1ugQ4cq1ZltL2w2WQhgelY9EeIcnrdX5CsyOqFmrQ7cz0rMrBg=
X-Gm-Gg: ASbGncv2ombRrSGcmC2wm2lFoKX9vyTYMBAp6cIRXJGG0bp5usnlh54WbbNKeh/xFjy
	uEGndqbMIuH9CnsLgUqqAt661zJh8FhqDdoveyItweSFWbuzwB/SZFXZyb3e8cxy5Oz0JZYYC7B
	cxijEjRcudtnRZDuti0uPBFUxVMIcWqUyvuANAvBEecfBu1fsi2wFHykw7y1hN8vqZ7/83j3UJB
	H19T41E1/ZoyQiwqW3QVKS5eg8dD3CnxujdKbAhjzftrYB8QbygtVfcDTLD35zzY8rHZFQjZV5K
	sL3xQ690wVOLso9q1rNSPrwkX7BYpdAMs2HLYT+9lu1821HBIiOz55uZ6ZIP7/2urIbdCzcehzt
	oR4XpTWAeZNcCpcjoIakKCtCCNfCt+Wds0SKnXeQygItPE4L3oG4FvQMRivh9m6DlvQirAYQgng
	34C1BPswc8y0TB/LqYE1sUzWDF0ho=
X-Google-Smtp-Source: AGHT+IH/clyUgV+SR1sU4PGc3WAKh6W0Xyw9krHbVPssxtnUzEeWpWW7mdUCix2QdK09ZVqc5ly6bA==
X-Received: by 2002:a05:6000:288a:b0:42b:3746:3b85 with SMTP id ffacd0b85a97d-42cb9a5c1c9mr2098192f8f.45.1763639615574;
        Thu, 20 Nov 2025 03:53:35 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34ff3sm5584315f8f.16.2025.11.20.03.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 03:53:35 -0800 (PST)
Message-ID: <5f4a848b-af1f-4c5f-bd82-5e3ebe1e9dd9@linaro.org>
Date: Thu, 20 Nov 2025 11:53:34 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/13] coresight: Remove misleading definitions
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-10-82efd7b1a751@linaro.org>
 <CAJ9a7VgQO0_FuZj2CD0yAW10xefJNmqRC-0DxJTG9FJu6h-o6A@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7VgQO0_FuZj2CD0yAW10xefJNmqRC-0DxJTG9FJu6h-o6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/11/2025 11:21 am, Mike Leach wrote:
> On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>>
>> ETM_OPT_* definitions duplicate the PMU format attributes that have
>> always been published in sysfs. Hardcoding them here makes it misleading
>> as to what the 'real' PMU API is and prevents attributes from being
>> rearranged in the future.
>>
>> ETM4_CFG_BIT_* definitions just define what the Arm Architecture is
>> which is not the responsibility of the kernel to do and doesn't scale to
>> other registers or versions of ETM. It's not an actual software ABI/API
>> and these definitions here mislead that it is.
>>
>> Any tools using the first ones would be broken anyway as they won't work
>> when attributes are moved, so removing them is the right thing to do and
>> will prompt a fix. Tools using the second ones can trivially redefine
>> them locally.
>>
>> Perf also has its own copy of the headers so both of these things can be
>> fixed up at a later date.
>>
> 
> The perf version is used to reconstruct the control registers for etm3
> / etm4 to put into the trace metadata headers in the perf.data file
> for the decoder to be intitialised correctly.
> 
> perf_event_attr::config uses the ETM_OPT_* values, used directly for
> etm3 since they match the bit pattern in the etm3/ptm config register,
> and remapped for etm4 from ETM_OPT_* to equivalent ETM4_CFG_BIT* for
> the etm4 config register.

That was one of the parts that confused me. Just because the format bit 
positions happened to match the register config for ETM3, didn't mean 
that it had to avoid reading the positions from sysfs. And it wasn't 
consistent between ETM3 and ETM4 either.

That's decoupled now anyway, so although they still match there's no 
reason it can't change in the future.

> 
> The reason we do this re-construction - rather than read registers as
> we do for the other metadata - is that the register value is not set
> at the point we are recording the metadata - it does not actually get
> set until the etm is enabled, later in the perf process.
> 
> On this basis it would seem that any changing of the attribute bit
> ordering has potential to break perf decode. Probably safe to remove

Yes so we should keep the positions the same until enough time has 
passed after the Perf fixes go in. Although other than the timestamp one 
I can't see any of the format bits needing to be moved.

The timestamp bit now won't be passed correctly to OpenCSD until Perf is 
fixed, but I saw it wasn't used for decode anyway, so that should be fine?

> from this version of the file though, but overall, changing bit
> meanings in the underlying variable may possibly need a fix in perf
> and  potentially a breaking change for earlier versions of the tools.
> 
> That said, for this particular version of the header, since it appears
> to no longer need the values due to earlier changes.
> 

The reconstruction of the registers will remain in Perf, so nothing will 
change there apart from not hard coding the format bit positions.

I plan to define the register bits in Perf in cs-etm.c in the same style 
as we do in the kernel. ETM_OPT_* and ETM4_CFG_* weren't searchable 
because the the bits are already defined in the kernel in a different 
style. So I'll define them to match like this:

+/* ETMv4 CONFIGR register bits */
+#define TRCCONFIGR_BB		BIT(3)
+#define TRCCONFIGR_CCI		BIT(4)
+#define TRCCONFIGR_CID		BIT(6)
+#define TRCCONFIGR_VMID	BIT(7)
+#define TRCCONFIGR_TS		BIT(11)
+#define TRCCONFIGR_RS		BIT(12)
+#define TRCCONFIGR_VMIDOPT	BIT(15)
+
+/* ETMv3 ETMCR register bits */
+#define ETMCR_CYC_ACC		BIT(12)
+#define ETMCR_TIMESTAMP_EN	BIT(28)
+#define ETMCR_RETURN_STACK	BIT(29)
+


Then use the format strings to check which ones are set:

if (!evsel__get_config_val(cs_etm_pmu, evsel, "cycacc", &val) && val)
	trcconfigr |= TRCCONFIGR_CCI;
if (!evsel__get_config_val(cs_etm_pmu, evsel, "contextid1", &val) && val)
	trcconfigr |= TRCCONFIGR_CID;
if (!evsel__get_config_val(cs_etm_pmu, evsel, "timestamp", &val) && val)
	trcconfigr |= TRCCONFIGR_TS;
if (!evsel__get_config_val(cs_etm_pmu, evsel, "retstack", &val) && val)
	trcconfigr |= TRCCONFIGR_RS;
if (!evsel__get_config_val(cs_etm_pmu, evsel, "contextid2", &val) && val)
	trcconfigr |= TRCCONFIGR_VMID | TRCCONFIGR_VMIDOPT;
if (!evsel__get_config_val(cs_etm_pmu, evsel, "branch_broadcast", &val) 
&& val)
	trcconfigr |= TRCCONFIGR_BB;


This also highlighted another Perf bug that evsel__set_config_if_unset() 
only operates on config and not config1, config2 etc. That's also used 
for setting up the event so I'll fix that too.

Seems like the API goes through a lot of effort to publish the bit 
positions in sysfs, but we've selectively not used them which wasn't 
quite right.

> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> 
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   include/linux/coresight-pmu.h | 24 ------------------------
>>   1 file changed, 24 deletions(-)
>>
>> diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
>> index 89b0ac0014b0..2e179abe472a 100644
>> --- a/include/linux/coresight-pmu.h
>> +++ b/include/linux/coresight-pmu.h
>> @@ -21,30 +21,6 @@
>>    */
>>   #define CORESIGHT_LEGACY_CPU_TRACE_ID(cpu)  (0x10 + (cpu * 2))
>>
>> -/*
>> - * Below are the definition of bit offsets for perf option, and works as
>> - * arbitrary values for all ETM versions.
>> - *
>> - * Most of them are orignally from ETMv3.5/PTM's ETMCR config, therefore,
>> - * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
>> - * directly use below macros as config bits.
>> - */
>> -#define ETM_OPT_BRANCH_BROADCAST 8
>> -#define ETM_OPT_CYCACC         12
>> -#define ETM_OPT_CTXTID         14
>> -#define ETM_OPT_CTXTID2                15
>> -#define ETM_OPT_TS             28
>> -#define ETM_OPT_RETSTK         29
>> -
>> -/* ETMv4 CONFIGR programming bits for the ETM OPTs */
>> -#define ETM4_CFG_BIT_BB         3
>> -#define ETM4_CFG_BIT_CYCACC    4
>> -#define ETM4_CFG_BIT_CTXTID    6
>> -#define ETM4_CFG_BIT_VMID      7
>> -#define ETM4_CFG_BIT_TS                11
>> -#define ETM4_CFG_BIT_RETSTK    12
>> -#define ETM4_CFG_BIT_VMID_OPT  15
>> -
>>   /*
>>    * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
>>    * Used to associate a CPU with the CoreSight Trace ID.
>>
>> --
>> 2.34.1
>>
> 
> 
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK

