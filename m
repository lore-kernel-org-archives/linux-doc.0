Received: from mail-m32118.qiye.163.com (mail-m32118.qiye.163.com [220.197.32.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF81F2C45
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 03:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763435840; cv=none; b=ibzy7kihlEolPR21IlfamA9+P+B/emXhYcrJdJBFW7ARy5JB9gS48BjLnHQY0+So5y5RVnenWEKQsbtqNIBe/HHx+L8foUeQGpCSUUlcsyYD/uNDj0FrYt+RvloHXzTKWd6uHPjvHjiYuKY2UZqNC6b5lZP8nGgcxDr2kg2COb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763435840; c=relaxed/simple;
	bh=JswsXCguy91hiDu7enVnb5Us06XyOvzX1yz1O72wke8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sk20IJnzw9IA3Z3Qe+XHbiugVcQheh1Nb8TSUXV3WQk1ORXmpi2AvdZMVvsmeVy9UQALhidtwDR97bm8igVxQjAu574Mx6+6Tk/f9TwLC7StkG7/DRNwVGJUwAHyR89UPPFDZdRj46ZKjBiz5iN7NdLiAvvanVilMa0Kt6gqVdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=aH16ghCT; arc=none smtp.client-ip=220.197.32.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="aH16ghCT"
Received: from [10.0.66.19] (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29ed66137;
	Tue, 18 Nov 2025 11:11:59 +0800 (GMT+08:00)
Message-ID: <0a3f9f2e-5323-4797-b146-56ece9ffc153@leap-io-kernel.com>
Date: Tue, 18 Nov 2025 11:11:58 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] docs/zh_CN: Add blk-mq.rst translation
To: Yanteng Si <si.yanteng@linux.dev>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 wangyuli@aosc.io, doubled@leap-io-kernel.com
References: <cover.1763366835.git.kezijie@leap-io-kernel.com>
 <c7a80affd45be8c11a236472977cdffab16e895a.1763366835.git.kezijie@leap-io-kernel.com>
 <1f5870b0-211e-40f7-836d-7118654ce3fd@linux.dev>
From: ke zj <kezijie@leap-io-kernel.com>
In-Reply-To: <1f5870b0-211e-40f7-836d-7118654ce3fd@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a94f29cac09d8kunmd76e9e80493d629
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHRhJVh4fTx4eS0weGE9NHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=aH16ghCTUUevxgOwGaqyP1B+ksJjY4eD1daCDMed8VPBROz5AZQO0xRaiO74h0zTzRCAFgdc7czrJ3FLVhE0t9L0j3HSy1EosNaVAUmyqekhqYQP/bZrgcwuJYqToDf30hLBC8ukTiWfBqbyPUWnElFIz7Ty5p8heWPloAxCqoPdsaaSMHN+dQfO/s5d6Wo5HY/M9xLGQ+8cMsPd6jkxTr2n6Bf1Q/OnIJ9VM9CZHy4eAsM9WV15w0Ob7AacwpN3bKkBkwUEXb2PaegmoLvtBpVGPReSPMYED5hQRqvHdVIreDh9Ab8YqgOiN/lD8vG9qpWsvnh5TkV6iZyHdmhLAw==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=un8tAkhq9/pwmpwKWqrrjD0AN5srT/totbIQSy2FBZY=;
	h=date:mime-version:subject:message-id:from;

在 2025/11/18 9:51, Yanteng Si 写道:
>> +基于标识的完成机制
>> +~~~~~~~~~~~~~~~~~~~
>> +
>> +为了指示哪一个请求已经完成，每个请求都会被分配一个整数标识，该标识的 
>> 取值范围
>> +是从0到分发队列的大小。这个标识由块层生成，并在之后由设备驱动使用，从 
>> 而避
>> +免了为每个请求再单独创建冗余的标识符。当请求在驱动中完成时，驱动会将 
>> 该标识返
>> +回给块层，以通知该请求已完成。这样，块层就无需再进行线性搜索来确定是 
>> 哪一个
>> +I/O 请求完成了。
>> +
>> +更多阅读
>> +--------
>> +
> 
Hi Yanteng,

Thanks for the suggestion.

I’ve translated the titles in the “Further reading” section as follows:
>> +- `Linux Block IO: Introducing Multi-queue SSD Access on Multi-core 
>> Systems <http://kernel.dk/blk-mq.pdf>`_
`Linux 块 I/O：多队列 SSD 并发访问简介 <http://kernel.dk/blk-mq.pdf>`_
>> +
>> +- `NOOP scheduler <https://en.wikipedia.org/wiki/Noop_scheduler>`_
`NOOP 调度器 <https://en.wikipedia.org/wiki/Noop_scheduler>`_
>> +
>> +- `Null block device driver <https://www.kernel.org/doc/html/latest/ 
>> block/null_blk.html>`_
`Null 块设备驱动程序 
<https://www.kernel.org/doc/html/latest/block/null_blk.html>`_
> 
> Translating it(only name)?
Is this translation acceptable?

Thanks,
Ke Zijie
> 
> 
> Thanks,
> 
> Yanteng

