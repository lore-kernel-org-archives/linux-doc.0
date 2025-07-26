Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295AB1FAC23
	for <linux-doc@vger.kernel.org>; Sat, 26 Jul 2025 06:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753512256; cv=none; b=sUJGMwLfW/UkWlSm8y9Y+G+Y5tKWUFYC0soH7gOpsSSi0wX/eJBCJXQ9V9QZE6nLihqbRpoZSVXYTlwgPU3q6yhtHNO54xafYsx1nJF5MyIrVlpstuZsR/abgI/bEC3NpoY8r7w+tUzTp13qV5k6C8rnylmrxQSyVC1ZHnnzldY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753512256; c=relaxed/simple;
	bh=Q+hHObkMdFth8rDZp4hYfclJSc8wn+0JM2QLJcQoUCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=io0pDfOmF0bw3a+o9c9+lBYX5pap/yAVX5tEAl2ArxW0TZs4/XsTbfD+VvvyKCUqDShsxSBUo8drFvbAQVcw/NYYZnwehqIjy804+x1xr9NyWoVtluGN7/zXf42AnzMxEOc511vc28dEvuU7+Ubz975jB1o75fy2PtLGhVoDBYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kgXgyxc0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kgXgyxc0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=GMPtRg9nhXHmbaZnTJbid0dt6FRA9YbHwX6Eczcq7Us=; b=kgXgyxc0BTi2CkvwIRAOEAr+e6
	MkQQtKSIXjXqUDFbnha5jvTKNrmUv9hWBIVzBNsbsadxMKpMmYoI8Z6pfJmXviF9tuGwGUhe8wmS8
	Hx1thYiSXuxWTlm+NU9Os2PVsFc7qnQSyInMqqoszO+ESdS/8aOHrWAqzDkyGMxASigY1UaiQj9Y3
	2gLo4wGkf462i01wkYwX3dDge3l/bjm282FfaRtyvJ5auvIWypeGgVtP39FogNz6dbS1rpPTgR70U
	Rd9vzcrzP0qtcrRNn/YRSk7tOUNHNromiCkXC0lMoH+oJXR4dPLtbm/PEhBSS06vTNGAVbB1oM4Hj
	jO3rVjnA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufYdi-0000000BCbO-0rvW;
	Sat, 26 Jul 2025 06:44:14 +0000
Message-ID: <a8741ef8-b881-4fbe-bd9a-47f8dd038010@infradead.org>
Date: Fri, 25 Jul 2025 23:44:13 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: Fix minor typos
To: Ranganath V N <vnranganath.20@gmail.com>, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, skhan@linuxfoundation.org
References: <20250726063645.4156-1-vnranganath.20@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250726063645.4156-1-vnranganath.20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/25/25 11:36 PM, Ranganath V N wrote:
> Corrected a few spelling errors and improved the phrasing
> changes since v1:
> --corrected as per review
> 
> Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/arch/loongarch/irq-chip-model.rst | 4 ++--
>  Documentation/arch/x86/cpuinfo.rst              | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
> index a7ecce11e445..8f5c3345109e 100644
> --- a/Documentation/arch/loongarch/irq-chip-model.rst
> +++ b/Documentation/arch/loongarch/irq-chip-model.rst
> @@ -139,13 +139,13 @@ Feature EXTIOI_HAS_INT_ENCODE is part of standard EIOINTC. If it is 1, it
>  indicates that CPU Interrupt Pin selection can be normal method rather than
>  bitmap method, so interrupt can be routed to IP0 - IP15.
>  
> -Feature EXTIOI_HAS_CPU_ENCODE is entension of V-EIOINTC. If it is 1, it
> +Feature EXTIOI_HAS_CPU_ENCODE is extension of V-EIOINTC. If it is 1, it
>  indicates that CPU selection can be normal method rather than bitmap method,
>  so interrupt can be routed to CPU0 - CPU255.
>  
>  EXTIOI_VIRT_CONFIG
>  ------------------
> -This register is read-write register, for compatibility intterupt routed uses
> +This register is read-write register, for compatibility interrupt routed uses
>  the default method which is the same with standard EIOINTC. If the bit is set
>  with 1, it indicated HW to use normal method rather than bitmap method.
>  
> diff --git a/Documentation/arch/x86/cpuinfo.rst b/Documentation/arch/x86/cpuinfo.rst
> index dd8b7806944e..9f2e47c4b1c8 100644
> --- a/Documentation/arch/x86/cpuinfo.rst
> +++ b/Documentation/arch/x86/cpuinfo.rst
> @@ -11,7 +11,7 @@ The list of feature flags in /proc/cpuinfo is not complete and
>  represents an ill-fated attempt from long time ago to put feature flags
>  in an easy to find place for userspace.
>  
> -However, the amount of feature flags is growing by the CPU generation,
> +However, the number of feature flags is growing with each CPU generation,
>  leading to unparseable and unwieldy /proc/cpuinfo.
>  
>  What is more, those feature flags do not even need to be in that file

-- 
~Randy
