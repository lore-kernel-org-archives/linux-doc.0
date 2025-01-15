Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EC620326;
	Wed, 15 Jan 2025 15:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955545; cv=none; b=WOhAfJfXPk33uiDhcMo2vT8LZufJlKlR/LWr6U4bR7M3yx+shaSe4YAzHDOYDaFso2rnTLzM5V1+PBmmh9JlWL/xTOgkl3VIa2PWmuWJi545gMauetiixmlzdsJPPYiw5R9ro1Lyqm7QUmIW2v5OidS8X7i+8+ltuh1Bw+yJa5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955545; c=relaxed/simple;
	bh=ArOHFNIp6QnNF2XUOo5yewU5OwVTQDKxmR+j7hKXMGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2IFGjpbDrTE7JbG9wxJJZ/F01MMO8vbGYDXShqc9C7khW3Jp+b/zt5eiqvfelGmYa2w/rgwb4+KoL4IgKciOmKS8GBhg8xkujwWsepNJIiAzxYdBW+oX89M5mUnSsbCPc3DLSoLR1z+6VJPVlieah4xP8vVwtgmpJ0rbZu6kZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HQS+Wf1G; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HQS+Wf1G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xVMTvoVNKSDdrKhnVusgF0d6r3IQosvfTC+sagB7Qu8=; b=HQS+Wf1Gh8BwKH0blgSTZ9GJQr
	38slONoFTED48nvcQy0B8hdzR2LFcKwI9pdINIGz5+wZZ4hOI8o7ftQ13R7OPS+ydw6n/VrZaqbco
	z5kf70dzXv99VuRRR2pTfaCfAfboiewOmY4t1FbUc3SdVIlXNazEn+JBcd7GNrmajUd9sM9iJu4Uo
	fqRDuaVQ2yRB8gL8Wzx1l+ho7z/iJyJ4GOQ6rmV9ucxIvG8/43hvOpaDBvM58LJTzfNneReSpFuQG
	uC5m16PQHP4s2zUQvd2U0OjwSJGBXfyJYpTrO7j/u3G2N0uu17F5DM7ak8M4ZuT0LYTty6gT26CZj
	8cYJjJCw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5Th-0000000AtFW-0uxM;
	Wed, 15 Jan 2025 15:38:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0D0653004DE; Wed, 15 Jan 2025 16:38:44 +0100 (CET)
Date: Wed, 15 Jan 2025 16:38:44 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org,
	willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	oliver.sang@intel.com, mgorman@techsingularity.net,
	david@redhat.com, peterx@redhat.com, oleg@redhat.com,
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
	lokeshgidra@google.com, minchan@google.com, jannh@google.com,
	shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com,
	richard.weiyang@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20250115153844.GF8385@noisy.programming.kicks-ass.net>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
 <20250115104841.GX5388@noisy.programming.kicks-ass.net>
 <20250115111334.GE8385@noisy.programming.kicks-ass.net>
 <CAJuCfpEF14gXsGs9WMiHDqz8irrrzQrxFmbdzS-qT4xihdhWjQ@mail.gmail.com>
 <20250115153507.GF8362@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115153507.GF8362@noisy.programming.kicks-ass.net>

On Wed, Jan 15, 2025 at 04:35:07PM +0100, Peter Zijlstra wrote:

> Consider:
> 
>     CPU0				CPU1
> 
>     rcu_read_lock();
>     vma = vma_lookup(mm, vaddr);
> 
>     ... cpu goes sleep for a *long time* ...
> 
>     					__vma_exit_locked();
> 					vma_area_free()
> 					..
> 					vma = vma_area_alloc();
> 					vma_mark_attached();
> 
>     ... comes back once vma is re-used ...
> 
>     vma_start_read()
>       vm_refcount_inc(); // success!!
> 
> At which point we need to validate vma is for mm and covers vaddr, which
> is what patch 15 does, no?

Also, critically, we want these reads to happen *after* the refcount
increment.

