Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A90477E42
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 13:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580045; cv=none; b=UHq0XuFDlGwxMZaGr5O4od5vVRqjflapPF+XZqgLCAvt/C8+p1lmVqEtq34STHmObvPUD86M4Dj7DlpVXeW77KL2Wi6Bxid4eVUekpCM96jQRqA72w6k4RqSrBDRM3qeS3g1s7SATeQOL0xOmm4eWksuVbuq1SZQxa46Si8rNr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580045; c=relaxed/simple;
	bh=Q+2riaQ4bkpEOGbfcGsgWYBHaiPit5haYTT9ORAITwU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ica0/JUvX6AibeYV2FO87OLapxNf0RPjFDxhqPM9TuEsU2R8KBpEX0uLE5d8Gynu3uJ5RTXvNDu43snDrp+q9NplAx9g6AX7M44f5eDn44Gqisr+75MTVLE70LDwJcn2itwmWyD3WWi0tdqLMgr8NfKPV4S0Wcl1xsmTY6CJx0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BQFA/tQI; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BQFA/tQI"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-46019edc13dso366920f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 06:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780580042; x=1781184842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ue7J7mL4SO+to/BOU4/AYhoa7RJi/0UZqIbNqRbPrJo=;
        b=BQFA/tQI8/d2OKczypwOcm3HGsZXNaEtutbHxYFxwcDcysMaReER/Mx6QAPwRY9r0Z
         Wr7IjlSzy3UUMxH2u1HwDYVzcZN1U/+lHbRo1MUjUvU46MJUkVrgMn3FTVHSu/waEfGR
         ngV/nJAJWzs5rDPsSZlSHOwY4caG6f1YAl80J0vcj65JH+DIVvbwXcrf21h3axQIm6sD
         MbeHUzhKZ+PjkhIF9DY5Dk2e05ApCzVoMmGddPlCyNJK1wBXGAo+m9gDagoZegqXB8YQ
         5WVhSr2OkHNNhCWfKfUYX0m2+hd4675/9sV8usKZgenyuCVZ8PEbxcemZ0CtdMFT8ULg
         oKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780580042; x=1781184842;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ue7J7mL4SO+to/BOU4/AYhoa7RJi/0UZqIbNqRbPrJo=;
        b=LTwbmr2pTVZSrf3S7MODAlWQq+UIaR0iH7gWaPO5z7TvwG6oxOwAsq1FtJjrFnPb56
         967UjaevGymcgj2bF8vcYj3y6U8Azcsq6mW1lVf8VfiwSwic3jtMscejU3R3Wx5y0itd
         NQcCAE9EuMqHxulPzuceiDbDtzHHWJduk9ZccgkFEcCsDiN3xhd455mDMCeqtP3j1D/E
         H4uWQYjqpEyzqHlmBLy9ULq3zAgnzqrZDCFp83RY7eiDhZ8yicr+lDjGZU0JPQStZleK
         gU+VYDN5fj6KeGx40NUw2IxKcRamY5Ps1goHrfs0A58L9xgSTHs/ZbWlJzA7WlEJIUvz
         C2Cw==
X-Forwarded-Encrypted: i=1; AFNElJ+zB+x6ZOr5vOoYwGQDE7nM64cz+dROE2llK6F7CGGXW7XbdlxlZEl3raf4HOnI4I/KFVHF1xk+gUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj0HfJTvAcWXbWzYID4p5d5mjWRAmurFEvY/zKWdS6uO5r1hhw
	NozYAz3QKP3X99rOUiLlzuWkRF5P1sdZocFypYIiuH3KO5d6WLq59zD603zXYf9yRNE=
X-Gm-Gg: Acq92OEjHU/p04+um+kmGp5cRu7kKUUOtEk8in4w1FQ6IsLscwXTlLXtMGRavfrV5Jm
	9vSpQ3ghe9151PFLjAHDtYb9tIfS5tQLkRQFhnIpgf5OLNvHNjfre0mLR4BBokTnx7JCqTDsaQC
	dITmeU8SMri/5YheyUn1UdTRuuczrt9B4QB/XRzQlZHF76fqVWEImrrXcE2BYUxWor+j8R6cT+m
	FLJeZ+UF9Z7yovUMoz6X00ZGtvBHPc38q3zZxAHGPVmL6Z2FapMIZJJiAqHB+3tpHL4922OnF2E
	iG0BHwtZER/XK8grpI5mBb/+sv7YB3mB4y+ZpIR7bpVCG2KnvBcE7r3ue+Ly2Vf5kHSnr2d1ZDb
	uEaTeMj16myglvYhXSkmqDzJYVej/FywqjviwJhQ2xxV26c4vmVk+0c75msXFLS5w3iFsIFO6MZ
	O2wlx7fPJlWuRqk5AEsMxe7EuQAVbRAW5zGJ4qRbr3kZqhCbVPOw==
X-Received: by 2002:a05:6000:1cc8:b0:45e:ed7f:1d9 with SMTP id ffacd0b85a97d-460216e6c10mr9128085f8f.17.1780580042209;
        Thu, 04 Jun 2026 06:34:02 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm27068067f8f.27.2026.06.04.06.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:34:01 -0700 (PDT)
Message-ID: <e7118c8c-a9a9-4c34-971a-ebc93f193fc0@linaro.org>
Date: Thu, 4 Jun 2026 14:34:00 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/18] perf test cs-etm: Remove unused Coresight
 workloads
From: James Clark <james.clark@linaro.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Amir Ayupov <aaupov@meta.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Paschalis Mpeis <Paschalis.Mpeis@arm.com>, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
 <20260602-james-cs-context-tracking-fix-v2-14-85b5ce6f55c6@linaro.org>
 <20260603172546.GE101133@e132581.arm.com>
 <8721d1b4-ce27-4ab0-9a24-138c31440e94@linaro.org>
Content-Language: en-US
In-Reply-To: <8721d1b4-ce27-4ab0-9a24-138c31440e94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 04/06/2026 2:31 pm, James Clark wrote:
> 
> 
> On 03/06/2026 6:25 pm, Leo Yan wrote:
>> On Tue, Jun 02, 2026 at 03:26:56PM +0100, James Clark wrote:
>>
>> [...]
>>
>>> -When you run perf test, it will do a lot of self tests. Some of those
>>> -tests will cover CoreSight (only if enabled and on ARM64). You
>>> -generally would run perf test from the tools/perf directory in the
>>> -kernel tree. Some tests will check some internal perf support like:
>>> -
>>> -   Check Arm CoreSight trace data recording and synthesized samples
>>> -   Check Arm SPE trace data recording and synthesized samples
>>
>> Should we keep the chunk for but suggest a perf command as
>>
>>    perf test "CoreSight" ?
>>
> 
> I put this at the end, not sure if you saw it:
> 
>   +There are a set of Perf tests for CoreSight which can be run with::
>   +
>   +  sudo perf test coresight
> 
> 
> "When you run perf test, it will do a lot of self tests." didn't seem 
> useful. And the other part about the directory was general advice which 
> I'm not even sure is accurate. The tests are supposed to install and you 
> can run them from anywhere.
> 
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index b539be153f6a..7efb893edcbb 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -2751,7 +2751,6 @@ F:    tools/perf/arch/arm/util/cs-etm.h
>>>   F:    tools/perf/arch/arm/util/pmu.c
>>>   F:    tools/perf/tests/shell/*coresight*
>>>   F:    tools/perf/tests/shell/coresight/*
>>> -F:    tools/perf/tests/shell/lib/*coresight*
>>
>> Need to delete tools/perf/tests/shell/coresight/* ?

I delete /*coresight* in the later commit when moving everything into 
the coresight/ folder, so only coresight/* remains. I think that's right?

>>
>> Thanks,
>> Leo
> 

