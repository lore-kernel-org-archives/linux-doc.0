Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AAB23E33D
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 02:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788576199; cv=none; b=un4e2FFCfvyY9ZNq4S67CHHDKJoTFUaOWFegGXs/X7lEne2lTBYO27z5kKIDUjd/RZ9HLztDZ8xathlkE0Pn+jHt5yNduovyWf24dh6CVX0U+jlT0p9AcoVOaFobwWE43Qs2HBNl/vHGnZEa6vbSk+9eUq+ikvdfv1vIlTy1Aj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788576199; c=relaxed/simple;
	bh=cafiR8PF1xxgKNVKQNGmb4iU4+qztAjRhOi4JbCGlvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngpRXMnKv2tkm/OFAqS9EsWFuG/Wr5BhyBqLrziQB/2vTwQi37Xay3PzOuhEWDa8hV8AuolUJ1djVlTKq+aBF+4ERgzUbmpGO3lDenJNe85by4d4D6kya1KCY9QRiaJHiZAMOp+pAL+gmKQby2STXBTrGetgTi2eZb/JYKuzvXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTRxJF+E; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTRxJF+E"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d01663d816so12349195ad.1
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 19:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788576198; x=1789180998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nN1oOZhHFA6iOMNOJ2Qu+h7C5QPyvLKsSkfURb8yDX4=;
        b=VTRxJF+EwLDTQfCVdPMYYNeWfcqecpZbhyU/tLwPzpZY07vaYQP0CzWNMY2o8R/ijI
         5pzeHmP7zhmFDrpMeMTD7iHlbK+vHfTTQRCGL00lM17XdlB1vjdx6vYbduKN7APB+g/b
         WLxd9p8HM2+p1Z1e52TdhJsnL+9eAxSqnZUTim8XLuTYgjuQvSCvLprAnnMVAvsveNn1
         dlwCJ8+772zjzGXCKqggkVQLTGrGB2rJmai/N0lkntPXKi83D1YnAdLgJhY8pRIUR6Ji
         ZKXnMPqIVWxqaFNyEnyy1kLGvmUFkEiA6Ysd52ksd1js/uYCyptygp2Xg+4hfgXDkX1K
         7dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788576198; x=1789180998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nN1oOZhHFA6iOMNOJ2Qu+h7C5QPyvLKsSkfURb8yDX4=;
        b=GSk+/CcjnD9V6snexBN+BeBX2AAXl6RskEEi9Pu+OguhATrzUulnGm/mWyoCzc4I0+
         NN+nsVD8SPK/pmUchr9araUNmuFgPkjt2ewOoJOLAI2TaUapD23X5Q6CZQFPSEzk7HMU
         NBIdJZtPhc1+HHFkTNW1zFVduTa4Ufrpe+zq2bHfWdNsB2X7BlLpPR4MXAtNrjDrS7db
         1MBoBojj/Q7M4KgnfzV5fg1HibrZBANWma76TCAyrfawghe0sh7KfF8LQIjMldEW/cY/
         FuNkumy2l4AI22CBO8ozp1i2Bc9M2RlyyE5iOxxGfQAbfPNteyRbYTWW6Zgu+IW+Jvmk
         kIXQ==
X-Forwarded-Encrypted: i=1; AKwUvByxlD/oziqdk/75a8dolCmTofzuzhM7ah0iBbS7U67rWxabGbQSudiAPCT7jL7rTkE9Pp2bktG/cmo=@vger.kernel.org
X-Gm-Message-State: AFuF++mryu1Seu2T/HAmihxi5SKWH76lZDl7adb6AfWplHSDd0B9WB9M
	igeVyJRtAxsgXnu9LK7pH4EYhzVfu89sK/P6NCkZJ1xUC6l4hursR7ZV
X-Gm-Gg: AYBFou3LruF3Vgs2PgyNTh362xuE1N99HV+I1SgOjqGwC4BspqMJYukcssn+0ptaMZ1
	sKNRQybqmRBlQ/ht6WfJJHABcD6nzsmiiek9YYVzFq4SwJC6Y/eB8xUGPg440qTvrTLij6Ury8A
	M74x89cCp0h+C7XOKRWdnDaAHn/ZCAVzFTq67ecGcbh9KvJHNIOzltj6FMSFUb4PL4gMN3H5CBk
	5qWTK6OL4eucgYpCc1d366pNnZG948cE+6jro3HCNL4EY2CoBiX08jxyQFTII4w8Tj3bTh3Amq0
	V5b/V4YDta1yrI5iRqsM1SAE7ySyaBBwRDpMHaD56SHoTT8xsPeLLVkgZMHpP2lA2eB1NWRMfTU
	mNSt3kHgc6/78hPl2utae0uojVLi9srhYFPrsW+EDZQeiWN5LDIvHJAaCqIuvpFwfZP4+hqanPV
	c8E8J6C1z3w/JdkQQROKYXFnHJwcPPVeZaWCNXx35gFd3aV+hIZuVE8yEmBoozfarJlmUUx0Ra8
	9Bmqi6QGFaW+++/NDaH+WzqWUdVyYByRNfH20n8iMDayr7h9nl0VyDuYSJErdYfNAiNR7FzAwpv
	r/Yf1jkjWXA=
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr15729029a91.17.1788576197758;
        Fri, 04 Sep 2026 19:43:17 -0700 (PDT)
Received: from nickhuang (2001-b400-e206-2f43-77ca-14d0-ff57-9965.emome-ip6.hinet.net. [2001:b400:e206:2f43:77ca:14d0:ff57:9965])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm13735453a91.15.2026.09.04.19.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 19:43:17 -0700 (PDT)
Date: Sat, 5 Sep 2026 02:43:10 +0000
From: Nick Huang <sef1548@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: "Liam R. Howlett" <liam@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, maple-tree@lists.infradead.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: maple_tree: Replace removed bulk insertion API
Message-ID: <apuBvv2sLEKPHlQN@nickhuang>
References: <20260905015509.76265-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905015509.76265-1-kmehltretter@gmail.com>

On Sat, Sep 05, 2026 at 03:55:09AM +0200, Karl Mehltretter wrote:
> Commit e3852a1213ff ("maple_tree: Drop bulk insert support") removed
> mas_expected_entries() but left the documentation describing it.
> Document the current preallocation interface instead.
> 
> Fixes: e3852a1213ff ("maple_tree: Drop bulk insert support")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/core-api/maple_tree.rst | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/core-api/maple_tree.rst b/Documentation/core-api/maple_tree.rst
> index 12bccfb6aac1..836342fb1eec 100644
> --- a/Documentation/core-api/maple_tree.rst
> +++ b/Documentation/core-api/maple_tree.rst
> @@ -214,11 +214,10 @@ Advanced Allocating Nodes
>  -------------------------
>  
>  Allocations are usually handled internally to the tree, however if allocations
> -need to occur before a write occurs then calling mas_expected_entries() will
> -allocate the worst-case number of needed nodes to insert the provided number of
> -ranges.  This also causes the tree to enter mass insertion mode.  Once
> -insertions are complete calling mas_destroy() on the maple state will free the
> -unused allocations.
> +need to occur before a write occurs then calling mas_preallocate() will
> +allocate the nodes needed to store the provided entry.  The entry is then
> +stored with mas_store_prealloc().  If the store is abandoned, calling
> +mas_destroy() on the maple state will free the unused allocations.
>  
>  .. _maple-tree-advanced-locks:
>  
> -- 
> 2.53.0
Hi Karl

The documented behavior appears to be consistent with the existing tests in
tools/testing/radix-tree/maple.c, in particular the mas_preallocate() /
mas_store_prealloc() / mas_destroy() handling around lines 35173-35185:

https://elixir.bootlin.com/linux/v7.2.2/source/tools/testing/radix-tree/maple.c#L35173
https://elixir.bootlin.com/linux/v7.2.2/source/tools/testing/radix-tree/maple.c#L35185

Acked-by: Nick Huang [sef1548@gmail.com](mailto:sef1548@gmail.com)


