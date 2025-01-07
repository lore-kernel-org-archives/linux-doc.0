Received: from mail-m3276.qiye.163.com (mail-m3276.qiye.163.com [220.197.32.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463E82594B2
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 06:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736231331; cv=none; b=i4xLHRbX+Q+YeI+Z23ZiBuZdZ9k6GOxutvET/jckmgVZVn7L1f5bkt+ci7n//VoEMqro7vnymve9beY5Qv0ECH3X/QmaOMTHFM7zT82SjxfvCb8ys+fsCFq2w13of6W9kWnLO6KDklAxc1I5zV+Ha3W4hdYI2EnSC1zDFQcmusE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736231331; c=relaxed/simple;
	bh=KAHPBtnlRV6WbCQhdv0iyLRuIYJXnWxhXqaMqOQmJTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LGWwYbt5GIPV6rrtdA3WmzJGDFnmXJthQf6F0woySVIjN4BUcHLleyxSaK7H/YJGwCbgYlnrCTUpIm9HDWNsGo2hT+3m9WUu2EaR4DAqHEZVEsTOXyPVdcm7ddBhO6D13CqspcYWcPqyuwQ6TWsUWKZwpdqqdACYRNt/ArUaTIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=BuT7pEfi; arc=none smtp.client-ip=220.197.32.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="BuT7pEfi"
Received: from [192.168.6.2] (unknown [171.8.192.198])
	by smtp.qiye.163.com (Hmail) with ESMTP id 7ef4fbce;
	Tue, 7 Jan 2025 13:53:13 +0800 (GMT+08:00)
Message-ID: <551c040d-4331-4f05-a690-ed1cd2e28490@cqsoftware.com.cn>
Date: Tue, 7 Jan 2025 13:53:12 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: Add security credentials Chinese translation
To: Alex Shi <seakeel@gmail.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net,
 zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
References: <20250103061547.20947-1-zhaoshuo@cqsoftware.com.cn>
 <CAJy-AmmhXThUa3yU4Rc_o8abP06E8MypKTdrcZv6U8Z6A9co-g@mail.gmail.com>
From: zhaoshuo <zhaoshuo@cqsoftware.com.cn>
In-Reply-To: <CAJy-AmmhXThUa3yU4Rc_o8abP06E8MypKTdrcZv6U8Z6A9co-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDH04dVh1OTkxCSk1PH0pIQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKTEpVQ1VKQklVSkJDWVdZFhoPEhUdFFlBWU9LSFVKS0hKT0hMVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a943f53077e09d0kunm7ef4fbce
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NAw6NAw5IzILExxCQx8vCTAi
	KkhPCRFVSlVKTEhNSUlCSkJPTk5PVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSkxKVUNVSkJJVUpCQ1lXWQgBWUFKSUxPNwY+
DKIM-Signature:a=rsa-sha256;
	b=BuT7pEfiYVZY3XTLaXRdTmCo7kUppZco3APkvkgCorxME44pI08K9P96KfQnfK/T+rCNBv4drQn0hdsJ8fIu0xtrjQYw0RDoFWRVFPuBDoH8q5h0aVBN9JD/yg2bF7LifPWTQKmpjZbs0ofaVVyDjfSyBwsqUVkPNn5ZBgnHPj0=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=+dX1erblQlPdTOWArhRquFOLCjsmVJwDkHM91Q7Geww=;
	h=date:mime-version:subject:message-id:from;


在 2025/1/7 13:22, Alex Shi 写道:
> Shuo Zhao <zhaoshuo@cqsoftware.com.cn> 于2025年1月3日周五 14:15写道：
> ...
>
>> +
>> + 3. 客观上下文
>> +
>> +        此外在这些对象的凭据中，将有一个子集表示对象的“客观上下文”。
>> +        这可能与（2）中相同，也可能不同 —— 例如，在标准的UNIX文件中，
>> +        这是由标记在索引节点上的UID和GID定义的。
>> +
>> +        客观上下文是进行安全计算的一部分，当对象被操作时会用到。
>> +
> ...
>
>> +
>> + 5. 主观上下文
>> +
>> +        主体对其凭据有一个额外的解释。其凭据的一个子集形成了“主观上下文”。主观
>> +        上下文在主体执行操作时作为安全计算的一部分使用。
>> +
>> +        例如，Linux任务在操作文件时会有FSUID、FSGID和附加组列表 —— 这些凭据
>> +        与通常构成任务的客观上下文的真实UID和GID是相互独立的。
>> +
> Anyway, I'm still confused on the 客观 and 主观 context, translation. Is
> it better to use
> 对象上下文， 主体上下文？
> No idea.

Yes, this seems to correspond better with the previous text.


Thanks,

ZhaoShuo

