Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAAF2F3621
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 01:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778810295; cv=none; b=II4xl4t/AUmTYYR2M7MTz7KShMQSojoukRIwCpcIcLR0+IIwVzdgmdDsPpcfZ3+racrfByYVL8vh8XcidzaAzumkG31Qr4HnTkR1sa0OtGrLrqseOQOWKQmglZpR7uwUcukgIBwT2ZDTB9WEJrTSMFFh7ZgROjN90yE+W2RpWww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778810295; c=relaxed/simple;
	bh=L4t+uQSIrWGHIHj33V/zbdEN0TXp0yNGvzeXCY0pJoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0S1Gp9883D15Kd/iYEs9O36YFy6My9iZnFbRCCWy6Qt9oFDzOLeT8FM3abYAVcfKI0BIGFxzcO0YWlXBt4OMZY54VH30TIYVmyrpv4msXbYKMgzs5uMwR5Fc3eOil9Pk7HJqF72fnRfC3UxPxkwFuk/ZZ1RRHQPDovmiYcan7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dNr8DHoE; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dNr8DHoE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=qQNIhZUx3WLFDRMgSL/B4XE+n8adzpdyE5ybMWI0sqs=; b=dNr8DHoEV7PGAWMYmSyfotxwmx
	Wv7uS4lS9gHcrLS98lN6zG3Oyni1yxoSOOsvF0Aiye7rDft8WlWXRn+rRdplYkt4ZmEkVFwYFMG9g
	E87nZ09xo1Du75rqcM34oaHrZB7v12VqGW8dIcvMiNcJ1Q8Rw8f7LnFpA8pgm5wIkl/PHg0LWGpGP
	EeYau0ZehItx265C6Z+tn1prQDqXEh1pjEGC4OWZal+TmtlRTaX79XcGVAJAUe/KJvNaAvBQxCxLe
	u8ppufWwpCJF/7WNCI560yhgBfEP7P5pcLMSHlANlKHsh4xpkK9oa+LkRwUB4sAXGxU6hMjYVvJ0X
	/NlOKhgA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhoX-000000074E9-34CE;
	Fri, 15 May 2026 01:58:10 +0000
Message-ID: <1ff1d237-fd32-4373-aaef-d19743bb2ea4@infradead.org>
Date: Thu, 14 May 2026 18:58:07 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel-doc no longer warns about leftover argument doc?
To: Jakub Kicinski <kuba@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org
References: <20260514184948.3fa705e1@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260514184948.3fa705e1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/14/26 6:49 PM, Jakub Kicinski wrote:
> Hi!
> 
> Looks like the new python kernel-doc does not warn when there are
> stray arguments in function kdoc. Eg
> 
> /**                                                                             
>  * ksz_wol_pre_shutdown - Prepares the switch device for shutdown while         
>  *                        considering Wake-on-LAN (WoL) settings.               
>  * @dev: The switch device structure.                                           
>  * @wol_enabled: Pointer to a boolean which will be set to true if WoL is       
>  *               enabled on any port.                                           
>  *                                                                              
>  * This function prepares the switch device for a safe shutdown while taking    
>  * into account the Wake-on-LAN (WoL) settings on the user ports. It updates    
>  * the wol_enabled flag accordingly to reflect whether WoL is active on any     
>  * port.                                                                        
>  */                                                                             
> static void ksz_wol_pre_shutdown(struct ksz_device *dev)
> 
> 
> AIs seem to catch it but that's not ideal..
> 

Yes, hopefully we can have this patch merged soon:
https://lore.kernel.org/all/20260507023232.4108680-1-shuicheng.lin@intel.com/

giving:
Warning: init/test001.c:13 Excess function parameter 'wol_enabled' description in 'ksz_wol_pre_shutdown'


-- 
~Randy

