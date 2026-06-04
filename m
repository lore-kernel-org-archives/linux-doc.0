Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FB01F4611
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579310; cv=none; b=SVz00z0HZXIXT8jji1FpMgQC/eHnUJ0PleH8ZqPc/9Me3wZ0nWrT58qLimN/nRNts12So6EtThVLhXMBVZnPgRlfNqs8deyBuTKUjCW8Hs3qSjW9k7KLw60luN+p//OHVTBlxAi7UH1WEB6s84QxcHLBY7X+vo7Woe9pfVt+2h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579310; c=relaxed/simple;
	bh=R4Qd1UZS19xLGwI+6b1+VkqpzA2WHtPOvF+YQJ5gNJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bv0q4IJiASSNbdu7BLaldCy+PB/i2r0B4P1pV02q5gjHzOMJ8D/hh4fkHHHRflcZX6NC7k7EiRVxsuGUceIX6iP6lYZElUh7I5SZonS2rld+06na9tojP5qCHhiW2XdSiB6R9DioaAQW3ym5IVo7DRz5OQQUHWAJrOKvytaBANg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zgdatk9A; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zgdatk9A"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490af320e2aso8744525e9.2
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 06:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780579307; x=1781184107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nAM+rRAaT8WOAGvky0RLKEaSXTjKAfYZq1zaY/oNR/s=;
        b=zgdatk9A3+oqtGDlof2gqUaumIx3TxVlLl8puY4sp+C/Ochf3ibjtlo/W7l7F7RWFg
         p8uEOUytpU9BDswUnxP/aj4vj/wjsIBW0ldeL4wVBdMVgf6wbg4w5lJw6tRyuoCxY8ak
         nGCi8EhRaw85AezttRakyArgGArfjKw9LvQuWkJFPRdFKhLlHeGXLnxEieOM88VdygVh
         OGEe1EYOAeWxOC3kl0fPbSygiybBRYmvRHaomYzuSEAPgpdrgQPhRQDhqKheGEE6q0i5
         t0JphQu/b2RRowWrJBX6U0TNsIJW107kObdns8aaONWV4QHE2+PeiW00Yk14SuuTvRRS
         lgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579307; x=1781184107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAM+rRAaT8WOAGvky0RLKEaSXTjKAfYZq1zaY/oNR/s=;
        b=SuvwKIknibieFKpVbVKUIHyxbGIMn5BtxD88bzjvRcFa0gNxlyl7bFiuv+MylqtGh6
         qu9zjCUjQzLI9sjYA3WALLmTIAHFOqGHu0xnqThWzj6hkkPTgsVGzzbZOJ5m/5+fcceT
         aURro+2S9JKSJsSZbemSyQkwN3GAN6ZXzbeayGIQ7ZGnNIff44UPqkbPUx1mza/qngRw
         +UxwHUwSQ0Law6Ocoww6TVlrGRaMVZAFRR6nB1mXD12U5ZsPobOpQoR4E7Gq9+XrEzqP
         4dTEhGxwmqBRCaD6TrQkA3oV0Q9MGSOmkbcpbUb/gYIl17miy7xBRjH15mY/Tp6O2KsZ
         qEgw==
X-Forwarded-Encrypted: i=1; AFNElJ+5nulcDoObX/c25GBA/LKgHIU5BHXwgsxNpa6Z0klNSAJcMw/Ju1R6IrKJlLqTTPfs+ye4NJa6BVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLgj0RtAPiKC5I03K4tlIovkhq0Q5mFfB6ZzF88EZsdqsAF00V
	gyZG06HPgrgQqSD4BcagTwvVqkheSD0lrdkDVfFfr+cCaAVS/ZVaG+Hq7JTrSCPeH0I=
X-Gm-Gg: Acq92OHIme8amzzzyO+KMg6ImJNay1kujn3pjv50WAFmOoLPg3fgCmICaQQ8PL89wYT
	ip1bjOwPP37YZt/VzwxK77EJY74rXvuqy7S65d+qutKkS6T8k3u82G+edyNf5I3PePypsptaYh7
	uG2xuyGIgvVfY1nHU5dzG3KsWetr447+A4qolzmAWwnt1NIz2+ZTuroGMueGMWIZonncCSFlAo+
	5c0UgiBCfjrvLldXDLjvs2pahfHWQBeaYHnvDT94bSmA5J5ekRNS/vP/99EmnG+LOzN+s3L1CNc
	Zec7pUQl3SOCyA8Ly0pCJIucoeX0+WGtmlxz0sQtMLms/J8Vqe+28L5smmm/2eX2guBMhZqGRKy
	e5/f8jZ3ZwioJycmC8+QG5/9Vw14K4XEZ/mado/ACTMPRkFS+AslV/xkReuOdOiYpKF+sIAqLQF
	cNYXHhUo+7MeRy9LclO4Sk7s0TSjnHOSpkrIJ2D/c=
X-Received: by 2002:a05:600c:a088:b0:48f:f64c:c2fe with SMTP id 5b1f17b1804b1-490b5ee1983mr137859005e9.22.1780579307027;
        Thu, 04 Jun 2026 06:21:47 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc391aaasm83198855e9.1.2026.06.04.06.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:21:46 -0700 (PDT)
Message-ID: <f0758b1d-9b04-4e81-aece-ea021cabb95e@linaro.org>
Date: Thu, 4 Jun 2026 14:21:45 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/18] perf test cs-etm: Replace unroll loop thread
 with deterministic decode test
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
 <20260602-james-cs-context-tracking-fix-v2-6-85b5ce6f55c6@linaro.org>
 <20260603140803.GV101133@e132581.arm.com>
 <2f1db2b3-93e8-4c32-b207-304e3a43ce77@linaro.org>
 <20260603170823.GA101133@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260603170823.GA101133@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2026 6:08 pm, Leo Yan wrote:
> On Wed, Jun 03, 2026 at 05:01:02PM +0100, James Clark wrote:
> 
> [...]
> 
>>>> +# Remove open brace lines as they may not be hit depending on the compiler
>>>> +sed -i \
>>>> +  -e '/deterministic.c:8$/d' \
>>>> +  -e '/deterministic.c:15$/d' \
>>>> +  -e '/deterministic.c:23$/d' \
>>>> +  "$tmpdir/script"
>>>
>>> Is this related to the function definition?
>>>
>>> I can see the brace lines with change below. It might be more reliable
>>> if adding unused function argument, which can give chance for hit
>>> function entry.
>>>
>>>     static int function1(void)
>>>     {
>>>         ...
>>>
>>>         return 0;
>>>     }
>>
>> Originally I included the brace lines in the test and it was working even
>> without function arguments, but Sashiko mentioned that they may not always
>> be hit.
> 
> I tried Clang to build the program and can see the brace lines are
> missed for function1() / function2().
> 
> Does Sashiko mention any reasons causing the issue?
> 
>> I think its point was that there is no hard rule about debug symbols for
>> open braces and the behavior might change from one version of the compiler
>> to the next, or whether there is a function prologue or inlining or not etc.
>>
>> I don't think it's important to the test at all though? So to err on the
>> side of caution it makes sense to not test for them. Unless there's a reason
>> you think testing for open braces is important? Surely just testing for
>> actual lines of code appearing in a certain order is enough.
> 
> As the test program is named as "deterministic", wouldn't we expect the
> test to hit every code line run in the program?
> 
> It is fine for me to skip some checks _if_ we know the reason. I dumped
> the disassembly, it shows function entry is a distinguished position
> from the first calculation sentence (same for both GCC and Clang). And
> there have no difference for a function entry after I tweaked the
> function return type from "void" to "int". I still have no clue why
> brace lines are misses.
> 
> Thanks,
> Leo

Seems like the compiler is free to emit a prologue or not for a static 
function. Adding an argument might force it to for one version, but I 
don't see that being reliable for every future version. And I don't 
think we gain anything by testing the braces.

Testing clang did reveal that it returns back to the call site where GCC 
didn't though. So I'll also filter out the call site and only test the 
"dt_work += 7;" lines. That's enough to check that the decode has done 
everything in the right order and shouldn't be fragile to anything that 
isn't a real bug.

