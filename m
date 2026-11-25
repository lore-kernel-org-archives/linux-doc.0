Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600678;
	b=mh3uMIoujeSQ5wVHgLVOrvqYPK9uQwKPEiQBNd2Q8FUtdcvXTB/zpz3781eEdZ9Vr15i
	 u3l9DwUQA4kbixPhywZ3tJgtOG2VfL0hilDKgmFCH9L6Wu0k8r2TpCXFUsdnYYEXHIM9Z
	 6KzyCvFDFFsAL7KCX+H3J7X47YR0EoBE8YeNmrtzK7q/SFgfklo3E1jOS/jpcm7kFg4JZ
	 2sM05hQV/TkWjfA2B3f7oYxqs8qvAY1sL+wgCi2UBZTy52EnqN9nm5NgpqwDtGNcoBMWW
	 KjKBvw9CZDSh175J6irmniIZQJth0Rn/x2ZgWm9zLNPzIK0US1+wBamYXLPFTX6wgqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=k6KEcTl/pyiQsKyyg/2eQ+l+POB59ejsRYmW+NNyeA8=;
	b=w1lx8KasjQhe3jlKTD3memePk55oL1WfPXArag0jQOidLpbJdnThbSaoq+5T/DQ9VYoj
	 ZGem6u1yTXNDbcDIzLINeMeMMx0O7T3tClaPpZHqQn93PQsEB5PILxss1i2VAaGVcGlMZ
	 OCU9JYlEHQH+/RWss9ITVPqhuCU27rIiTr8c5R/UmJJM3X5+15whEDXI7hp/hHXa4iD8+
	 /oRLhnWMADkaJ2NnxQrIqUFdHqmLmrjJWtYd1uWjBspHplzAB0oPafCFYxxPZYg9reeDr
	 A8mwIbT2O+ePjjPJO7uZuDLzEr3JN/h0sp2JRrsc220npdUeP7JH3HND0IqosnPTrxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U4ho5SIW;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69120606A323
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 09:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69120606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U4ho5SIW
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e09aa5264so3174773f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 01:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795600676; x=1796205476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k6KEcTl/pyiQsKyyg/2eQ+l+POB59ejsRYmW+NNyeA8=;
        b=U4ho5SIWBLfAJh6L5LxddeznA40KG8rNkgKkmJbUOGnKML97JS7z0daSK34Zyvnr9Z
         emW4BnhTJPTGzn7MDO/XQ6XFuGAkn8PqfR9lmVM0j/npQJm39KhqnCc5mQozsg9zFA+k
         nTSmV7GBL+NT8vrX+Pa7YX6Ru7xTGU3qM4CTFBA8YOieDt6N4g/1BiI6yxOrWS2aEow8
         FD4gXsInN6ZPK2FqjU/gAVh5kZCCcJGd27RWkC3rnlR+1ThU7hUb+s02kJRgG7hQmeZ7
         re6IrPGN9TT1ywerZEdUzP/LM47cfXwtQjFH72RWIUB23Wx/B17BIfb9f+7Dj7GSHpJO
         SiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600676; x=1796205476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6KEcTl/pyiQsKyyg/2eQ+l+POB59ejsRYmW+NNyeA8=;
        b=HyAIp8MdIa+/l3jFZJeQbNLdJf3nzMtFHOfURmIx2FnmsIoWZE/EIeE/qW1BhV7h6e
         PgMqLYTtpHmpRcR2AO8FmAJHEE99YYb+Dt41Tw0cu/xN4uClqMUFk/r4MIdn769RC1iI
         W3d9TJ4l5RbJgzfFTQ//qx2C8jPPyxsoJq28EIf9pVdxKtbLt7mt2glq73WXwBnnLGh5
         89NbXCg8M+uKcMq96LOao+lufivyn8A82vZntMeA+sYtgHdulQKcJJ55vVF6nbMI1kIv
         0uob44N7ZIe0p2W+WjuUGkSPjuwizvHvdiEvFibbO2tny7QnFCPlf7G5s0+1SKaHuC1M
         C4hg==
X-Forwarded-Encrypted: i=1; AL+hErF2C+Q2Dc49RiuPlNEYVQP/O5h2oMryMhHLZj6jNf2GLbphx4Owjsb00dAumtyzxuTvZlujnwIrF9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z87J3EbMRz7bU2dzcyTihItjUtDLmlg5YX/7Z5YpeUDU3+6HGJW
	EGrvM04TPykSLFbDbe+StYuVG0PSGsRl1V3ZrWaGyJ6OP5APeQNwptDeEd7BYtMYxjI=
X-Gm-Gg: AZFdTZfbbfkW2CagH0kjNyKgbQHQCgZh4Nvo0UDrxpXhMFAZ2zzOZz+c3ur00czU81/
	0E5txYGSssR6YMzjKBEK5oS4YrsI++e+gdWpoNN9NsOFXLLIs1Ek4sSL2AHp/lzBrAVadiQAKvF
	uRatAHNicm9q9mKv3U22mKJmG6gY+KtQV4tQ7ItL+g/ewTcKtnUZXCHVX79BuDRR8DPnlstk3c5
	A2KZEE3dnXAz/2NvvQWjhF4Y+wFoK5C+ojF2tD+Y7J0dWDXQ9TvRlBcgcKWp62WJLKtHuz6KdOQ
	RpnNzLdUxAehFwZJC0UMcnSdjhDzRg9RegRsAo3ZaLs5fVbRK+e9/9XIaMKVmyBwMDRZVFFLN4p
	c9gamf7g7vLHYVi3hCqQE05rQF0/HrSnFCru1hAB0rWbxtB7Zd/U/bmQrDZfX42bVrqJ2MT9MVk
	dSqrPGPYEcP3qC77p5zoaOa5fSp+320aE1TV0phVQ7yd9TyuPw7pvDquaU1sabptQ+1U9+qwNXY
	jbqLZJ6T1KmyK0/NOq9rBkuH9XzNM2aeRd6W2R/2+ZrAOxHR7n9AVRSdykuVJAQtJFfjEyu0ss2
	wwa7u/YPgtcIsB6t0Q72i2tURM3cQMqcdg==
X-Received: by 2002:a5d:64c9:0:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-4abb0f3c071mr35368426f8f.14.1795600675654;
        Wed, 25 Nov 2026 01:57:55 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm32730070f8f.10.2026.11.25.01.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:57:55 -0800 (PST)
Message-ID: <d2ae7970-63cb-4c8a-8c04-483d88fcbffb@linaro.org>
Date: Wed, 25 Nov 2026 09:57:53 +0000
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
Subject: Re: [PATCH v4 15/19] perf auxtrace: cs-etm: Capture wrapped snapshots
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
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
 John Garry <john.garry@linux.dev>, Leo Yan <leo.yan@linux.dev>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
 <20261105-james-cs-unformatted-per-thread-fix-v4-15-7759e0ce2449@linaro.org>
 <8b37f5ea-9427-43f6-8abf-07a36a9bbb72@intel.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <8b37f5ea-9427-43f6-8abf-07a36a9bbb72@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/11/2026 20:41, Adrian Hunter wrote:
> On 05/11/2026 13:45, James Clark wrote:
>> find_snapshot() isn't implemented for Coresight, so when a wrap occurs
>> we only save from offset 0 to current head, modulo buffer size, rather
>> than capturing the whole buffer. Coresight drivers currently use a
>> monotonic head pointer even in snapshot mode, which gives a lot more
>> information for taking snapshots than a wrapped pointer. It means we
>> don't need to search for data at the end of the buffer to guess if a
>> wrap has occurred, and we can go back to saving partial buffers after a
>> wrap by checking if the next size to take is less than the buffer
>> size.
>>
>> The drivers will always be able to generate a monotonic head because
>> TRBE has a bytes written counter, so even if we stop generating an AUX
>> record on every overflow, we can check if the counter indicated an
>> overwrite and offset head by a whole buffer size if it wrapped. This
>> forces userspace to read the whole buffer rather than between last and
>> current head. ETR and other sinks use software double buffering, so can
>> continue as they are.
>>
>> Add auxtrace_record__monotonic_find_snapshot() and use it for Coresight.
>> A monotonic head can't be auto-detected in the default find_snapshot()
>> by checking if head > buffer size, because before the first wrap a
>> monotonic head looks the same as a wrapped one. The search would then
>> falsely detect a wrap when head is near the end of the buffer, and the
>> wrapped pointer fixup moves 'old' and 'head' a whole buffer ahead of the
>> driver's head. With a wrapped head that doesn't matter because only the
>> offset within the buffer is used, but with a monotonic head the next
>> snapshot would either save already saved data again or drop up to a
>> buffer's worth of new data.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> 

Thanks!

