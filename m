Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796613876BE
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 16:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780503183; cv=none; b=iVheHMFHzbfuGvRA35pkm8z3aKh1o5E1Dr1eG0TPc8OrV9eisJqgf48CQhW6c93gLbDUaZ6olF3FSdCX9na3+SaLGsRnzz+ryVsNHN0QaYvFvV2kIW6Jj6oj59qCdFfq6PZAz1s6wDwpB/QM8uZcA4ossuqUTIzylEXMxhAoCjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780503183; c=relaxed/simple;
	bh=+GWdI5GaapuuPFkF+1pWn80E7RwfKlyV8xsbbbZwENQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jqWq9Ii5GTKlRt04A5bsMkIFkK3wbmxA9p/EdJeMMj9znKt3vBBH8lB2SvFsmOG2dWyi39kxiC7f406cCzPIQ2Eff4cDhIgDL4w3lpzqMTqoVAUHAbkohfihLlNm2VeasGTd420pP2i5+eVlYocI50wpqXr0YJGNvqw+yNkvOhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=riatndP2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="riatndP2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b3e03939so8586715e9.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 09:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780503181; x=1781107981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UKULipB408ValDz8ua2CahzCEdZz52u0U+4kqUbz4QE=;
        b=riatndP2zNdhheLMEwL7VGYbzX2Iy7YfvM/aw7VA5Bofg20hjX1FxB5C0BfjvAtQb+
         VghOksLuXAq6U5KKp6YTDoTGrV3rY9QdtU/fyefANqSNBbuGk2Sz3Y6mNOpfyTY3B3rW
         7VNppayma/4m8Q5dLSH8KvFAbRZgs+a9P+DyIm4LTiyOuGUShFyVcCBgaUZ6Aewy6RZu
         aSAI8z3iVVp0YERQvmUtf7N6EJu6mPe5apBzB9RplthQJEtIUyay+uirxjr3p2PC72zF
         e/vO+dWtZXa9DAk8d9wcHTcKK6O3vMZYDLy05oaVG6L7KmA388uvEPQcRNVuP1leW8+o
         8N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780503181; x=1781107981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKULipB408ValDz8ua2CahzCEdZz52u0U+4kqUbz4QE=;
        b=RlBxionnkdoHeOJy4iaHiJJCA/0BRpfm020EknuOjn/I5IL2nZ3BZoucmS6/PGTKel
         OgO8vYWRA9mU98YsBsw/6GYckjGubozvVD29Vu6jr1amF9xOkpVB8qMasSdkFnL+xyiZ
         U00pdK/QljR4u8+2BjxcPOCz4K3mxncGPH2FDqj2iEtaaaEWE7AkgM6wYRPmyTsrfWlS
         NAdQuD1/ln3ySqNGCuD/kfkKyyJT7t25pNrgKAy+vyvkPkWV9H3PlSJPMWbqIeMsqcmF
         aryGSgEZb9iKF0x/oWEblji9ZKKSuzvMwIk9D9bQOWinKkjgEh4tWf6pXivzr7uDRSZv
         /Nxg==
X-Forwarded-Encrypted: i=1; AFNElJ9Yz6/nyWycIbHmRmioG84lZ8bBEnIZD0QQAO4nGbn3RWvc/rC2izyEotSxhJB0oDoNXNuQYU06iX8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq+T3eK0UUrJ7FuRwMSC18g26NdgnaTvR0QpWM2e0tn8js/7X8
	k2/ImImZAJ3OkERnRA8JTg7rX5Uyfl42RJiN0LpnkbbkfYglmW2vg2w/FyOPzXzpjY4=
X-Gm-Gg: Acq92OE95/iS6ulTxl9vbeeNVi7OLsWFaRIerjh5e3/qRMgfWoTQ4Y4ucrd4r2KYRJm
	6Lxjvwwl/9ED/ElE0nL8pyNjs6d8EFFzG+0D0jb2F7/EtKssx1FGt2YRBACGcm3vFQqlxe/5Pwz
	zTodRJ9V1hAyJqJWx8vMDdqBSE92OkElxvBygqUHoBWErS8bDrDyZ7TPEcMyIQJXHl3wFe1FpjD
	StNffH0W88aSwD6ZB5VUpUp0m9MZVJpU5u0cgvvB0wRLs1z7KtR+OAYnH5YtotTOy1yRMkWxv7J
	IeR1Fu+bKVyVSRWJKsyz8aGJSTbi15lYUTGoycx+Afbuz06MJo7Z203V0FAmMIPwk1zmvsxbA6y
	vAAdH4rsuUzqQblT22wsFcJ2JrSBj2WdJ//obhlRX1jvmSSKV1QO//VISs4I9Tnia7GQJDgSAYI
	aqzf//EY5Jz718eiJ6dwsHji1ln05VTE2b9T9gB8Y=
X-Received: by 2002:a05:600c:810b:b0:490:8b0b:d3b1 with SMTP id 5b1f17b1804b1-490bc4f9846mr622895e9.12.1780503180885;
        Wed, 03 Jun 2026 09:13:00 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7a7cb85sm70950515e9.1.2026.06.03.09.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 09:13:00 -0700 (PDT)
Message-ID: <5e29907a-2533-4540-833f-977c5f0fb90b@linaro.org>
Date: Wed, 3 Jun 2026 17:12:59 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/18] perf test: Add named_threads workload
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
 <20260602-james-cs-context-tracking-fix-v2-9-85b5ce6f55c6@linaro.org>
 <20260603145415.GY101133@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260603145415.GY101133@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2026 3:54 pm, Leo Yan wrote:
> On Tue, Jun 02, 2026 at 03:26:51PM +0100, James Clark wrote:
> 
>> +#define DEFINE_THREAD(n)						\
>> +noinline void *named_threads_thread##n(void *arg __maybe_unused)	\
>> +{									\
>> +	pthread_setname_np(pthread_self(), "thread" #n);		\
>> +	for (int i = 0; i < iterations; i++)				\
>> +		named_threads_work *= 3;				\
>> +									\
>> +	return NULL;							\
>> +}
> 
>> +static int named_threads(int argc, const char **argv)
>> +{
>> +	pthread_t threads[MAX_THREADS];
>> +	int nr_threads = 1;
>> +	int err = 0;
>> +
>> +	if (argc > 0)
>> +		nr_threads = atoi(argv[0]);
>> +
>> +	if (nr_threads <= 0 || nr_threads > MAX_THREADS) {
>> +		fprintf(stderr, "Error: num threads must be 1 - %d\n", MAX_THREADS);
>> +		return 1;
>> +	}
>> +
>> +	if (argc > 1)
>> +		iterations = atoi(argv[1]);
>> +
>> +	if (iterations < 0) {
>> +		fprintf(stderr, "Error: iterations must be non-negative\n");
>> +		return 1;
>> +	}
>> +
>> +	for (int i = 0; i < nr_threads; i++) {
>> +		int ret;
>> +
>> +		ret = pthread_create(&threads[i], NULL, thread_fns[i], NULL);
> 
> Just curious this can be simplified to a thread function, like:
> 
>    noinline void *named_thread(void *arg)
>    {
>          char name[16];
> 
>          snprintf(name, sizeof(name), "thread%d", int(arg));
> 
>    	pthread_setname_np(pthread_self(), name);
>          ...
>    	return NULL;
>    }
> 
> Thanks,
> Leo

Only if you don't want to check for symbols as well. I thought if we 
were going to spawn a load of threads and look for thread names we might 
as well check that the symbols match at the same time.

If all of the threads run the same function you can't do that.

