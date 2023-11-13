Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103E121A11
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 17:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="et1rTy4y"
X-Greylist: delayed 2131 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 13 Nov 2023 09:19:52 PST
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E33D7E
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 09:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=t+X3h0tLlX3yo1+ZHCajOFGkEO92RwMUdz8JyR30B9s=; b=et1rTy4y1DAjVf4BnstsIdBcrt
	YTaMuGUIREkG1xGWJ3UfzEB7w4wXKVCRmtWy6Dkg71QDQPKuKQcb+8K9km+tH162XM/9N1ZzigkMX
	qcNoDc/qW4GU1JIAoG7FmDKmZM7sfEBxLrwqoDSKQGL0j+1ayrC4c1mqbXpjfCoGOHIoboaiD+8Hs
	knUlPYI9C8webgyoNq760t8ttKvUMOBd210mO8H5Zdl8jXIgapUrpwi+N+oYKNVxl/50hWYzturZ5
	8/UmVU2ewDnryoDuB7HbYwxyQQJGTx3l4s+U2jlt47pm2XvtTFdyssqoT59vuDPoDBDFPTYV6bdUW
	pCWKJdEw==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <logang@deltatee.com>)
	id 1r2a2n-004lUD-6U; Mon, 13 Nov 2023 09:44:14 -0700
Message-ID: <8899b3e9-50bd-4356-9c94-d2d8a5256b0b@deltatee.com>
Date: Mon, 13 Nov 2023 09:44:04 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-CA
To: Tadeusz Struk <tstruk@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Tadeusz Struk <tstruk@gigaio.com>,
 linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, stable@kernel.org
References: <20231111092239.308767-1-tstruk@gmail.com>
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20231111092239.308767-1-tstruk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: tstruk@gmail.com, bhelgaas@google.com, corbet@lwn.net, tstruk@gigaio.com, linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, stable@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH] Documentation: PCI/P2PDMA: Remove reference to
 pci_p2pdma_map_sg()
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)


On 2023-11-11 02:22, Tadeusz Struk wrote:
> From: Tadeusz Struk <tstruk@gigaio.com>
> 
> Update Documentation/driver-api/pci/p2pdma.rst doc to
> remove references to the obsolete pci_p2pdma_map_sg() function.
> 
> Fixes: 0d06132fc84b ("PCI/P2PDMA: Remove pci_p2pdma_[un]map_sg()")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Tadeusz Struk <tstruk@gigaio.com>
> ---
>  Documentation/driver-api/pci/p2pdma.rst | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)


> diff --git a/Documentation/driver-api/pci/p2pdma.rst b/Documentation/driver-api/pci/p2pdma.rst
> index 44deb52beeb4..9e54ee711b5c 100644
> --- a/Documentation/driver-api/pci/p2pdma.rst
> +++ b/Documentation/driver-api/pci/p2pdma.rst
> @@ -83,10 +83,9 @@ this to include other types of resources like doorbells.
>  Client Drivers
>  --------------
>  
> -A client driver typically only has to conditionally change its DMA map
> -routine to use the mapping function :c:func:`pci_p2pdma_map_sg()` instead
> -of the usual :c:func:`dma_map_sg()` function. Memory mapped in this
> -way does not need to be unmapped.
> +A client driver only has to use the mapping api :c:func:`dma_map_sg()`
> +and :c:func:`dma_unmap_sg()` functions, as usual, and the implementation
> +will do the right thing for the P2P capable memory.
>  
>  The client may also, optionally, make use of
>  :c:func:`is_pci_p2pdma_page()` to determine when to use the P2P mapping

Might make sense to rework this next paragraph as well seeing it
references the P2P mapping functions that no longer exist.

Thanks for cleaning up the documentation I forgot about!

Logan
