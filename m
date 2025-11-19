Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B747E221F2F
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 01:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763516418; cv=none; b=PsN3aC86knLU7YatmnznEHt161sfPd9d8eQQuYfeWDAplQApXxJTGsZm89HFnZLVf90d2qjpppAQtDiNv4cULvQeXmF95bLWel3rjoJBYIdxCQ3i8Gs6PMpacAmLiZYUChQEdBs1f1h7sY+OaE/4kYUoOEwL4MQW7gwQmgcOBvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763516418; c=relaxed/simple;
	bh=hwOs34HctwAq5dywkPN1SQxd8lKGYgcXJdWHQhr+e+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EMHzod6ef+fPgvrRkWbSmXVdl1fqn4yzvT2tlyjEch0QQ32pRXidlGo865OdW9DccTuhi/ogcOmmwxdG0xgJVvbRGYE4SmoBkbabnGu0Nk/OMELhkLQorFHSnjS6rI8SkvxhqGFLqiMgNvYBC51bRY2RCvWdw3oIKt/FjBQtb8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ChGw30gz; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ChGw30gz"
Message-ID: <4d11629e-7fd1-40cc-ab84-a4a0e065b3f8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763516413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwOs34HctwAq5dywkPN1SQxd8lKGYgcXJdWHQhr+e+U=;
	b=ChGw30gz3/SOsOrR9rIPx35dIhE9C5Gs2HensmLLaf0LV9CTkw7O93l1OhrHED9DhXT/rS
	v7odW3Hng75o8QZ94fsx0rfu0G4VC/+NJ7rYCQmnVNwKVhFAqPGLMzYmlMf1YzIHCuAyF9
	Bisg9VuqnoqyeO14o+B+CWwmEO0BR28=
Date: Wed, 19 Nov 2025 09:40:07 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/3] docs/zh_CN: Add blk-mq.rst translation
To: ke zj <kezijie@leap-io-kernel.com>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 wangyuli@aosc.io, doubled@leap-io-kernel.com
References: <cover.1763366835.git.kezijie@leap-io-kernel.com>
 <c7a80affd45be8c11a236472977cdffab16e895a.1763366835.git.kezijie@leap-io-kernel.com>
 <1f5870b0-211e-40f7-836d-7118654ce3fd@linux.dev>
 <0a3f9f2e-5323-4797-b146-56ece9ffc153@leap-io-kernel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <0a3f9f2e-5323-4797-b146-56ece9ffc153@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/11/18 11:11, ke zj 写道:
> 在 2025/11/18 9:51, Yanteng Si 写道:
>>> +基于标识的完成机制
>>> +~~~~~~~~~~~~~~~~~~~
>>> +
>>> +为了指示哪一个请求已经完成，每个请求都会被分配一个整数标识，该标识的 取值范围
>>> +是从0到分发队列的大小。这个标识由块层生成，并在之后由设备驱动使用，从 而避
>>> +免了为每个请求再单独创建冗余的标识符。当请求在驱动中完成时，驱动会将 该标识返
>>> +回给块层，以通知该请求已完成。这样，块层就无需再进行线性搜索来确定是 哪一个
>>> +I/O 请求完成了。
>>> +
>>> +更多阅读
>>> +--------
>>> +
>>
> Hi Yanteng,
>
> Thanks for the suggestion.
>
> I’ve translated the titles in the “Further reading” section as follows:
>>> +- `Linux Block IO: Introducing Multi-queue SSD Access on Multi-core Systems <http://kernel.dk/blk-mq.pdf>`_
> `Linux 块 I/O：多队列 SSD 并发访问简介 <http://kernel.dk/blk-mq.pdf>`_
>>> +
>>> +- `NOOP scheduler <https://en.wikipedia.org/wiki/Noop_scheduler>`_
> `NOOP 调度器 <https://en.wikipedia.org/wiki/Noop_scheduler>`_
>>> +
>>> +- `Null block device driver <https://www.kernel.org/doc/html/latest/ block/null_blk.html>`_
> `Null 块设备驱动程序 <https://www.kernel.org/doc/html/latest/block/null_blk.html>`_
>>
>> Translating it(only name)?
> Is this translation acceptable?

Great!


Thanks,

Yanteng

>
> Thanks,
> Ke Zijie
>>
>>
>> Thanks,
>>
>> Yanteng
>
