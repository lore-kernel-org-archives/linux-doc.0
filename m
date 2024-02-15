Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059A912C53A
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 23:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708039952; cv=none; b=EmyHChFep7/7uOQctyqBIQr8vSfcFOyvqSb+XYM/hVcAdrD3nBwPTbAEUXjYipQd13W48jOKRjoEyyPX2h2rOAsAO95KWQGRSTNQ9y38TCwfxeU5OuhYj6+GPYGXvZZM3ovNx3x5YNXhOXPW/Dnh9ldiG8quuMeluStO+947E0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708039952; c=relaxed/simple;
	bh=FM1+HUZG5gJUxy5QV5jCr4amZydcFggwvDuhx2BtR2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/UYcEB6dIaMjJLVOyaidbBLZ6gH4y6ATfJRp3z+ck9B8Epm06v7JEMb/qnwxL/qijzc+sNUC6GDgjiidNPhb8knkIB8v90AaDCT847dCiNAz2FTbWdUFLimhpxPXFn2IZK0Gyr0JfbUHa7L1AJ5Keu6ks2GSC3gl06cBFW/na0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mMQAkY73; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mMQAkY73"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=gtD0SNkqZJIb1h8qzwq6wJzbeQyR7+4yTb9BiMe7RMM=; b=mMQAkY73ZB9KVISzIUjffjf1sc
	jEoSylDMIcP0z7VMU61EuBIomnMGl17SL3r0aL5LVzuEt4691GcU+qqHK2vYIt1Q/rvHsUG2acsE6
	Te7ODBw+CFQ4iDy0t87eLBoe4Qv/AF88D6Axf1uUPgF/We18MUUxotekDORnD1TJKRNEYXw/7493v
	VwkplmNUdYbbicaarkxawHmE9VA0l6+qMEfTHxe4wLyoePAMWqmoI5wkw/LV8g4SMP2fVn4ItxB4a
	gkvvR51glSy2slMbC81WYdpBIA0Nk9t5WAFZcv30SHtVnFS6T47iUNlBhSzq7y83DXghHAOiTYqnV
	6nNQIY5A==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ralDK-00000000Tgo-3utW;
	Thu, 15 Feb 2024 23:32:23 +0000
Message-ID: <14e986a7-8e86-4ddb-b9b2-b5c4a54d3606@infradead.org>
Date: Thu, 15 Feb 2024 15:32:22 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] scripts/kernel-doc: simplify function printing
Content-Language: en-US
To: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
References: <20240215134828.1277109-1-vegard.nossum@oracle.com>
 <20240215134828.1277109-3-vegard.nossum@oracle.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240215134828.1277109-3-vegard.nossum@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/15/24 05:48, Vegard Nossum wrote:
> Get rid of the $start variable, since it's really not necessary.
> 
> No functional change.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  scripts/kernel-doc | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

-- 
#Randy
