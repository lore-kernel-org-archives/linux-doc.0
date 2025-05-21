Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE9E26F46C
	for <linux-doc@vger.kernel.org>; Wed, 21 May 2025 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747843128; cv=none; b=HRvBzxN/UAHJAp/wkj5vuNczcAZIa2/DtgKYK1hHlZjjM/gyXjr+a12KlAhZQdeHrWkViHTRQrvF0ePD0H2SD7VtI0VIQX8IL9SlgzY6vKdwqonuH/+YHtPCgcfOOQdHL4nakrvLcvLPRc0uNF/9uGQApWdYBuAvU4CHEGR1eB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747843128; c=relaxed/simple;
	bh=I9VBBxVFYOrWsTK7GjRldDLctXPPzg+fbuHoTp+4SCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sB2jgvk8mYgMgcLDSBw21avZMa1i5ja7VE9RpRPTEL2+v5jZKJdY4hkMX4Ox8br1hO3CbKg+JCBafdE1Vq28UNLY32ae4dOq7KRXsvuThjjbDApnhE+HYDtaKZlohcLMvHdMBhyblWaspigjqKS4Rh5gBRB/Q87p5CDMr7GcEmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h6hrAbYx; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h6hrAbYx"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so42770845e9.2
        for <linux-doc@vger.kernel.org>; Wed, 21 May 2025 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747843124; x=1748447924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7jGMaRN9DTvk91Wh6QyGZY6sK/KJmkltlvMirfVWYJg=;
        b=h6hrAbYxPLcQy8VKLANuehUMWTeH3kchwwt/Ziv7rjzpaLz/DEp8cQE8torhel0Qvz
         Ob1lje5u0MZG/Uw7QWb/IaH2BnyuIhzYiAAa3KvUlOd53MAlb7Crxa5NiWPrWfhz8MUP
         GsPJoBEIDSFZDw0uziIZPzR7g17niLjHxy7Q7ns/mRQhdTXW9ZlO8ELHny+RkGDpW3jw
         u5gLLJ47LnDjKF2gEUwQQr+GE4wWUNxrmo+uXn9zZGoDcJrbwziJPsqLeqINhhuwZOL+
         gxGqYOY93xiGMP43iLx6MMCW9dfG21kiiISGi19UXE5jXQzbUkx0xVAIH+pXLOhkAHkz
         WPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843124; x=1748447924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7jGMaRN9DTvk91Wh6QyGZY6sK/KJmkltlvMirfVWYJg=;
        b=AOsMqlybu8F3ZK1EhzLveN/+oMHcYvOVt12S6UtTxpFL2e6oOEk8Yfdsb94eVkaH1G
         anjaaUfh9GtXW0afr/PUIyBbf4ba1Lhv1KErpt7mdP23eyECGtWN3+UCASpQ/CSfbfxW
         C9v+6wgF+OnA/3OCmJo0RkblaXVLBIY9MP/eAn+lPHIdeY756wu3YVB9tzG/SDszaTvG
         /6tUAWIZI2cqvv5nsKJf1YXGyyxuN0ljztUeA3euKL5DIl2jiE1eacZx/VeTWrj+pccf
         fyT7x6RrSNrbRFxKdppOiJx/Imqb+kESuONnVUoyWDcjBmz+0b4qjinOOsVHa+y4DI8r
         T1gA==
X-Forwarded-Encrypted: i=1; AJvYcCXOtpEtwAP/4w6KY6+vI9xZKiWrKRTk0rHiZcqo0fTDzy326CburigUFQxwP1Bcak3+uWNoq9VcoZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHRnIytF4VvfLYK4eJvcbINfHtnRrSIsaZTfLdIRonGxpvaYtP
	1EsriD6x5+MnAl2CmVPqdEsVIl5Lnk8KrNRcSeGHXN5cyANwZngKH5JuIAaRWlRkvH0=
X-Gm-Gg: ASbGnctEK4vPlNtUDSdSh/Ou0kq5Md2u3VprENxfcCsR05o+kR76TYwsoqC8DN8+2Sx
	cDu6lbWUCTWx4rBf/IrRUfEPmCUX7QXp7y71BZ63DCX/++DK2SS5GpLMKgoh9UabyRdxukzTsaN
	vPVv2Wr+wVUxA7m1wm5WGy8K2034lGn+NJDfhcMA0VARMyO0Br323DYvK+e2ZrcJFEKasf4drzA
	+f9GuV/77sSs3rQ7i1yGRXLGAYZIbGmJHRyUAyQ+9LQozRR+vdii9AVLDdU/nKHHFxWZhG/ecgn
	KaOuuy/MjvLH0Lg9FMYaxHSQp8I3LzTIXCCdhi9K4/Q3ByB7tJdF2SY+eKz4npJK/Ak=
X-Google-Smtp-Source: AGHT+IE94Qc/sbvf18GBZCQv3ZQ8s8ZqdtBvtnfrv3gSKGcbnewhx8YlU5QP8S7QSIUDnlJDrBopzQ==
X-Received: by 2002:a05:600c:34c4:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-442fd6752e7mr217340645e9.27.1747843124389;
        Wed, 21 May 2025 08:58:44 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d2ddsm19933864f8f.7.2025.05.21.08.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 08:58:44 -0700 (PDT)
Message-ID: <119c9a70-6ea8-46f0-b877-8a433d97ce84@linaro.org>
Date: Wed, 21 May 2025 16:58:42 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 4/4] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
To: Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org>
 <20250407-arm-brbe-v19-v21-4-ff187ff6c928@kernel.org>
 <20250519150621.GA17177@willie-the-truck>
 <20250519215651.GB2650608-robh@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250519215651.GB2650608-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/05/2025 10:56 pm, Rob Herring wrote:
> On Mon, May 19, 2025 at 04:06:22PM +0100, Will Deacon wrote:
>> Hey Rob,
>>
>> On Mon, Apr 07, 2025 at 12:41:33PM -0500, Rob Herring (Arm) wrote:
>>> From: Anshuman Khandual <anshuman.khandual@arm.com>
>>>
>>> The ARMv9.2 architecture introduces the optional Branch Record Buffer
>>> Extension (BRBE), which records information about branches as they are
>>> executed into set of branch record registers. BRBE is similar to x86's
>>> Last Branch Record (LBR) and PowerPC's Branch History Rolling Buffer
>>> (BHRB).
>>
>> Since you picked this up from v19, the driver has changed considerably
>> and I presume you will be continuing to extend it in future as the
>> architecture progresses. Perhaps having you listed as Author (and
>> crucially, in git blame :p) with Anshuman as a Co-developed-by: would be
>> more appropriate?
> 
> Shrug.
> 
>>> ---
>>>   drivers/perf/Kconfig         |  11 +
>>>   drivers/perf/Makefile        |   1 +
>>>   drivers/perf/arm_brbe.c      | 802 +++++++++++++++++++++++++++++++++++++++++++
>>>   drivers/perf/arm_brbe.h      |  47 +++
>>>   drivers/perf/arm_pmu.c       |  15 +-
>>>   drivers/perf/arm_pmuv3.c     | 129 ++++++-
>>>   include/linux/perf/arm_pmu.h |   8 +
>>>   7 files changed, 1006 insertions(+), 7 deletions(-)
>>
>> Do you know if James Clark's tests [1] are going to be respun for the
>> perf tool? It would be handy to have some way to test this new
>> functionality.
> 
> Yes. I dropped them here because I've been told by Arnaldo in the past
> to send userspace stuff separately.
> 

That version of the test was out of date so I've pushed the new version 
here: 
https://git.linaro.org/plugins/gitiles/people/james.clark/linux.git/+/16e4a18c2d5fc53736f05c9052b1d11d74909707

But I'll wait for the driver changes to be finalised before posting it. 
Or Rob can take it back into the patchset.

