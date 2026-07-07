Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EC114ABE;
	Tue,  7 Jul 2026 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783382682; cv=none; b=acis9Fv0gv2xmdOMNK9ZcT9I6OViPDEfKZTsryoc2wOEln4FkOygDolq7w19qdBjzNhK8Sfi0f9CNQsUmqpeNHKKH7oMGzlNHfYxf3TXDIZhbch5BE3kbcPq7dIq3Mz6gjB1pS5AJq6xY5IZcOVapeZ9AZJKjbPFPedAwtxXiig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783382682; c=relaxed/simple;
	bh=4K15lUYlCT2M8aHdYBpqCJdEfhnL4ojMLyt6K+OBoWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCVaNI6RpelADJqPo1sH8gIkAeyzjF8t4IjHihh6Lc6KqZHelbST9+LHIrzp5zFsJli/itv3X9TYkXAOp3jYrLweWI1DfZUqJdvRBD+QBlqbXLQzhYLA6K8vfENeGWgszlpxg06g9Ldiq/cyfcxPK3eddyIvRT2GAz0Yt4r6Lfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jRyjemAb; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jRyjemAb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=wBEE3bGdJJeaKsBMj2QzhwubA7UQnhJ2zebSKEE6TDU=; b=jRyjemAbpHk2JMkzX9tuEyJ6Y7
	nleU1Cl6Q9OBmS9A6uRm9DXMmvqZTQeZGjKCpoekH0HL/f5cgDFba1HvlK4zcZTiolyl4M4V58qA4
	4VnBEHAez89C7wXwCdNj3cZrtfySyLKWn7fyutsxBqPNJmFWimPrnv/WsKItGoE2/D1MtOsYEG2bj
	eIIF80mC7O08eFYqhq7qmuIW1plc50i/vs3QlngyArq3tcr96k9YPB1rdOVlPpdAlILXb1+sajOYX
	ljhvFT2+6IZ9lrf2XQQqXi9rr32Xs4v0t+9iyRLIkm/Vdtzu9TqcBLYstz/ZMrNCj1i5hAjDXc5UX
	VfNczXNQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgtIf-0000000DoWM-0NSW;
	Tue, 07 Jul 2026 00:04:33 +0000
Message-ID: <9811a0ae-5acf-4124-a1e4-4a4d6c267aa0@infradead.org>
Date: Mon, 6 Jul 2026 17:04:32 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/arch/x86/amd-memory-encryption.rst: Fix
 typo
To: =?UTF-8?Q?C=C3=A9dric_Hannotier?= <hannotiercedric@gmail.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260704125516.49944-1-hannotiercedric@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260704125516.49944-1-hannotiercedric@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/4/26 5:55 AM, Cédric Hannotier wrote:
> The MSR address has one 0 too many: 0xc00100010 → 0xc0010010.
> 
> Signed-off-by: Cédric Hannotier <hannotiercedric@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/arch/x86/amd-memory-encryption.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/x86/amd-memory-encryption.rst b/Documentation/arch/x86/amd-memory-encryption.rst
> index bd840df70..92edb26a5 100644
> --- a/Documentation/arch/x86/amd-memory-encryption.rst
> +++ b/Documentation/arch/x86/amd-memory-encryption.rst
> @@ -53,7 +53,7 @@ CPUID function 0x8000001f reports information related to SME::
>  			   system physical addresses, not guest physical
>  			   addresses)
>  
> -If support for SME is present, MSR 0xc00100010 (MSR_AMD64_SYSCFG) can be used to
> +If support for SME is present, MSR 0xc0010010 (MSR_AMD64_SYSCFG) can be used to
>  determine if SME is enabled and/or to enable memory encryption::
>  
>  	0xc0010010:

-- 
~Randy
