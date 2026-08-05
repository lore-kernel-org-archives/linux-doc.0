Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4DD3DD849
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 10:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785924554; cv=none; b=LKdOgWPdpL6rPazbnEXS5mjfmb0pk5MjkIrDDMQU9yCr5Feh7HHsjo0KVYtopAwZnUdcKOeuLOCFbKYKdIZAr8HONOeNU5jLje5u0dLF/8QIJYQ4kviAIqGUSl3pJ8RGN/7SPkrhMDJvnEJkefT3TQy9vB+QF3FLoZ/jWf0p1o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785924554; c=relaxed/simple;
	bh=M2jF0Jt2bDRZzymZQmRY6Uui16djwBoVWK1VjhYmc30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4npNz8ugBgV6r3vkpMBLTlYToNLgMqFRVGLL+mYuXzIq51qL4oAdqhwNgiRj7b2ZV60enIWBCLqoGBUn4TVyh2N47wdqBT9Nw0DHOmrmWKmf9Jk1ypbE/dnETO9YGZEDXp0k0h86Sw2bon2oZ2kDGxsnYHsSNhFnkXScWO1b2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TE/KrOhR; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TE/KrOhR"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f6609c657so372306f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Aug 2026 03:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785924550; x=1786529350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrcStaMXdkE1hM0cDDyjF0ywdDXESAjsr6s/h+tclqU=;
        b=TE/KrOhR+hPudONkTR1ud9BiEGids6A4j5g+iSX3NQwqqv6UfQ47ho6Hh78BSarN2j
         VWzEyTQE8opn3ybr4nWb3fjO7eL+EqXnotKCRyt60OPtewwHVI83MmxQZ0mugzSrfWSR
         srhdnWhCAL9c4niOLoY674o7bU8UFewIHCw+UewJbpeCNUsTKFEbjz7zh4+rSi11hefP
         WHUIykpewpxsiYaBLNXJsg12u+XR49pDltYLOwA7VaQ5irinX+W/K7zA1hKrKNV9RHOb
         psGh+0pSrS7J7E2cxeXYEt60vzL1QgUcqBQJ4tIDLN8LVd7OttdhMhnvv8Rd22OJaTxt
         N18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785924550; x=1786529350;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrcStaMXdkE1hM0cDDyjF0ywdDXESAjsr6s/h+tclqU=;
        b=CGtIfzmH8EKyrT/4eTZFZnePoeDZ6HtOccrt0wCHTwUW0Jg57d0c8wmwMNAWt6tNX3
         1xQnBd/5u/688ZY9Mj+akezvtT8hzM9PZmqEF5yrnSD1WRAOPA9okAGkfnOfvi4EvoGq
         ZFztHaf4DmFOEYR2AsA7ivfKQnH4deTI1l1UKugXuH7379bGsQt72caPODHX/DmKvg71
         q2mVSFjP+pmKpVdGAy19RWCGF3MdSXSy5IRiOpMxkNS2Fd2BfS647sZPS+y/8STPgM+Z
         ZmPhEcShm1cbEPfJ4UJwEoaKBJv99m6d9CElcrlBV1kw4GO/5T030bfXJtOnC3jXv99U
         o0BA==
X-Forwarded-Encrypted: i=1; AHgh+RobF5AZ6aCMV7WOoYN1srAQosh6FaIq3mSlwJREz2PfKZ44ZSlBp46FljCTO9VsWytRUrlyhdgY+Sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsBJ/BmRrVEWdTVoxkkmq6/AUrMP6EPGhmNPshTKM7vG2pSWy+
	LU+I+5X/wEKdD5SaOWOxWDRmEwYaP04H+vZtnIShV98Ikde2pZ9enoBG1DahX+bJ1rI=
X-Gm-Gg: AR+sD11+AYyy8cn/5n/lmgJW3EYZz/VPx0y1mkvWsTdigLSW61+70/tVlp+DnZcWYCj
	Wfdp7T9fq2OGQjJpV4eb9qcfl7/sIAT5M42OQ42lgUeE8ZhFvxQjxfyCf0iBY1xjRHIYDAUaAQR
	TslUSN5/4H0wu7hYyTm4oq3Im3lAHUO7PV0V5jt45kxC7c/5BujKfQCzndnz4UpF6mAJ4W4+u/7
	cHqn0qJ+vqpYzp+Xd2W0SWp7HZjRYn82Eh96NHrJ/SLYsWhzj673GIGlkemqtSeuye2z2EVvLsx
	CcauoPNvmWbFFW36w0DGbSolOAzWnyiQQNQdkLz06H4KlqBT67/pcN9+mMmOlmyxTxwP5vg2av9
	EM/mFQWGMy/9/yeygpW5BpabTJ0ShTQrKHgXFsA68EmravEx+/bbZtuyvoB7MQIApbNYf9sHFqS
	fjRQFVtlI7UD0mX+WNZHOhPLyKVfqMkWNDQnebDff1EiAooYc9ohuvcolLDa2pcrt6fqw=
X-Received: by 2002:a5d:5291:0:b0:47f:d072:87d7 with SMTP id ffacd0b85a97d-47fec4f663fmr7081483f8f.9.1785924550297;
        Wed, 05 Aug 2026 03:09:10 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfda0cbsm7427247f8f.6.2026.08.05.03.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 03:09:09 -0700 (PDT)
Message-ID: <ebb8a1b7-d5c8-4be0-af64-1496a7fd29d0@linaro.org>
Date: Wed, 5 Aug 2026 11:09:08 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/21] ARM64 PMU Partitioning
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com,
 corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <gsntse4tvbn2.fsf@coltonlewis-kvm.c.googlers.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <gsntse4tvbn2.fsf@coltonlewis-kvm.c.googlers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 04/08/2026 10:06 pm, Colton Lewis wrote:
> James Clark <james.clark@linaro.org> writes:
> 
>> On 23/07/2026 9:57 pm, Colton Lewis wrote:
>>> James Clark <james.clark@linaro.org> writes:
>>>>>> When running the guest on a single CPU I get different counts for the
>>>>>> same event for a single process, although this never happens on a 
>>>>>> host.
>>>>>> I think there might even be some Perf tests which expect them to 
>>>>>> be the
>>>>>> same, and this doesn't depend on whether any events are running on 
>>>>>> the
>>>>>> host or not. Not sure if you ran all the Perf selftests in a guest or
>>>>>> not?
> 
>>>>> I'll investigate but I'm not sure perf is intended to guarantee
>>>>> that. perf stat just runs the event counters but may not write or read
>>>>> them at exactly the same time.
> 
> 
>>>> Is that true? The perf core calls perf_pmu_disable() when a process is
>>>> scheduled out before reading the count of each event of that process in
>>>> an inner loop. The perf_pmu_disable() clears PMCR_EL0.E which freezes
>>>> all of the counters so they can be read out in a consistent state.
> 
>>>> It's important that they're all stopped at the same time because
>>>> counters might be used in metrics as ratios of each other. So I think
>>>> it's deliberately designed that way and appears to not be working in a
>>>> guest now.
> 
>>> By default I think perf assumes events can be measured independently, If
>>> you want to guarantee events are scheduled together to avoid measurement
>>> skew you need to make sure the events are grouped.
> 
>>> The common way to do that is with {} around the event list:
> 
>>> perf stat -e {branches,branches}
> 
>>> Please see if that resolves the issue.
> 
> 
>> Groups only change how the events are scheduled, not how the driver
>> starts or stops multiple events running on the same PMU (grouped or
>> ungrouped). In my repro I had less events than counters in HW, so they
>> will always be scheduled at the same time regardless of grouping.
> 
>> I did notice something extra though, you have to first open some amount
>> of counters, and then open more than that. Then the second time the ones
>> with different counts will be however many were opened first time, as if
>> some state has stuck.
> 
>> For example if I open two counters then 6, the first two always have
>> different counts the second time:
> 
>>     $ perf stat -e branches,branches true
> 
>>     Performance counter stats for 'true':
> 
>>               106129      branches
> 
>>               106129      branches
> 
> 
> 
>>     $ perf stat -e
>> '{branches,branches,branches,branches,branches,branches}' true
> 
>>     Performance counter stats for 'true':
> 
>>               117013      branches
> 
>>               117013      branches
> 
>>               110364      branches
> 
>>               110364      branches
> 
>>               110364      branches
> 
>>               110364      branches
> 
> 
>> After opening 6 again a third time they'll all have the same counts.
> 
> Interesting. Thanks. To clarify, is this happening in the host or VM?

This is in the VM

