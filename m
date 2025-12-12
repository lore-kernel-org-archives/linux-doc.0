Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066BB23BCEE
	for <linux-doc@vger.kernel.org>; Fri, 12 Dec 2025 18:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765565278; cv=none; b=Z5wKFs8diiypL5s29j7o4Y1UaAgmfLmHN7eJSqip+nyjBrz6y0HV2iq8NYyWilVyW+pQCMv35z8PkAeRt366jVqpluRDBOSn+Wa+C9mbFif1AiAgEKUvnpk3pECDxcP5o/9raftRHYmiRIOKsHgvPTSIE1PtY4AfmPOIvWk5s8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765565278; c=relaxed/simple;
	bh=aYlLP5oK9ujcask7x6uq3Z6XkCkRSggu11eLJH2sWLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOT0MFdmNRWccnR+29U+JMhuGoW9s61OsvPl/X+Ajp/OXagUUwN54cu/2woa2bAYM4pW5CM/mSOuAtgEPjrK2gZu6iiS7vb0OwWMGLMx3PeRNeOvXWCpi/hldCfnJzVPPRnWM8uWcgh4mLzWvCGiuts70S0N4tqHCDubVLt5ZbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OmxBo1f8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OmxBo1f8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47a815c43baso145595e9.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Dec 2025 10:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765565274; x=1766170074; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kyaZ/i78MwYb3FB370zdecXw44g8nQdErJMSZHrGqA8=;
        b=OmxBo1f8/H+X8+SzPhKOM5glhBh26dOOV7ZOXD6RZ/xxKLUx1KoqkKdGc1263lZ7no
         4FDqJTj7i6Md8f6Qn3kHz4zgux9P0bp37DGSdHrhlsvOm2JZCJmBNiF1qTkD/up6zxHH
         W9dvC1spdUB9TBM2+mwqF+nYZRRd+51WTJPWzeqVlHP3Zyteh6hlnQeVi84aGVNvSowh
         YBasRFCVOMwNQvZ/zg3UstxhWfmlMfKBYy5uVLUZkgnfoEe0oD72R57JxlW3zEi0Svh9
         SSt3xE1wNOHY8eZ3erY4wkip08nH4zS7g5Q/Gg+yZoVPGVluf3ShlvfOBANjTEcDO56N
         3DJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765565274; x=1766170074;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kyaZ/i78MwYb3FB370zdecXw44g8nQdErJMSZHrGqA8=;
        b=G7PznDe02oQFrUqImuGBSax9KzLtXo8YFvjrUIC4dMm6qtFyoe0/2kUNMv+qyCKKao
         9zHLMJTqy6AFO6Hdpnl9sw4Mb8GU3QV7t6msf0OnsvGaWk5Dr7ZhWXobG0uBSc2ZK9g2
         nopRaTJZx6Dp/6kpph2K90kQOTdUVDunI3VDGMUgRucnJ3/DcQvgu41b+4qywkfWX/0/
         cFKQf3731IBaLXFCpkjrAqIFnlicY6KCOW4y37r8smVdubHQW11Ny41TBguyE5/rNQoT
         YU/IyySK6xVIQNjU4SATehEOT9gVibJtrH/K+hCTClwdIr3eITHWQf8NtX2BXgPJzNfA
         dIFg==
X-Forwarded-Encrypted: i=1; AJvYcCVvz3MfgCU8KP+HrwO5eMvF+CunO40/4PNpy6DU/EphWOA3MB95l4TYSWNJsr5MLzxJEHlHZjnOvlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlqgcjTINFXnVBm+5nMfBsJYfQikgeSHMHuLF5xNpCZAAXc175
	LP+7C/cGQ+efneufvcKpevSzJZ0aTzfZANC84/kNGUCWyvoFjkewTYAwT6mWYFP1vQ==
X-Gm-Gg: AY/fxX5Em4A2LVJYtsnSF52sRbApnQlT6mCBz7KTHW9UoYnTnuwqPNZGSJSa0idWE2k
	CK09qE3jHbhzU7FYI5B5mHnPlgjEnQBUScjwwKxB0sInyKeWrk+MPWRexzInvByCiA1lTUf7Hmf
	V2lDkjx94UiUasWpebjC3ZT2MHeMwci+0BsMp0uJxvuqX0IyZE7B2d/XU4OlRts6wQ9gpkhD0jj
	DjnD2myIUGbwPhxlcADCZSH0wjBfzOo/HCPXKLSAAqt8ynpXpic/81bjUqtzY2q3Up7sKBryLH2
	oQxmdiBY64oVgOzFLvegdtTNC1CfjD34K2OKS7rKv9ea2qE7xQULAY+NNb9mAhZnER8e1uy5rg/
	2qNqzpKSl1twfaXVz1piW3alkTOURxtNZsp+kzo5BK06JXLaSy/z6bYoj1bo0UhR6SB2iQhkn5p
	xXBKRJ7Ykcq39GEirrZ8hB4J6+ghtiuGdu1LrIua2T9S4sa1f2QQ==
X-Google-Smtp-Source: AGHT+IEVZG3wHfe72Ly1OF3yuy/6xrNrPiEA8hzzhu0i82Q2n2GZB/t5f/ePhNdeE0eyqp1ZEcC0Bg==
X-Received: by 2002:a05:600d:106:b0:477:73f4:26b with SMTP id 5b1f17b1804b1-47a948c78e9mr17525e9.3.1765565274191;
        Fri, 12 Dec 2025 10:47:54 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm43341825e9.3.2025.12.12.10.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 10:47:53 -0800 (PST)
Date: Fri, 12 Dec 2025 18:47:50 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com,
	rdunlap@infradead.org
Subject: Re: [PATCH v4 4/4] iommu: debug-pagealloc: Check mapped/unmapped
 kernel memory
Message-ID: <aTxjVhQxJAX9TdLm@google.com>
References: <20251211125928.3258905-1-smostafa@google.com>
 <20251211125928.3258905-5-smostafa@google.com>
 <aa14d149-dfde-44e9-8fb3-72cb9b0e6920@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa14d149-dfde-44e9-8fb3-72cb9b0e6920@linux.intel.com>

On Fri, Dec 12, 2025 at 10:51:24AM +0800, Baolu Lu wrote:
> On 12/11/25 20:59, Mostafa Saleh wrote:
> > Now, as the page_ext holds count of IOMMU mappings, we can use it to
> > assert that any page allocated/freed is indeed not in the IOMMU.
> > 
> > The sanitizer doesn’t protect against mapping/unmapping during this
> > period. However, that’s less harmful as the page is not used by the
> > kernel.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >   drivers/iommu/iommu-debug-pagealloc.c | 23 +++++++++++++++++++++++
> >   include/linux/iommu-debug-pagealloc.h | 14 ++++++++++++++
> >   include/linux/mm.h                    |  5 +++++
> >   3 files changed, 42 insertions(+)
> 
> [...]
> 
> > diff --git a/include/linux/iommu-debug-pagealloc.h b/include/linux/iommu-debug-pagealloc.h
> > index a439d6815ca1..46c3c1f70150 100644
> > --- a/include/linux/iommu-debug-pagealloc.h
> > +++ b/include/linux/iommu-debug-pagealloc.h
> > @@ -13,6 +13,20 @@ DECLARE_STATIC_KEY_FALSE(iommu_debug_initialized);
> >   extern struct page_ext_operations page_iommu_debug_ops;
> > +void __iommu_debug_check_unmapped(const struct page *page, int numpages);
> > +
> > +static inline void iommu_debug_check_unmapped(const struct page *page, int numpages)
> > +{
> > +	if (static_branch_unlikely(&iommu_debug_initialized))
> > +		__iommu_debug_check_unmapped(page, numpages);
> > +}
> 
> Same here, possible to make iommu_debug_initialized static?

This also is similar to the iommu ones to reduce overhead, the main
feature have the same pattern with "_debug_pagealloc_enabled" static
key.

Thanks,
Mostafa

> 
> > +#else
> > +static inline void iommu_debug_check_unmapped(const struct page *page,
> > +					      int numpages)
> > +{
> > +}
> > +
> >   #endif /* CONFIG_IOMMU_DEBUG_PAGEALLOC */
> >   #endif /* __LINUX_IOMMU_DEBUG_PAGEALLOC_H */
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 7a1819c20643..3763b71a7d3e 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -36,6 +36,7 @@
> >   #include <linux/rcuwait.h>
> >   #include <linux/bitmap.h>
> >   #include <linux/bitops.h>
> > +#include <linux/iommu-debug-pagealloc.h>
> >   struct mempolicy;
> >   struct anon_vma;
> > @@ -4133,12 +4134,16 @@ extern void __kernel_map_pages(struct page *page, int numpages, int enable);
> >   #ifdef CONFIG_DEBUG_PAGEALLOC
> >   static inline void debug_pagealloc_map_pages(struct page *page, int numpages)
> >   {
> > +	iommu_debug_check_unmapped(page, numpages);
> > +
> >   	if (debug_pagealloc_enabled_static())
> >   		__kernel_map_pages(page, numpages, 1);
> >   }
> >   static inline void debug_pagealloc_unmap_pages(struct page *page, int numpages)
> >   {
> > +	iommu_debug_check_unmapped(page, numpages);
> > +
> >   	if (debug_pagealloc_enabled_static())
> >   		__kernel_map_pages(page, numpages, 0);
> >   }
> 
> Other changes look good to me,
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
