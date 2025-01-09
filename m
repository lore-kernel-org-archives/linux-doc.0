Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459311A23B0;
	Thu,  9 Jan 2025 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736423531; cv=none; b=FRTQ4NOOTPzDx/9+NOf+QMxApY4cpHgjvIQw61yFeAzsJ7xLkwfrhsxDt0yKywlQcNcECfZqwAAvGxOQ1xuGjwluboi9mLFL9fnBHHI9I09JoazhtlNd1ByWVciW0uZMYbWfs3pH96pGj3hK6x3Yh47Yh8pHHronYld5ZDtcScs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736423531; c=relaxed/simple;
	bh=zbUr2ORaIkJpc84p9F8I0++Zs6AuCLIK/hoxp0neO8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBXmqbzvcTru0WZdMtcrKqGXKf4JhzWEB3+OfaugcpF4OQ3S43RtUnBAnTuNTE+KuxKzwRxkeDJf5VAL0TtrvzpJeyRNaPc3K+J9lC9nPLZ+G2x1o3tBlrr21QOTKYiPVdFlonwBkcchIt334NnsTS8qPQNcXve+mwbJX2jaAHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=X5hC5ARD; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="X5hC5ARD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zbUr2ORaIkJpc84p9F8I0++Zs6AuCLIK/hoxp0neO8w=; b=X5hC5ARDFM6hCrKId9Q/HqW+K4
	7HSaIZ0W2LopxKSDeNw23xMgiMCfXQK021md811KZ6Z1fXMHa8DIxIcAgqtZP/cm2IsXXa4Q5FEz+
	Wl/0+MF604bc+7Y+3NbG7bjPQ0ul2GXanmG0m0TVGsn5re3Pm4B8oMMXawhNIaR3BFo5TNNmIDTSb
	SfM6FrmSoZhvgqyttixVHymdaUyRTWvEWBFcVQH0MXhVc8lP2MJX46OTapPbJiaiMqsq6hzdbU5uG
	NzVyaJqHWWYQUPL/mATs1Wvqe8tQgFagpKucaB8B75rQ3xMIE5vfpiPTdGynvFjewQkgkmuhFPj9D
	TB06am8Q==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tVr4h-00000009YkZ-0su6;
	Thu, 09 Jan 2025 11:51:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C705B30057A; Thu,  9 Jan 2025 12:51:42 +0100 (CET)
Date: Thu, 9 Jan 2025 12:51:42 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com,
	richard.weiyang@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v8 00/16] move per-vma lock into vm_area_struct
Message-ID: <20250109115142.GC2981@noisy.programming.kicks-ass.net>
References: <20250109023025.2242447-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>

On Wed, Jan 08, 2025 at 06:30:09PM -0800, Suren Baghdasaryan wrote:
> Back when per-vma locks were introduces, vm_lock was moved out of
> vm_area_struct in [1] because of the performance regression caused by
> false cacheline sharing. Recent investigation [2] revealed that the
> regressions is limited to a rather old Broadwell microarchitecture and
> even there it can be mitigated by disabling adjacent cacheline
> prefetching, see [3].
> Splitting single logical structure into multiple ones leads to more
> complicated management, extra pointer dereferences and overall less
> maintainable code. When that split-away part is a lock, it complicates
> things even further. With no performance benefits, there are no reasons
> for this split. Merging the vm_lock back into vm_area_struct also allows
> vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
> This patchset:
> 1. moves vm_lock back into vm_area_struct, aligning it at the cacheline
> boundary and changing the cache to be cacheline-aligned to minimize
> cacheline sharing;
> 2. changes vm_area_struct initialization to mark new vma as detached until
> it is inserted into vma tree;
> 3. replaces vm_lock and vma->detached flag with a reference counter;
> 4. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for their
> reuse and to minimize call_rcu() calls.

Does not clean up that reattach nonsense :-(
