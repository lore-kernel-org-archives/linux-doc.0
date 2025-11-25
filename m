Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265C1CA4E
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764064871; cv=none; b=QU4fiQH8SC58AeMoLW3pyEKBuwz6nCcd3ezFwlAUdK13/MfGtyrXlkmn8GH6uHLNX6SAbiSldULTN+07e4wzAG9jYdKrC/UP2a5cLsIUbIJV5Xh352d1d2IW9E1KylCfDdgYFWw8xYR2hNIx+E0hju09toLlS3pgPGsItKS6+WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764064871; c=relaxed/simple;
	bh=FflayG1R0mV1qS179pYu9XTzfQQl3+7kMxMmbTvLZPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaoZ92wWjDVkJKKfn6Y+O+WpH1Khgj8f6VnmAtXHT8ZyRa84n1W4At5fkly1SRmpo5+xwVk15kSqrLYqNDEZzu09+aoT4OeBmbuEBxTKUTcOMYEg5ikadacbZL2e26ZifEX5UzVBNUaH0WOXI9gnU+EVRdaxfvobcNxurmLe2UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P3I5fgZi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P3I5fgZi"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779a4fb9bfso49005e9.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 02:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764064867; x=1764669667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B1XHwcWfbvKNkFkLxt3DIv5QKK97k3U/xNeeijWZm2Y=;
        b=P3I5fgZinTGoblP6Wg6tkPS43/i01OEQ9sq5NHEtfJDcZzIUp6a87DpY3/Unypkjtc
         lLMZaBDNXTZ6qXKW3Q1SlQjraKWs4XwJf+B0JTaz8b7Y+djewE8t044RgrexOEGSlu4l
         SSikA/twXjrmYkav94RJ62jIsTwYKt6AiwmQt4/bi/+7Zg3n/zdyGDbvF/W/7madnSF+
         KoPgUEXWrPuIGfUqnBjnOptrnRy9paIfKsU9/OAhA/w4nqxeCzW9AYuGTohe4tphWooF
         qiPbirmspp1RFrPcGUe5te5IrhPJ0V+i+707yE20UgwRvCvPxWGEG6x5MQsYP1ZSPvDY
         1ZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764064867; x=1764669667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1XHwcWfbvKNkFkLxt3DIv5QKK97k3U/xNeeijWZm2Y=;
        b=Hg9j8gZIe+NjyIJ4c57qVROeW7IKpK+3WAica7N+TNFjxFwGqAYv7p7XyFCJUuI7pE
         3RmF1NEo3wa3FtPH0aefPy7rRCL3s8jBIwIVNASLBj9NgNfXZ+a/UNBXDEPxw3wjOJt6
         XU3oyr595KOkmmPj8gr5n0qYBaFpw5m+Yvt0XrKeZMkIFuN4NpOBL1SAuNeLZPeV99Dz
         kM0zA/N3uuzhViWCM8MBebWF6riRcZnAFJ1ivBK7bgzKlTXAKe3HYCdrPjx4Ho1Zxvf3
         uqWDVmUAyiBUKfdy1UnYaH+4A24bcTOIzy/ID8eNdO1OUGg127enEnBOVKDBt57AnRFR
         t7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCU2VgeRhceQf02+T0/riAxa1iiHtcDHM2/79BUUHDcRLWp7wEHIszuBWAAv+6MJyC0z16+vS+Qt9zA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE4z+IqYl8jOEEOeL5SFBvWTaz52ghUvcub327VG6nZ9qx1Bt6
	UFwMI1UKigQAr+zfL9iGZEfgKCf2fXoGUGRXdhi+h7lO+KU2e8fCDJEnIfhLG52EEw==
X-Gm-Gg: ASbGncuKLhGcKwxztdHp+7DIvBwyjVmyLgeM/0wkQxrdtNQjw747SXgonC+4ThV1LNf
	XHopcCJbUvLhM/v261/rqUguzeS6AFwNLkfZeET13CVtln0i+3LE2GOkjbKmnv/+tVzrbNVg1CP
	NHrBuXuHk1mizSiQ9q90JFKwY+DTddLxk0Y2APHKX7ji9BbQHtApFrYF3udiUxGwIbQvRXXveAb
	2DRG5qYROvm6kuCgKglnRJvdci2iwLhW+79IjV/KsdlHcMqKb5CxVI0Ckb8dk1gD+u9/hBnX86/
	0gk5Edwu6bGuafcQ+EAuAmIx0vbMLWmNDViCtgHm5yJOqf8xFucghf97jmlQAvwdGh43sUNShnR
	jrVLs1T5uiUrontN6lTd4D4TaPtREyDiChpm9AwFGkmYh/Z/9X47u0uzCRr0/1ZYXXR7v9It+55
	pZRmjHM6FL4m2eTR2tDMXldXKmXHM9ziUmiy/1HgAmuWbd1ad6m9TvqGy+6AFS
X-Google-Smtp-Source: AGHT+IG+KnTaq24FjuTie0tLAx5tjS9go61y7PiJSmroIbPi5FQrw77ok8WdDc8ABTUNJc0zJlZa4g==
X-Received: by 2002:a05:600c:1f90:b0:477:95a8:2565 with SMTP id 5b1f17b1804b1-47905265293mr341685e9.16.1764064867219;
        Tue, 25 Nov 2025 02:01:07 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cc231dc6esm24521687f8f.7.2025.11.25.02.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 02:01:06 -0800 (PST)
Date: Tue, 25 Nov 2025 10:01:02 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com
Subject: Re: [PATCH v3 2/4] drivers/iommu: Add calls for IOMMU_DEBUG_PAGEALLOC
Message-ID: <aSV-Xi5uMJcMtk1b@google.com>
References: <20251124200811.2942432-1-smostafa@google.com>
 <20251124200811.2942432-3-smostafa@google.com>
 <07434771-3233-4c88-b505-ee02da72c905@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07434771-3233-4c88-b505-ee02da72c905@linux.intel.com>

On Tue, Nov 25, 2025 at 03:35:08PM +0800, Baolu Lu wrote:
> On 11/25/25 04:08, Mostafa Saleh wrote:
> > Add calls for the new iommu debug config IOMMU_DEBUG_PAGEALLOC:
> > - iommu_debug_init: Enable the debug mode if configured by the user.
> > - iommu_debug_map: Track iommu pages mapped, using physical address.
> > - iommu_debug_unmap_begin: Track start of iommu unmap operation, with
> >    IOVA and size.
> > - iommu_debug_unmap_end: Track the end of unmap operation, passing the
> >    actual unmapped size versus the tracked one at unmap_begin.
> > 
> > We have to do the unmap_begin/end as once pages are unmapped we lose
> > the information of the physical address.
> > This is racy, but the API is racy by construction as it uses refcounts
> > and doesn't attempt to lock/synchronize with the IOMMU API as that will
> > be costly, meaning that possibility of false negative exists.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >   drivers/iommu/iommu-debug-pagealloc.c | 26 +++++++++++++
> >   drivers/iommu/iommu.c                 | 12 +++++-
> >   include/linux/iommu-debug-pagealloc.h | 56 +++++++++++++++++++++++++++
> >   3 files changed, 92 insertions(+), 2 deletions(-)
> > 
> 
> Remove "drivers/" from the commit title.
> 
> $ git log --oneline drivers/iommu/iommu.c

My bad, I will fix it.

> 
> [...]
> > diff --git a/include/linux/iommu-debug-pagealloc.h b/include/linux/iommu-debug-pagealloc.h
> > index 83e64d70bf6c..454303ec09c2 100644
> > --- a/include/linux/iommu-debug-pagealloc.h
> > +++ b/include/linux/iommu-debug-pagealloc.h
> > @@ -8,10 +8,66 @@
> >   #ifndef __LINUX_IOMMU_DEBUG_PAGEALLOC_H
> >   #define __LINUX_IOMMU_DEBUG_PAGEALLOC_H
> > +struct iommu_domain;
> > +
> >   #ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
> > +DECLARE_STATIC_KEY_FALSE(iommu_debug_initialized);
> > +
> >   extern struct page_ext_operations page_iommu_debug_ops;
> > +void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys,
> > +		       size_t size);
> > +void __iommu_debug_unmap_begin(struct iommu_domain *domain,
> > +			       unsigned long iova, size_t size);
> > +void __iommu_debug_unmap_end(struct iommu_domain *domain,
> > +			     unsigned long iova, size_t size, size_t unmapped);
> > +
> > +static inline void iommu_debug_map(struct iommu_domain *domain,
> > +				   phys_addr_t phys, size_t size)
> > +{
> > +	if (static_branch_unlikely(&iommu_debug_initialized))
> > +		__iommu_debug_map(domain, phys, size);
> > +}
> > +
> > +static inline void iommu_debug_unmap_begin(struct iommu_domain *domain,
> > +					   unsigned long iova, size_t size)
> > +{
> > +	if (static_branch_unlikely(&iommu_debug_initialized))
> > +		__iommu_debug_unmap_begin(domain, iova, size);
> > +}
> > +
> > +static inline void iommu_debug_unmap_end(struct iommu_domain *domain,
> > +					 unsigned long iova, size_t size,
> > +					 size_t unmapped)
> > +{
> > +	if (static_branch_unlikely(&iommu_debug_initialized))
> > +		__iommu_debug_unmap_end(domain, iova, size, unmapped);
> > +}
> > +
> > +void iommu_debug_init(void);
> > +
> > +#else
> > +static inline void iommu_debug_map(struct iommu_domain *domain,
> > +				   phys_addr_t phys, size_t size)
> > +{
> > +}
> > +
> > +static inline void iommu_debug_unmap_begin(struct iommu_domain *domain,
> > +					   unsigned long iova, size_t size)
> > +{
> > +}
> > +
> > +static inline void iommu_debug_unmap_end(struct iommu_domain *domain,
> > +					 unsigned long iova, size_t size,
> > +					 size_t unmapped)
> > +{
> > +}
> > +
> > +static inline void iommu_debug_init(void)
> > +{
> > +}
> 
> I suppose that all these should go to drivers/iommu/iommu-priv.h, as
> they are for use in other files inside the IOMMU subsystem.

It seemed better to have all the feature functions/declarations in one
isolated file, as it is included outside of the iommu susbsystem also.
I have no strong opinion, I can keep them in drivers/iommu/iommu-priv.h
if you think it's better. But then we will have to include also
"iommu-debug-pagealloc.h" for the static key to avoid including extra
files to linux/mm.h.

Thanks,
Mostafa

> 
> > +
> >   #endif /* CONFIG_IOMMU_DEBUG_PAGEALLOC */
> >   #endif /* __LINUX_IOMMU_DEBUG_PAGEALLOC_H */
> 
> Thanks,
> baolu
