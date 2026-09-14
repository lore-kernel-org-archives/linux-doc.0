Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D0830E0EE
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 22:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789423830; cv=none; b=NqS+urxjWnUnxcpO4kR0eoWlVOifFYCRyZbAZKPZ30pMPEtZFCxqvxUb0IoVSkE24R2YafnwB/S4Va/lTMYNmKkNd6aC+URIkeAE1EVbUzOCXqBTFb9ITKLp+0ggvQb/1RhN/MpE/6nR2V/cTGwf3M2Fi6VduRrXs/5RN3MrLZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789423830; c=relaxed/simple;
	bh=gLzjztUBh8eUXFB5ZGRmFKOT+KaN6m6lVeXdcVVl7OY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPRwnPO/chCb21Qxw6FmrNO2vZl9QXIJcmRZKth1jcHSZGyANVaiRcOpBLl54+iKQ6sIJiYyCjZpPUcfSxeCq4LppggkzBlWYH+aXdmUJ92WOLejuhB4bTlHQIMlyzQ5RP7D7r6awuoX1eBL6sZ67RoHEy/Oec6s6imAXwJWR5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MrNn2ABe; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MrNn2ABe"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-910316a2fc9so54110626d6.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 15:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789423827; x=1790028627; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3XZNUGEs58um27ogp+l/DHH3zgdwh/5Gz7nOI7x+eE=;
        b=MrNn2ABeVBBLD/psDiK3m8CL12AHXAedKA09BStuiTLavMSh2zkru9FcuKOt20Zbjd
         MPuKWICMDaDu/HrKe+osLXQuiOHKgIz3nULbZlBumSaVQJhTLkdnV6i9qHniuVqW7zyW
         VUq1B9Bp84J9Rmxq5H3BEM/2OYugq9xo+DVbdYSYrhWZIL6yPubVIh9tyoadKkW6MJcV
         wsph/3jwQHxIFMT19YoinBg6KV86GUOZkG3sd6wCFOt9ngTtwh4QitLZn8CBgXRZnGDj
         Uy/1BXjUOwpbZcfnryQr4uQtx5ZAYZ3K1fuuA9VhOBVPQzJQz323ALZB/IaHz9C4sT0n
         44LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789423827; x=1790028627;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J3XZNUGEs58um27ogp+l/DHH3zgdwh/5Gz7nOI7x+eE=;
        b=NDYuPKVWrmSk3YJ07megfI+rxjndR1jLhWp6QH5fTCRkJmuF3wWpJULdzmbPMUofpC
         zvUAKaOd2/k1Cd2SKOHqbsU2JZofwknlJx2cIrvzJoV0Oa57hyct0KiVFxIzNHuSL25d
         aBtJ62nXi1YwL95ed1ShNgWw9LBNYV7yUKIYWSFdIJ6mC/N7xRTS+JzBiZV6S3KQMJdC
         8VJSwvAKRgqKO9dRljl9NYxjDafnzn4FEhUAOmb0SAAL7Aox/sxcMRUvBCH/4pqnwo7v
         4a6X7dJ2ImTfJz7/Dkjj+oNXsdoVoie4DVVSOLiBmaPZ8qtilUajDGBe56OJm20wGq/a
         5wHg==
X-Forwarded-Encrypted: i=1; AKwUvByggziGuVSLyMEJvoUBrmIaPxv4WewwQVqFsY6IFKL+KGR1FAUVtLmG7kmwNeNVzzVrP+f48x7FPFs=@vger.kernel.org
X-Gm-Message-State: AFuF++mOjCn7IR1oaDvuWATdmYpUUkD60wCS6nAvKQl0Zf2uPafAW3sI
	XvuZp0NQDPhySyX9P5PFHVTtQS95Rke02vzFCZj52H3wG7Ru7PSg39J1E6Y/qkYy4us=
X-Gm-Gg: AYBFou2r843EKYmfFyEJuCHS6u7b3Gx7v5Ijvex/bVGQjWRLN/6NiWwkAvCtnFA9cd8
	BMREkGQJrHaE49cQUlnFmhKKBrFAs3hzkQGqGAeI1KOuc7OvNDCrCLvKKVub0adHT9mmPP51W7d
	PD56o5AUQlrh0Tnd9Ljb7+GQ7AspevoRTeQhh6F5uKbiLRs7UlmeJ0Z3yVOwhRogHXD1IPiAROc
	qDdHRYyT4BXFOxxMvqD7BByiEMFI0YRtv2AvwG2XdME2or50dK/xBQ1b3stclEeS4LBKK3kZhwN
	oqMWJigUJJ2YfGiqGo/kibLi6vcctNuMft2gAlm+HoGoVdc56rNJy5oRKymrkEo7WmJYawFMCor
	tEMsMfeYNuiYXlgHE44pnhsISmkQLcMb1bIYB1ARXw/2ISZOWoMBlyIMXIlJfprG+PImXSI/hO2
	Q/3coACYQxOEbf9sJhA5Qfeq8MvubK2CgJPq0gNZ39+Mc834C+pYZwEwMpdnJjSdxeLV7rGlSgP
	5xd8EkZ4oUi5w5iXzlOlJ6edNHEV2wZuDKmAwsbX5oH9YQEK3hAvAJpyL43OVp9LSY=
X-Received: by 2002:a05:6214:2243:b0:90e:9ac5:bfc6 with SMTP id 6a1803df08f44-9122e52dcdamr78819906d6.24.1789423827222;
        Mon, 14 Sep 2026 15:10:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab7csm105588756d6.15.2026.09.14.15.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 15:10:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x6Esb-00000002Idd-3vnk;
	Mon, 14 Sep 2026 19:10:25 -0300
Date: Mon, 14 Sep 2026 19:10:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	iommu@lists.linux.dev, Tushar Dave <tdave@nvidia.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-rdma@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH v6 17/18] dma-buf: Let importers ask how peer-to-peer
 traffic is routed
Message-ID: <20260914221025.GA3196566@ziepe.ca>
References: <20260914-fix-p2p-acs-v4-0-v6-0-5ef07ec9ef06@nvidia.com>
 <20260914-fix-p2p-acs-v4-0-v6-17-5ef07ec9ef06@nvidia.com>
 <d3fb7ea0-019f-4311-bf0f-00d25bdebda0@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3fb7ea0-019f-4311-bf0f-00d25bdebda0@amd.com>

On Mon, Sep 14, 2026 at 04:27:00PM +0200, Christian König wrote:

> > +enum pci_p2pdma_map_type
> > +dma_buf_p2pdma_map_type(struct dma_buf_attachment *attach,
> > +			unsigned int tlp_flags)
> > +{
> > +	struct dma_buf *dmabuf = attach->dmabuf;
> > +	struct p2pdma_provider *provider;
> > +
> > +	if (!dmabuf->ops->p2pdma_provider)
> > +		return PCI_P2PDMA_MAP_NONE;
> > +
> > +	provider = dmabuf->ops->p2pdma_provider(dmabuf);
> > +	if (!provider)
> > +		return PCI_P2PDMA_MAP_NONE;
> > +
> > +	return pci_p2pdma_map_type_tlp(provider, attach->dev, tlp_flags);
> 
> Calling PCI subsystem functions from dma-buf is a hard NO-GO.

This is why I had the mapping type arrangement able to know if a PCI
path was involved so it could activate PCI support for that path. In
an extendable way so other interconnects could also provide their
unique knowledge too.

> I shouldn't have allowed the mapping functions to be added to
> DMA-buf in the first place, all of this belongs either into the DMA
> layer or the exporter.

DMA layer is not the place to form dmabuf's corrupted
scatterlist. This must only be done in dmabuf.

We don't want to open code this common logic in every exporter, it
needs a helper. If you have a better place where to put the thing that
makes the dmabuf unique broken scatterlist, then I'm open :) HCH isn't
going to accept anything like that outside stuff hard wired to dmabuf.

> We should probably have a single callback the exporter provides to
> fill in a structure with PCI specific information for a mapping.

Yeah, that is where I was going.

I'm really sorry I haven't been able to come back to that mapping type
series. Were you feeling positive about that? Maybe Leon or someone
can pick it up from me. I was optimistic about scaling back to just
the maping type negotiation as a first step

Jason
