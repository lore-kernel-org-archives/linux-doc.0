Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C353E1A9FB0;
	Sun,  2 Aug 2026 15:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785682928; cv=none; b=s88jaO/jAeikSt39TJhJOp5i+Cuc1LwhwdbwYt66rB2kLF242OJHppzqwrl98JJS8sylEIZGZf4TidWYL+SWOauAILun92p/r7Epr+9Ysd8N74CS20rxcTeHu3uybYlpfX4Y0N0PgE8B2n2DRplcFQ4WfJMhefWC96Y2qfrPO84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785682928; c=relaxed/simple;
	bh=ZZCqYbFsZMKVizyNH/f0xLk3r9vWbXqtbNZn8NkL0Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nRz2eQfHjRE8aH82qDD5i9ExUgBgoCt9Qu0hkpefzyD/tLydhfWtLsL2XgcQb4HDRY7YYyni+58j/TWDIMO9bUtlHm4NbfNZ4sMbQjWLXCA1m1RnsDoQQcEKXxiKUAIAMQsjsREigO1CHFTL1hetF0Xw8+vTAEA/XWqXKCcY/zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dzTij07M; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dzTij07M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=T9mFhlkQME8wbOjqotV3SckwZ77gBJ2jtY9aPTl0uoE=; b=dzTij07MmJYWX8vo8gi9upkO7s
	AFcvFM/UimxpXNZekFuCY0sPH4Hx8Z1At5DCM96FUDWzq6DlHoS6gWe00Orru6X4X87rQhzhpcEmG
	vHGbhjeUgBEMwU7Yg6uXkuxJH5zP9nb2r+S0w9WMmmQsuZ18mH/A+XsVrB518vfN/+KskIQlR1N1q
	tLp1kIB7mtG60YTMHbv+ZVkJ3BSWYXk9dn5IUiD5tiXYGeelc7Kw/ZWeWzEoJcjkOPSx6F4mbRJTu
	aIjw3Ev8R3Ee541ovdbWi5PgF2deB1GGlozXgpGBOQeTfI/R8PLm0E2dMm/yYGl+M/vqTtT5BDCKh
	NlDFsjJg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXhS-0000000Flqp-2Mdk;
	Sun, 02 Aug 2026 15:02:02 +0000
Message-ID: <3c52a2e4-2708-4408-b1db-b01785a62bc0@infradead.org>
Date: Sun, 2 Aug 2026 08:02:02 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kernel-parameters: Remove smsc-ircc2 IrDA
 parameters
To: bolewara@gmail.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260802-docs-remove-smsc-ircc2-params-v1-1-91b302e90cce@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260802-docs-remove-smsc-ircc2-params-v1-1-91b302e90cce@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/2/26 7:11 AM, Anuj Bolewar via B4 Relay wrote:
> From: Anuj Bolewar <bolewara@gmail.com>
> 
> The smsc-ircc2 module parameters reference drivers/net/irda/
> smsc-ircc2.c, which was removed along with the entire IrDA stack in
> commit d64c2a76123f ("staging: irda: remove the irda network stack
> and drivers").
> 
> Signed-off-by: Anuj Bolewar <bolewara@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
> The IrDA stack and drivers were removed from the kernel in commit
> d64c2a76123f ("staging: irda: remove the irda network stack and
> drivers"). Remove the now-obsolete smsc-ircc2 module parameters from
> the kernel parameter documentation.
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b5493a7f8f2..72afae6ea85 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7006,17 +7006,6 @@ Kernel parameters
>  			take as long as they take.  Specifying 300,000
>  			for this value provides a 5-minute timeout.
>  
> -	smsc-ircc2.nopnp	[HW] Don't use PNP to discover SMC devices
> -	smsc-ircc2.ircc_cfg=	[HW] Device configuration I/O port
> -	smsc-ircc2.ircc_sir=	[HW] SIR base I/O port
> -	smsc-ircc2.ircc_fir=	[HW] FIR base I/O port
> -	smsc-ircc2.ircc_irq=	[HW] IRQ line
> -	smsc-ircc2.ircc_dma=	[HW] DMA channel
> -	smsc-ircc2.ircc_transceiver= [HW] Transceiver type:
> -				0: Toshiba Satellite 1800 (GP data pin select)
> -				1: Fast pin select (default)
> -				2: ATC IRMode
> -
>  	smt=		[KNL,MIPS,S390,EARLY] Set the maximum number of threads
>  			(logical CPUs) to use per physical CPU on systems
>  			capable of symmetric multithreading (SMT). Will
> 
> ---
> base-commit: 2d2338c93da79b3bfe4b6099a931d9468d539952
> change-id: 20260802-docs-remove-smsc-ircc2-params-ac9b4fef1443
> 
> Best regards,
> --  
> Anuj Bolewar <bolewara@gmail.com>
> 
> 
> 

-- 
~Randy
