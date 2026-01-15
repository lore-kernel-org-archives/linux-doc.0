Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94423C1FCA
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 17:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768498039; cv=none; b=Zxmls+g1oBeyriuc3+krZ3ZMdJEvqzohElOQ7qLlbFgO6JvRwOXktAtwV5zRwyh5kMHwGmrQTvXPDjGsP1CVfJRoO8eyAgafElS8wef4rx76DNmgz2cTKqAwfOyBQ00zRR17Wd2cfKSbn9gc7xVZyvIvjUPotnb1wzHBUfSVDCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768498039; c=relaxed/simple;
	bh=3UGXrZkeYXLx8IoVJrtniFV8BFbMiKk7p6uPdTyK/0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lo19aIWQneKj97EPXTWG/CrQU4flGeM+VPgnP1fIJs4UsAejhJWiHA2LJT+Wdjlfsgc3D0ysPsaM5Wq+vmkMjoex2UKPxGj1IwqoqPMJIxK7mTGhhu4Zm90lD5Ln8rpIhLASH+CDIWrpXIj3YmXMujWMOxuDMVmCOB6GKe0vBWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=YEhU+4Ug; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="YEhU+4Ug"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-88fca7bce90so12354986d6.3
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 09:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1768498037; x=1769102837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9FK61OSEd0UmY2wqnN+WlOD2t6xQO8MJ1jOlEc9XBMg=;
        b=YEhU+4UglXlQQlfuFffLzOxZF1W221ljq75jkYmrgBTttcp18/A9wRTucjN8uHZtlg
         ECvh9hd6KBcOEx5heMRX5nNm9jvWUip0I/pctmUUaMroCrdAqRq5x6SccwevxqlziUcX
         +/H3LgzsFU/oXZERrYrlk9fp5ZgtSrDK7Q00NJ/t2elprpDeGFR6002oruyaRiElcG5d
         sUAF/nbeMvK1ehey4jpZKskRdfYrstJtw2//Isjg4oQ2OxNVZwAyWwQEvJPHttBKAazQ
         AW4x6bPH1/49pR8zfHAOhwzWWvy5zr4cmG3+34Ds4SsQxIP76DcO9Ic4xLpCdBW617IF
         5soQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768498037; x=1769102837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FK61OSEd0UmY2wqnN+WlOD2t6xQO8MJ1jOlEc9XBMg=;
        b=LNteCHcwdc7ntmg523Y6+69y/6VueSMAAwUwWEL0s2ODtBCJHoB7kayw0k7yCMLKmW
         57k8Ld5ccoGZNm5Hl0OPEabwRePPlV1N8RxG1iY7Cr05PUsgLawJjDleVTTfWsDHjYd6
         hwp9A5PX5s4yAH69qH6BUKX5V9sXu5+takoSklZIGSXU307GsqWCDXlmDmugwUUf5f4p
         6wdwUXiR15s12CbdZCP4y6gaPj9Ie9zlDBDjcEKtUuFpUfNQ6m2QCFf4lzM8GnD6MdW9
         b+a0QtgNVwSgq0+MSg8op1q3lXbQGYKsq9s+Z3W8UO0lsaYK8LWYy1Ku1r1W1MltEaFL
         oa6g==
X-Forwarded-Encrypted: i=1; AJvYcCUaV4NaYYuLcN1xf27To7T/5PtIgSSd6HD4IkG+GhbB8GpZvcTTZWxxMxJXtKdHNyF4+sU2FK94x0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEKnHwzACHgE6yI294JFIa0Aenfk6VVAkZ3Zao+0vSBu3GXFzH
	WrDlbKjvbz0k1auiIEdNkrgVW/53km5DNAFwlZ5QLYvGibslWfL6PHGnS5q4/9gSON4=
X-Gm-Gg: AY/fxX57NLlKQRMBRg9FyLFBns9eYXN1DEC0NrV3T+HP4+Bnw5iOJFgWIC1Z8zhA7Uu
	pizEJhw4e5lzrmOq0t6JV84mMwdIMu8/FEmGU1PA4Y+ReLOmxj5Rz7vfU89LCrJV/SUCigxD8d5
	ufxNtgwPlOijce0fsPeWTG34wKbQaA9xQ9b+8/rHQJVIcdMEbF//dlteZTkUyx/Q+GuAbTX50it
	5tz+MosOUgLF0JRjoL15eZ+fHJG1/RohEhuQCmk1/upimScKkfqEWU5y0mY2ORLfZykEnMWh9Pa
	yrquWYMTI7kP11lcF+zVz+dZqpaPGrztZAWFyQP1lUMqgsAH3Z9e5LI1W8FBpDkuzVIaWJtdXpO
	+tP4EdttlqNjCmJJX0zfIDIzHhHCTGpSrIaWjzYWI39F08PLuf7WCCmASHMX0ojWqJjhLRWEj11
	avZlKsNSQocdGVBAzwJ+tqx8QFqnbZh81IIF6VGdohmu1e9fKYlXB2JYMU3V4ZZ0YtlEGI1g==
X-Received: by 2002:a05:6214:4007:b0:889:b6f1:1f30 with SMTP id 6a1803df08f44-8942dbf5199mr2798016d6.18.1768498036628;
        Thu, 15 Jan 2026 09:27:16 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077253305sm219364246d6.41.2026.01.15.09.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 09:27:14 -0800 (PST)
Date: Thu, 15 Jan 2026 12:26:41 -0500
From: Gregory Price <gourry@gourry.net>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, kernel-team@meta.com,
	longman@redhat.com, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, corbet@lwn.net, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, dan.j.williams@intel.com,
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, jackmanb@google.com, ziy@nvidia.com,
	david@kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com, yury.norov@gmail.com,
	linux@rasmusvillemoes.dk, rientjes@google.com,
	shakeel.butt@linux.dev, chrisl@kernel.org, kasong@tencent.com,
	shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com,
	baohua@kernel.org, chengming.zhou@linux.dev,
	roman.gushchin@linux.dev, muchun.song@linux.dev, osalvador@suse.de,
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	byungchul@sk.com, ying.huang@linux.alibaba.com, apopple@nvidia.com,
	cl@gentwo.org, harry.yoo@oracle.com, zhengqi.arch@bytedance.com
Subject: Re: [RFC PATCH v3 7/8] mm/zswap: compressed ram direct integration
Message-ID: <aWkjUXpyLEJyc-C0@gourry-fedora-PF4VCD3F>
References: <20260108203755.1163107-1-gourry@gourry.net>
 <20260108203755.1163107-8-gourry@gourry.net>
 <i6o5k4xumd5i3ehl6ifk3554sowd2qe7yul7vhaqlh2zo6y7is@z2ky4m432wd6>
 <aWF1uDdP75gOCGLm@gourry-fedora-PF4VCD3F>
 <4ftthovin57fi4blr2mardw4elwfsiv6vrkhrjqjsfvvuuugjj@uivjc5uzj5ys>
 <aWWEvAaUmpA_0ERP@gourry-fedora-PF4VCD3F>
 <fkxcxh4eilncsbtwt7jmuiaxrfvuidlnbovesa6m7eoif5tmxc@r34c5zy4nr4y>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fkxcxh4eilncsbtwt7jmuiaxrfvuidlnbovesa6m7eoif5tmxc@r34c5zy4nr4y>

> > For the first go, yeah.  A cram.c would need special page table handling
> > bits that will take a while to get right.  We can make use of the
> > hardware differently in the meantime.
> 
> Makes sense.
> 
> I just want to point out that using compressed memory with zswap doesn't
> buy us much in terms of reclaim latency, so the main goal here is just
> saving memory on the top tier, not improving performance, right?
>

Yeah first goal is to just demonstrate such an accelerator can even work
as a top-tier memory saving mechanism.  But hard to say whether reclaim
latency will be affected appreciably - won't know until we get there :]

I'm totally prepared for this to be a science experiment that gets
thrown away.

> > 
> > I will probably need some help to get the accounting right if I'm being
> > honest.  I can't say I fully understanding the implications here, but
> > what you describe makes sense.
> > 
> 
> Yeah it's counter-intuitive. Zswap needs to charge less than PAGE_SIZE
> so that memcg tracking continues to make sense with reclaim (i.e. usage
> goes down), but if zswap consumed a full page from the system
> perspective, the math won't math.
> 
> Separate limits *could* be the answer, but it's harder to configure and
> existing configuration won't "just work" with compressed memory.
>

I think you are right. I am also inquiring whether individual page
compression data is retrievable.  If so, then this actually should be a
trivial integration.

If not then this is probably ending up on the cutting room floor and
going straight to a full cram.c implementation.

~Gregory
