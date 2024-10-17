Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF4123741
	for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729131883; cv=none; b=DEeqkjyltP71UzzS0pckb5faaGE02HT+YwjtUFri4chOyuSY1q8DRiEa+6cw39wuT+2Qr34AzTGFFN04+ntCFWE8loQuUO9P/0iedzEZeZdUNB47JBhHtcAtv5NVozI3XBDwXwsP933WcRSmSiJ5BLRwngGMXpBM+M63usEoRBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729131883; c=relaxed/simple;
	bh=Do5vG6pniFKL9CgKnRhAzSlGZriNR+Jkfe7eB92gs+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n6ReXsyUroVsRDdojXeI1UOdwBU8uk9T0Ka+C9c/iON8Opbr/r0XnE7HACfQ+X4wYOPqAFNqmeB9FQOmd9TFIWoW/sc4FKgZHJt+baHA2eUZG4znd/1X6n+jSWQdglPjJkZgBl5qr5Ekw7nXbreFOYQhsltYpdTme+esAZtCtYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AKTPquif; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AKTPquif"
Message-ID: <660201ce-9109-4da7-8921-7a781b4b8ec4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729131878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s5km65xJISQkG7Yb2tyjZxOp2bjZuxl/DZnU3wHuWT8=;
	b=AKTPquifZWldMTgRfE9DAvvqxSXSCvlKp/WzoWln6THOwqsEWHnH6/RWn02QcBvujUs07X
	ndMt01Iwj0uv5E/VwLSc0JwZ7ymKxRg2GLc4yFwqO5FnfF/v4iKs2G1L4i9g4XeZX8fMez
	s/BGFaXSP7DTHat2bPpWQDQ7Q98wvh4=
Date: Thu, 17 Oct 2024 10:24:30 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v6 4/4] docs/zh_CN: Add a entry in Chinese glossary
To: Pengyu Zhang <zpenya1314@gmail.com>, alexs@kernel.org,
 siyanteng@loongson.cn, corbet@lwn.net, seakeel@gmail.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 yaxin_wang_uestc@163.com, zenghui.yu@linux.dev
References: <20241016141801.25487-1-zpenya1314@gmail.com>
 <20241016141801.25487-5-zpenya1314@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20241016141801.25487-5-zpenya1314@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2024/10/16 22:18, Pengyu Zhang 写道:
> To avoid confusion with the term "entry," the glossary stipulates
> that in contexts related to page tables, "page table entry" will be
> translated as "页表项," while "entry" will be translated as "表项."
>
> Signed-off-by: Pengyu Zhang <zpenya1314@gmail.com>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   Documentation/translations/zh_CN/glossary.rst | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/translations/zh_CN/glossary.rst b/Documentation/translations/zh_CN/glossary.rst
> index 24f094df97cd..5975b0426f3d 100644
> --- a/Documentation/translations/zh_CN/glossary.rst
> +++ b/Documentation/translations/zh_CN/glossary.rst
> @@ -34,3 +34,4 @@
>   * semaphores: 信号量。
>   * spinlock: 自旋锁。
>   * watermark: 水位，一般指页表的消耗水平。
> +* PTE: 页表项。（Page Table Entry）

