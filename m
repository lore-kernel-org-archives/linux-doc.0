Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAEC26AE4
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752765398; cv=none; b=ofEiSW6uZNjC2NrTZKHx6Udr3wQij3D5GBTx+LVRQRvP3chb+v4/p0SbaariTuoV8ERmatKcl4uQP0M/PVNbWUrA6sEQNb07r1rF7Kxb8kH0h77vvjTo3M2UIzy11azMysjwnE+VyFoRrettCC36uOpJPve+38RIVg8oP0EdNGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752765398; c=relaxed/simple;
	bh=42i7QgR3Vm1XbHENgDUnhNUH1shHeEplaZfgHdiTnfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMl0zx1tRNnNuoW/py+NMIsDP4O3zc018NYi1NN6dr314VoXsep0zZKcDwrYXzJYl/xpsh4m9jQq1zh5kw6UCKZ9K/5lyqegWQIGSI/BdZ6iyjPytsPjSUfOf+wEk8j6HzhQhNHwj/fsI6DiWvvKTr4zaYSTb6L1gN3cBVeixEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VVkmqb4r; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VVkmqb4r"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54690d369so924706f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 08:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752765394; x=1753370194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9o9XStLuurpqMGv7dh7QCRhtG3mn+IMSEac9X1lSv4g=;
        b=VVkmqb4r6FLNP7jFQ0LKYP/a3iOpC0sIfd/hhZrgEzqpfF/r35LYYV9/HZzFWiYZ0U
         46ywHsd77GhFh/MaCYM2VsrEoMfnQwwL1aE9L269yvD4qGE/cO3TKPMCFxQH9IRsyPrj
         BerdNvM6Cl+UHAHNOqooKsQOVlnV0jHNahxiS5OMWbtaQeE+8+1Wuk8HEKEKF/SJgogN
         nTWbv2MIAoYt1hmjp1lqmCnpBUWm/+iOyrLEJQO1jIGYOsw0e5RaknYAu4T7gf7/uDPs
         /+eD4AWGR6mlucA1cGDvyBtJow0vtciAKeJWmXWlA2HrmnU1NNZRtdYR1Hvk3o9K/8ro
         V02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765394; x=1753370194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9o9XStLuurpqMGv7dh7QCRhtG3mn+IMSEac9X1lSv4g=;
        b=elI1OhIF2VY+eEPCH75b0vgxfeSA9qUwr8h9VIxUWkJIkAQKvFo3Ht44MZuosh3bLe
         30Bnz3kCxySn6mAO2r5NVbYwSjWT0a3AiyF0IVFp2DZTJXaFspMOWv7p1m2ao8nDenO6
         9tFdfnOXXzNYVGmbOA9dLzcTc7m0RzOV6a6UW7Z0xQtZzSioeumN595We1k7A6kRXMFH
         MHtGQFM4b5U2RXpk9bXp/Q8r6m2hv06zVoVWtimUWt8PYHr3Z+7eMqG4wPYEGPNsmvQb
         CcHz1kNIDzXF2YlXFsoSbRdI/WqK2XMn5NHpMvAwonbajdmUyZ+MDh3K2YFg1fox1iEY
         6lhg==
X-Forwarded-Encrypted: i=1; AJvYcCWMQZ7nWdLkZTpZIia2I2DlLCwSi89wHaeQY/hL7dB67ifWu78H553OeeY3/ETiDUMRHwaQmIzGxlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL3wlmag2OH8z/4cEwych1mu+/s0rYOB1rvkF+Y9PzaXWs+0Gg
	t868oaJuiW1PkbFlARQdIFo2aA40Q+8e19wLbekj0B4uvs/cktdcoODyCDW86WV4xMU=
X-Gm-Gg: ASbGncvH2moHvFkqmRURhI3Nqal13F9LTnqT5TWktJbi4XIb9wQgEMOvDiA/Uf9Jo20
	GFVjSBh1kviFztOu/AhLczWHIvrjxUHsltjmDS4RghkrJbJb572pCnozih7Oq1Hqrd2eT2kZEKC
	GVQUkrBtGWC00jt+52/1BmfZMWxu5tMBbh0k9okIB4mKhde4s/AQDBX40xsUP1fqgB01MI/k2u2
	gxli5SDU4TgeBbae67XbZh0x1DI2D1Q5rH8C20ucYkvVwW1CuW4uJdsPKy5ySugzbAxTj7mcx89
	W5Ip19PWk+7hyyF7ua6IQijrXJwqFvjCkPDi0HnUEVtWDAAqFgQGyhzQCKx3T8EaH/9VhIG6z3O
	uvlQZJrn8F8DbhWMxdCQPM90zi0k=
X-Google-Smtp-Source: AGHT+IEOgsXesc4WriF6B4s4UdXOC/523vChLTF14vUDuJL5EdaGCxaHdXKmwN46VtYnX5eN75Kjsw==
X-Received: by 2002:a05:6000:40d9:b0:3b4:4876:9088 with SMTP id ffacd0b85a97d-3b60e510003mr5758377f8f.46.1752765394479;
        Thu, 17 Jul 2025 08:16:34 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5f32ed100sm18096525f8f.0.2025.07.17.08.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 08:16:33 -0700 (PDT)
Message-ID: <ca99af3b-e358-4c2b-8d62-0b6c29984391@linaro.org>
Date: Thu, 17 Jul 2025 16:16:32 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] perf: arm_spe: Add support for filtering on data
 source
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-7-71b0c9f98093@linaro.org>
 <aHUOig-kaRo15ZH5@willie-the-truck>
 <7f51d4f9-7e08-49b5-ab43-8bc765bb2ca8@linaro.org>
 <aHkI5_IOV35L4YJa@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aHkI5_IOV35L4YJa@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/07/2025 3:29 pm, Will Deacon wrote:
> On Tue, Jul 15, 2025 at 02:04:18PM +0100, James Clark wrote:
>> On 14/07/2025 3:04 pm, Will Deacon wrote:
>>> On Thu, Jun 05, 2025 at 11:49:05AM +0100, James Clark wrote:
>>>> @@ -406,6 +416,9 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
>>>>    	if (ATTR_CFG_GET_FLD(attr, inv_event_filter))
>>>>    		reg |= PMSFCR_EL1_FnE;
>>>> +	if (ATTR_CFG_GET_FLD(attr, data_src_filter))
>>>> +		reg |= PMSFCR_EL1_FDS;
>>>
>>> Is the polarity correct here? The description of PMSDSFR_EL1.S<m> suggests
>>> that setting bits to 1 _excludes_ the FDS filtering.
>>>
>>
>> Setting filter bits to 1 means that samples matching are included. Setting
>> bits to 0 means that they are excluded. And PMSFCR_EL1.FDS enables filtering
>> as a whole, so if the user sets any filter bit to 1 we want to enable
>> filtering:
>>
>>    PMSDSFR_EL1.S<m>
>>
>>    0b0  If PMSFCR_EL1.FDS is 1, do not record load operations that have
>>         bits [5:0] of the Data Source packet set to <m>.
>>
>>    0b1  Load operations with Data Source <m> are unaffected by
>>         PMSFCR_EL1.FDS.
>>
>> I think it's all the right way around and it ends up being the same as the
>> other filters in SPE. Because we're using any bit being set to enable the
>> filtering, the only thing you can't do is enable filtering with a 0 filter,
>> but I didn't think that was useful. See the previous discussion on this
>> here:
>> https://lore.kernel.org/all/5752f039-51c1-4452-b5df-03ff06da7be3@linaro.org/
>>
>> Reading the "Data source filtering" section in the docs change at the end
>> might help too.
> 
> Sorry, but I still don't get it :/
> 
> afaict, if any of the bits in 'data_src_filter' are _zero_ then we
> should set PMSFCR_EL1.FDS. That also means that a mask of zero means all
> loads are filtered, which is what the architecture says and is what we
> should provide to userspace.
> 
> Will

We'd have to add another format flag to enable data source filtering 
then, because otherwise the default would be zero and people's samples 
would disappear.

But the only use cases I could think of were more like "I want to see 
samples from data source 1":

   -e arm_spe/data_src_filter=0x1/

Or "I want to see all data sources except 1":

   -e arm_spe/data_src_filter=0xfffffffe/

Filtering out all samples with any data source didn't seem to make sense 
to me, and I think you can already do that with the other filters 
(remove loads etc).

It would be a shame to be inconsistent and to add an enable flag just 
for that one case because the other filters in SPE are auto enabled for 
non-zero values. Although to be fair for PMSFCR.FT and others, zero 
filters are explicitly not allowed:

   If this field is set to 1 and the PMSFCR_EL1.{ST, LD, B} bits are all
   set to zero, it is CONSTRAINED UNPREDICTABLE whether no samples are
   recorded or the PE behaves as if PMSFCR_EL1.FT is set to 0

Seems like FDS doesn't end up as neat as the others, but IMO I can't see 
anyone needing a zero filter. I did discuss it with Leo and we decided 
that we could always add the enable flag at a later date if a use case 
turned up and it wouldn't be a breaking change.

But if you think it's there so it should be exposed I can add it.

James

