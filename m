Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EC82DAFBD;
	Wed,  8 Jul 2026 20:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783543291; cv=none; b=LwiNq4J72otRpugUWoxiBdSV7MvN4cem8zBT96admPGCnQVbGahVr1rIcSXn6a/c+Yen7NHCJql7u3QXK/A1sF1GLEFQcap9HttvmKdLEdinsnKC61YvIA1vStIaZAiuy9X9IGVOorFXpLqtNo974U41TBFe9c/arr88jMJ+G4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783543291; c=relaxed/simple;
	bh=CWLyyWdS2a/eNhT9flBP/v+ZGmUAnvGgTlkSSCESOEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A4GAm/8A26ANvXJyWP/rBSSXFbtT2/2IPCMLuwdzxvyMiiI+2MCNucsbp0E1+orZrCOeul4wk+WT0pWXKBuWCcyMWBMv+AV2vDB0w7uCY5v3+vtGsFAGdNZP4rxiGPssRUTrr/+6rnpLNi6U1YzMqk09OLU0Z45ePinDuh1/dEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rgM8KbJk; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rgM8KbJk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=XAEYFMtH5O7tsk1zUthoe5m8ngq7naPrMjsAA+Tu0js=; b=rgM8KbJktB3xz5afIPwba/Pign
	hgj4I+PdcCjtoPqWJUeUSUYRLz3OiAwicOq42ZpdGR2exun9doSv0qCVdV9V2CyzCjfX0ffj7DOoW
	iudABXjUSKwbLxRbucQSGWHpQHDQwDrnwks6lgWtQdSUZEItXVn75fPp8ztVnXyhD2S1690v3RnYk
	eVvMGd0WgXj7mqoW2/pXUhac9yf1YObtcigez9CW9EWjyx7jIswmX+PoBYRJAPLblb+lbHND3V+7D
	sxoBzGVuLJjF2MGBCXyc8daZTioKUHOfqI8MtBGewBBuHHI70AaxslUvF+vSQ9y2qIhGeCkrTTyXP
	XjCq1vkQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZ5D-00000000NTz-3Rm1;
	Wed, 08 Jul 2026 20:41:27 +0000
Message-ID: <04e56c70-68f1-4e16-a1b5-7e308c891035@infradead.org>
Date: Wed, 8 Jul 2026 13:41:27 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: dma-api: remove needless bracket
To: Manuel Ebner <manuelebner@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708194821.357548-2-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260708194821.357548-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/8/26 12:48 PM, Manuel Ebner wrote:
> Remove single ')'.
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/core-api/dma-api.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> index ca75b3541679..ba23a472f794 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -508,7 +508,7 @@ call to dma_iova_try_alloc.  This can be useful in the unmap path.
>  
>  Is used to link ranges to the IOVA previously allocated.  The start of all
>  but the first call to dma_iova_link for a given state must be aligned
> -to the DMA merge boundary returned by ``dma_get_merge_boundary())``, and
> +to the DMA merge boundary returned by ``dma_get_merge_boundary()``, and
>  the size of all but the last range must be aligned to the DMA merge boundary
>  as well.
>  

-- 
~Randy
