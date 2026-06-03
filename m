Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406433C13EE
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 11:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485436; cv=none; b=DfvliiK3u3jmBW48j9L2iejnEcuzb3QG56tbkTvQ7zlINTQcyJlIedQQxHhd3/tgzk6Zxb4TFYFkEBRCoPZ3S0+XSR8FJ9kjPPTYUuLgbR/bWYcEPgwN3RtJnDzJ8t/6LOAvpyjg55xix5bz6pwqjMLMg4x0Nt6pSfCCf1r4PqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485436; c=relaxed/simple;
	bh=YH1yDlcQ1Btc01IgTRsUEjs4GCr14HE188gaQM2nQnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DisKWWuQHWoOEZx3mFULg54Ni6l/orbpm3r+Dif4W+aQpgShh02XsAwnj6Y+rD0ngVAPVvCvAH8B3kF9HyrqBujtxjD3vimcw1D+V2ebJUOJsOFaL3Y3HuncYuhjRihhiViZbt0t84Jk1hiqpyNQkdajnWgIjgQN/ja9evoORkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xyWN6bgA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xyWN6bgA"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49068493267so74439405e9.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 04:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780485432; x=1781090232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T+KyrkqrXHlGePKgaipm3bkHOjJ6TJi29svJlMHw/IA=;
        b=xyWN6bgAa4Ta8P3t/fTKYccMvqp+hFJRnJjzysXxF9frrIoNjXv74Iqg3xPB0pOpzX
         Xpx6MYQTZFYrifX+4DLkfnF7R3rj5RCdLheFzRuOWvNvzmj+Hlre0tOfXI6S6GeJDwy5
         tyAGA3oDG5jLAYYv4k2lyCtHlH1im9wYIcpgldaqySc9T/dEFzX5kEmxwhkQ/Dh6WbKJ
         cZSyStjwhWZNQHNHRZiJaC0BPvoh8un2twBRyUDcZ2gtrsh3Kp390IShz1wUgYDu/21R
         gJXysm03VAmwu28uST/qa0wecP+dkeTktfNOgbA1NXvT8cxwLQTk4dFNZjts4yLjPdwy
         ZobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485432; x=1781090232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+KyrkqrXHlGePKgaipm3bkHOjJ6TJi29svJlMHw/IA=;
        b=qrN1TTzXWJfAGttxGq2jF3zEuhIVphcpNJa5MnUDRFKjdoL6DNLSXn41aSl4pUbhvb
         hrpjI5w5oJnkb9Q5PrnkSSC+tr5OuH2dwnK/05zfT+mCor59tQzBVAHcVUY/HHxnAFHG
         ptCWEUCvSM3emfXDaaCYYruBh1riAWscFP+HxXmHMg/CCnL8pkx/LCTX8t45wqJS2qID
         fX+8J1RKawZbmzjGKCvzOl5oJ2wHa/tzOAu3Buvm0oz//8VTRldnYJxPmbaNN/chzuLP
         zLh3hadDStWQCLXEOz57qeaLtTwc/ygvQSBWXgTtfSBtYTZJK/POGQinqPf7BGzWpfjH
         GjWA==
X-Forwarded-Encrypted: i=1; AFNElJ8eMM0nao9mUuhkyCW1saDi+3M9BLI+JMdN0jZgkITaI4FZLI37MYgBEmPTIU3IIPa7NjYddZoA+Wo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlwb7iIjyClMMNZluyi7KcFreIXv1XWBaC4xcN6KA2rOl8uru5
	twbdGnlPG1hVZKHuHsHGzikNcUr6uUA2ANpr7N6wrPbmpereq3hxpYfZ6MNVgNksiaQ=
X-Gm-Gg: Acq92OGqEQO2hGOdE8bFpeavHSHDqUZ471WiLoWK6Cq9+g7cj78grHuAuZFr20RTzGs
	BjIhKbprq9b8NQceaLJcB+emi7ukyrJQ4yIJWa35KHoHznBNYC42nBYiBve3CH6XJriUc3N24pa
	IvsAmuPU3G5WMPzaDDGXFRkJnB6cmSteb2jW9aMy6i3XOOZpoYAsH1MQwXkBlUKfiUuwAgnueOP
	ykpip6nR+VN5ihPhh0ufLhaZuB39PLbMmjWFF0QXjPdPw8cDyjdvHgQTxtwCYAu8rFLWDDslJFg
	u5LlOVt2TZtk86yZt9yoY5cF2FRAkCGdv3bC7Gd40IgQce98n+JJWNVZYahVmPVWAjQJmaZxCDm
	OXmyb9rBOZ8kTj3dr7ArIlvTfCu8Tq0yKmuOeH+iMcYs0zIwC4bUULGgzMTZu03FuhB7W6P9cCP
	nIRoO0+/tZ7gJN2qkB0injd3C6W21rkNm/bxOhbIk=
X-Received: by 2002:a05:600c:c092:b0:490:b724:5085 with SMTP id 5b1f17b1804b1-490b724521cmr29027425e9.33.1780485432205;
        Wed, 03 Jun 2026 04:17:12 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7e6c6a4sm20016975e9.2.2026.06.03.04.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 04:17:11 -0700 (PDT)
Message-ID: <34b3b085-cb13-47d2-aad4-fac8c7812bd3@linaro.org>
Date: Wed, 3 Jun 2026 12:17:10 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/18] perf test: Add a workload that forces context
 switches
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
 <20260602-james-cs-context-tracking-fix-v2-3-85b5ce6f55c6@linaro.org>
 <20260603110621.GR101133@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260603110621.GR101133@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2026 12:06 pm, Leo Yan wrote:
> On Tue, Jun 02, 2026 at 03:26:45PM +0100, James Clark wrote:
> 
> [...]
> 
>> +/* Not static to avoid LTO clobbering the function name */
>> +void context_switch_loop_proc1(int in_fd, int out_fd);
>> +noinline void context_switch_loop_proc1(int in_fd, int out_fd)
>> +{
>> +	for (int i = 0; i < loops; i++) {
>> +		read_block(in_fd);
>> +		context_switch_loop_work += i * 3;
>> +		write_block(out_fd);
>> +	}
>> +}
> 
> Rather than struggling with unexpected options, and "noinline" might
> not work as it is not a standard compiler option (it is defined in
> kernel header as AI reminded me), wouldn't it is reliable to use a
> dedicated CFLAG rule same as other programs?
> 
> Thanks,
> Leo

noinline seems to be used as standard across the tools codebase, so if 
it doesn't work there are bigger problems. Perf also only really seems 
to support GCC and Clang and they both work for this test.

And I don't actually think it matters if this is inlined or not as long 
as the debug info reports those lines as being in this function. That's 
what what having it as a global symbol is supposed to achieve, but 
that's about renaming rather than inlining. Maybe inline is over the 
top, but its a pattern copied from other similar workloads and tests.

Probably makes sense to wait for an actual failure to appear and then we 
can decide what to do with it then.

