Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D76392649
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 15:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799706; cv=none; b=Uh/iWF4pa760xgASBRPKSnin0/a2SqcPnKPOM4mkD6bEmIL0t79mZC/IbpRF4eLU7ZYjH7IextIoBppo5JXq94e+kSsvbUuslvsjeeZWF23areNVR96pSXXslJ1BxgRi1sX7t+lkEabjBaAbJcE/jGs83iW/3RkrPadd7w21DNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799706; c=relaxed/simple;
	bh=bEdTzVsCTnds/QEJ72cMK55QulTPOUsoFiergEmO5Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pe0ZEYkU2uyEmmdZ9yxfLHB07X0dSxWt8cfsibZxH3S6bta/lfD6GMq/m6zgzpXT1rFOxsk1KwJenRPkDSmRIW3BPVVjYe7r+pPHBmIwLgrlyHP54wsXKf6AMWw0UKZmdlJg929SRRPyHeAoZbPfPqMdrCCaepHl3glwHINwzJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0N1HSlPV; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0N1HSlPV"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a35ae38bdfso72985ad.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 07:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767799702; x=1768404502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zr78093NHGdBXXu/mjsoeuNUSxyi1KCAaesy3wXMOKA=;
        b=0N1HSlPVpv+Fr3aqLDvT9XoUw+QC+z94mafQdQ3XaMvea2G8y10r1OB72BFrx6nwr+
         KoehJRy1+fAOAd/mo3UDXFUCx5+/ysvqYeMGVbaX7rfEf+HX+wcGrXF5pd1MVNUoaHFX
         tvJ/lc/kIiXRyqsaODLlGUPj1cSfe5ANhtrRFyog1I6fP3hHxM9PK68U+SGAKTHzhjq3
         pmtisReOrQA3KX+CRCiZORq6MkWhgLWRKOEcUH2JYu5xI8QSs3b92wqIObTInWM31cJf
         Y1EtTo5RFRXFefWgfYF97oksTdP47ZfRtf1Uofdp7Hk1Axiop4ImUnUHdpg/5pgrqTzd
         I1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799702; x=1768404502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zr78093NHGdBXXu/mjsoeuNUSxyi1KCAaesy3wXMOKA=;
        b=E0pccObALYfPaPOXXHziI/4+O+kh34ZqY/Tf+J5c14ZjkWFnRnzrNjkqbrfrq4LPfX
         rTYfv+aV/oBXcuG9GL8OJZs2xXAEDRHvfP3K79P055inpncEvFAo1BTft15cENnJtuOW
         RPsJclRMHts4L0648aUgvP55OYSm97P8KTHFUvj/K5EtUxBaBIjR1o77otUSXyA9WoqJ
         3VRkt9dtq0W3aQ8k6CT7RNH6NRuqt2qArLZPH7QLwAJ+28ClNtEkiZO47meo5/u1Uj+C
         WLyZtMwvKh4SoC90alUe9ClCyosd/3w0aT7VuEKCf+a9alLU66wk18towzdoHRQYiH+N
         2t6A==
X-Forwarded-Encrypted: i=1; AJvYcCXR8BocyUL9zIvOzEgpAovzRmba7u5aspsvoJnnql5GUr1FJKeARxdsv6L2Dmo4AFh9nN1PvPZqBmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YytBeOBNhGVoTKzxtmO3yQcGek5j6yRejx9EcX3Aak+5FswyLjb
	Vyaz4K9jnkuDD7cDPGT0zJ8QY9W7vfNgrId4tZRNH7dy46K/sLCAE8RsMdXJD5SBfw==
X-Gm-Gg: AY/fxX42zt6DZ0rWBi4GfxRY5dSEQAtEFDr6FoxjYUmBttEiTOaOTHh9eXNI66Nki8F
	4wN78GPET7hQwiSCOHhkhbVxXIrA9V7YLxOz9d8+RXRlcHfb3K6igLuhxGyddUmveft63xGVV4B
	7Ac/LC8bocTCa5e0ioXRVfcQI6X5VF3rr2Ta6l6CZTgGQxzYWxbySWDSQOIxp79T/a5eJpJOcax
	au595KlLJGHGYX2C/oIZdl0+wrLEyi4EQDtGjTDvbJ08Pi/GMFAANwJqHYqsRW7/zhVsfcrF5Tz
	rhT2K2OTiojRoM5RPY5bU6knOkW3TbkL8iluzXTzCjSsDbxeF2afFRfU1LHfYCa9DNXTLlJlDfQ
	kbG7JJ4W3xvgLA/C620cMFPse06RfzakZA2jn8lV0o9XC+A21b1huwcA5lGQkhLiSojlDXSI6xc
	cmpIDDDIlbTBt9DaEE50dZZOleNwdwvPtDq7jg/qYtUjFApnd1
X-Received: by 2002:a17:902:ea01:b0:295:28a4:f0b3 with SMTP id d9443c01a7336-2a3edab5490mr2722885ad.0.1767799701484;
        Wed, 07 Jan 2026 07:28:21 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c5ce06sm53630535ad.44.2026.01.07.07.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:28:20 -0800 (PST)
Date: Wed, 7 Jan 2026 15:28:13 +0000
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
Subject: Re: [PATCH v5 2/4] iommu: Add calls for IOMMU_DEBUG_PAGEALLOC
Message-ID: <aV57jZiKBfDHXciP@google.com>
References: <20260106162200.2223655-1-smostafa@google.com>
 <20260106162200.2223655-3-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106162200.2223655-3-smostafa@google.com>

On Tue, Jan 06, 2026 at 04:21:58PM +0000, Mostafa Saleh wrote:
> Add calls for the new iommu debug config IOMMU_DEBUG_PAGEALLOC:
> - iommu_debug_init: Enable the debug mode if configured by the user.
> - iommu_debug_map: Track iommu pages mapped, using physical address.
> - iommu_debug_unmap_begin: Track start of iommu unmap operation, with
>   IOVA and size.
> - iommu_debug_unmap_end: Track the end of unmap operation, passing the
>   actual unmapped size versus the tracked one at unmap_begin.
> 
> We have to do the unmap_begin/end as once pages are unmapped we lose
> the information of the physical address.
> This is racy, but the API is racy by construction as it uses refcounts
> and doesn't attempt to lock/synchronize with the IOMMU API as that will
> be costly, meaning that possibility of false negative exists.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/iommu-debug-pagealloc.c | 28 +++++++++++++
>  drivers/iommu/iommu-priv.h            | 58 +++++++++++++++++++++++++++
>  drivers/iommu/iommu.c                 | 11 ++++-
>  include/linux/iommu-debug-pagealloc.h |  1 +
>  4 files changed, 96 insertions(+), 2 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Thanks
