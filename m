Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0114827F4CE
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 18:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181331; cv=none; b=iMxXYeKxlokgmZoqQWwjeoNup0U1c8KDSTgR/lbGPYeHhRa892D9VizbWL2KprbsphqRnMX129C89HPy/MKgaLW36RnXm33ATDwUOkNvUsPao4CjT/pbQ+PGyPNxdQJWtVwD85dACqhKsxj6hztRwamDStuUW6oM5hI3d4y0jhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181331; c=relaxed/simple;
	bh=JIffUHW/SybQCLCBlH2E2/WPQRMwm/ANevb672L4zvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cULNBvLlRx1F4zb7+bJTDJW0INY6vJBgzMtNF9LS3bxX4pV7ecQIxTb685h1+tODsRUeLyXhjKVADk48nYczXPm6r/as2MVNzaR7OSI62QACMF563jGMOSQfXYaMliv/AGzUsWEFq5G17UHbZtz3PfMIxoUAQ9ePAGho1j7Lq7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JTFitk+x; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JTFitk+x"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8738c6fdbe8so897666d6.1
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1764181328; x=1764786128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z/U907VaMhbY9//mqwOrvEDrs07VSJFQJVoQC08LGfc=;
        b=JTFitk+xI0qNBQ+kRuacLdQRKJH1sL5eCYUpb+ADHqCoFeo3VfAxBGdB2i4R2NkobF
         Xf/wjMevGTjQ353uyVYXJMAWRp/TZXY0G67f1vZTjs3m4K7Ntuo9GC+ej5LNHQ/kNrBM
         u4fV+bKlD5tZrNX9GwchRtndVRAgpdB0Z4TbXBA8cT78BDWkEiyfDg9kiKxkUrPvz6tr
         lWONHqQIlMM7BWG1oNQbrobYb00ZxKE6TccxWHSBQHalKY0e7sTZl//TIHC1cB2zIMnH
         ajxvF6jJQLruyJfdNUIslPhQzTE0BrKylWCub20/JtzrynUVyAhbi2MqlnTThg4spvoz
         K+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764181328; x=1764786128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/U907VaMhbY9//mqwOrvEDrs07VSJFQJVoQC08LGfc=;
        b=RoGJtpMqggYfPEmzjUgSWO3Cn1Xf1rF/0IZz8PwOju8I2ZFIfNRiYLSN2lpcg81i03
         4AJE7JzzmQ5eeWvO8DyWeYDO1DwUlRc5pVdkAseB1gBW9hCPQDQghX6khYhuMR7FrEPl
         LzeC4lNFoObNrmFpjyeA66DStr+A7nMLUmyTG++0JyW0SljUruUDM87EbaoR+gc55VXa
         6Rm8pTuZ4BwFHwEZsTBq7R8xMJTxAkpeXaa4xhTi7H8VOZr0OUCiXDPSilry7qO+E1jp
         B2DH6BDl5WKMtEWxmtWLaHACCk/BWfeChcphQ3HcxUYnC3zpHCcMnKJNiwvVQJDTpD4O
         2UOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU82YOhCHZuAZF97A2c3/MXOjZo/AFKRgIyD8iuPl+e7MJLKOPByVYiBl+ixGk+l+Uyp1IA2FrYYPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjhcYgwkui7hvmM+TtQfZzUjMzOCePY85Q3Ygaw/JBoOHqhbyW
	iW7bSOaNVk/LKKWIJTemEfiq00xfjkvr9XRsNzWiloOk3SLBiYahHNvPlt3WHdGAA2o=
X-Gm-Gg: ASbGncu+tcWe0ptFSOlOzQ9v9yWL6iX6La7Z4X8SYdhnUdvjd3f3PNFCFzNbOJflpV4
	42wikh/evephGU0mqdoNyY7Y+GQ1ZLskEBlY7j2vwLefZim+obs8Hnsn2fGOv12VhAfv93YvBov
	OUZcSecEJP7JaxxQ/QKC3Q0lY6WoSssL0RGhpz/hPCPE6l2eL5fthxcjZBhpSv+n/aza4wc30mk
	F7JKudclJQWWUEZdFlfzSIES/wRjdMCYBpnuFVJiV5j04EVp+8ezUX9yxDs3rWk5IZfRc2sTrVM
	kr3GPAHuGHyosc4/eLJ5Zt5pbpnX3FB4Efr9b1tbqK3Rf1lkf6zAjpqL2aVr9e2NywOWr5Jut7F
	bhxmFcmWu6qtSK7VZjl5V27fDmI00m83nJ1IREZ2kglwYNOtoWyI3EmtyXxoHW5Ya2pKS3RhElq
	JEAQIg6jWWRT6QV6nyVkKGf3V6zzGEfLsb3sFbb0ieM/BxmKAl0M8TPqDy
X-Google-Smtp-Source: AGHT+IGk5aVt2np0F+0SUeq9bR/s3g/04Xibzoz3lycRYe8682b8OGK1SU+6oo6F+0oYAkhKjHiqfA==
X-Received: by 2002:a05:6214:319c:b0:880:4c2b:1c29 with SMTP id 6a1803df08f44-8847c4e0295mr324140726d6.31.1764181327832;
        Wed, 26 Nov 2025 10:22:07 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e46981asm149710776d6.13.2025.11.26.10.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:22:07 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vOK9W-0000000349C-2YZJ;
	Wed, 26 Nov 2025 14:22:06 -0400
Date: Wed, 26 Nov 2025 14:22:06 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux.dev>,
	Kevin Tian <kevin.tian@intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] iommu/arm-smmu-v3-iommufd: Separate vDEVICE allocation
 list
Message-ID: <20251126182206.GB542915@ziepe.ca>
References: <20251126033602.28871-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126033602.28871-2-bagasdotme@gmail.com>

On Wed, Nov 26, 2025 at 10:36:03AM +0700, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warnings when merging iommufd tree:
> 
> Documentation/userspace-api/iommufd:335: include/uapi/linux/iommufd.h:456: ERROR: Unexpected indentation. [docutils]
> Documentation/userspace-api/iommufd:335: include/uapi/linux/iommufd.h:457: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> 
> Fix them by separating vDEVICE allocation list from preceding paragraph.
> 
> Fixes: 9f0b286fe40130 ("iommu/arm-smmu-v3-iommufd: Allow attaching nested domain for GBPA cases")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20251126125920.207fc959@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  include/uapi/linux/iommufd.h | 1 +
>  1 file changed, 1 insertion(+)

Thanks, I squashed this one line

Jason
