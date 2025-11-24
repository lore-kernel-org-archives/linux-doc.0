Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ED926A088
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763987938; cv=none; b=Jhqj8vrDSRow5xtCYUE9EE7HSq2wV9Pw9U1uDvmBYUi1W0iK7UXYDAITG3z4IeG7F+V8pL6FITHwWSAApY5LRdbJxIU549pLhIa87PRtk2xzNguZfwgA/GfZ1pS4IvN6BS4F1Pl+GipcjXJ8Z8k9YtnULWe/XcnROt4El2hU3Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763987938; c=relaxed/simple;
	bh=fmhzmUbf5MkrRNaJZmVA3g0/x3ROh18aYfmbA6C/VdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tl95imtAxUw6Gtq4G96kziQCixNpAE8anu88IPGj+0jXFx2mH+EKdMmjKBoVM2VuN4XItOh228/drcG/BAlfw0nIoBgDXyO1dXbGekesa88XvBJTBQEQvxfPUaaUtahVzxPazpAt3e3/BCdQ8dSUVLYim1Hi9Kt38Zr0VAandmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VzwWA1ca; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VzwWA1ca"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779a4fc916so93285e9.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 04:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763987935; x=1764592735; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+hKcjz4CEQtKu1cZ8SM9PbIexDlVU/R+LQLODvCo9Dg=;
        b=VzwWA1caUj0gMTgIN/oEIhOGaEbPxawRlAyBH0ayg7ykTp+Q0aKSiNhgvVAjZjwJgd
         RQU9RcAcBlNxNxWX1YmpjLUK+Fq357pw7YZl6CvEYOiSbRNCDPIqkxd6m45a+mQAuuwf
         HtzzJrT5JuUXXs++hvutGUv+jCbOjy+mqf0C1SOo4W3JpiD1vAXulRgSZCnrNrckbbSR
         FeBSB+gbnt+r0AuO5kV5kqjRCH5oHJVDPRJ2O3LY2A3BJxgeQCOkEGbu0YPybXc3xleB
         B4iitT8ee/TggLV2Vd1cODfaAUEU7tPxwVIQaBXCGxAEY13GVs6vglWSaeJEuW7Bi7gi
         GjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987935; x=1764592735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+hKcjz4CEQtKu1cZ8SM9PbIexDlVU/R+LQLODvCo9Dg=;
        b=eZZHkCJ014NB1iSYe5rQxdfOqbqZH6QRMkaMvF64ahAKuTMqxZqfOJaqkPHeaMVKdU
         XTeR806msrmOboQIVXOp+2i9apGfCoXzZ/BetszOCo8DMSgPyORl3RDgdbjvLQ359vwP
         PhdLzS1zmUMtMdf9aL/TQd6FGaq5Gx65sU+6Jf+HjEFHZo2rBy2CgYF3k7zyguSMXIIk
         FGp714CxJnAZI/Pc15VDOHKiize8J0J1qNxXedKsaiCQwjyLeIAoFmyQJ7t6WLRi1BTO
         fYvB+WPDHE3J2Yp571hv5bZOwXDcPWBHAOIXsS+LX8k2LfZBIs8kImUFc1teAWyDFKxk
         m+GA==
X-Forwarded-Encrypted: i=1; AJvYcCVexgL64BFnGdm2Iqs05V/EtENqSyiyv3olysIcxNB9pE8qHmFyTV0tfxmhyiYQ3xy+L1NnUjSnCbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJVwllgPHzO9H5V7zcpQ2Sb2M7X2GJAd57P7yrtMqI+LK93qon
	qttfyxQXPOts3WwFtqJeR/GNB9nowqINbYl3MXdOVNUGwfjOoRDLUJ224ZXEGNwh/g==
X-Gm-Gg: ASbGncvuRfTymgzflKAMokMbBVJWfIWMHN1E3cF3eyWeBxx0hjvH/MGDy8y0cARXyfV
	iqG4/V4e9Qpo3KIXYCtqRmiIwrEXZvO6JCxxwXBSIDT77AnzzQQRPaE2fAWldQwDTCt2sH3bri5
	kF+2oLoG1jH8VoCxgGR9eILvwrGFmH/EFGnp01w8XjBk9PTyNx7ixVFOUAvLgHU9uBcQx/P9ZcL
	A7WRDpK41aTfJkG7KgokXEu4v367oUag8IWbyIR4ERm0hGxnAgfodPzcWuP1FWVotljjecS/JY5
	v629tCSyN7nHHsGJutKau9oi6YaTAmdcmIpQxjnVsMLMdrPniYiXtYM0+SWfsFDemh2yzdlV+/b
	FnVxz/9z8qo+9Um1ItJTjBDtL/DLiN2sMpiOQ7HbI77AwO72oEh+vBLBL2esVuIrZgEIXrZpN8f
	84/YpPCZhqPvolHlrHPKgO6iw1FphLeD3qqvWnjYoM3El05E8KOw==
X-Google-Smtp-Source: AGHT+IEZgUg1bUbdAI5VMl92UmNgBFeGgbcBg9hYsUoLQBWM96FEzs3PepDjVAB17q+bUwBOhS6TRA==
X-Received: by 2002:a05:600c:8a8:b0:477:86fd:fb48 with SMTP id 5b1f17b1804b1-477c5e9b0e9mr810065e9.9.1763987935133;
        Mon, 24 Nov 2025 04:38:55 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fddsm29238614f8f.14.2025.11.24.04.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 04:38:54 -0800 (PST)
Date: Mon, 24 Nov 2025 12:38:50 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Will Deacon <will@kernel.org>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz,
	surenb@google.com, mhocko@suse.com, jackmanb@google.com,
	hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	rppt@kernel.org, Qinxin Xia <xiaqinxin@huawei.com>
Subject: Re: [PATCH v2 4/4] drivers/iommu-debug-pagealloc: Check
 mapped/unmapped kernel memory
Message-ID: <aSRR2h68l9LRn3iZ@google.com>
References: <20251106163953.1971067-1-smostafa@google.com>
 <20251106163953.1971067-5-smostafa@google.com>
 <aRW6LWh_1lTce7kU@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRW6LWh_1lTce7kU@willie-the-truck>

On Thu, Nov 13, 2025 at 10:59:57AM +0000, Will Deacon wrote:
> On Thu, Nov 06, 2025 at 04:39:53PM +0000, Mostafa Saleh wrote:
> > Now, as the page_ext holds count of IOMMU mappings, we can use it to
> > assert that any page allocated/freed is indeed not in the IOMMU.
> > 
> > The sanitizer doesn’t protect against mapping/unmapping during this
> > period. However, that’s less harmful as the page is not used by the
> > kernel.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > Tested-by: Qinxin Xia <xiaqinxin@huawei.com>
> > ---
> >  drivers/iommu/iommu-debug-pagealloc.c | 19 +++++++++++++++++++
> >  include/linux/iommu-debug-pagealloc.h | 12 ++++++++++++
> >  include/linux/mm.h                    |  5 +++++
> >  3 files changed, 36 insertions(+)
> > 
> > diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
> > index 0e14104b971c..5b26c84d3a0e 100644
> > --- a/drivers/iommu/iommu-debug-pagealloc.c
> > +++ b/drivers/iommu/iommu-debug-pagealloc.c
> > @@ -71,6 +71,25 @@ static size_t iommu_debug_page_size(struct iommu_domain *domain)
> >  	return 1UL << __ffs(domain->pgsize_bitmap);
> >  }
> >  
> > +static unsigned int iommu_debug_page_count(unsigned long phys)
> 
> 'phys_addr_t phys' ?
> 
> But having said that, wouldn't you be better off taking the
> 'struct page *' here rather than converting it to a physical address
> only for get_iommu_page_ext() to convert it straight back again?

Will do, we will need the physical address anyway for the error message.

> 
> > +{
> > +	unsigned int ref;
> > +	struct page_ext *page_ext = get_iommu_page_ext(phys);
> > +	struct iommu_debug_metadate *d = get_iommu_data(page_ext);
> > +
> > +	ref = atomic_read(&d->ref);
> > +	page_ext_put(page_ext);
> > +	return ref;
> > +}
> > +
> > +void __iommu_debug_check_unmapped(const struct page *page, int numpages)
> > +{
> > +	while (numpages--) {
> > +		WARN_ON(iommu_debug_page_count(page_to_phys(page)));
> 
> Since you only care about the count being non-zero, perhaps tweak
> iommu_debug_page_count() to be something like:
> 
> 	bool iommu_debug_page_referenced(struct page *);
> 

Will do.

Thanks,
Mostafa


> Will
