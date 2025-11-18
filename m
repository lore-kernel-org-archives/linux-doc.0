Received: from mail-m32108.qiye.163.com (mail-m32108.qiye.163.com [220.197.32.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFFF261581
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 02:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763434632; cv=none; b=V8PaAm75TfDIwwMOOzcJ5k8Lqk5T9S/dbeU486Cc4PTVhJ/gTeuQ5/nujXcWrCWdAfp9/PhPtQ64YEnApeZlri3yfWfuPTXdWBqub8Wm9SeA/zCxbP6n1c9ymLXKa1y92P/2uX5eLyau4lHkbiO2vkR0jK3l1kF6kkM1APRkoPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763434632; c=relaxed/simple;
	bh=HqeKbTSRxVvYw6XOqxZsg8zbZcIpoassmXroRVg+lTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l77E5laZYJOEv2qSRj4a8YiqLN3BAHGjjlhTW1GUmnknNUErMYNKExgJRtGkbCSiWswaAQ8DYTHQ4DvM8qUUHOCN8UZrsv54QX7L04fUgn3ZTFb6qrh7hqxO88qmcgl3dsYaFwztUCOJAaw9PQegNBN5QOlhO1kTJmHKTQE5dzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=Jlqq0JnV; arc=none smtp.client-ip=220.197.32.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="Jlqq0JnV"
Received: from [10.0.66.19] (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29ec2aeb5;
	Tue, 18 Nov 2025 10:41:41 +0800 (GMT+08:00)
Message-ID: <efe49e31-249e-4e25-b3de-38883165a068@leap-io-kernel.com>
Date: Tue, 18 Nov 2025 10:41:40 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] docs/zh_CN: Add block/index.rst translation
To: Yanteng Si <si.yanteng@linux.dev>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 wangyuli@aosc.io, doubled@leap-io-kernel.com
References: <cover.1763366835.git.kezijie@leap-io-kernel.com>
 <dceb4c59bc0d9a02246386cfed31a543d6a943b8.1763366835.git.kezijie@leap-io-kernel.com>
 <02520bd2-7154-437e-aa93-f1ff0756a0e3@linux.dev>
From: ke zj <kezijie@leap-io-kernel.com>
In-Reply-To: <02520bd2-7154-437e-aa93-f1ff0756a0e3@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a94d6deca09d8kunm98db79a248f134c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZShgfVh1LGkMfT0xIShlOTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=Jlqq0JnVIw9aVqTejSxZfYUKtXHoF3G8osMG1mcAm/DIwoBG4rV+HeBJqPYmuw2jKuQrdwtRFeYqSYUSMA8bFZSCVKGzU3ZV5z4Zr/f9PFpdV2vGtWkM7RYWL7ZP5+X4e2LRCIT1HlZfpgtLk6UjxB2JvSAsYhzLl4xC+rwXSd1gXY3zTx8okMY3+UK1Y1ystR7cjpB48WP2aLbt2/SstL4fc1GM6KSLBWeE+lieRt5eIUFgI0RvbyPjVks67uUlP9qgf47oQU6bn8rPy/mmgMAjnONc6tLHcL+BRMeK4EAiLsfaA0MxUpK0sbNINLcH0pRp3MEI55ucOo//6bubMw==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=uwA5eC1y6r9HXm94a8qFE8LvX+ahMa0DgqFNE6XCPF0=;
	h=date:mime-version:subject:message-id:from;

Hi Yanteng,

Thanks for the reviews and suggestions.

I’ve noted all the comments and will incorporate them in the next 
revision of the patch thread.

Best regards,
Ke Zijie

在 2025/11/18 9:33, Yanteng Si 写道:
> 
> 在 2025/11/17 16:27, ke zijie 写道:
>> Translate .../block/index.rst into Chinese and update subsystem-apis.rst
>> translation.
>>
>> Update the translation through commit 56cdea92ed91
>> ("Documentation/block: drop the request.rst file")
>>
>> Reviewed-by: WangYuli <wangyl5933@chinaunicom.cn>
>> Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
>> ---
>>   .../translations/zh_CN/block/index.rst        | 36 +++++++++++++++++++
>>   .../translations/zh_CN/subsystem-apis.rst     |  1 -
>>   2 files changed, 36 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/translations/zh_CN/block/index.rst
>>
>> diff --git a/Documentation/translations/zh_CN/block/index.rst b/ 
>> Documentation/translations/zh_CN/block/index.rst
>> new file mode 100644
>> index 000000000000..45172f6d2659
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/block/index.rst
>> @@ -0,0 +1,36 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/block/index.rst
>> +
>> +:翻译:
>> +
>> + 柯子杰 kezijie <kezijie@leap-io-kernel.com>
>> +
>> +:校译:
>> +
>> +
>> +
> There is no need for so many blank lines here.
>> +=====
>> +Block
>> +=====
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +TODOList:
>> +* bfq-iosched
>> +* biovecs
>> +* blk-mq
>> +* cmdline-partition
>> +* data-integrity
>> +* deadline-iosched
>> +* inline-encryption
>> +* ioprio
>> +* kyber-iosched
>> +* null_blk
>> +* pr
>> +* stat
>> +* switching-sched
>> +* writeback_cache_control
>> +* ublk
>> \ No newline at end of file
> 
> A blank line is needed here.
> 
> 
> I don't think these two are major issues, but they are not good after all.
> 
> 
> Thanks,
> 
> Yanteng
> 
>> diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/ 
>> Documentation/translations/zh_CN/subsystem-apis.rst
>> index 0f121f9b0f70..830217140fb6 100644
>> --- a/Documentation/translations/zh_CN/subsystem-apis.rst
>> +++ b/Documentation/translations/zh_CN/subsystem-apis.rst
>> @@ -75,7 +75,6 @@ TODOList:
>>
>>   TODOList:
>>
>> -* block/index
>>   * cdrom/index
>>   * target/index
>>
>> -- 
>> 2.25.1
>>
> 
> 
> 
> 

