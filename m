Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424572BE7C0
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763982285; cv=none; b=Y0FcNODjdCTAUyO0rPuczaks6DQBV6CzKL8QHBMvEIIliiVTnlR/aMoAycy7eEwnG5Wek5EV6t0g6CnF7EdsZl1dGkBOyHC/0Dbf1UqZxeanlNb6c1PoQ31HyyzYihS0/WKhTGp0hpsRdZ9e39WcKkDBre9K4ooSvg4BpJK16f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763982285; c=relaxed/simple;
	bh=yGGtQ01i6ULcnlphEJ3YP5AEFLU+uu4BCrDMhyrpMes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkvxJS0H6wyLxlRcYYN7JyymZ+7Dz/W1cE9qdTGL2AukpFS+XJ4Zz3XCQOBdhrM7CS+tbuozwjNx6TT29icTOqxu08JLODFl+HkXuWVE+2qZCD7D/CR3JXOwcIm53DOvlWSY2XvtWpwPoK74bhd41IFQDrmb2AIQ5hQfH2UFZRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RD6U6QQI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RD6U6QQI"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779a4fb9bfso90815e9.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 03:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763982281; x=1764587081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IxY0zFsSsb4UvWV8JkswEu93uViR5DhGzNdHTRi5eEs=;
        b=RD6U6QQIxGDzesx0pP11v24uK1dIkADuLPqpDDRQ4JCJ2SDfXoEGFUIBX6ILHWFsQ6
         ozJeFFEK5QrXEsZYQAKOYxupggcbCATCgvLFReu7EwKgbBlao81yp6Kq6pXlmZQE4c4q
         9QkD+PWSmJE5SPsiTn2tanTq8GdBstX8onrzcQAnUl/qrSiHIjAFzwrxPTEu6lV+ZnBH
         0dsBjH3cYtrDUMvbjQm1vEjcKnqS1HpRs6lrg5W+wrArmUk68y20zj13naMc9lgTLQFa
         wO8RUefpzwhgo+QF9Z4GD4K1Nnd83eeXAS6BBER9ZjAAzrj9+MUnyxH2Yv7lDmOq7wZv
         yABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763982281; x=1764587081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxY0zFsSsb4UvWV8JkswEu93uViR5DhGzNdHTRi5eEs=;
        b=U8kwe1jhqu0w15H8qkr3cXlY4NpfJjjsF0AAUFyeiodQrA5LJd4VkxZu3aTR3tMcw7
         L1q9Fjk2wAyOmWpZ6F5RQHy7hdQ7IPre820dA2/aDabYQRxe7WvciASDyRQtVTb49Rhu
         +WC7vEm8/exgxrtvFSnt3JSQFHt/Sr+D2eoNRalTx6pgJAkSlCd1um6bqoLhRTmI/lkX
         tlf4uOpkkGShZe8LOiBVSi1IdKRkSfajmBZM1wlK3464FSrUGLrdx5PhNFY+jR/XN6E9
         rBML8Ex5j5ptkeMutn61Mzp5pLKX1L6xTMDZNkVaCJZMCd9LMJ6kAbfDiLjxFclAP9wd
         UBNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqJ0DNopu6yvXMkM0lPSjcW9X0C9MJPCdRnP0pe12EzjghfMGz2f1e4NfG8OeA+ghiYCSw+uqoLGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFDsaiqtPoZ2qk6pUaLKmdZSppi4W6npQKY9DHe9jJqqoJyV3R
	Im0qZLVIAr/voEFJQZ9UG4htlji5tsxI3oKCkOCIvmZAQSAV5hAMRCUqZxgUOwT9tg==
X-Gm-Gg: ASbGncuk+Uzs33PmXFcgh2aNCi1315+hGsa3DXcgLyYZHXo0KWu14kJ3E3xqzleKJxd
	+AJ/5eRAVB3AgDd0uS2aw4sXi+PhTOco5IM5/mAO3ekMnk6icn1kH4bvXivAND/5cVeWu+Ygd3y
	Z7QTICh3mjYMiS4yAGE3qvfhXkfKIJqc+aR6FwozXiADCRWUMTkABcmaz/rv8zhmMXjfKN4n743
	hzQEjdqCpnUfsSiNxAyVbUijV5nVmEiTSVVjmD6e2U2Z+5SVJqgm1eBq30vVMIgBnuNo2lXO6ec
	U27DCntN3SgO+/w+40HrRXymmcuY96495e8kfelywjivSarFoOt6a4G4cbIZIu5lPmLmZSDppZV
	OsOTLGqXnE6IxS6q0rRLz8TXV4WVm9YedQtifRdVF8kW78rggVJ9v/ucFz4rckS/KCtWvi6rH5+
	WuZ3uUgRf80dGOkjy3sXfBvvWIwXG2L/KsjxReHy1hbSldqhgOAA==
X-Google-Smtp-Source: AGHT+IHfC/zx3CtUqS+QNQEXWjnlvj8ok2cj2JsEBQqJZIsdvVIDhcfsaBV55OT3BOjTGNisyGw1Aw==
X-Received: by 2002:a05:600c:a402:b0:477:2f6f:44db with SMTP id 5b1f17b1804b1-477c5ea4a1fmr1591355e9.5.1763982281333;
        Mon, 24 Nov 2025 03:04:41 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf226c2asm188677715e9.10.2025.11.24.03.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 03:04:40 -0800 (PST)
Date: Mon, 24 Nov 2025 11:04:37 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org,
	Qinxin Xia <xiaqinxin@huawei.com>
Subject: Re: [PATCH v2 1/4] drivers/iommu: Add page_ext for
 IOMMU_DEBUG_PAGEALLOC
Message-ID: <aSQ7xfQjkeAMHiLC@google.com>
References: <20251106163953.1971067-1-smostafa@google.com>
 <20251106163953.1971067-2-smostafa@google.com>
 <55391dad-339b-47f8-8996-afe337b238e0@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55391dad-339b-47f8-8996-afe337b238e0@infradead.org>

On Thu, Nov 06, 2025 at 11:50:11AM -0800, Randy Dunlap wrote:
> 
> 
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index 70d29b14d851..6b5e9a2d936a 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -383,4 +383,19 @@ config SPRD_IOMMU
> >  
> >  	  Say Y here if you want to use the multimedia devices listed above.
> >  
> > +config IOMMU_DEBUG_PAGEALLOC
> > +	bool "Debug page memory allocations against IOMMU"
> > +	depends on DEBUG_PAGEALLOC && IOMMU_API && PAGE_EXTENSION
> > +	help
> > +	  This config checks that a page is freed(unmapped) or mapped by the
> > +	  kernel is not mapped in any IOMMU domain. It can help with debugging
> > +	  use-after-free or out-of-bound maps from drivers doing DMA through
> > +	  the IOMMU API.
> > +	  This santaizer can have false-negative cases where some problems
> 
> 	       sanitizer

I will fix it.

Thanks,
Mostafa

> 
> > +	  won't be detected.
> > +	  Expect overhead when enabling this and enabling the kernel command
> > +	  line iommu.debug_pagealloc.
> > +
> > +	  If unsure, say N here.
> > +
> >  endif # IOMMU_SUPPORT
> 
> 
> -- 
> ~Randy
> 
