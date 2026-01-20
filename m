Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFB94534B3
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922035; cv=none; b=Wx+DMpgRUh4Ier0890badzQ12XzEO7KJtq8fpth2Rqq30t1r0U5/5CO0Sl6kcG30La4gkblJqUSLflPq/9to/UzK77DuNyo+g/OfRZ9gIfUiRhKJNZ7bUhb/XQP/AH9L7mFhIy/Zbnd1MjFFox+HvrSIuFiEGh6KnTP7WFng/fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922035; c=relaxed/simple;
	bh=tTdNJ9w0A3SRS2jGZyO87hh6ddJ8/yTI7BHcKalWjPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e0aQkNfheVSOSp9+cI3gpHteHd0qI05Ew1zvk9RlO0kd7Y7Ir2jo8Ox5hbL3jOMXO8yv1sKzLW8gjoakH1GdecVGG13Jr0zxnLuiVOtpjBqopItuF5EvQMlB/uK9zKN+zimhJAxvKR4Zgv+ohf8ANuPW5Eqrmiep0JC2YdpVwbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bR3/T7zd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bR3/T7zd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801c314c84so35236565e9.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 07:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768922031; x=1769526831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KfHF8XX2sLoiWwn6mh6WL+QXvB0XHx4J/lS+4r+T224=;
        b=bR3/T7zdFsQ79orClB/OtuJkhWjteFZ0ldd6bNXwgN6fisE5qcOQgkjwxTZFoHHc5y
         7yOyZDtZSZaDTS8ifjUmEfV9CoS4RA0mOQRRHhOX37mQc5i2WUhVK/u4Fj0WEq244H2m
         EL8NGU7vTFgO0C5cgmMINHG7iQ82UZZYrBQhBcFL3LFsiYgUncQGXA/w0u1AqIGJk6WN
         JM0QyEhH/TdLoVc9N/tGqY0ahOhJLCkixGa08RxflOIfnO2f/B+6aHagRzCQwLkG22Bf
         QqDk0s97FGVeslJMAlK5OHWLIEqY2BEyQ63ZNs6fO3Us9xRwOe7ylg8LmnX5TJqPW7qe
         UMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768922031; x=1769526831;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfHF8XX2sLoiWwn6mh6WL+QXvB0XHx4J/lS+4r+T224=;
        b=WnrnUaqck12T7aD3tZ4Nk0ftvK5n9PfmIh6rRMUSbt9f6Ze+RgvEeQhpUbFTshSIUQ
         tJZ5wjNvcYR0S83Nrn0Iapuqj4KdjKgxtxTgyiOsR9FY/SIjBRXeQsQcakNQ4tLcVd3P
         4AB1x1Ao3oRw1AZ5MNQBFA8Wq/qWHiRteAqAZ2mzcvmvPsvjvjnRzMd0ey5ViVwxJBdS
         0cOLrnaS9QONz9Sv9bMaNJxeSHOaTgq6p/8R+RsiuOEwSArFkI75LVc3sb9OROzQ55gI
         Q/BuC9UeSEdZrv1x72eBr0UV32W1bafcKiTeqhQ+ZzBU93tJnsRE0nNtiF89ONcbRXxZ
         En+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVI9Y0/d5EN2ca7N2jw7OFj31fYZp0FuemNVuQ+7HBpQLTICtRaKOpCb1DmhJDm+uU4h+8L+V4S9bM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkgjeji35zgoLFLdT2vQ5SyK5Ae1aGBFgPQLvQ5S23lukeFZ26
	EcyIzD/emZJ5PsugveQNt8oSwq0iHyhuQyAV8L/tefXBBEcnx0BNYdN0QSCao1rMe8E=
X-Gm-Gg: AY/fxX4C3CJRF9rTMyNm22ItLKTSp0X4QMbjzWsJ5x/Go+3ERZ2zhz2+Z7oCvOC9BgB
	UKaNt8XF3Eh9SR5ehxMngb9m3bL0s/o/5v3Iw6QP6Qkk4jPF/na+UE7a09Z2nAlDpbZXcdXNelV
	o7428Hb1UIaSMu4wHbAVnGc0pVpES3vJxrAKYlRHcrByuCSjk4V2+ZfYzAN86PUAKX68vaWRNlS
	l+S7R/fnPE0yke4kYbrb0mEe+qiQkfomP1EQKQuaRlxerp+Si2x7Rh1/UdveFiSaL5DQeR2Cobm
	AHECIlZETtEuYjW7NZHfeg0Myrcnu/cOn75T4jz1tJbBjbaE/aLiv6fc9gRTDf7TpYurmRkddgO
	G55z+tuhheycKGhO6aDUivqHE3ToDWJhcXfy4RL1iWNEvhKqdNadjKmnmTZ7D0dmjRs8nqXr72T
	oG7Y9K3jeh7+U7stkJFXM1QvoxcEzenqE=
X-Received: by 2002:a05:600c:458d:b0:47d:264e:b435 with SMTP id 5b1f17b1804b1-4801e34209cmr173700875e9.22.1768922030743;
        Tue, 20 Jan 2026 07:13:50 -0800 (PST)
Received: from [192.168.1.221] ([94.202.56.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e9ee5c3sm113053335e9.2.2026.01.20.07.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 07:13:50 -0800 (PST)
Message-ID: <ae85df64-b6b7-43d7-ba50-9c0525481299@linaro.org>
Date: Tue, 20 Jan 2026 17:13:43 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/26] mm/memblock: Add MEMBLOCK_INSPECT flag
To: Mike Rapoport <rppt@kernel.org>, david@redhat.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com,
 tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-19-eugen.hristev@linaro.org>
 <aVImIneFgOngYdSn@kernel.org>
 <4b8953ac-567b-4d68-9c25-72a69afdf1b3@linaro.org>
 <aVlsqdgXSBLIE9Xi@kernel.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <aVlsqdgXSBLIE9Xi@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/3/26 21:23, Mike Rapoport wrote:
> On Sat, Jan 03, 2026 at 08:36:40AM +0200, Eugen Hristev wrote:
>>
>>
>> On 12/29/25 08:56, Mike Rapoport wrote:
>>> Hi Eugen,
>>>
>>> On Wed, Nov 19, 2025 at 05:44:19PM +0200, Eugen Hristev wrote:
>>>> This memblock flag indicates that a specific block is registered
>>>> into an inspection table.
>>>> The block can be marked for inspection using memblock_mark_inspect()
>>>> and cleared with memblock_clear_inspect()
>>>
>>> Can you explain why memblock should treat memory registered for inspection
>>> differently?
>>
>> It should not, at a first glance.
>>
>> The purpose of the flag is to let memblock be aware of it.
>> The flag is there to have a "memblock way" of registering the memory,
>> which inside memblock , it can translate to a meminspect way of
>> registering the memory. It's just an extra layer on top of meminspect.
>> With this, it would be avoided to call meminspect all over the places it
>> would be required, but rather use the memblock API.
> 
> memblock APIs are not available after boot on many architectures, most
> notable being x86.
> 
> But regardless, I can't say I understand why using memblock APIs for
> meminspect is better than using meminspect directly.
> I'd imagine that using meminspect register APIs would actually make it more
> consistent and it would be easier to identify what memory is registered
> with meminspect.
> 
> In the end, memblock_alloc*() returns dynamically allocated memory, just
> like kmalloc(), the difference is that memblock is active very early at
> boot and disappears after core MM initialization.

Hi Mike,

Thanks for sharing your opinion.

David, what do you think, does it make sense to have this flag or we can
ditch it and use meminspect directly ?

Also, for some memory blocks, they do not disappear ever, e.g. the
printk log buffer, it's allocated early and never freed, so it's
required to have some memblocks marked for inspection.

Eugen

> 
>> And further, inside memblock, it would be a single point where
>> meminspect can be disabled (while preserving a no-op memblock flag), or
>> easily changed to another API if needed.
>> Ofcourse, one can call here directly the meminspect API if this is desired.
>> Do you think it would be better to have it this way ?
>>
>> Thanks for looking into it,
>> Eugen
> 

