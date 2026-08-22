Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE39B28B7C8;
	Sat, 22 Aug 2026 17:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787418233; cv=none; b=WDYEU5TyYFRmDHnSodbqF5t4QzoYhEDYwAI/MqLRQZbreIfgJUhiTEHcnAIo2yjD9Wk/LmQ5oiwz9G3+yYZrvMU0rjam4+rlMzdx5ronvB1KMVYBPVbRrH1TYdSTvszm6Bcs52RqDnLQZOBn23fS0CRVvOfbq4nIOrZeF4iJrqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787418233; c=relaxed/simple;
	bh=FZJp2VFKlPuUAjuvD12tkeybhNEIk1bvzYpy/vmXbi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=deFE8z2P0ybxtbN8rYHxEW7Sxhq+YkRbEIsIj3BXRsqEQ/zcGyYe2RGuNhDoOvciy59KwV5+gT7p3Wk5o5rhxBa5dG54ELM2nWtU31Wo61WWr52L/+WQmEiTbmEpH8uLOxLI4Z2Sv6j94ub/Rvv888pQ++wSC8dczdvXiR2Zeig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DDAh9v48; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DDAh9v48"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=jRurOyxAo2cKk+kp1+du+01wVdAs175oEtx0zjJi6/8=; b=DDAh9v48X2/RXMz369skrvURX5
	wIPW4ZO4nHE3Zj6jedRs2+BtJwohrrQQjZmC4X1+/vkGYYISCCddyCmwLoVDqM4J+2q2Bp/HjFiRR
	xLJCCLMEDGdDvxk2AXgJsHEgdtf8qsm8ju7xld3T1JvAbNWZYTV22QOfLMyY00R9kqRpRm0Y//oXD
	X/vqftSUYXK8I9i1ZumE2bjgvkF0VNi9SkQx+nv/kow7NhqzkX0k9ROPwyd4VDIOwjSB4vUIgDC5F
	G3Za/qXxLtTZa9MtlKa2cmWFc5Z91xFvmq72LvbdioavScE7VxU+AVHcD+CHeAjx3ga3su3tDgavW
	Q4mxDj2A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxp8I-0000000EgCy-3R0L;
	Sat, 22 Aug 2026 17:03:50 +0000
Message-ID: <99b15419-2650-4a51-9dca-cb6dc4357cdb@infradead.org>
Date: Sat, 22 Aug 2026 10:03:50 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: parport: Fix FIFO Kconfig symbol
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-parport@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260822082248.89651-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260822082248.89651-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/22/26 1:22 AM, Karl Mehltretter wrote:
> The ReST conversion shortened CONFIG_PARPORT_PC_FIFO to the nonexistent
> CONFIG_FIFO symbol. Restore the full name.
> 
> Fixes: e095f0711b49 ("Documentation/parport.txt: convert to ReST markup")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/admin-guide/parport.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/parport.rst b/Documentation/admin-guide/parport.rst
> index ad3f9b8a11e19..4aef45262bd49 100644
> --- a/Documentation/admin-guide/parport.rst
> +++ b/Documentation/admin-guide/parport.rst
> @@ -273,7 +273,7 @@ If that works fine, try with ``io=0x378 irq=7`` (adjust for your
>  hardware), to make it use interrupt-driven in-software protocol.
>  
>  If **that** works fine, then one of the hardware modes isn't working
> -right.  Enable ``CONFIG_FIFO`` (no, it isn't a module option,
> +right.  Enable ``CONFIG_PARPORT_PC_FIFO`` (no, it isn't a module option,
>  and yes, it should be), set the port to ECP mode in the BIOS and note
>  the DMA channel, and try with::
>  

-- 
~Randy
