Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007390;
	b=mwkm7xWUzVSvNyoFaLGuBTtGSLCG8ITm35Pe/mkof3kpuuHfeuntxYmn6ChhjayOjlFN
	 LjpkCyMogXd6Vrq3XFT01iiOMwAOJ4/T/W1JmNv8NKKTSlrAwVls6qvM03ntRJXZbttzb
	 SFjFweT7Dq+QSeAnt7qfgkq81J1XxELK+pZXhs3N4P5kARZfXx6bYngxGx0e23C8qFDLU
	 v2zSUu6VtyAOJ8hAgCq/wCZ+zrMV34p0rM6E24SNCYzfFAAtG2YPjL82vK+rf2H00zftH
	 m8O3QZYVPT+qizNxTBzdOTj7ZgtRH33jdXlxtd4GTfo4NY+VNQNRPiPd37KfdFLwxyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xZEbYJuiqAEmfWzwwBWYGmvrF+bVdL42cX97Jy2+Bwg=;
	b=FmiINwpU7A4l8HNJmZjCR84JQYHIy1d8VKLl4mT/6/C8qMW5HUlWUB3z4Z7fj3qPKkBT
	 rdKXuRBYDJjbwPNqSROlDOQOfLeqUU9R9BxU0BM9/iHvkWySSgFUD+FPENDddhzPMQ05U
	 d+uqvgErX72bv139UvMbEgsV9FUFKS8U2wc5GLBeEXOcaD8khUBHKPx9sFRl9HaFq4EuH
	 5gSmXpvxIpO/IalRjJAQEM34vH9/vjgi+I38DqTeLKgrexknomxECrKzmLye8oN7bhhUD
	 H2MwqRlkpOViRuZRYaWCym2JEFA3ZeR4tNs0qdgj6v6OpFZzJev5nixdQ3uVJr/uFbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UGuF96BO;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4805606A31D
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 09:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4805606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UGuF96BO
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so17497985e9.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 02:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793007388; x=1793612188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZEbYJuiqAEmfWzwwBWYGmvrF+bVdL42cX97Jy2+Bwg=;
        b=UGuF96BO/EuJ908f4AhL0jvn3+rdIHvpEwN2Q1ood6dqwA2CEIRBNTpveBrSaMLP1+
         +c7++5xsTyMXJtkZs8+G7AuHPvnOKcvQTlT4tx7OboTeQPBvm0Kvy7tEiF1h9kKAQh/S
         JBDu9bmVMC72RKP/Q8BMszrVhfownxcSR7rjJRU72w8+piehuG7/1WQrZD3eIEkNXUf5
         p71pgx+MoqRL7QcKRwYrMAha/9qwZasvo6ag6Tmw821LKUtLjQNrVUG4jfVsxrH3sWtY
         4swGptsu7JweC4UX09rEX335MlDfJcg7r/iJjK70WpPN3GF+Fcxk+V0GIyI13+GSDIwc
         3G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007388; x=1793612188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZEbYJuiqAEmfWzwwBWYGmvrF+bVdL42cX97Jy2+Bwg=;
        b=Jy3CwzOr5uQdMx2bxISGVbewTc3lpWPaW7QVlLlzL0bwJOxHy12hJkKsqZADkseF46
         5K/0i7IEoMHzJDt3KJaM2k8/XONqjoKa/v2uGn4EvB3tHV5p2/g7lbnNOx7NcaBNmNzL
         Mt8HKJnTr4/F0psXsw1JcMaKGWPKLT7yd/65CYX0X/fKB25ZY7HJ4ayBTP2RBlWNXbeo
         0EbIjwSmsF8RXLfs1vAeUruWHDpMg47kN1tbOU5Q7iauWTLWJTv0R0CPRJTS4FfDT0cJ
         oYECN2jfu6Jod8yGDL6fYnIQiOLLWwGpmtPImxplW2gx2/BgQW7hsDUyW7Ru708MlClb
         7n3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwclAD7IYDSDas7RHYbQRMkaSqxBHd4MYlsdo5gt+z7VO2ahG9gNS27OI/+n7y9R69qFWgHkYBgq7E=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5129WdMmozFKF53PTuZrUW6PjLaiFHG3+C6MB3O9w+C+0LgvR
	ZHh1BEw9dkwrx6+qzfMCUBciav2w8M4k/VNMqetRd5tutdCB+lxcJVhZ9g9YSfVomHM=
X-Gm-Gg: AYBFou17nfR4JbcESIjV9Orh9PyB2vnLR7TCopqpeZIQKoM6rP5/g9y6aFYMS6sKKZk
	LxJJYoWNj6lR4u+g9cbmdmIP2yFXCMlEH0FnAMog13GlcYWmWH9DzL6YsR1vHiIld2O5NTvpbII
	2DgRSa5QKW+q9odhL5AT9E53CLZVicVYMrilnSyNPKI/t2mCLGcCQ3eb22DFdr0ocT1kQlZ6qlP
	uZOD+r104+2HzOlsr2f3//cP9Ql7ijIFO5DYAJd8o66mGV61zCXmG81aKA9vXSPksgPoYg53QD6
	u7hdF4HTikS/9OXbgXR0/YYeIc8/LMAP6zkwRS2/OKoxYYCnzRArLZI2EV9ib09vMobmK2mY3pL
	geJJ9P/Sz6sMNgV9tM/0iqtQCUeV7S1oYFji9oAiyYPFdlhiRTGYqOMKprHAo9ODenUfP0o+8ra
	DlkDFTT4hmGNknIvyZsiaQ5kk6bl75mDoPPaB7iL6pvHsOT8x+Ta44WkNJNTGZR2g+BORFh4wk5
	bNV4UqHHq8pNkTC15n7yPtaTqgPPcrMR5dg6NJKtU4f8QzMfE1+4irksG3s
X-Received: by 2002:a05:600c:6749:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a35ad01261mr104560415e9.2.1793007388160;
        Mon, 26 Oct 2026 02:36:28 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bdd59sm118131875e9.4.2026.10.26.02.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:36:27 -0700 (PDT)
Message-ID: <93c294c5-157f-42bb-9940-79082ac37c74@linaro.org>
Date: Mon, 26 Oct 2026 09:36:26 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] coresight: Add pmu_pulse/extout_pulse
To: Amir Ayupov <aaupov@fb.com>, Daniel Pereira <danielmaraboo@gmail.com>
Cc: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261025063846.3112301-1-aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261025063846.3112301-1-aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/10/2026 06:38, Amir Ayupov wrote:
> On Mon, 12 Oct 2026 22:09:35 -0300 Daniel Pereira <danielmaraboo@gmail.com> wrote:
> 
>> On Mon, Oct 12, 2026 at 04:05:23PM -0700, Amir Ayupov wrote:
>> [...]
>>> +  perf record -T \
>>> +    -e cs_etm/pmu_pulse,aux-action=start-paused,timestamp/u \
>>> +    -e armv8_pmuv3_0/cpu_cycles,aux-action=resume,period=1050031/u \
>>> +    -e armv8_pmuv3_0/trcextout1,aux-action=pause,period=1000,call-graph=fp/u \
>>> +    -- ./workload
>>
>> The CPU PMU name depends on the system: armv8_pmuv3_0 is what ACPI
>> systems get, while on devicetree systems it comes from the compatible
>> string, e.g. armv8_pmuv3 or armv8_cortex_a76. Maybe add a sentence
>> after the example, along the lines of:
>>
>>    The CPU PMU name depends on the system; the available PMUs are
>>    listed under /sys/bus/event_source/devices/.
> I'd rather drop PMU specifiers as this is not something this patch
> series focuses on, and examples above avoid them too.

I agree. Making the docs overly verbose makes them less useful. And I 
can't see a use case where a user would get stuck converting this 
example to their own system.

>>
>> I applied the documentation hunks and built htmldocs, no new warnings.
>> With or without the above, for the documentation part:
>>
>> Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
>>
>> Thanks,
>> Daniel
> 
> Sent using hkml (https://github.com/sjp38/hackermail)

