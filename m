Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A981B2E9ECA
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764064492; cv=none; b=ckDf7AxK6ax859/m5kgZKCsZh31Nhaw8qEo+DBTWWmUMCyToRcJfNafP7K56xITJprDDU5GjaEu7sUNKp2kKJ8Zijotm+SEL3DUOZ/ZzeSrq2I3CSekrAqAW0Z/HYx28Og/lsidWGET11JjY/gQqj3JI9omK9dEHOOYITjReDKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764064492; c=relaxed/simple;
	bh=XrRcP2ro/TCclrWLikByR96I9oovIxzaw/fFhhnprtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RD+1MbNQTJxSbbObMYZTnoNPUryBuczZh2/lfhcckYgtst7occ8Tl+mkCh1Z6vf4tOmPJz+q8PYMlI2zw+fX1fQ1topGMbdaQlYRBSKYB5x7qk+wbcoLkJ6Ap3rPJbEpjBDVM2gr3/A02RT7ZHB7l61rtAHwYR+jEHO+yAu22p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0v5AtgXn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0v5AtgXn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477a1c8cc47so54605e9.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 01:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764064489; x=1764669289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vL2SF6DadjEfReQqy+MahpgoTUep+XQ3TbZINCjIIpU=;
        b=0v5AtgXnajvsbzuw/YfmVpOQd3jvv5S+emUC2DLcssKrKcGCYdfthLa9h606iJt8hq
         6RfelIFUFE3c1qtQ07RGZZ2cw1NwTD+wXcy3hbCPEEWLmp769eIGsYW3sYq2Y1VdP0WH
         lS84mzveBpHoUdSlHp0w+084RPWw4m1lTWTTxQ6M1IOFOJ/rYszXAP7hEjT6HN0VCw6f
         CuEuPKOi9Lj68chbGSl1ycET73tY5e9AxALDhLOXMcaRVaCDCta4aeRzqCmsA3aKaCwS
         CMJLVAtYcncPbYbxaskk6iBRiZ0Kno+7UUGu3ioNKdu1ZPh0MKMySJHzQMJaTBthNrMQ
         gYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764064489; x=1764669289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL2SF6DadjEfReQqy+MahpgoTUep+XQ3TbZINCjIIpU=;
        b=ryiMuEm+75srYyLLS88r3X0wHeneOGEuOCstvq/LDHuDDQ7FJ0M4H8bfxu2W2uuWHV
         CoN58qIqfC+s5fcfeM94M8eRjyFxytPHaSBVlFsRw1SozYu0Y+BrKkqwvJeHS95kk7GB
         3vVga1PwG+2uMUwTQbaYhsGsB2M9dT06PJWG85Ud816Avi7WLB8YPDTVFOuN/Vom9PgL
         fQfxvDiVj/FfolaP5JPq3Bl+whnTb5aaJJkM2R/MSv33K93r0Nn6cIJoMLNqrbo0hTMA
         2iEs0UOZbTzj74kAWstjlMQKwrSqeqZOWAkwbcV8zfeBlguZLM0z8yL6IDlTcHOj7b5c
         Irvg==
X-Forwarded-Encrypted: i=1; AJvYcCVsbkRUgqq16B5lRBQAnHu1mgIXC4hNFYsAjSby9/OE2Jnc3eJ/N0x5Wd8Unh8YWfBJNL6J8ECHJxw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6uEuR6uJPtnFLbxFDTfJvcxyUXAWCL50lsYu7p9NYy93rk7Wu
	TKTz2DGuO4yB9tjHEn6U7cKpbs4E/2cw2EMUcfxdU3yWClgeePD4iXl6ZNK30TqIyw==
X-Gm-Gg: ASbGncu4VkoigmtMhuhxmgoqBxl57WLG/2It/et3uNpbyvEgxeuNICainx5yuv9s1eN
	wS/dRSfdv9uGDov/WSwMfi1iRjKueGJWcMR7CvN+RMcMcI4hKh5kn/YSaEzlcBjTDMu8X/2CnMZ
	meJ3PgIGtZu7107hbAnbXxZIDV3cqAYZsIZMiMhyBN6vZilb7uH4JD3lSAEypin7YLKKvDA3aEv
	etv3q4rOupjaFLvjChnlo5iUC+rsaShw9K0D/cK0v7HZgdtV0VMdN8660SM5gnI6miJG+LaWebn
	sscnAnxa880kOATsLIcTafsouTioRqPsoKl4W8IWr8mPkO0q6lnlBkCWgj+sMNasOf+VAz0E0zz
	H3F4gZ3lxEsu4zc+FvSYDeocvLJBfeGuWGV498TzcOIu4hR0hji5TjMnKaBgmlJ7c9FSp9wz906
	oCE3QaYy1yp1hjcblT7fvzhz4PoKp9piihZCzNtN+AGeEB00lduA==
X-Google-Smtp-Source: AGHT+IHEabe/7pXhdzmn7h02Or0O3qxqSNjpbYe1IcSPnLYCWEVv/evZDk1iZk2r+Q06y19BisRFJg==
X-Received: by 2002:a05:600d:1c:b0:477:86fd:fb48 with SMTP id 5b1f17b1804b1-479068edd0emr316815e9.9.1764064488818;
        Tue, 25 Nov 2025 01:54:48 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a6bsm33143282f8f.28.2025.11.25.01.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 01:54:47 -0800 (PST)
Date: Tue, 25 Nov 2025 09:54:44 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com
Subject: Re: [PATCH v3 1/4] drivers/iommu: Add page_ext for
 IOMMU_DEBUG_PAGEALLOC
Message-ID: <aSV85G0F4bQNYwHE@google.com>
References: <20251124200811.2942432-1-smostafa@google.com>
 <20251124200811.2942432-2-smostafa@google.com>
 <5f85e519-5a05-4359-9904-06f16737e28b@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f85e519-5a05-4359-9904-06f16737e28b@linux.intel.com>

On Tue, Nov 25, 2025 at 03:17:47PM +0800, Baolu Lu wrote:
> On 11/25/25 04:08, Mostafa Saleh wrote:
> > Add a new config IOMMU_DEBUG_PAGEALLOC, which registers new data to
> > page_ext.
> > 
> > This config will be used by the IOMMU API to track pages mapped in
> > the IOMMU to catch drivers trying to free kernel memory that they
> > still map in their domains, causing all types of memory corruption.
> > 
> > This behaviour is disabled by default and can be enabled using
> > kernel cmdline iommu.debug_pagealloc.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >   .../admin-guide/kernel-parameters.txt         |  6 ++++
> >   drivers/iommu/Kconfig                         | 19 +++++++++++
> >   drivers/iommu/Makefile                        |  1 +
> >   drivers/iommu/iommu-debug-pagealloc.c         | 32 +++++++++++++++++++
> >   include/linux/iommu-debug-pagealloc.h         | 17 ++++++++++
> >   mm/page_ext.c                                 |  4 +++
> >   6 files changed, 79 insertions(+)
> >   create mode 100644 drivers/iommu/iommu-debug-pagealloc.c
> >   create mode 100644 include/linux/iommu-debug-pagealloc.h
> > 
> 
> [..]
> 
> > diff --git a/include/linux/iommu-debug-pagealloc.h b/include/linux/iommu-debug-pagealloc.h
> > new file mode 100644
> > index 000000000000..83e64d70bf6c
> > --- /dev/null
> > +++ b/include/linux/iommu-debug-pagealloc.h
> > @@ -0,0 +1,17 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2025 - Google Inc
> > + * Author: Mostafa Saleh <smostafa@google.com>
> > + * IOMMU API debug page alloc sanitizer
> > + */
> > +
> > +#ifndef __LINUX_IOMMU_DEBUG_PAGEALLOC_H
> > +#define __LINUX_IOMMU_DEBUG_PAGEALLOC_H
> > +
> > +#ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
> > +
> > +extern struct page_ext_operations page_iommu_debug_ops;
> 
> How about moving above to below mm/page_ext.c and remove iommu-debug-
> pagealloc.h header file? ...
> 
> > +
> > +#endif /* CONFIG_IOMMU_DEBUG_PAGEALLOC */
> > +
> > +#endif /* __LINUX_IOMMU_DEBUG_PAGEALLOC_H */
> > diff --git a/mm/page_ext.c b/mm/page_ext.c
> > index d7396a8970e5..297e4cd8ce90 100644
> > --- a/mm/page_ext.c
> > +++ b/mm/page_ext.c
> > @@ -11,6 +11,7 @@
> >   #include <linux/page_table_check.h>
> >   #include <linux/rcupdate.h>
> >   #include <linux/pgalloc_tag.h>
> > +#include <linux/iommu-debug-pagealloc.h>
> 
> ... remove this include line and put the "extern" line here,
> 
> extern struct page_ext_operations page_iommu_debug_ops;

This file is needed for other functions added later, which is then
included by iommu.c mm.h

Also, the pattern in page_ext looks that users have their own headers:
include/linux/page_owner.h:extern struct page_ext_operations page_owner_ops;
include/linux/page_table_check.h:extern struct page_ext_operations page_table_check_ops;
include/linux/pgalloc_tag.h:extern struct page_ext_operations page_alloc_tagging_ops;

> 
> >   /*
> >    * struct page extension
> > @@ -89,6 +90,9 @@ static struct page_ext_operations *page_ext_ops[] __initdata = {
> >   #ifdef CONFIG_PAGE_TABLE_CHECK
> >   	&page_table_check_ops,
> >   #endif
> > +#ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
> > +	&page_iommu_debug_ops,
> > +#endif
> >   };
> >   unsigned long page_ext_size;
> 
> Or, put it directly in linux/iommu.h?
> 

I tried that, but in the last patch we need to include that in linux/mm.h
which didn't compile and required including other files which seemed
unnecessary and that it would be better to isolate this feature.

Thanks,
Mostafa

> diff --git a/include/linux/iommu-debug-pagealloc.h
> b/include/linux/iommu-debug-pagealloc.h
> index 87f593305465..b2b82cf032e6 100644
> --- a/include/linux/iommu-debug-pagealloc.h
> +++ b/include/linux/iommu-debug-pagealloc.h
> @@ -14,8 +14,6 @@ struct iommu_domain;
> 
>  DECLARE_STATIC_KEY_FALSE(iommu_debug_initialized);
> 
> -extern struct page_ext_operations page_iommu_debug_ops;
> -
>  void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys,
>                        size_t size);
>  void __iommu_debug_unmap_begin(struct iommu_domain *domain,
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 801b2bd9e8d4..40133031985a 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -1185,6 +1185,10 @@ void iommu_detach_device_pasid(struct iommu_domain
> *domain,
>                                struct device *dev, ioasid_t pasid);
>  ioasid_t iommu_alloc_global_pasid(struct device *dev);
>  void iommu_free_global_pasid(ioasid_t pasid);
> +
> +#ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
> +extern struct page_ext_operations page_iommu_debug_ops;
> +#endif /* CONFIG_IOMMU_DEBUG_PAGEALLOC */
>  #else /* CONFIG_IOMMU_API */
> 
>  struct iommu_ops {};
> diff --git a/mm/page_ext.c b/mm/page_ext.c
> index 297e4cd8ce90..345af8c9fcce 100644
> --- a/mm/page_ext.c
> +++ b/mm/page_ext.c
> @@ -11,7 +11,7 @@
>  #include <linux/page_table_check.h>
>  #include <linux/rcupdate.h>
>  #include <linux/pgalloc_tag.h>
> -#include <linux/iommu-debug-pagealloc.h>
> +#include <linux/iommu.h>
> 
>  /*
>   * struct page extension
> 
> Thanks,
> baolu
