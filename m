Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E6F2E540C
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764063771; cv=none; b=hJweFPe2M8GuaQdmpq9cGSiEv5qHxbA9Mpptb/WGwFD7Y1d5U40Nbu4vkGPrjB/DCRz4QImXWh1iirrEvpyn2WMzfQuwVADGimnrf2g2DAbNRtkvNcyCvNoM+YkP/4opQ02IQpqDfjP/Q/0Kg3eoauCrBrkJJsqON8GSlyx9Dtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764063771; c=relaxed/simple;
	bh=pYU70KDOQGpxoP29DuTiODNRi+qhfpeRaagOh+suD7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s25aloL8wt3op+8NmrMOAGPITZqQwOo7Ckp7OuXRCS4R+8gWi97MQ8SDYAqUupV6Kv9irRbIvvutTFWIK5kpuo26AQE+OOCabHpB1XoIoUaatI9NzzTUTdQLp1feEtIX9xcEZlzn23evJ1m774Mjber48UoATBk37guVgJeYPYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mAH61eZ3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mAH61eZ3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779a4fb9bfso47725e9.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 01:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764063768; x=1764668568; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gCXHGSoCQLbBnbJkgfyqXAP9QKSn53WdyAoVSewwZH8=;
        b=mAH61eZ38FQNZf9NYAcvlfwKw9jH2snY4fdJNhUegPonBan5i/SdVkW1Q2BmXSHIDQ
         e21K+7juYh1MdFiiS33Tf3+RuTC+C0t8hEWPLADFu5I3EKokAwX/eL01nuGb8/sIGhXd
         X+lYj/5gi/nNmvDcdRLT3rqUROJEFhevfoEoiK933Eq/dQBRnIsgLiT8zztEBkqa0x5Z
         eqW5k/ak2kAbFUi8E4aJ83Z2NaWzcTDcNmmHz8/brWTqvsKybjVEobPMHYLXBLJpzcPO
         3ea7o7m5vH+Ih5TvmMD/5eMSK+UrjL4g8BDjh+K6VuzHr2NCDL4noKelI2jxtVKgfzKV
         yFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764063768; x=1764668568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gCXHGSoCQLbBnbJkgfyqXAP9QKSn53WdyAoVSewwZH8=;
        b=RhA0vmr4UTS4lOwscSPCmJRZuIPxQiqzxY9Li1p/htNuSf/9xxCXKPkNYhuPMjoD0B
         C9TUnKDUXq9xvxUjvvVZJI2JLvlGGCh1Qn1NA36WbhAlQDOrpiCpWvZzaFHf2yVcTu1E
         p3CZyUxa6nq/G5CQsdfZ1Jx5YntykVaoEWy0c/SdK8Ri2fZyM5g/Q9jqKs3K5p5cv3pp
         cV0nZul/JqIIZrnzxMejICBx72A0Ln+UFka3nojgGE9D/W7241zAu2+gvU6gd7RsugY/
         agk0ljC9iSiY4WPoXilBnJ6BtvAB2dDu1bVpUOzST8dcA6yLyNEjxjlYJWpJMW9ACsek
         9DSA==
X-Forwarded-Encrypted: i=1; AJvYcCXphQggYmyhPFSxcwPFY1xlsk2Sy7I2ZGesjMppy6DV2a8+HyDAqPa6S2PhDNeBfzQWFejlcvax+YE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAozZFTIjOyjtUa2o3nEFX5CUgpzffx0XfSk/CwvNquiOi57Qi
	68QPsq0FfFDscdIktEM/KBPWi93rSPLfjrvktUTkuuPn0//0jUjm2rdd0ddPWsGABg==
X-Gm-Gg: ASbGnct5bA1n108Sn89xzxSkftT7shU8YrL008wrw5Zjt4AFcJFuT6kCZ/udzrJBBBx
	gn6KPgWR4wHUOf9VMsidlt02w0LrlJ5t2wc4h1d6LM3UDICR8poeIGyNjBUkdzYMZtnr2XTYbUc
	en6mmeMMGLaRJIARRbI7XTBiUF5LwraYuHjEwH4XnnDZ+xDDhmZsSjeZcN82ElvTx7EW+Srugwe
	bVC+bTSQVpuwFhRiVLa7LxdjbSotmmu1N+9UqRohfVMpwqtu2tyyuZ2qTd7/BbrIzAEnbUxf0tx
	eSPMa4GtQhutVLlFL8/p3vFo+LeFQIUlUyKynrrACWS2pwje9jkFJ23EPuxEmcNAYIS4w6drrZs
	3R5/Dv48KLRMe4uB7oSChkpwIDob5amj+7HmFaKqFcAN3twCX1Boz6pRVNF2DCBFhylCLrZYuud
	od6TkHZIEfjmzu2s7PoQ3nQrEt3SSFJToCkfSzaRsMh4p/IILE4ihOn1+olNfC
X-Google-Smtp-Source: AGHT+IEnhOrLJGeXT6QUokA3QYFoyH54rP3priqnpDd397EAHhk3ibEBNXSKphd8QyA5DX/xXbjC9w==
X-Received: by 2002:a05:600c:3582:b0:477:95a8:2562 with SMTP id 5b1f17b1804b1-479068fa210mr331535e9.13.1764063767841;
        Tue, 25 Nov 2025 01:42:47 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052d95absm11951115e9.5.2025.11.25.01.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 01:42:46 -0800 (PST)
Date: Tue, 25 Nov 2025 09:42:43 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com
Subject: Re: [PATCH v3 1/4] drivers/iommu: Add page_ext for
 IOMMU_DEBUG_PAGEALLOC
Message-ID: <aSV6E1a4tL_Vt8cz@google.com>
References: <20251124200811.2942432-1-smostafa@google.com>
 <20251124200811.2942432-2-smostafa@google.com>
 <7854489b-bc9e-4bb9-a19d-cff96badc180@infradead.org>
 <5d7a305e-d6b6-49dc-ab1d-bddd1339d4a7@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d7a305e-d6b6-49dc-ab1d-bddd1339d4a7@infradead.org>

On Mon, Nov 24, 2025 at 05:31:12PM -0800, Randy Dunlap wrote:
> I missed one other thing:
> 
> On 11/24/25 3:13 PM, Randy Dunlap wrote:
> > 
> > 
> > On 11/24/25 12:08 PM, Mostafa Saleh wrote:
> >> Add a new config IOMMU_DEBUG_PAGEALLOC, which registers new data to
> >> page_ext.
> >>
> >> This config will be used by the IOMMU API to track pages mapped in
> >> the IOMMU to catch drivers trying to free kernel memory that they
> >> still map in their domains, causing all types of memory corruption.
> >>
> >> This behaviour is disabled by default and can be enabled using
> >> kernel cmdline iommu.debug_pagealloc.
> >>
> >> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> >> ---
> >>  .../admin-guide/kernel-parameters.txt         |  6 ++++
> >>  drivers/iommu/Kconfig                         | 19 +++++++++++
> >>  drivers/iommu/Makefile                        |  1 +
> >>  drivers/iommu/iommu-debug-pagealloc.c         | 32 +++++++++++++++++++
> >>  include/linux/iommu-debug-pagealloc.h         | 17 ++++++++++
> >>  mm/page_ext.c                                 |  4 +++
> >>  6 files changed, 79 insertions(+)
> >>  create mode 100644 drivers/iommu/iommu-debug-pagealloc.c
> >>  create mode 100644 include/linux/iommu-debug-pagealloc.h
> >>
> >> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> >> index 6c42061ca20e..dddf435a1c11 100644
> >> --- a/Documentation/admin-guide/kernel-parameters.txt
> >> +++ b/Documentation/admin-guide/kernel-parameters.txt
> >> @@ -2557,6 +2557,12 @@
> >>  			1 - Bypass the IOMMU for DMA.
> >>  			unset - Use value of CONFIG_IOMMU_DEFAULT_PASSTHROUGH.
> >>  
> >> +	iommu.debug_pagealloc=
> 
> Please note what format the option parameter value takes and possible values,
> like iommu.passthrough above here in the kernel-parameters.txt file.

I see, I was following the kernel's “debug_pagealloc”. Although, the
implementation understands “={0,1}”, I can add something as:
	Format: { "0" | "1" }
	0 - Sanitizer disabled.
	1 - Sanitizer enabled, expect run-time overhead.

To make it more clear.

Thanks,
Mostafa

> 
> >> +			[KNL,EARLY] When CONFIG_IOMMU_DEBUG_PAGEALLOC is set, this
> >> +			parameter enables the feature at boot time. By default, it
> >> +			is disabled and the system behave the same way as a kernel
> > 
> > 			                           behaves
> > 
> >> +			built without CONFIG_IOMMU_DEBUG_PAGEALLOC.
> >> +
> >>  	io7=		[HW] IO7 for Marvel-based Alpha systems
> >>  			See comment before marvel_specify_io7 in
> >>  			arch/alpha/kernel/core_marvel.c.
> > 
> > 
> 
> -- 
> ~Randy
> 
