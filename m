Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BF43DA5AC
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 15:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780502038; cv=none; b=Jsvh9Em15beLQaHbRAzYC5m+P97aNMBq6izI4ruPDvAnzd4PU069xlT0hKwmNTvXrIKHK1zIvca9cck8i/tA931nLXirOlKQQ0SLAQW4hS5vH3SdV6TvX7mH9hxjqiDjrtjvO3kutsB27vu+4q+Oawpj9+nH+61Q/9Fttken2M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780502038; c=relaxed/simple;
	bh=YyHIKl0YFnOrf4b3X6aHRwQh3XkLsdrmrGiOM+ixt8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuOUFdNo0LLsMYFsP+FeqFNJDSQ1r458KmPS4SdQDGIfo4MGyiECxsBzGYF8VM8u+aFW1e2G2ONtT2tbPWrp29VesxD6RpwB9pj9rtS5kB+Iw4HZYGd4vJ+wUDJcDss9w/mXjdM4mnMQV6tMw3ta9xOOMeLlyuTRcYCNoTUPjt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H2gylKza; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H2gylKza"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45eeea039ebso3087877f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 08:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780502035; x=1781106835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WeNxgthX7RDeq1y4GZbJjfxu5vLqCNfeHjKxVMHovlQ=;
        b=H2gylKzanBFzLlh0QwLhFCoTA9kmMu3xckPfj00m/AgWY08AMjxKyC1tbGP6AclfHK
         f6TqEp9VWlEqppmCKNjh1j54ERThV1uT3XwIr1S0UZqxrf8dJJKvNcHMWpTDcomNdDQT
         1ugep2Umk0xBkrTavpX9EezveY2qnMdLmfvob/JzOcWCpNhaVgJnTCClBZYpREYU0J4W
         QP4QxYz0US7umplCbTx/sxwVHNmdJ7SxmFYTzRGf4odh2x/OXtv9GSeKpBUmKODYnMMd
         8tNawXfMv87ZsCsx89KD1c2PnM4fPWp5r+plId3uuSdVa7ykpV3QOT+Ct0pL9Ep2VF+H
         Ttsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780502035; x=1781106835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WeNxgthX7RDeq1y4GZbJjfxu5vLqCNfeHjKxVMHovlQ=;
        b=Z5gan91MvJe8Qf+mXJpARB8yyo/XasxwJ73LSkNVd7gyrraveefurPhRrQs6io5Ftc
         oWDw0bwZvMNGtzv72CcKMR05trCxiXg+g96fszrKr/FsmZO84zziDnqn9LCznk8LLYGf
         h3QzOqCzXx1z2iu0R8vD8kGqTvFmWfqlvmHj0upVQ2YmUlyUZV9WthXZ8jYUDIUznYy+
         0xGe5V0AMllbCtEaVM0ZJL8yzwcmyvrnrFnqzfoGCdZ5T9+caqEhl6wo/R2i2yRNj4pk
         q1LUiwzVYHlX/Zh0KzuU2nowMN9uT291A5CIKj2vZRMMuhzrwhGa5NZyyep89zUOdBvn
         cIUA==
X-Forwarded-Encrypted: i=1; AFNElJ+QEFcE/VcoaqxU5MxhZA6NWELXgPbcmwPeD1SOeF817uUxZoGZB0u8+CVu4mS7RFxHIM84lyddkWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDvIwKR8I26RuIkLjaDzo/JaCJ1yMVStcArMjnzJQMiKodEb5X
	YpuNSFoFOmJqkKOyFPiG7hcW+F8Jc56pJGMN2adkZF2hieOVnOnuW/GeJiktQDVIZVk=
X-Gm-Gg: Acq92OGTm/AxL9q2m9KjvXLtjM3bq/wIBDOaEK16H3v8NBK3oWXXfbA3Srl0ZlQxKkI
	BtuLYlbt3t3HPfJn1X3I+i0uhitQSSZeteD2Wet21ezC2pcWf7EZtHvFr0u7wNdm8ys6UlRgqgC
	EZZ+ABQOk6L9jVdRz6Hj48vmP5JDROC7Cggtsktikjp7vlgkj0F8PoahO0Mh6/iSMagJBsq9yVu
	F+d8SsE9eBnm0H6Dk+lffusYHi+fDZtbbbjdrlHe4OhETGKSDYVHqwLnxENBiGol7lMrl3yTR0O
	AA+/W8aOX9qaiJyJ2yYTJHr/VmS/901uuL4VvnoF0n1o5bODgGvC9++yG29tdaumLyqmgknzM2+
	+MmHIhdq7czKhH9b5y3+ndVYUQ8pOTbdKNLzLps0YATL8GH/9zm364A2ELKShuCqIdsjkHyHusI
	FbKtNXD7bujIeUuVgVrIM/6Tvo5ygheI5Koh9ltGE=
X-Received: by 2002:a05:6000:2990:20b0:460:25f3:b25a with SMTP id ffacd0b85a97d-46025f3b73emr1462864f8f.34.1780502035457;
        Wed, 03 Jun 2026 08:53:55 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm8692402f8f.19.2026.06.03.08.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 08:53:54 -0700 (PDT)
Message-ID: <9b149f11-3e05-4871-92a0-d0fe1ec49357@linaro.org>
Date: Wed, 3 Jun 2026 16:53:52 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/18] perf test: Add deterministic workload
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
 <20260602-james-cs-context-tracking-fix-v2-5-85b5ce6f55c6@linaro.org>
 <20260603112742.GT101133@e132581.arm.com>
 <b4836fe9-49cf-44c3-96a9-548e890cee29@linaro.org>
 <20260603134339.GU101133@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260603134339.GU101133@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2026 2:43 pm, Leo Yan wrote:
> On Wed, Jun 03, 2026 at 02:10:37PM +0100, James Clark wrote:
>>
>>
>> On 03/06/2026 12:27 pm, Leo Yan wrote:
>>> On Tue, Jun 02, 2026 at 03:26:47PM +0100, James Clark wrote:
>>>
>>> [...]
>>>
>>>> @@ -22,3 +23,4 @@ CFLAGS_brstack.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
>>>>    CFLAGS_datasym.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
>>>>    CFLAGS_traploop.o         = -g -O0 -fno-inline -U_FORTIFY_SOURCE
>>>>    CFLAGS_inlineloop.o       = -g -O2
>>>> +CFLAGS_deterministic.o    = -g -O0
>>>
>>> I have no strong opinion for using 'noinline' in source or using the
>>> global option '-fno-inline', just thought this is not easy to follow
>>> up if anyone (likely myself) will write a new workload for disabling
>>> inline. Could we have consistent style for this?
>>>
>>> For the patch itself:
>>>
>>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>>
>> Actually it's a fair question why some have -fno-inline and others do it in
>> the code, it could just be copied from when these were built by their shell
>> script tests. From a quick look I would say we can easily drop the
>> -fno-inline and do it in the code, and it's better to only noinline what's
>> needed rather than everything. But that's probably a change for another
>> time.
> 
> Seems to me, `-fno-inline` is more reliable.
> 
> I.e., in this patch deterministic() has no 'noinline' annotation, my
> understanding is the test expects it is not inlined. With `-fno-inline`
> flag, we don't need to worry anything is missed.
> 
> Thanks,
> Leo

Ok I can replace the noinlines with -fno-inline then.

