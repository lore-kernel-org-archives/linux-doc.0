Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7A955896
	for <linux-doc@vger.kernel.org>; Sat,  5 Oct 2024 08:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728118218; cv=none; b=Ib5yodWfk7kdN1cSrcv3ndcohgoXX5MvAs1DRQ+Eh9O5ioGEvOkoyQ4M0khznxv184oWNyykaZhg9ANX6JDs81id0+yno1LBAmN5s0YpKk/XuRn78F2C1qoO7wW5oBAhAB+ssKOu0yqhf4tMnYgf2hE+hx9r7OUyulqynN4PSIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728118218; c=relaxed/simple;
	bh=QuzmmglPoJFxAmQ+97yNnV9PvID5WbYqF959tpT2wIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQID4AJKwPmvFX8u8jXjvSpo3HARl0vk6EvLc8G4QIKAyzb5J84gHhmNRURrWRJytACrdZKSlSaNu60zVGUXwYJG9KXxDSXCTRdC3+zqmGXVym87ip++Q97BqkaPf9LtT66tGLUuYgkbPruf+BY0SZT0VPwxU72PvxFQzfehkKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oAI18l22; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oAI18l22"
Message-ID: <68116566-c075-4f29-9809-8d93b69a933e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728118210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4lcqzMzX/PIGejsyaLTXVDuOyqI6D2Vso1SQoiZcnFQ=;
	b=oAI18l22uUL391A/krkgFsDv76PQ2l1rYyC11icTmzvZ1cW4QDlHkpBw6v3R/wz7zu/8ao
	Kl+G8voQCbijmuVJzrzwECI4B8RN4X9JSZg4PaGn6wZSDc6/JjsO8MtDyaWeAv+HkPOlmt
	3l94JxdjqGAoMyPer2vBJjqOoYYBA50=
Date: Sat, 5 Oct 2024 16:49:56 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] Docs/zh_CN: Translate page_tables.rst to Simplified
 Chinese
To: Pengyu Zhang <zpenya1314@gmail.com>
Cc: alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
 seakeel@gmail.com, si.yanteng@linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, yaxin_wang_uestc@163.com
References: <20240919133825.15606-1-zpenya1314@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20240919133825.15606-1-zpenya1314@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2024/9/19 21:38, Pengyu Zhang wrote:
> This patch provides a Simplified Chinese translation of the
> "page_tables.rst" document, aimed at improving accessibility
> for Chinese-speaking developers and users.
> 
> The translation prioritizes technical accuracy and readability,
> ensuring that the content remains clear and informative for
> its intended audience.
> 
> Signed-off-by: Pengyu Zhang <zpenya1314@gmail.com>

Overall the translation looks good, thanks for your effort! Only two
nits inline...

> +在页粒度为 4KB 且地址范围为32位的情况下，pfn 0 对应地址0x00000000，pfn 1 对应
> +地址0x00001000，pfn 2 对应地址 0x00002000，以此类推，直到 pfn 0xfffff 对应
> +0xfffff000。如果页粒度为 16KB，则 pfn 分别对应地址 0x00004000、0x00008000
> +... 0xffffc000，pfn 的范围从 0 到 0x3fffff。

s/0x3fffff/0x3ffff/

Mind fixing it in the original doc?

> +本文将简化并概述 Linux 内核如何处理这些页面错误、创建表和表项、检查内存是否存在，
> +以及当内存不存在时，如何请求从持久存储或其他设备加载数据，并更新 MMU 及其缓存。
> +
> +前几步取决于设备依赖。大多是架构跳转到 `do_page_fault()`，而 x86 中断处理程序由
             ^^^^^^^^
I'm afraid this is not a correct translation for "architecture
dependent".
