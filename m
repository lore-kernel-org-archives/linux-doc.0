Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB7121883E
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 12:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318062; cv=none; b=UIwqSK6N0tgAC4i6+LwrIofpXSHPnsOQukrlOezZncBdgiDR1i7mh+nWilufoXUgSF3g6TdCocY7xOklU7+Oh+pZGazv3WwmWqur+cDwndaUhocukY8Kfk8BR0oF2T3wctsnDlm8btS/FDzAFk3iGBc6KyfmOfLAdtj/L2BcUfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318062; c=relaxed/simple;
	bh=ykZqC/Mt6PvknDhYlKuIL2nlRrianZMm9PtDxixDlPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLbBKj4V3OtzpfhxTqChaBnPq+45JeR/o11acDnAHqsif5B+y+U6/xzd3B8kWgiZazp2mztS+MYbU2LyYRcbcipFOfoFru3SlH1iaX27XcBMZKqMhoyFqW+dRgISd/AUHmJgnFFWWCuNjfXmnMkAvawIpLIaPH4INCCj/Yc/8IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=lf57U9if; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="lf57U9if"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-509064418a8so11554541cf.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 05:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773318060; x=1773922860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5rN+Dnt+nngZKc/HxpCY0GaFz9G0vHdC78c5bVshyI=;
        b=lf57U9ifEBLyWexzvIhO+XWU98aspeK4epPDkVo+bdUc3uTnRHFJOzAQFqtZnirpvL
         k8WeXlvvSI8u+12g+H+RomdTCxvAsh3kAn5N2BjPPi8vq94s6Oz20FKmexletPuH9CDd
         kY6PAL0+tgqYeVJyO+vItC60qEHK3ThnYf/UD0MFEEj1sd/5cHAqC+CRrRhfsPUeevgk
         NA9hIOWisR9ITVunmGpPNJjiTOXkD9H2lvwvenW8CHns6evMimwcZUGyabHMruJwxAaz
         pcI1HmQBIrJQjeuMNGr7o3dWdYRxf7UmUrzRdYCqQcdIWMOebcd7mYF5Bal6OCbsQR4Y
         5nHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773318060; x=1773922860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5rN+Dnt+nngZKc/HxpCY0GaFz9G0vHdC78c5bVshyI=;
        b=FW+OZqnsk1IHUEuXQPPsOCjdE2m9/8oZRKcmUmFLhj8jNA+4OqK2u6sDzm2H6yEO1x
         fqSEVX4MfxGXk+vC4+Skvog91jbGTbsRkKA9V/hLVv/maCyGKDp+X8frQaKDLk4Jc8Aw
         8DlW1sJ42jmvQGIbgppbSbJdhle+NzeQ7yhnDMfOlZymaXO8qzwsnkf9LPGX04VLhzDI
         uGuHfbh5pf/Yw6WS8TrDoBR4GWBys8AjSawge8+XLVaKz3cMA8Hwna0T3Ne9heho9RV8
         Hw6W953VYL+8BV7t6HJj17CugBZLMLCCMXhOdzuSMhRwIlGpWwtP3RvxDD31AWIhfpl9
         3EWw==
X-Forwarded-Encrypted: i=1; AJvYcCX9+eDxekbeVufO+7HZduGowPaMpN5D21FhVXgIL+GDkxfxOZtCE/QVzNId72zERPa2jOaJdchLHKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCZeieXprHLDOexIb1Andg2uF0F76ddDNcmY+iflMHmeSpfWgB
	60qB+GBzq3FcbNRmn8daPjjqXzivydO/msMsKNBedabk5cQeqbLXSuMOr9eDzNiv7HQ=
X-Gm-Gg: ATEYQzwhmYEG88Js3gOeLMFWCQEDnfsSKfSpJHr1QWyyxSJ5tEeDl9q8PZGmW1lbRgj
	TL0+F2om++Hk/hNtUfSxPGqhBUd42bpNwcfvnTZuo10GSp9XVynlAecvRa9FJbE8pe2p0AzXdRA
	T2H2GSA2WuNl1maxTWps4u9WwXCZiDlUfkfSfu1tHZKIYCdquAnfhy44UgK7qyCsoZMRzzCz6rX
	v+MLyfLYQQKplrerOCl3ZBzADfrexh/eFD30CWrCXWCktvNx5ROL57AJamF/U7wUnYOSwZY3p5f
	bdt97geTjslDm48sffIG3dHNNNsNkcwN4jcIvGFB/ClV9wMkkr0J3jt62c0M2gbFde2BpLPFF8b
	55OLUKO5UUm2jSBuDJuHk8IN2GegX8dwOqYyyEifwLM/JgOkt+/pH63OP4lCUejNbIbRhL6C0+w
	/TmRWX6KaT97BErfJ3FFALXX/rfiZ21cCJpGCQayDoXMveIKhXEEmDmcHLr3orgW/ceS6jtgdCV
	FTPIkLaxs+RXVEnix8=
X-Received: by 2002:a05:622a:11c1:b0:509:4410:4492 with SMTP id d75a77b69052e-50944104900mr62025551cf.22.1773318060513;
        Thu, 12 Mar 2026 05:21:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50939ec5017sm30688511cf.8.2026.03.12.05.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:20:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w0f2A-00000006et5-427z;
	Thu, 12 Mar 2026 09:20:58 -0300
Date: Thu, 12 Mar 2026 09:20:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Petr Tesarik <ptesarik@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev, linux-rdma@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 5/8] dma-direct: prevent SWIOTLB path when
 DMA_ATTR_REQUIRE_COHERENT is set
Message-ID: <20260312122058.GE1469476@ziepe.ca>
References: <20260311-dma-debug-overlap-v2-0-e00bc2ca346d@nvidia.com>
 <20260311-dma-debug-overlap-v2-5-e00bc2ca346d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-dma-debug-overlap-v2-5-e00bc2ca346d@nvidia.com>

On Wed, Mar 11, 2026 at 09:08:48PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> DMA_ATTR_REQUIRE_COHERENT indicates that SWIOTLB must not be used.
> Ensure the SWIOTLB path is declined whenever the DMA direct path is
> selected.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  kernel/dma/direct.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
> index e89f175e9c2d0..6184ff303f080 100644
> --- a/kernel/dma/direct.h
> +++ b/kernel/dma/direct.h
> @@ -84,7 +84,7 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>  	dma_addr_t dma_addr;
>  
>  	if (is_swiotlb_force_bounce(dev)) {
> -		if (attrs & DMA_ATTR_MMIO)
> +		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
>  			return DMA_MAPPING_ERROR;
>  
>  		return swiotlb_map(dev, phys, size, dir, attrs);

Oh here it is, still maybe it is better to put it in swiotlb_map() ?

Jason
