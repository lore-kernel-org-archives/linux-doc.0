Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37125184F
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 02:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728959370; cv=none; b=fBhc2GNuSD7OkeZp+KWR/e/ZYbAYB59/PcrGTArUwbBUlVH4aIk2dgtG84yklUn6HDl7UO0+1GxreXyxNbZeRzdYxqLw0rlSSUwurJ9mgsaZsF7TrENAnHMNbagO/2Zj9RXHfiMFRS3/IRTL8BSKRgN6XU00zc3wQNbmV4qZnDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728959370; c=relaxed/simple;
	bh=AA7r46btC76m/EE0Yl6i2cGRHcnbkixeirU21j8cHIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cU55i7S7tEAzkY9ZSaBYxa0QQiSKkk8VepOYrb95h0r0d9OJUtqhGFf66WWMWgn4jV5fQsD8q60mfPCzQgS9VQG9r5rK3QRBqnaWYpvUAK6Dh1YKadIgb4dzIuhvr0r/BjhTQ/gP5Ke9gr/6el0vZWN/nf+3PLq2NqQ9oBxF0q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=i3HH71+p; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="i3HH71+p"
Message-ID: <db9cd093-ed7b-4c09-a47a-4e45e303242a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728959365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mogAPavdVRePPG4uyteXekjsOHZ6NldfaGF9eaLXN9Q=;
	b=i3HH71+pg0EgBtCNdSDQY/pNmFERgp4vLO98E/GRfuk5rPszSZ/BO+GMqUD9gAoVbHTHYp
	cSF3IcV1uBXJ7khJiZe+RyqxuQP9b0FKy4yuoiuqczwuEYqCheR2YQq27OuLzpUR1d2ynG
	cEsO/640RhNRN7ixaWXjD8SDnzowVf8=
Date: Tue, 15 Oct 2024 10:29:16 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/3] Docs/mm: Fix a mistake for pfn in page_tables.rst
To: Pengyu Zhang <zpenya1314@gmail.com>, alexs@kernel.org,
 siyanteng@loongson.cn, corbet@lwn.net, seakeel@gmail.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 yaxin_wang_uestc@163.com, zenghui.yu@linux.dev,
 Mike Rapoport <rppt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
References: <20241014155526.17065-1-zpenya1314@gmail.com>
 <20241014155526.17065-3-zpenya1314@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20241014155526.17065-3-zpenya1314@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2024/10/14 23:55, Pengyu Zhang 写道:
> The documentation incorrectly calculate the pfn value as 0x3fffff,
> which should be 0x3ffff instead. It is obtained by right-shifting
> 0xffffc000 by 14 bits.
>
> This patch corrects the value to prevent any potential confusion
> for developers referencing this document.
>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>
> Signed-off-by: Pengyu Zhang <zpenya1314@gmail.com>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   Documentation/mm/page_tables.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/mm/page_tables.rst b/Documentation/mm/page_tables.rst
> index be47b192a596..e7c69cc32493 100644
> --- a/Documentation/mm/page_tables.rst
> +++ b/Documentation/mm/page_tables.rst
> @@ -29,7 +29,7 @@ address.
>   With a page granularity of 4KB and a address range of 32 bits, pfn 0 is at
>   address 0x00000000, pfn 1 is at address 0x00001000, pfn 2 is at 0x00002000
>   and so on until we reach pfn 0xfffff at 0xfffff000. With 16KB pages pfs are
> -at 0x00004000, 0x00008000 ... 0xffffc000 and pfn goes from 0 to 0x3fffff.
> +at 0x00004000, 0x00008000 ... 0xffffc000 and pfn goes from 0 to 0x3ffff.
>   
>   As you can see, with 4KB pages the page base address uses bits 12-31 of the
>   address, and this is why `PAGE_SHIFT` in this case is defined as 12 and

