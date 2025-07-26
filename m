Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013621DD525
	for <linux-doc@vger.kernel.org>; Sat, 26 Jul 2025 03:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753501939; cv=none; b=EeMpjdYJ2PtOD7QARAIC339VV6/PntZk2eGI39GOLV16sKrS/2C6FjPyQYIml3FK4HBSn4LXSi64Lh3x3S01P/d2ZGULm2PqdzfH+2KBsjAU32KDYYx6wBWrgJEk2LN6dak0x5m0hoitra9/jfrcyW8txM0GFVPeGsQfEelGNwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753501939; c=relaxed/simple;
	bh=t1zReEhovPyZApkeiZQ555xzuoJ4YN6XcabR2MenPJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+9j1FWU8Kjvw0F1k+fJumDbPeROFgVqjPf1E6V11E6Q2JlnRaBxJ4SJcCYpTHCWDfRCPxfJ/oGGXx4GeYbr4+Wz1g3xVa+NcuGoi2Pf/W8BEUua3rC1qDDhqR4GApUy63+ACSZR7w6v5pSLXOsJj2Zjc1yvAEMOoEta5Y2lDE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TWxqsX5a; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TWxqsX5a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=o6oZrFBvQ3MiGAq+h58alHB6CuZYxZ1UVciU+oh1/QE=; b=TWxqsX5avUGVWb10GdeXxxJ629
	QQ/o3BFizco5jRrr6vVcrfPsTRozVvidfBlS/1u8Ib5DOIX347LCsDlJhiEohv+KHkX/bxJbOEirC
	uzUlegruS68fFH70viiYXoQbh5IpZY6AluwvpjVlQIgGUoPspGF2Ay+PSj79DOBHrMHhZ5u4btlNM
	Vkh6H2G+5kG9TJayveOjWPEyVfMWESNu51u0lkALfYUgy/7OZetW2a2w4faD7NAOp5hrWjl09Ms4r
	PzMxm0ioCSPh9xo0SzESrCaCPjgRYRyP8oUTLht/xAmMQCoveVcpPogIaZaZEP9IvoV9yDdql6m7H
	0dgkfuUw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufVxJ-0000000B69F-1Z9e;
	Sat, 26 Jul 2025 03:52:17 +0000
Message-ID: <80496925-6e3f-408a-a9e7-4d333f2195ec@infradead.org>
Date: Fri, 25 Jul 2025 20:52:16 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: Fix minor typos
To: Ranganath V N <vnranganath.20@gmail.com>, corbet@lwn.net
Cc: linux-doc@vger.kernel.org
References: <20250725134940.12106-1-vnranganath.20@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250725134940.12106-1-vnranganath.20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/25/25 6:49 AM, Ranganath V N wrote:
> Corrected a few spelling errors and improved the phrasing
> 
> Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
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

ack

>  indicates that CPU selection can be normal method rather than bitmap method,
>  so interrupt can be routed to CPU0 - CPU255.
>  
>  EXTIOI_VIRT_CONFIG
>  ------------------
> -This register is read-write register, for compatibility intterupt routed uses
> +This register is read-write register, for compatibility interrupt routed uses

ack

>  the default method which is the same with standard EIOINTC. If the bit is set
>  with 1, it indicated HW to use normal method rather than bitmap method.
>  
> diff --git a/Documentation/arch/x86/cpuinfo.rst b/Documentation/arch/x86/cpuinfo.rst
> index dd8b7806944e..3d61b9d06f7b 100644
> --- a/Documentation/arch/x86/cpuinfo.rst
> +++ b/Documentation/arch/x86/cpuinfo.rst
> @@ -11,7 +11,7 @@ The list of feature flags in /proc/cpuinfo is not complete and
>  represents an ill-fated attempt from long time ago to put feature flags
>  in an easy to find place for userspace.
>  
> -However, the amount of feature flags is growing by the CPU generation,
> +However, the number of feature flags is growing with the CPU generation,

I don't think this needs to be changed, but if so, I would say:
                                                   with each CPU generation,

>  leading to unparseable and unwieldy /proc/cpuinfo.
>  
>  What is more, those feature flags do not even need to be in that file

-- 
~Randy

