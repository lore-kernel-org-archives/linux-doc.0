Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F6D248BDE;
	Wed, 15 Jan 2025 10:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736938153; cv=none; b=M06liy/HT0uMfeprXYkDpN1VwHl5lvMf8OHB38JgpzpMDzZtzJq07q/j46Ffyzox1G2TKHOqMJmS14FsPp0JAoSE6uY8bthWBhwjN/iVw9rasBlImjxTmy6xKuhTVdZsic8lNfYgwW9ztZmDMPvh1oNHOlXpojeEsBA8Hcn3qxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736938153; c=relaxed/simple;
	bh=H7GIsZcONSDML/rxO3VfOAn+5/Y5ZkO3cI5R9vIRuf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3XIZFZAp4eibY5eVUR2Q7yuKA9mS7KcKNvhXWfXtV8ONP8KZ5bdPvlPAeg7Z9jBSgnF9yNNlhy48rjeXnor8WWJ0zOsX2DEh8EsP93Pe9R0wZdf6B5UzCvZfyT6saT7M7v9Nw1bVXLqQH8JOXFPNusXzPH3Xx4TJ7prK9zjO0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AWt6Kgsk; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AWt6Kgsk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uRYuEqn4WUyIK+m6O0WpoRV3QlBFajdww4u8dDsuPOU=; b=AWt6KgskOSzuWRcoGFsfxiHJa2
	9PPr2pKgZgUKtes0GTakiBDW08ioewNrCuXA3Kdq7JVqRm/5fQ+5RchiQ2DNzfXGe9ZV5aoi/qMVO
	WetoBozxkVfoUR7a8W1PHNz7FJq/7WYQmZ5TqZycglqAj4KtvHv+1gsMGRurGn1K3OzwLIOhWDK/9
	dyR+xgjiivBX8sYYTYjSJltp8l7DEbbLDullmr6gSjRWnALi1g5QVrH7eB8uIj1xFZF0kpQx470aS
	ww/SWZSZTPKu8RK61jjv7tdeszoYvWWXeMnPNCYtEn8NBNnGuweON4MmQzbfhU2fmwARQU718cIHM
	1s959kmA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0x0-0000000AqZ5-1qxR;
	Wed, 15 Jan 2025 10:48:42 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 76D8E300346; Wed, 15 Jan 2025 11:48:41 +0100 (CET)
Date: Wed, 15 Jan 2025 11:48:41 +0100
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
Message-ID: <20250115104841.GX5388@noisy.programming.kicks-ass.net>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>

On Sat, Jan 11, 2025 at 12:14:47PM -0800, Suren Baghdasaryan wrote:

> > Replacing down_read_trylock() with the new routine loses an acquire
> > fence. That alone is not a problem, but see below.
> 
> Hmm. I think this acquire fence is actually necessary. We don't want
> the later vm_lock_seq check to be reordered and happen before we take
> the refcount. Otherwise this might happen:
> 
> reader             writer
> if (vm_lock_seq == mm_lock_seq) // check got reordered
>         return false;
>                        vm_refcnt += VMA_LOCK_OFFSET
>                        vm_lock_seq == mm_lock_seq
>                        vm_refcnt -= VMA_LOCK_OFFSET
> if (!__refcount_inc_not_zero_limited())
>         return false;
> 
> Both reader's checks will pass and the reader would read-lock a vma
> that was write-locked.

Hmm, you're right. That acquire does matter here.
