Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814890;
	b=b6TMQunWMGOsfzohIDRAS6WLXpH3oBNCiB5cHTBIHHkD7Kz4kYHL/o5mDXXbNPLGWa4a
	 mfVQynIYR+x9GTZoN6sUV6oruTrtiTyv0v/Sgn2rVk1YiuXW0p8lAJ/aENLNMMoGMKU51
	 l28fhBIoncFKtDw7vDFkWvBQTvig6KTsHb35waeGGZDxIbC2C3npMMDfygG7/GKDGc3rZ
	 mzDAq2KyyCYB5foUa0e4MX6nRxSS9XwXdp9sI/VspSk4b/GnOfeyyH5P2yx4luSBPdE8w
	 Z7FV+iTbd+k9yHLC+y+S1C7NM+v/35zwioLh8FxNRIJm30pXuFOwdjoh1eXY4YZc+7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3XMRgIjajaQRkvFd53KAJBG+JI2fzjczkpx99FvXAIs=;
	b=WeDn+Nqgoh9G0/Johod1YHQvZjLdI5YdED6wC+2xtgwxpmXhh6NiCXRW904gN7S99qtN
	 c0jNmmI5wvAtmCmmp+B1qo7tgKxtDO5IYEmzyPMKKlGuJ/ZM+7p6cbUhYkHnE4y2DMRmi
	 U5sUtuENIpN6t6HzK/FFHmXBeszHKhuddmtr3IUtRJELwyMIiHzAO7Zw0U/7nk6nQZLzQ
	 QzKzKOATzpsaiK9QVQ54qnszR1MCr8s3yFWoX2mesz8h1CIKnfi1ztlVK0oNHRHjIS+Sr
	 4UQL0JSNoCg3rNZOYQQyN15FVetNSiJ2PDTdFxOCeCi2yEO+qZBT2p/L992cfPAloIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AXaVxpkf;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5B2606CFE8
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 17:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE5B2606CFE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AXaVxpkf
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4cdc606b47so149215366b.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 09:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793814888; x=1794419688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3XMRgIjajaQRkvFd53KAJBG+JI2fzjczkpx99FvXAIs=;
        b=AXaVxpkfljM68lxlk7nie9l6HuOHkE/PNgvUOqd7yM4ZRnqrMT7lAX+miAz44WyuEq
         YhtfGBvHhh+jRrta6ETWIq7rPCmIIlJuq2lB6kUpL1ohtfFdriANJrCooZSwtpWAOOPs
         M9wu5yeQyB2sKHtOQavuzzGUSw7i2d1OLxK3swnyfeLybv9RP2KuWjVDlhTJEDb94oS4
         S82blmqu2GrU55nJ8d4Cgr3C4mEyAdhQ0FZthkEzEMGZgjr2dIuaxxvnVcabAHyjGgfg
         +Fil0gqr2iNNqqwYSqtnWnhFyJEUiuqM2e9cxkNYzMrdTlDo4HTDLJEsPwjYOcONv7Nh
         eGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793814888; x=1794419688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XMRgIjajaQRkvFd53KAJBG+JI2fzjczkpx99FvXAIs=;
        b=HtqaAQl95ghoFPWPi+jka/JXOOzeS7aF6wbkHfZHrRrYpfBmiJpZ7LysDtmGrW0IQ0
         GB1qI9ipKaRiB5f3S7abb1Wn+/PkuGJ7k83o7Gjqqu3Iugk37Q2N9O+3fblPgdD4MDhA
         SFVI8AuqiqQKedaAviehY1m7FgxJPt3P5BUq4YMcCs0l5eVXKOC0+RflmU2IQ56ktQMm
         uvw+m/QD4nau0djNf+w3j4nGpCiURYCIkbAMyCRGhPoLr8dpuQTXdAyeuRr/+i7HGJ3F
         yaVYwIptTE+HWXHzz+a8La2VGeUMY/HEiiZpmS8Q/q8Vsi7lrGuTk9u7z5h847j3j3J/
         YFAg==
X-Forwarded-Encrypted: i=1; AKwUvBy3129A5NRC06Ob1q8meVntYSG3lBCnfkbXo0XBX3U4uM5psUedMpyAFYCmzXYNmFPtOEoFf2rhqEQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G+0V663tY60ORAYM1ooBxS8BXZJwseWLQKeY7W9E4CNVcO9kC
	nmaxg3npNoLM0q1HxY8CB7fUCvlQ9MgnmZonwa9w6iR46OfIE3kYTgQI5Q2wLO18e30=
X-Gm-Gg: AYBFou0CMC4qlf9Cs8QmuXSlu3u7MNbkMjhbe0H1L2nCr97jpTrCi3XHi8HNZqaZxoP
	wdSCsuvJJ1ZKN3oLvUWhcxXC69wpZktoLNUZNTTQ1EL+t+Tt0VyWoFz+oFRKOMar7m+KVtEN9uc
	WGdrZ0jVeRSziwOBc5tYA2Lmuupi6edc9Vdrhms1PG1YH4yTDIFQUP9HNT7MR1lVLOfY2H7vGCR
	5/TstQTBm/5qM3A4SrQn520rkJIJV8A10PtQoq0AXR6y3I9CgXf8E74njE/IonfnFl/3pJ/h6td
	9eIzrZGjRqjhrmFVQ9dYbjnYBMqtU7mgIMGMj3G2qvVff0jmtBigDx4F7Xm7CFmmue+9PJIlMGL
	NFshh3D4Lp9sEd1ieRmJogWgsLq7HqY9qXx/Lq3pFzsdRKb3QuO5AWQuXW2RQG5x30lkEOj3pX+
	TFlV7b8WpLd4fmn32Xf/tkLPrYVmOdmIBerPqK+G9ZHJuu3ZImzhoqFOgB8zmcoMZrWpWfKrQsg
	9VBIPSkXq03Q27zwnY+PiylKf4S8IRaO2mR3Oe1wh2PEDKawoK+om8WN2tTEhIYEqDGAbEoJKuW
	8SwcQyTMAXCDlH/q7uNDlwBCK3IJdOYv
X-Received: by 2002:a17:906:99cd:b0:c41:731c:534 with SMTP id a640c23a62f3a-c4ca7a86e67mr1494767166b.24.1793814887972;
        Wed, 04 Nov 2026 09:54:47 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e41e711sm92156066b.14.2026.11.04.09.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 09:54:47 -0800 (PST)
Message-ID: <c7c04e5f-2c65-4914-be41-f28365c47d94@linaro.org>
Date: Wed, 4 Nov 2026 17:54:45 +0000
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
Subject: Re: [PATCH v3 05/18] perf test: cs-etm: Increase window size in
 disassembly test
To: Leo Yan <leo.yan@arm.com>
Cc: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org,
 John Garry <john.garry@linux.dev>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
 <20261102-james-cs-unformatted-per-thread-fix-v3-5-dbcb0c281b9b@linaro.org>
 <20261104163657.GJ9176@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261104163657.GJ9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/11/2026 16:36, Leo Yan wrote:
> On Mon, Nov 02, 2026 at 12:15:19PM +0000, James Clark wrote:
>> When we increase the default timestamp interval in a later commit, less
>> trace will be recorded. At the moment the amount of trace overflows the
>> 64K buffer, so the exit snapshot trace is what happened at the end of
>> the process rather than the beginning. With the new default interval,
>> the entire execution will be contained in one buffer and the first few
>> samples are always various instruction and data faults. These go to the
>> kernel so don't result in ranges that can be disassembled.
>>
>> Increase the window to 6 samples to ensure something with a branch can
>> be disassembled even with the fault samples.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> I don't mind to set even a bigger sample number (like 50). I did test
> and 50 samples just add 0.5s run time.
> 
> Either is fine:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

I quite like keeping it small because it's more likely to catch a 
regression in the decoding. But we can increase it if there is some 
other reason in the future.
