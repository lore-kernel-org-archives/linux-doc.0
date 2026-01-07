Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65933644C3
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799577; cv=none; b=sH1feS+bnPIB9i6TItKjH2VTH4j+fuCXHE8rz4tMQl8r/aAjWEjvEEI+pvQA3AAAAyn3RVApF5sMGQmcG1AnhdiQdl1PAqf2cGuhVVvKkCR2ezOJQqznRGVxbbaD+eE8I5T8j0z51hu3UOyvOnYd9f6w/bbgK+i3gdUr9QyNkIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799577; c=relaxed/simple;
	bh=amKscgwf9O32GBAy+eAcc817bb0T9V3d3DwTEJ6J6mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghLCUNS264StrUtdX93J79bxTlgs2QCcqWie81mGpsRAJHcRM5vKDljzGM9lYxK9Z6jv2+WwMfsQvINUni5aItI/UoqkcUdVcmaeIPjDmA3aaLYBfH+Z4kLaY/h6G6V78nJ5GXkGAFi6HEQtIA8hBa1nx7Nd47b2Q6mjknmVUjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EfbmMtHW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EfbmMtHW"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0d06cfa93so77675ad.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 07:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767799575; x=1768404375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lbmDIhCSS30gfIV3g50RSwwLGOW3EzTKyBm3a+7nOf0=;
        b=EfbmMtHWjZ6yWmRpFWrBzlBuE7DBKOmtpb6SSEnTc507BzrjuKlCqhkaMQpMphXwVx
         pFNW88NG2agGnFEKRqs1itCNlNwhBzlLQ5Dgx19sEz8SpyZqekLrdkFDb5QvOMeZpENk
         tKClY47dN5upWn9DWCKf/bVSsEa0MBiBHuTR1URi77FGmHA7h05GS6T2HXXf23sn69xb
         87rzammbq0o2OdnwBX9Y88xvc2cQqGJLhqq/mwNgAh3TIPPLjgrWu3f9bV+NnZYDOC/k
         9XvNuzebiWG/qRHkF6A1PiWlKfVUUta7r55GAKGrd1awROLAX0fVQnXXVlgZ6SEbIr9u
         IhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799575; x=1768404375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbmDIhCSS30gfIV3g50RSwwLGOW3EzTKyBm3a+7nOf0=;
        b=r+MUfl6S36ZPRMCj0YY0VFm6M2RfgmLH/bkknXXqixDABDhLosbO2VG7e6OYPinq+J
         1/ndV3AL1JEXn+kv1Bj/yZvv0mOZ/ADzkSI46vxl7CZ1gQ82ongIFXL4sC8SqIdFGpVC
         VOSnts9Opw1TFFWh1c8hVtfGVCfM9kju7TxbNIir2JbHsJibCVzF0eQ1OC6qcZu/Mox2
         lrhX5Ig6AQkbE4xkXRQC6ajIJOl4ijmP9FvADZYI0nkKHSSECyf16dxzCJixBwu01BQY
         UZu7bPscsPRHJfpd3xwtAKADmzHt3NEIJt75ZIA55jHVxfLSp9rASxTXstur+lpxZ/kw
         BPyg==
X-Forwarded-Encrypted: i=1; AJvYcCWLy6mjebF9hStnHm4s9X39RAivwbp2PvXT9i6FjwCXrVmsgJmJvZt8f7DTLXxB4gLhJvOlOyIBoPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE6dGFDjRYnfIMyzd3XF/tsExgZTFDAZ69QVilYvmYAG/U0OeB
	ukcMnKPk+/j/spwNg4d5UwnbncNleoVOpUx9jYrtKxqQu4DCc5g8MRk9J/kmuvtQiA==
X-Gm-Gg: AY/fxX7a3lRuyL6fYYLjXqbcFZxm1xjLivYinNJdTTDyzdm6RK3EcS+QQW68ld8Sf0e
	9HgMR9vMUmQFVPVML2cMdmYGmY9TmV0vuszSdjM4/JId5F20QAPRyACc8IBteeJz9no4en7KX2/
	a4VHHg6PNttwXQAO6kLkd1MBw9y4regDP3cRT8BgxTpXKTs++v4+ix411aUJwuZ+v+3ZfG6YGAe
	vjeKx6WxlZvKSzNQ8WsRLhc+KMiPpjiDGtI3C6u6SfKB8qQZFyA4KAevCtbUawgrHbZcr/8umC9
	ditpx1YIRNh3sAYlvMP78e5BYi90vEvh3YoE1FT7qb854gCAVEoSC5ptohSWVzTfDCpoemrAclj
	3xO/pzOojk7OclbtKmTY7kve0Ilxqlq6prG1+AAZxAPdfsadDDYdOfo6UuFsXrxX8sUBU/tlszy
	gCowkuI3FgM9WKLWwqOcS5Bv4JGg0C6nedjVoXO3IbvyzrYvdK
X-Google-Smtp-Source: AGHT+IH+lNUdBDeuVOlZ0XFJN6S6o7z6ABkgQgy9tsTiSGmVL2tsojD37/6y+OgOeGxqXsN0knzcZA==
X-Received: by 2002:a17:902:ef0b:b0:290:cd63:e922 with SMTP id d9443c01a7336-2a3edc1a4efmr3144205ad.15.1767799574721;
        Wed, 07 Jan 2026 07:26:14 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2b3asm53637475ad.88.2026.01.07.07.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:26:14 -0800 (PST)
Date: Wed, 7 Jan 2026 15:26:07 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com,
	baolu.lu@linux.intel.com, rdunlap@infradead.org
Subject: Re: [PATCH v5 1/4] iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC
Message-ID: <aV57D6OiuKi2359h@google.com>
References: <20260106162200.2223655-1-smostafa@google.com>
 <20260106162200.2223655-2-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106162200.2223655-2-smostafa@google.com>

On Tue, Jan 06, 2026 at 04:21:57PM +0000, Mostafa Saleh wrote:
> Add a new config IOMMU_DEBUG_PAGEALLOC, which registers new data to
> page_ext.
> 
> This config will be used by the IOMMU API to track pages mapped in
> the IOMMU to catch drivers trying to free kernel memory that they
> still map in their domains, causing all types of memory corruption.
> 
> This behaviour is disabled by default and can be enabled using
> kernel cmdline iommu.debug_pagealloc.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  9 ++++++
>  drivers/iommu/Kconfig                         | 19 +++++++++++
>  drivers/iommu/Makefile                        |  1 +
>  drivers/iommu/iommu-debug-pagealloc.c         | 32 +++++++++++++++++++
>  include/linux/iommu-debug-pagealloc.h         | 17 ++++++++++
>  mm/page_ext.c                                 |  4 +++
>  6 files changed, 82 insertions(+)
>  create mode 100644 drivers/iommu/iommu-debug-pagealloc.c
>  create mode 100644 include/linux/iommu-debug-pagealloc.h
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Thanks!
