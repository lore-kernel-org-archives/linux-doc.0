Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFB12FF16F
	for <linux-doc@vger.kernel.org>; Sun,  8 Feb 2026 18:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770576545; cv=none; b=tyi0VPeQabmFc3EPp6mzUeTLiFPoa8P+/t+wNHvI6s9xMxg+CcZTpNDcp8U5AcQeVkKdBFaC38pFpJH/sdzvN3EW+sqbmBMY4Nz7wbzRIc5I9D2/eUoPyYU8oIS9ZgkXRrj8jqjPnBeKcuPXd/NE77BswfEiM+l6lE0yuAA66jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770576545; c=relaxed/simple;
	bh=jbkOKX+7We/ed814ylwi+VmJ5YtwoCud7lki6vAYny8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c2D+To1sLLJLpwYxm/7rVViYyfae408zUML8X2WhfTqiGKxHPTkbkC9YTRFnnfMi4QYTAmUuaNPlwcJeASTQ4UaNbYTdxhQks3eGPfREonMOd53ErpTDoNI5ajmuD5oZqkWzDbap+dHmhJyhtPw0jVDV3pzKYGDaGeDewHzKlsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLieK65i; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLieK65i"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f39438187so2606237b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Feb 2026 10:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770576545; x=1771181345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ut1sGkenUeI9BD3BBVG16G8F8nlxjScJIq5pNB0m984=;
        b=FLieK65iSaA/+VgvWYvFCayVU/+JRn820zw0FFXth/biRGJS2kSErdw8/wq3tx12D/
         Rop91pNnaDBdpldVStOsUu/sP50hpI2LT1v9qJc5xLA6x5tfM+DVe5ksQUi0dIwKVWpn
         3ZV2jfRbcodYIDLE/FyEzGVWiXRBRIYX2bzkGlBR6vDcG6zl9toKrxHpdVDaZGxevRn1
         aHF83doVlN+sVLNGs8JzYQJhnYmYyLQQ+x0mCSvMWw1znyZJSCvkGeRTPmuto5M02Dmn
         xN3wRng7vqwksKnlGGk0idnttjqyGCtrng0BI7xq2im6lX/5RJUMVVjjmy2A7VCRMq6D
         szew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770576545; x=1771181345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ut1sGkenUeI9BD3BBVG16G8F8nlxjScJIq5pNB0m984=;
        b=tPUTQ25NKL61h3z4sOC4lbPINMRNZ/e7jaBcepyrXSziyzntA0FOCdT4Y3ioOXtvv8
         pcFbP9x73S5Vj7l0Fvxgx1iSuFwsb97RLF9KSlmUj/HDipflrFifzD7OYgvXc5BFG4Ey
         PxMoi8QXN4D49nBnBQfLceLURbjvWVjGCWDlZu//415T9aSbYxlQZN1sbpR9nacx8YPy
         0dGUZDrGxqgw7LlZA4BnVpZ0SvYnEC4ZTCfOHKbZT1Xskb+IDM3vVL4fUPy2tBhfCJUo
         Fm5kPUH8c35Rlek9MF/UblnzyIpXv67jHAtujfnqmNAJ8M+rNq70BDaQfGnTRo0QsNro
         Z/3g==
X-Forwarded-Encrypted: i=1; AJvYcCXCgjbhNi0uELwZQ8ecezkuLd91IANn00/DmB3oMUcSfNzjbEBMC6Fk+kTB9ZSxl3djdSIYqJStnrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxLDttKzHDo74ZG9LR6vL9zSz0YxZtm2ahl7W9i+2+UAkkeBBQ
	mzaxApAHJepvdtlNDzt/WwD+JXtOVwliQ5mxwX4U71hIXXn+anbNR2TZ
X-Gm-Gg: AZuq6aKTgb/mqPviZwN5HPrjGIfBFUll9PRgsD1Tiv1Xz1Kj8yhuhKMCnx6lKED1eAN
	ILrdGz6JqSIYwpa0mWBaV7q/eM3RAvGfRbDyqUAR29qMzr2jmizScm0TeHHh5tFkH3vDX6UzPbS
	ulXukXonfhJG29WMHPgqbEljzkMMAT1d6UB+UgRoc2TEFGLcnBDbcUiEkLduzbdaxeF7ubzP1Fj
	jSoboHzOhwn62oBY6knou5MSbOHYZKL26T6nadC1zpRStFI4QPmSMLTaMbVn1BCuAQ0+zkjGb5c
	nvDqrtXZp8hA3aGJRhi72XkoY13L0XfWaNx1IE8gtuwK4JIYTmjO9cVk0D0T7MRId9JdIUPyhsP
	L3M+FcIvgkxwxXrM+zgIR5K0RJ6ydzT/22wfZ1RT0EZ5KFqpRDxWIbskjLYEG+Tt9X6uVq0GtO0
	0cA7xzbTDVorv9xP4Au/OZ
X-Received: by 2002:a05:6a20:d524:b0:2bf:183c:ac86 with SMTP id adf61e73a8af0-393ad00062amr8537931637.25.1770576544736;
        Sun, 08 Feb 2026 10:49:04 -0800 (PST)
Received: from [192.168.4.196] ([73.222.117.172])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb3cb742sm7636288a12.0.2026.02.08.10.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 10:49:04 -0800 (PST)
Message-ID: <3d7e7e82-594c-4387-8dbd-2b78e888ead4@gmail.com>
Date: Sun, 8 Feb 2026 10:49:02 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] selftests/cgroup: add test for zswap
 incompressible pages
To: SeongJae Park <sj@kernel.org>, Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yosry Ahmed <yosry.ahmed@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
 Chengming Zhou <chengming.zhou@linux.dev>, Shuah Khan <shuah@kernel.org>,
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260207013529.69681-1-sj@kernel.org>
Content-Language: en-US
From: JP Kobryn <inwardvessel@gmail.com>
In-Reply-To: <20260207013529.69681-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/6/26 5:35 PM, SeongJae Park wrote:
> On Fri,  6 Feb 2026 15:22:16 +0800 Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
> 
>> From: Jiayuan Chen <jiayuan.chen@shopee.com>
[...]
>> diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
>> index 64ebc3f3f203..8cb8a131357d 100644
>> --- a/tools/testing/selftests/cgroup/test_zswap.c
>> +++ b/tools/testing/selftests/cgroup/test_zswap.c
>> @@ -5,6 +5,7 @@
>>   #include <unistd.h>
>>   #include <stdio.h>
>>   #include <signal.h>
>> +#include <fcntl.h>
>>   #include <sys/sysinfo.h>
>>   #include <string.h>
>>   #include <sys/wait.h>
>> @@ -574,6 +575,100 @@ static int test_no_kmem_bypass(const char *root)
>>   	return ret;
>>   }
>>   
>> +static int allocate_random_and_wait(const char *cgroup, void *arg)
>> +{
>> +	size_t size = (size_t)arg;
>> +	char *mem;
>> +	int fd;
>> +	ssize_t n;
>> +
>> +	mem = malloc(size);
>> +	if (!mem)
>> +		return -1;
>> +
>> +	/* Fill with random data from /dev/urandom - incompressible */
>> +	fd = open("/dev/urandom", O_RDONLY);
>> +	if (fd < 0) {
>> +		free(mem);
>> +		return -1;
>> +	}
>> +
>> +	for (size_t i = 0; i < size; ) {
>> +		n = read(fd, mem + i, size - i);
>> +		if (n <= 0)
>> +			break;
>> +		i += n;
>> +	}
>> +	close(fd);
>> +
>> +	/* Touch all pages to ensure they're faulted in */
>> +	for (size_t i = 0; i < size; i += 4096)
> 
> Nit.  I show test_zswapin() is using PAGE_SIZE.  Maybe the above code can also
> use it?
> 
>> +		mem[i] = mem[i];
>> +
>> +	/* Keep memory alive for parent to reclaim and check stats */
>> +	pause();
>> +	free(mem);
>> +	return 0;
>> +}
>> +
>> +static long get_zswap_incomp(const char *cgroup)
>> +{
>> +	return cg_read_key_long(cgroup, "memory.stat", "zswap_incomp ");
>> +}
>> +
>> +/*
>> + * Test that incompressible pages (random data) are tracked by zswap_incomp.
>> + *
>> + * Since incompressible pages stored in zswap are charged at full PAGE_SIZE
>> + * (no memory savings), we cannot rely on memory.max pressure to push them
>> + * into zswap. Instead, we allocate random data within memory.max, then use
>> + * memory.reclaim to proactively push pages into zswap while checking the stat
>> + * before the child exits (zswap_incomp is a gauge that decreases on free).
>> + */
>> +static int test_zswap_incompressible(const char *root)
>> +{
>> +	int ret = KSFT_FAIL;
>> +	char *test_group;
>> +	long zswap_incomp;
>> +	pid_t child_pid;
>> +	int child_status;
>> +
>> +	test_group = cg_name(root, "zswap_incompressible_test");
>> +	if (!test_group)
>> +		goto out;
>> +	if (cg_create(test_group))
>> +		goto out;
>> +	if (cg_write(test_group, "memory.max", "32M"))
>> +		goto out;
>> +
>> +	child_pid = cg_run_nowait(test_group, allocate_random_and_wait,
>> +				  (void *)MB(4));
>> +	if (child_pid < 0)
>> +		goto out;
>> +
>> +	/* Wait for child to finish allocating */
>> +	usleep(500000);
> 
> We might be better to revisit here in future to avoid racy test results.  But
> this seems good enough for now.

How about using some form of synchronization like an eventfd? The parent
can wait here for the child to write the event and avoid the race with
the arbitrary sleep.
