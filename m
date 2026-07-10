Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2649143B4A1
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701876; cv=none; b=gaHTJeACmpq5auOgDpVuWT3GyqfXVn3AhbabC89RMDKeIbHN7uryVzy0/srecQvBf8ryEX50iPoS7awucjps5ze21EaLe+vBOfWel/mXQXUgYYYdWzBvEql/rofJ8pIv35njf+QK/ds64kYmtxRH3w1eJxQWJeOrDeq6gEumtF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701876; c=relaxed/simple;
	bh=f7MiJ/V3Sa3Z4+LOlKBCBuiD8YraJfksnG/xFb+njPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7f0yGL8h8oOtExhjnzH+05c7fxOQOw6htH7uY7JACWp/kVPmLWg0RCo5HfunLy2/KGgTXem3YPfVBrBnPpaqLBe8efxR6QRwnAiJMJzby124F/CSfbUqpEHHV7aP/zBiv0CnqlSHWpXRltn0+oZ7wuupWqyAfPeTU350G7AMeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=n2mfLfYD; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="n2mfLfYD"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c22c61795so7683641cf.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 09:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701874; x=1784306674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f7jwDOcuUIXFwEJ3t6jZRtuRC5qCtLyV1KSZwcqARY0=;
        b=n2mfLfYDLULPdcCb2P7n+Ftl20rt5v6FrgTSuKs61+/A4tY+V41uTSFtv6fblckkkT
         eyDRILWpy2iIOb2Q1pIfPYo1dDoTZFibhlAMymsBxFJ8Dp/ui6P8eXJsygMIxAKvHZzl
         ug1G6kmK/OtX1dxfua4fBK7FrSs1lLgwcPQnQVKeK8S9uO4thq1c7Of2nun7mYW28nVL
         uKZuESe1xhm4p3ugfzGenvk+jty096m9nCA8vBEQWZv99TSbBNxZrTDv3JD8dDzn3jQ/
         t8ngPJ+yqUVHaslZIcME744MrbSqfoqz28zE9xzG6+foiDJYJHcVVJM96UeFplG+KFZN
         l6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701874; x=1784306674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7jwDOcuUIXFwEJ3t6jZRtuRC5qCtLyV1KSZwcqARY0=;
        b=GSDT0PhaVunZpA6DruTnC2e86xKWm1Ry/2w9nJNoOZ2G7zsh7OJZyCHK1Cyxchhwbg
         yz5CUUrGSK58kpfd+4oxJmnrU7fp4qBhMxIWM0TbCxo6oYvu+39rZDMyLPMiluDuuUxB
         QbDyJ3zDTIu+lfVD6MGCruGzeWlImdIGDo6X0+PXXXVmi07diUfR8ZT9io4ZKhyFoQLp
         XDeY6L2TPjGkyZl1m4+yjHesILHUHlgpMrVy4ufLETDvxeegcToYAB1H5+ra2iTV4Kx2
         BUdEX0h1fk47Y9Fdq7EO6OO2jOqtjmASC2kWyvD1LPyx/uhBKKdmc6aVHdr1DlotYzPb
         8J0g==
X-Forwarded-Encrypted: i=1; AHgh+Rpc97zBveYlE2h9MdlSHc8tfbJsE7+IeWr2n2VBr7R6kdHcTdIkORqbX/rSlhfoYNWKqt39WK+95To=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7GDJHfU23BisOpOSJ6dc3i+XFMDkU3Mvv0zFK65RYlpYoCL/A
	CgcPfZes8UymuK406dDwJfH8W4KwKYe1995vWHqpNBjTPGVmHx0/Jf5QWeRggQmqHo8=
X-Gm-Gg: AfdE7clk/byXzkfK5MJQ/u+PQZJKKz5PQAsFFXVDfeAK1HvANYqa0zBIkaFDtQsCG44
	NHEddqeb12OdPs0LV7l4cD6sEKQEWmZkWE/OwBBQQlBWvWevR4f+JmLf8WKLySDcl9t0T9RMVvD
	sBqOUDVryTcbBnD6vEeWXNTUnH+1S/TXeAUzrDTDXOVsO3v9axhO4nm8Rni7XO9bQT9QWvnU33b
	09Zv4O4vB6gx+/OzcooHRpSIdBvMRsDAGx2AyIJOk1XfPBzNtFvYLeZ+woWCZN4XXqSAE1e239T
	ZphgIp8JRPpGcpyc/dX5+xu8kEEW5yJJB14IpZ5Xnj2UueP8WVONP4PoZOIhLFHMYnEHhWnm6FR
	hZD5xE3udCtPPig5DrjPpPBa4yaoMw/HT6kni8TmriXNan12Ypoa44VUgBEWS
X-Received: by 2002:a05:622a:96:b0:51c:7b12:5ff5 with SMTP id d75a77b69052e-51c8b43fec2mr132124531cf.81.1783701869227;
        Fri, 10 Jul 2026 09:44:29 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4b91sm45168766d6.19.2026.07.10.09.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:44:28 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEKx-00000007Yxj-3wpY;
	Fri, 10 Jul 2026 13:44:27 -0300
Date: Fri, 10 Jul 2026 13:44:27 -0300
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
Subject: Re: [PATCH v7 8/8] drm/gpusvm: Use
 hmm_range_fault_unlocked_timeout() for range faults
Message-ID: <20260710164427.GW118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345366389.660027.12986386801605494596.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345366389.660027.12986386801605494596.stgit@skinsburskii>

On Tue, Jul 07, 2026 at 12:47:43PM -0700, Stanislav Kinsburskii wrote:
> Several GPU SVM paths take mmap_read_lock() only to call hmm_range_fault(),
> then retry -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires. Those paths use
> MMU interval notifiers whose mm matches the mm that was locked for the HMM
> fault.
> 
> Use hmm_range_fault_unlocked_timeout() for those faults and pass the
> remaining retry budget to HMM. The helper owns mmap_lock acquisition and
> refreshes range->notifier_seq internally for each retry, while GPU SVM
> keeps its existing driver-lock validation with mmu_interval_read_retry()
> after a successful fault.
> 
> Leave drm_gpusvm_check_pages() on hmm_range_fault() because that path is
> called with the mmap lock already held by its caller.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c |   52 ++++++------------------------------------
>  1 file changed, 7 insertions(+), 45 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> -	mmap_read_unlock(range->gpusvm->mm);
> +	err = hmm_range_fault_unlocked_timeout(&hmm_range,
> +				max_t(long, timeout - jiffies, 1));

Same remark about max_t

Jason
