Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301382EB859
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 19:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581003; cv=none; b=FNumj64Yuq7UmXjPFx4JP28+oYSjNaXLSJx39fleueqgk+OwFRfQPWXs9YFAnhtlXvM5KF7CflLg5ldDdYWiddUpNTmFsf5AbbRfprFqDFBYIfvNiZAIM+GvZbeA3wxp34k2yH5XOP0/aOQS5FgHiTpK+x1vmFcuW2w/vkbg1DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581003; c=relaxed/simple;
	bh=sztelLlBrONBmM282viGyh6kz65i94yYxCWrYWozdqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJ0amBbzoRqAklLGnHGsbN17hRaHVDn+BK+0vdPuPd+v3470FaeAJqVOlHlhIwe6xRFWqTTSnjLgdGISQcT0mb4rF4QhSSXXcBLPaFjTip7TpyxoBAfxVLHX0T4nJ3DaOFaE3oLfDFGrzS95k/kktE9y7Pzy6hN85qOETaR9i9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jBqa/z5s; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jBqa/z5s"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ee05b2b1beso783341cf.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 11:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763580999; x=1764185799; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sztelLlBrONBmM282viGyh6kz65i94yYxCWrYWozdqM=;
        b=jBqa/z5s9CGp5RICxeKSJrdO5l3megJVr81FnjM4RHwVEKCUb4xEQ8NaoiOBOhnzcZ
         bMxWoyoMgmSdI5ISZhu0sMMq/bhX6xdwOzl9EI+joXijVlgSlY/nZpUwpWnn/B0Ui1n3
         W1cP0IRwL+kjK02u1dFunMpg85hYN05Dj9YAOL9GP3DccFBflwbNZyVBV7hJoxkN969L
         WGavQPhrCgEO9MrysbD9xVHbtHHSiRc7gCv2T2zrxkr+wtl5uM6DDuTpWX8LCAjj2xlp
         FMsXVMjmkR4zOh3um/QXeOnX47MD5GU5Nvj7Dyi23HwJxfdQIj3H8yE3t+KQbYckONLZ
         +Lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763580999; x=1764185799;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sztelLlBrONBmM282viGyh6kz65i94yYxCWrYWozdqM=;
        b=Xb4nunfr3KKexIYDXPOeg2gCJbeboRkBvxgB/Im1AkuiqM9nOKLR3dofwxRt4/27Rq
         KUpLYHHbVYujUrKQtB7cUPzjJQqgeKTQuKQBQvmOASsSE06I2pViAbcGDXA5F9VIXMnX
         mXpGf5RJvjsT7W3jtlqr8sbddp/Y+He88rzj9ZcPWfhGWzCAt7LbvcZ/ojcSF4eq/G8L
         EBDvYsmzhODhnG6r5p5aBBhuP0X7eC3NZ6kzTUj2wh6XGHmBQyuCJRQ91dDcWQzF1JrL
         oM3X57KOqx3FwukcREgqCvzIWy9t19+sucQ5+xQ1Z0pUgCECxut4tQeHNZ5he8Csv7To
         PrcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTLMLZAg6r7RNyUvxHN3/oU07NaXfMLoZKDz/GzBQd8Ya2oFPTydzae1VznczugeMJs3HisC7P8cY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/KxVlvn5iOpEOCl6KugC94dub4uH2CAyb4sSp0HRm63VVEU7O
	D8pFo1eWaC+BjW+XBx1K355rXBr/DLbNrmHeHEDnuGaeAmbdU612DMg1CRfzQNIaUtE=
X-Gm-Gg: ASbGncv7bCBHNkAJtJ3FskDF1TAYFf2k79/YGqHswNV4Cb8l0NYXgUu2RyMp02Yv99P
	MQdSTzy8oxVCVkr4xYHac4REOqJCcH7r1vhan4KWIz494DLS8w9trnmm3BHZmS2JrCQ+ng+dDFK
	zQeuTYfL23Kr+qAmRzEosuhjWW9KdJRk2DIdE8IoX8sFIHs8oRMQ2rgjG0YKvl4NOioH72H5vAp
	H6Ejqx0wez9PBFBcVcWvYHmzRVzG3qebHuqROUDtOJEDPWEW3LkH0WQiX2RqvePNkwKm8C6BMci
	41K6Ll/FytL4b5/kfNsp8vvVa3XxjMjJUgqXew04BtOB4bKEoAH9/bs0lfiFKYIsYQ0Ga1dwnTo
	VQiUc3JTlJxiFe3BIDH+IHM9hacAonnjz8qsdiyWpW+i9BCfYVMoWmMwQh76PRBEI8QGd1mjV8Q
	2sMGGEyCG9QSX4Azj1JW+nDFmNz4vrJA8TYYnZSH1Q6XOZeoQee/aCK1OP
X-Google-Smtp-Source: AGHT+IEogkhlTHFcyAE9/u1UuBQV+X3tukog/nHIoHavB/ndnYOWZGPWrkYoYNh/EOln2cA+Kp4KoA==
X-Received: by 2002:a05:622a:310:b0:4ee:1d84:3068 with SMTP id d75a77b69052e-4ee4971a985mr8236121cf.76.1763580999342;
        Wed, 19 Nov 2025 11:36:39 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48d64503sm3117901cf.13.2025.11.19.11.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:36:38 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vLnyo-00000000bYz-0lQx;
	Wed, 19 Nov 2025 15:36:38 -0400
Date: Wed, 19 Nov 2025 15:36:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>,
	Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
Message-ID: <20251119193638.GQ17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119134245.GD18335@unreal>
 <6714dc49-6b5c-4d58-9a43-95bb95873a97@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6714dc49-6b5c-4d58-9a43-95bb95873a97@amd.com>

On Wed, Nov 19, 2025 at 03:11:01PM +0100, Christian König wrote:

> I miss interpreted the call to pci_p2pdma_map_type() here in that
> now the DMA-buf code decides if transactions go over the root
> complex or not.

Oh, that's not it at all. I think you get it, but just to be really
clear:

This code is taking a physical address from the exporter and
determining how it MUST route inside the fabric. There is only one
single choice with no optionality.

The exporter already decided if it will go over the host bridge by
providing an address that must use a host bridge path.

> But the exporter can call pci_p2pdma_map_type() even before calling
> this function, so that looks fine to me.

Yes, the exporter needs to decide where the data is placed before it
tries to map it into the SGT.

Jason
