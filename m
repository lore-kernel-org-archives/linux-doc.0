Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752A514C5B5
	for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 02:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729046614; cv=none; b=gxEvh7/44/+otO8jgpMHhG09ZPrS3U1n4ux1LeCK4MTyaFOL81swgDnsaySbth95YSqRKLE3anGrozhNHqXNRPS9VsDuOc9BNQNQwA+rzpJtwEOQEWwr1/Qkpg2jRPSBjBeNz4rCLjT3gEgyqtbP7vusnfLqp745PppbChbLOh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729046614; c=relaxed/simple;
	bh=5quQ9Z0Z7oHrCaae6DYZXYqEEC6z7KWjNFlHX9O+WfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y58VLg4yLrMH3vf71oM/h0MzHG59uRoOzSfBA34LOrK9P0w/yNR23DbCP48nkT8dMHiFpVWEBP57FTPRHZkTtQswMD2QYumlKqSu2fS08y8qknUWe4yvIvm4Xcuni+yITQstClukuhNpJpwXxsNnEmhdVd319R/dZpqTzZV/Kpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=C4cMOhWo; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="C4cMOhWo"
Message-ID: <5f64d14a-4de3-4abe-a0be-9288c2594cdb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729046608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pSaXD5yyprV6bSzARBG4h8KizvJMBQBv9KzMrwwDgvs=;
	b=C4cMOhWoqx+tyJFg5CUAMnEbOvgh3AuGWQIgG/g34fXpfURtu5nB9aiav7goxR4KT6nEEz
	n37G6spoazyKYON98bIYAtrf+gvABTzWldLm8gViQUv0KZkrXynZHbhPef6VnJ0FachHNN
	swnN7gmeRfw6445WEVYZGRJ7rVcmorY=
Date: Wed, 16 Oct 2024 10:43:12 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/3] Docs/zh_CN: Translate page_tables.rst to
 Simplified Chinese
To: Pengyu Zhang <zpenya1314@gmail.com>, alexs@kernel.org,
 siyanteng@loongson.cn, corbet@lwn.net, seakeel@gmail.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 yaxin_wang_uestc@163.com, zenghui.yu@linux.dev
References: <20241015154301.4736-1-zpenya1314@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20241015154301.4736-1-zpenya1314@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2024/10/15 23:43, Pengyu Zhang 写道:
> Hi Yanteng
>
>>> +随着内存容量的增加，久而久之层级结构逐渐加深。Linux 最初使用 4KB 页面和一个名为
>>> +`swapper_pg_dir` 的页表，该页表拥有 1024 个条目(entries)，覆盖 4MB 的内存，
>>> +事实上Torvald 的第一台计算机正好就有 4MB 物理内存。条目在这张表中被称为 *PTE*:s
>>> +- 页表条目(page table entries)。
>> page table entries -> 页表项。 So:
>> 每一个页表项在这张表中被称为 *PTE*:s
>>
>>> +
>>> +软件页表层级结构反映了页表硬件已经变得分层化的事实，而这种分层化的目的是为了节省
>>> +页表内存并加快地址映射速度。
>>> +
>>> +当然，人们可以想象一张拥有大量条目的单一线性的页表将整个内存分为一个个页。而且，
>> Hmm， let's exec %s/条目/页表项 in vim.
> This translation is indeed the most confusing part for me. When 'entry' appears
> on its own, I previously tended to translate it as '表项'.  However, I noticed
> that other Chinese documents have used '条目', so I reused their translation.
> In our context, though, I believe 'page table entries' and 'entry' are better
> translated as'页表项' and '表项' respectively.
Many things are chaotic in their early stages, and Chinese translations 
are no exception. However,
we are working to change this situation, for example:
Documentation/translations/zh_CN/glossary.rst
> How about exec s/页表条目/页表项 and s/条目/表项.
I think that's OK; if you don't mind, you can go ahead and add it to the 
glossary.

Thank，
Yanteng

>
> Thanks,
> Pengyu

