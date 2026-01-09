Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832CB2DEA70
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 19:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767988274; cv=none; b=sAHc/cwENWTQGrn8KnOZulAnbIk4VCkNNi5WFJ2/GzuEJD6jaBMvBNt+yOpiBPUP3MbjLeuNNhYqTm8Jwgvw7AH0b8Av8mf6JbuZHAp8Wbx5WAisNo099ghKcwCi/naozHR7NI132+HY6+QL6Ip47QqrysO1ZWUBx6rKMt2rDYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767988274; c=relaxed/simple;
	bh=4j8mSXXSQlh/FE4IkZdDwk7n5+vtZGmT0Vq4KXerTeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCUv4Qlypzn8RcC5B/JWrFIoGOR7KTXDioGLd4SNZwdk2jihG19zclvgtOIVWqI44hnLXgzcNpKkHiqI+YtCqJ1juwdmvcJ+fF7Q3wrllWj0VkvCRvrBiTHp9pCkB2QylyMNas71kV6HRMmYAzVtE8/KdjRTcW5BT+HYbjWTVTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ImgIFG75; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ImgIFG75"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b25ed53fcbso621958885a.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 11:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1767988272; x=1768593072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1HhQrwHPYHs7tKqcm2gO84BH3BiFPGmtv9DkIKXa95Q=;
        b=ImgIFG75OoxdecNRLoSmBvaKd8dGnF4Mu9BGLF6A1HX2bgDmB292viDtxT3P1OAIGO
         3MYZDAfyFLGsZgMdQAIxj2m84PCrCwEFkYkTw1GPL5GTZgMmk9/UqPELxW6juj+tN0fo
         APiVzpETnCeCqqopCZRIVo3b+Yrg6eGqQ6CYwLpGrJetVQ/tBR7lWO43wum2W04XIGyU
         r6ZxS+kw5uB4zEqlnWCK4I/91O9I2FL0khLSFJve6Ut8h8kMbUEPHhMbYsX459+l2RXD
         rRTm/m3mOuk8koC7BZ7JluSxlSc5KKSAhINHRHr6tGav0rliP3ea7mB5lA55frzm3klS
         PwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767988272; x=1768593072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HhQrwHPYHs7tKqcm2gO84BH3BiFPGmtv9DkIKXa95Q=;
        b=Kt1+aj+EYJihaa8NdwboxmUFU7biikRfQYpYMr+8TywH6opcv37dQJmyIPiDY6HpaW
         Tri56SO/blRCrj7nbnQX5ZEiHuArerX9mhz1RB4h2hJ3JLpVtm1XxJ6v8OkMizFuUP4Z
         QYAL5JcCB1M4sv/nF7ssBodpTIZVIFL2/eA/5haOX0GbogiZDW8amYDD4r/Hdn/eY0tM
         Z/uGS0gN3NnhKOUj0wFNiO3qhKEZqDH1mWaKDPflXyeL8JXuRtr8aX2gJ5hxAX5e+ub4
         EkpgJ3QbVEVt8KFnnPR4Uve2rwnVHxAs2a6PjpyFo0RS7f4YbLFQbiX8EYj9CQiV44Xx
         vjnw==
X-Forwarded-Encrypted: i=1; AJvYcCUmv/EFsNHvqd3kllRPtrAkWbRjD9vVSw1DhfBX7GtKSJFl/P3NMUSc4hdGoF+JIRrCPnTW0S0/+lo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz12pIUxR3+dtZd3j+qhrH12xU4uiMNAOP8WHwx6gXxSexFLKl1
	L3FVvPhEjA2OmsITlqOo4zRkLsnzS04B+Qvi7R+Rst5aj3H/2SMtcm5RlMLaA+D57Uw=
X-Gm-Gg: AY/fxX43MDRbcyio8BNfunHHlb20fHiWLueH1851NsSlx6JFmwotFRSEJzSHTIPXRIG
	ID0aXDya2c3K7QLxdNKvDwOmKk7vwlsLevdU2RKqyAIr6ATx4pQ59LdCignGxX77RWFJyonNp2b
	sd0fR5e7aIYvnZVqy4r3bpwPnk3a1poDtcuLcVVD0i/V6Xri3mjej5Dn8rkXlJBRfD8sxxXyFeF
	R+IlFqg1gPjJaGHKGqDhUhOZq3DxjOsD+ZnvGby4kuHXYiWUIkKg30cKQcUBv6ssIliZdC+lRNn
	VAfrRyAjuW74El+1NuEnENkrRZs0pkxHoyPTHEkXb7sZsDRHQOJ/rCqoKKRm0D1WD4VNH1xu8fU
	OPukdunzd13pLKrLfTPJtqJ9qjsss/kxvHOO/wYJj98N+elH5lyMAOytV9xcSvJIYYhV0K5Fn8O
	DGOtP6riNmiLl/vhJhLW8LSmOBJdu8Lf6dLnz/Ksvcq9qzzLDEOwqWYv4CxJTCyF5iOhY=
X-Google-Smtp-Source: AGHT+IEZlrPxi+avVlluweNPtX7JEzZwtpBy5iyUb1htiohwK8TIi/Gv4SrQxJebEESGgl3Hi3a9jA==
X-Received: by 2002:a05:620a:414a:b0:8c0:995b:e729 with SMTP id af79cd13be357-8c3893aa18cmr1552234485a.38.1767988272405;
        Fri, 09 Jan 2026 11:51:12 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f400b59sm888623785a.0.2026.01.09.11.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 11:51:11 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1veIVr-0000000381J-1kSA;
	Fri, 09 Jan 2026 15:51:11 -0400
Date: Fri, 9 Jan 2026 15:51:11 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com,
	baolu.lu@linux.intel.com, rdunlap@infradead.org,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v6 3/4] iommu: debug-pagealloc: Track IOMMU pages
Message-ID: <20260109195111.GQ545276@ziepe.ca>
References: <20260109171805.901995-1-smostafa@google.com>
 <20260109171805.901995-4-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109171805.901995-4-smostafa@google.com>

On Fri, Jan 09, 2026 at 05:18:04PM +0000, Mostafa Saleh wrote:
> +static struct page_ext *get_iommu_page_ext(phys_addr_t phys)
> +{
> +	struct page *page = phys_to_page(phys);
> +	struct page_ext *page_ext = page_ext_get(page);
> +
> +	return page_ext;
> +}
> +
> +static struct iommu_debug_metadata *get_iommu_data(struct page_ext *page_ext)
> +{
> +	return page_ext_data(page_ext, &page_iommu_debug_ops);
> +}
> +
> +static void iommu_debug_inc_page(phys_addr_t phys)
> +{
> +	struct page_ext *page_ext = get_iommu_page_ext(phys);
> +	struct iommu_debug_metadata *d = get_iommu_data(page_ext);

You cannot do this - phys_to_page() can only be called if we already
know that phys is a struct page backed item and by the time you get
here that information is lost.

Probably the only way to resolve this is to somehow pass in an iommu
prot flag that can tell the difference between struct page and
non-struct page addresses.

But I have to NAK this approach of blindly calling phys_to_page().

Jason
