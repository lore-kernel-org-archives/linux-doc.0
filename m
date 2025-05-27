Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5B4283FD9
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 17:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368668; cv=none; b=tvpgDG6AgG2WU1GKVwqsJtcxIS5ZeOKSas5uoN927UE5LB5We+iXXuZJaFktZckjP2WPeKCSXXDCLOt0JzHERYy+hlJwaApUf5+q7rhrSnvAYO8ganeQ9gIEP8SUE+L4v/YRu0IhRYaFQXyWXZ5TwdHCuLnQHXJ6oWbgdSu8yQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368668; c=relaxed/simple;
	bh=Pba0PHIEYIGNrf6XjJ6nlDeAkd8emTX4pz2cTHqOo1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdxf+l+AP0Qlevf4h5RE5xKEvpVcvO1A974a7vWhKbSx6148souVwhGplfEtEITs8F8GCcWfY3DDxLBLAo65zEtZXQd1pva7ul+J8V1tGvlPR2IGpleF94l8FI0q/QCAI650Ks7HZYgXnWCDVFlNIDx1aERwFj9aK1cUrUddEGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AcKh1dl0; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AcKh1dl0"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-442ea341570so27014295e9.1
        for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 10:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748368665; x=1748973465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K66IbQMbjje707cA7mD5l9PP1/zHD1PIxR0a5Pb7bKE=;
        b=AcKh1dl09BJNIrEtzO5y7K8k18nGIPCE0WjRxjU2h4vbth9eLkCuPykk5CpWMjuKBw
         ErbtEi+Y4OS7Wjjw56BGtsDKYnemLCy1vzp6WuBauRVUCcSWmcdfxMibegATfMirNwgn
         i7KARmrXOvpBN97SpVVor6TGV46mb4LQPpYbaZuHCVs07r1qjAQVnp1rltm8O+kzLVE+
         RzsomXZrFk36qXsStK2SeaNK0+VMtUk2eWKBROyvqkMmfSqvm9bTGIpnrfsOQDTrQIdQ
         vFJWy4LqP3LtCviBCvAtx079WfmjwZqnjLIWTmocN0J2lO5UvUA+Kyccjurk2ABBqUeV
         sTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368665; x=1748973465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K66IbQMbjje707cA7mD5l9PP1/zHD1PIxR0a5Pb7bKE=;
        b=ZZALXefOSsJrF3cmG9Sgm/VVcgkt0b5O+viNK7mxyD/ukqtodQd5GPkYnC1BQtL3K+
         C0Z/AtAfBpi50eGiQ63zbH2XONsHTbEWsWU1y96qHWpPDZO5CUAQoJzYCJ72UFR1/6/e
         /CUWgoyo1dmGGOwYyMTNFFLkXrksR/5fZHcjD37/n9HXadc4M17BG1KKVLWiKWjb8c6R
         FNlkVyNaPSO9S23Ty+FeEglnbDAWpiYomVsgBNkcv3HwwVYdIpcqSulo+QHQ8Lc8jQRt
         QXqK5j53Ws1zsouVu/jV+Rp11INTLW74bSNPDWfs6J5AbKcdgOFwydNfSiTTuBUFY3JT
         agAA==
X-Forwarded-Encrypted: i=1; AJvYcCXFcZPIxx2pjl5WN3fUs85bVbetuDp43r2YUGLTBaNzNlHV9g6KZ7zndDj6/HtxqOgQ6IWMpLaXV0g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0F9DB8xN6MVlgfiAV+mQjAWFsWfBoutxkUDXatg2zsq7UU0Ei
	DrNvI02JydJagDzIO0dQJ4UXjhGRvrwoteqY4ihInyomVJ+fc+XfNcw42Y/RosTSz8Y=
X-Gm-Gg: ASbGncuC7F9txcOkM8IMLzQjCKy+aA11Kwbs6Jmi3Nf16Yic+Ku+sQUFaOBbaQuN7R+
	rZA6P2oDAU1ZPnz6BW7iyRE1QMg7lapKX8eJ1xWjXwLj/5DLmnN031qrNCVr1Oa225RdU0X5XWS
	K+FAB974osi1JtkMH9xQhJBLAB0sP0iUXSntjcVfppX/MKvdZ9ZqLZQawTvLN0aRIu4QM0E6z9R
	U7U7UhJ77TXG3evdEaCMjHL9H+Y8AvzPuUVU6SRI8oYjQA9eB1OUzCuon0mTi4SFPe0NNU151aG
	O1JFr1acRwNwKXYUGOFdwlHsqyBPWw6JIfj+EN41CXZRuPeNwpp7Yu7u
X-Google-Smtp-Source: AGHT+IGWVp+1pe2g72Y3zco5kiY52P50nzKLHDIXvLoqcgNBLuwmb5ic8TmQyg2vlxnYIHLktroXHw==
X-Received: by 2002:a05:600c:1e1c:b0:441:d438:4ea5 with SMTP id 5b1f17b1804b1-44c9493e6b1mr107966315e9.20.1748368664703;
        Tue, 27 May 2025 10:57:44 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29548sm290642395e9.4.2025.05.27.10.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 10:57:44 -0700 (PDT)
Message-ID: <c2393238-d1cb-43bd-b67e-08105a9834fd@linaro.org>
Date: Tue, 27 May 2025 18:57:43 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 4/4] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
To: Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
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
 <119c9a70-6ea8-46f0-b877-8a433d97ce84@linaro.org>
 <20250527105035.GA26328@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250527105035.GA26328@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/05/2025 11:50 am, Will Deacon wrote:
> On Wed, May 21, 2025 at 04:58:42PM +0100, James Clark wrote:
>>
>>
>> On 19/05/2025 10:56 pm, Rob Herring wrote:
>>> On Mon, May 19, 2025 at 04:06:22PM +0100, Will Deacon wrote:
>>>> Hey Rob,
>>>>
>>>> On Mon, Apr 07, 2025 at 12:41:33PM -0500, Rob Herring (Arm) wrote:
>>>>> From: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>>
>>>>> The ARMv9.2 architecture introduces the optional Branch Record Buffer
>>>>> Extension (BRBE), which records information about branches as they are
>>>>> executed into set of branch record registers. BRBE is similar to x86's
>>>>> Last Branch Record (LBR) and PowerPC's Branch History Rolling Buffer
>>>>> (BHRB).
>>>>
>>>> Since you picked this up from v19, the driver has changed considerably
>>>> and I presume you will be continuing to extend it in future as the
>>>> architecture progresses. Perhaps having you listed as Author (and
>>>> crucially, in git blame :p) with Anshuman as a Co-developed-by: would be
>>>> more appropriate?
>>>
>>> Shrug.
>>>
>>>>> ---
>>>>>    drivers/perf/Kconfig         |  11 +
>>>>>    drivers/perf/Makefile        |   1 +
>>>>>    drivers/perf/arm_brbe.c      | 802 +++++++++++++++++++++++++++++++++++++++++++
>>>>>    drivers/perf/arm_brbe.h      |  47 +++
>>>>>    drivers/perf/arm_pmu.c       |  15 +-
>>>>>    drivers/perf/arm_pmuv3.c     | 129 ++++++-
>>>>>    include/linux/perf/arm_pmu.h |   8 +
>>>>>    7 files changed, 1006 insertions(+), 7 deletions(-)
>>>>
>>>> Do you know if James Clark's tests [1] are going to be respun for the
>>>> perf tool? It would be handy to have some way to test this new
>>>> functionality.
>>>
>>> Yes. I dropped them here because I've been told by Arnaldo in the past
>>> to send userspace stuff separately.
>>>
>>
>> That version of the test was out of date so I've pushed the new version
>> here: https://git.linaro.org/plugins/gitiles/people/james.clark/linux.git/+/16e4a18c2d5fc53736f05c9052b1d11d74909707
>>
>> But I'll wait for the driver changes to be finalised before posting it. Or
>> Rob can take it back into the patchset.
> 
> Thanks, James. I just wanted to make sure that there was still a plan
> for upstreaming these separately from the driver. Have you had a chance
> to run them against this v21?
> 
> Will


Yes I'll send it once the driver is merged. And yes they're passing 
against v21, but I'll retest v22 as well.

James

