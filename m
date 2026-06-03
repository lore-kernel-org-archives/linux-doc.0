Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3722E736D
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485658; cv=none; b=nkAjJAeIXtglg55ArexcfYiMCgisXqisZJP0UJI0otuREAurU+kUgfDrYh9B/CZ4fbk/ZmCov+MSm34kNBfdIryEiX2owlVvzBEW9yLdVbu3yU4iemxGIxTrKMxt1aipFqR8NEd21N3aolelJl+69vFsVxd4YpEMXN2c4jMcJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485658; c=relaxed/simple;
	bh=OzFVEqgwCuNxD8i7OS1J8fnss8t7CNHqvfWTQ+y6B3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONvlfPI2QFEHeP8Hs5Y1hYpsw6OBy7/ESYCQEZAqQYDlJUsl1G62Tlx4g+crY8OSSayKpx0WZqblcJ0Yz2YJHEZdjCImxvzz1UFYXJKJX4OuVP/Mp2RbWMK/4npDg6zlOn8kDJUNUuXpH0TXWtJUHV9CKvFbrRkC7Qq6DnRaggw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QV9v9pp7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QV9v9pp7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef616daf6so5116577f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 04:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780485655; x=1781090455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRFu66k1KJeXKuYTZNicRKot0uoKyyMMCt8VU3OBoJc=;
        b=QV9v9pp7ISAn6FWyYPEr/3XWBvFUYI/ePGOCZSEZGxjdfNNaHxOcHlikxSbNRSwvpz
         ls33sWfQ241FnTfK8em0ubfMoHTja/S4G4sHlJFBbiVqOKZXLddJ7hYVd9Z25xxj2/Aw
         5GgubxwIKWTRXaMleb+rSW67gQ3enMnqugXB2+dF/GN3EUZ4qBuBuBx81HXP3MCBRMsU
         o/AflMddJVP/pKwg62buVmNW7sUAa1i/B1ehLt8TDXxcfuBe4ofU37q4clHE0f0nAe6Z
         Nnn2+W9pZ0SEPaB5Im5ueePJK0PeHmydLozOtlVeTBuZT7EBSt5eBl9zQDjhwLu64Xek
         JGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485655; x=1781090455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRFu66k1KJeXKuYTZNicRKot0uoKyyMMCt8VU3OBoJc=;
        b=An/q3rm+PKn7vyO0lAiyu9aEVr3SDmNQPuxtlnxH5ZLd7LtMqnmfRx/iA48xdQ691C
         X8CBhOOr2klCfuCAzevyGRNA3PO3ACD4xet2S+/oh13sxobElYM8ml9UVWWZA0xL10nz
         lOzxO3WVm9RoKTLO+vhGnF/0kpPcC0+GP4AP1XdElEqYp20x2Nt1tfE3qbTS7Z/qZ5Vo
         4U7yg+So1I8LKxA8FE7yqJOc02hz7peDst+YP10AClTybzKqLwKKmZbUPUGiRH3jD1kv
         Cu+jnEIToHJ9IDFl9lleT+l1df+ZAnytvE7OavN+pA83oyy2sj4SNdlrVndj2suCItFQ
         aVeQ==
X-Forwarded-Encrypted: i=1; AFNElJ97XCvC5Eka/YEgxwQ+e4YjFxYC6M0WzbwGKQqmUMs9hFiSOmMuzpb/W04/f0nyfKCzuKaEEmsUihE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6OcggTOTzOWNGSZcFR9tM5fwTB0lKnh6uo3psFAvF6ikJR7N1
	wbYrEfDO+juHUAO+hXj1mcs0kFOo6Xbqb2RzzBA2iQF9fidkXFOxLhmcEuUKNLcYME0=
X-Gm-Gg: Acq92OGO6fpOXgT4Ete81/83YFUqC9zwj7wy57m8AwCUsCguGh49/XVZkUcZsfWaHSY
	946coykiuRx0DqnkKb59XQh0xSugKFcLu6d1WdeFzDzaf8oOsj69hUCXnaWeX4K9RmiyrWUHZ/0
	by0Cnj7Jk/oCPu+CQpUxHakHgU2u/dmJLhjwFz6TEMyLgmYKTSvItzdxB0ZQg1tZXdJjAwFDr9g
	Jiz06mttcsi78YPBqPVQQXkX8zviQ+dYLf7jnc6GF5mkqLCApByKcpxTyuhuo3JDhgFoYYGCFjJ
	1HVdvAP8ez47bC0MiCdzO6Zp70ngSrU8Ul+P3f2cyVDHIGWlZWH4Hvf4hhI2FIvxKCe7XRPlXcO
	6Sbgkci+TRWI1j77GHmlOpr3KmD08C+zypUCiDOPDKYcSQEjPTYJHE2DtuiFiIrv7tZnEl11qJe
	mnJR6lRq5l+B+GKtIT0oJF6/3E9xUjv40HSJBAJSQ=
X-Received: by 2002:a05:600c:a307:b0:490:b7e6:bd1d with SMTP id 5b1f17b1804b1-490b7e6bfa0mr28113465e9.16.1780485655211;
        Wed, 03 Jun 2026 04:20:55 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d64e8sm46791355e9.0.2026.06.03.04.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 04:20:54 -0700 (PDT)
Message-ID: <c8959843-2358-4305-bbe4-3ad69da949f5@linaro.org>
Date: Wed, 3 Jun 2026 12:20:53 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/18] perf test cs-etm: Test process attribution
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
 <20260602-james-cs-context-tracking-fix-v2-4-85b5ce6f55c6@linaro.org>
 <20260603111018.GS101133@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260603111018.GS101133@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2026 12:10 pm, Leo Yan wrote:
> On Tue, Jun 02, 2026 at 03:26:46PM +0100, James Clark wrote:
> 
> [...]
> 
>> +check_samples() {
>> +	owner_samples=$(grep -c "proc1.*context_switch_loop_proc1" "$tmpdir/script" || true)
>> +	next_samples=$(grep -c "proc2.*context_switch_loop_proc2" "$tmpdir/script" || true)
>> +
>> +	if [ "$owner_samples" -eq 0 ] || [ "$next_samples" -eq 0 ]; then
>> +		echo "No samples found"
>> +		cleanup
> 
> We don't need cleanup explictly here, as trap covers exit case?
> 

We need it whenever we call exit because it removes the trap which would 
trap and return with its own (potentially different) exit value.

The alternative is a global $err which you set and then call exit 
without a value and let cleanup() do exit $err. But from searching the 
existing shell tests calling cleanup before exit seemed to be more 
common so I did it that way.

>> +		exit 1
>> +	fi
>> +
>> +	if grep "proc2.*context_switch_loop_proc1" "$tmpdir/script"; then
>> +		echo "Thread1 symbol was attributed to proc2"
>> +		cleanup
> 
> Ditto.
> 
>> +		exit 1
>> +	fi
>> +
>> +	if grep "proc1.*context_switch_loop_proc2" "$tmpdir/script"; then
>> +		echo "Thread2 symbol was attributed to proc1"
>> +		cleanup
> 
> Ditto.
> 
> Otherwise:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

