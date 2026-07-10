Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D747443B485
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 16:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701795; cv=none; b=DTni/1Sxw90/Tq7lrT1tB+aRuFFADnt/vqXJmo0GmucXYaGw97F3Cs94iHOkkHibuaGhrKNlJzpkcvABq00BSQBWBXW2erC25/ixrsUpZmKemkRP0vybQYyKz6urBwqsuxUnnOc+BeR1V+2APZTFyqPVeLZv9kVJ3FY78Pdoiug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701795; c=relaxed/simple;
	bh=ZL2zX2D9UZwwCtPCpSQDsF4TpGKLC8vJlz83DhiVqG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=isuunAmyjS1UDFRMUVyAuFUbOF5+wzfjgNE66yVUxkMWqq8+H9WmZYlGjNAhVtZDIdPYMRAwLV6FKZt1GfzmGA0y6FeehwpYaUTBLyhDTNeA7kQ1u1aALNXpmMVltQ0jbOjXBjVY/UZEkpFk3K7nyEZ/PQcxR3x5f7HHS8D0Njo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MTVA1wSc; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MTVA1wSc"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8efcfdb2b43so7500656d6.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 09:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701793; x=1784306593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cCrA5GvcNcomQ8YHAskvpnsx6mUAVwyB/JWdGkfbiJc=;
        b=MTVA1wScQzJ9mlsaDCFYAeIc6xDO4WA4Ha4RmRKgQuysCFeal1CB14Sstfu4qFZ55f
         5cmlur51RFp7E08XP0GP0n+sZtz0fWTWn9KAeT+6cdTgXgk34jVkAL2//BWc+AE0eh/o
         pVATPDZeP9aLep4mUYpOaw5F8BtOjdTkDlFFtCYDYFB30W/Ghd/j3osldimeaWfpiVXF
         eWKYnURUzVLAc1nLwCsM4FJLlramamUsaud7zt/S+jZKmlI4H5rpUl06VdgG6YIGp1PF
         bBsToAihc8O4hRIFyPSAuyBXyTdFTL5VmCtZBBTfB+Qaq1KgIVsfqYJIuAv6sv+JXdkA
         wJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701793; x=1784306593;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCrA5GvcNcomQ8YHAskvpnsx6mUAVwyB/JWdGkfbiJc=;
        b=ITZmK5MIvA3pHRuHqq4TkMRvXXjxkLG2updY208IUdSVFV/w29GOHwdliCC+X1WZpI
         o3HdfGSIxP9oTyZoVL1kyJy9xyAMLrVgkve7SseiUvvBH1mw9yWvIwbsyaYbNIDWh452
         h9I3j6t/r2T1/G//Q6geSbJLDOaOHDwCH6GYA103my5SggYkecpIKROChM9YoXVxIUSW
         jGbb9etfghDG/CTlHVUyq+WW6GqyZP+enq/psDcUCO5xffH9jOvq9YNviWzJLiuKDSne
         PEhximlobQe1wZeIcZMEfp+wGLjs3v3awplifMtDCIab6A0BDZqoJn768z6wJcFplUhi
         bTng==
X-Forwarded-Encrypted: i=1; AHgh+RqmFC0wi4y2Ybu64kSgmvqnx2SbObzOTSDn4RPxBZ1Cf4WGbuwC6hQYARF19p8KQOcNceHFY7GyMIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP6WFICKttdWg7LSWdQ/M0tvQhIbXScsYxybgUInlHrCqf9IPR
	hRZ9gphAY/y9U0cBRDcpmshZbXweVHm5ru/++LH/oPqyz1D3/BwUZFJkPlFa0+2Kbx0=
X-Gm-Gg: AfdE7cllgBM3kAluUp6V3SqzVAgsSW3jnZrjFpWO/7/8MrMFvP+DbgKqLQwv6wuhbZs
	NwmVCewcfii/X40saoVjqYMwE1x0VF/my6jJFe90kgXaffLQLN5nw8bvgAj9lu8gGE7PEHdNAW8
	nUeY8abeKJs0ybvH55kE2Yy/50NkBm8kY2bgukNvSARulKe1k6u1tUPPNQViu8N9wChVYrYaDnn
	tgl0JRMZyFmwlBvQFPhHR7xgoEQmCU8k0vMKEmafUAaLElPzYiC+M7Qo+mj1lTH3mnetmdfGBTb
	Iq5CFCCWiEJ+pUjzoFXVJkgv63TA1k0Fx1Gl+bX8s7i7vYwKw6LV485O8z9U3LEtYsT4axoJM7i
	odUl30VtAiZytv53z7ejW4yoQHeMhvtdSAylDYEd9jfhiWVwtUmRyQ5pi8HqJ
X-Received: by 2002:a05:6214:43c8:b0:8f4:4d6:8adb with SMTP id 6a1803df08f44-8fec1d808a6mr146369176d6.22.1783701792723;
        Fri, 10 Jul 2026 09:43:12 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-900a7f8f5d6sm30725036d6.15.2026.07.10.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:43:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEJj-00000007Yof-1AFg;
	Fri, 10 Jul 2026 13:43:11 -0300
Date: Fri, 10 Jul 2026 13:43:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
	corbet@lwn.net, dakr@kernel.org, david@kernel.org,
	decui@microsoft.com, haiyangz@microsoft.com, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v7 6/8] RDMA/umem: Use hmm_range_fault_unlocked_timeout()
 for ODP faults
Message-ID: <20260710164311.GU118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345364975.660027.8790629832830633290.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345364975.660027.8790629832830633290.stgit@skinsburskii>

On Tue, Jul 07, 2026 at 12:47:29PM -0700, Stanislav Kinsburskii wrote:
> ib_umem_odp_map_dma_and_lock() takes mmap_read_lock() only around
> hmm_range_fault(), then retries -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT
> expires.
> 
> Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
> the mmap lock and refreshes range->notifier_seq for its internal retries.
> ODP keeps using HMM_RANGE_DEFAULT_TIMEOUT for each HMM fault attempt,
> while interval invalidation retries continue to be handled by the existing
> outer loop.
> 
> ODP still validates the interval notifier sequence while holding umem_mutex
> before DMA mapping pages.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  drivers/infiniband/core/umem_odp.c |   18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
