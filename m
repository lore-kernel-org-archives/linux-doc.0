Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A5BC8EB
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855768; cv=none; b=jDpfrMabjl3QpNvlOIld5grXIvHJKmJnK6z1W7djN+pn2jV1EQGQfgevKhj4T9qQVnfidzlrp/tt8jXiRRL1gGNCz/1QMwFxCThZXIuo7DCC0/Z/pToPM+ViYVODLl1RlGxHQkDz6ZxC3y9tsUWgLzY8UpNjIHruvUR/rtEVqE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855768; c=relaxed/simple;
	bh=uCh6TRj7BWDq2jED3MZppkmiQ5hCz9hJHccz6aa4afo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kT7EqnTtVa1o/i5WGxGMuWENYXjfjUrG83d35RmLZ0419rK4siSc/07oBXJiPZ6+uGG1/RqwWIIr/+Qj2eWNjhsInuwKzWSkWxCZYp4EHQfCzCVA8wyYGeM+8Hlsv2A4bumqQSsA/+8RK3WlI3W5L7BGo5f46LtPDcM3OBHYna8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Dh2jxuNE; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Dh2jxuNE"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 66986410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778855766; bh=HHUc31yYkUONY5SmAP0FzINJAZpZCxxY9IZFM8vNzM0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Dh2jxuNEAg6Rj6opg2jDQF2VjybCRWZJqd9JgWk0c0yHjvQTELBPf5WOIorUgpbz4
	 32tC3w7ratJs9gf6RQZbPuGrduxJXeGonUkFu3A/kp6RNAC55j0cdDuxMkshZq+Rve
	 vqxyLamVXWLw6GxCN0Tfo1AdLuQL57Ge6LBNhC0YJqZCSynVPXgLWbMDFy0MOQ2VVm
	 nL752x+YEDuX2xuhx7eh9fVZxgKsPNX+ZfBToZyLHz82XpVCyThTm/xn4M49A33yqw
	 CwTZNmF8TJp2AXTvxgOud8fIgyXec0AmcFdbPZ2ejEHHJgsbZIgAqCCsDtWY9sIftU
	 gnJG31UJzZJvg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 66986410B5;
	Fri, 15 May 2026 14:36:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org
Subject: Re: kernel-doc no longer warns about leftover argument doc?
In-Reply-To: <1ff1d237-fd32-4373-aaef-d19743bb2ea4@infradead.org>
References: <20260514184948.3fa705e1@kernel.org>
 <1ff1d237-fd32-4373-aaef-d19743bb2ea4@infradead.org>
Date: Fri, 15 May 2026 08:36:05 -0600
Message-ID: <87se7spwoa.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> On 5/14/26 6:49 PM, Jakub Kicinski wrote:
>> Hi!
>> 
>> Looks like the new python kernel-doc does not warn when there are
>> stray arguments in function kdoc. Eg
>> 
>> /**                                                                             
>>  * ksz_wol_pre_shutdown - Prepares the switch device for shutdown while         
>>  *                        considering Wake-on-LAN (WoL) settings.               
>>  * @dev: The switch device structure.                                           
>>  * @wol_enabled: Pointer to a boolean which will be set to true if WoL is       
>>  *               enabled on any port.                                           
>>  *                                                                              
>>  * This function prepares the switch device for a safe shutdown while taking    
>>  * into account the Wake-on-LAN (WoL) settings on the user ports. It updates    
>>  * the wol_enabled flag accordingly to reflect whether WoL is active on any     
>>  * port.                                                                        
>>  */                                                                             
>> static void ksz_wol_pre_shutdown(struct ksz_device *dev)
>> 
>> 
>> AIs seem to catch it but that's not ideal..
>> 
>
> Yes, hopefully we can have this patch merged soon:
> https://lore.kernel.org/all/20260507023232.4108680-1-shuicheng.lin@intel.com/

The odds of such things increase significantly when the patch is
actually sent to the maintainer; in the midst of travel such I missed
this one.  Looking at it now.

jon
