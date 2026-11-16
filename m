Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793064;
	b=JDHnuyQ5Wuptmu4MwaTq3DNIdYJPrBzLvQjXRzmzgfNUkWRBSkGf5W3zWaRxUHzZhS2W
	 rhjI9aIIrHIPeKSh2E0MNCFlHW3Sy9sqrr8NGPZOeh+5lUMnAq61tMFyfrPbpfWNA3ygo
	 LpAinLZvZ1necezws0EYHc5ps6YDyM0O8rOVglSZdVhXdZYl5LrN2ZQv6kDtvE3n3doLU
	 Apj0L/NziXfPWCprRaAlx9m6jpLcP4Uw7+x2zJlKS0Qh+z5Q5ec+9aoixrXuwFsj9MrAQ
	 nmgIWRe0tCG5z5oDaAQ99bNJOIB9Yh57aa6S0JYBDBNBP6gNN8l0Ps4g/IzIBR0d5AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793064;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=NfPti2l4XVW6Jl0CkIUKldyppqHnO3n1hWXoe8TU4LI=;
	b=qpKPvsJCbSDutC42iAa7Y7d28R75ju14gAHEnLgD38oJaZoCqie72ZApSHOAYRG6vFeI
	 AxC8cpmXIRf14RTmgwTQP64OXZ0p/FuQgNeHpfAglxq7KE6gx+SUF84GGrgf3k++LfR8g
	 rKcm3ElWoYu8y9cP/kKR6R9fCn4uIvcp4PhzQVRvJIDUzMOqc5wUm/M4Zb532CdKskt0s
	 0bbej1ZBwCpuuFpkl2hZqNL2r0zuZi64ZVU0VieQwH/m7yaf8UTXDeWWAQSydmQAwti2R
	 h0h9V0MVWfbBw6r+7B8i9SUkZ3qxWRgSvIgy3DW8iGl59RtGtEsf1TyZNOBVEnCPUTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tIA8cKMr;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2622606A321
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 01:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2622606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tIA8cKMr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=NfPti2l4XVW6Jl0CkIUKldyppqHnO3n1hWXoe8TU4LI=; b=tIA8cKMr0JV7wSLmMdNwKdXP9H
	CpQSZaS5KjZOTG7DP9/+67orrA7RnkP/heJw3qnLoYvGCuh2sQjtMpTWI5ekg9z2xEX0crQWcjdgX
	LyjAExvAZojmljpeklpnWDXX8USG6D4jKC8T0giNDGOMsKgD/1NMQZJdQrtnFrOZRQWBaC5iibE5O
	S+sUxvhg8oOprRAibeT4or69SJQJdN7IaYYF4m4erfmj/fdKn88y0PTca/wpyyc2KE+K+2D7IyOut
	3erXgaDBmVnsrnx4GtAYbLYXtie/WXw9d3WE9+VpvhrbkP2X8NqWH59gzul5jf+Ay5b5Nk/C7YoMI
	kSSAzgbA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSlfD-00000000tim-0WxL
	for linux-doc@vger.kernel.org;
	Mon, 16 Nov 2026 01:37:43 +0000
Message-ID: <d544a665-9cb4-4e32-8ac6-0e7b65d6e56b@infradead.org>
Date: Sun, 15 Nov 2026 17:37:42 -0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] Documentation: KVM: Fix the function that implements
 halt polling
To: linux-doc@vger.kernel.org
References: <20261111085448.1130701-1-fuad.tabba@linux.dev>
 <20261111085448.1130701-4-fuad.tabba@linux.dev>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261111085448.1130701-4-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/11/26 12:54 AM, Fuad Tabba wrote:
> The generic halt polling code is in kvm_vcpu_halt() since
> commit 91b99ea706578 ("KVM: Rename kvm_vcpu_block() =>
> kvm_vcpu_halt()"), but halt-polling.rst still names kvm_vcpu_block().
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/virt/kvm/halt-polling.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/halt-polling.rst b/Documentation/virt/kvm/halt-polling.rst
> index a6790a67e2058..c311aac1ff9e9 100644
> --- a/Documentation/virt/kvm/halt-polling.rst
> +++ b/Documentation/virt/kvm/halt-polling.rst
> @@ -22,7 +22,7 @@ savings of not invoking the scheduler are distinguishable.
>  
>  The generic halt polling code is implemented in:
>  
> -	virt/kvm/kvm_main.c: kvm_vcpu_block()
> +	virt/kvm/kvm_main.c: kvm_vcpu_halt()
>  
>  The powerpc kvm-hv specific case is implemented in:
>  

-- 
~Randy
