Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B76211474;
	Fri, 10 Jan 2025 17:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736528498; cv=none; b=XFVUGYfnXofKPlPFhUZ1jSuaCA8VRmTP7vvY8aPPYUZRFfoVRzFRiCBV8prJSNlxtWe3SmoT/+N5ooRYHh5oLI0uoL52DVeaaw6MfIS8cW826RbIH/9ZWwmA0fuSLytMgMuaRp9LtcihnnqOdRlDDZky1+EKKA/iapS7ah1pB8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736528498; c=relaxed/simple;
	bh=Z6ZvgJNm6Nxm58Nj7j7NbDDtm/snNydFpG4E46r/QQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1qJuvCHLaYfdd66mzAVmyP5qOaP9RRt/1IzD7eIVGXzUV8dy14u2dUzuJn25gAcmHjnpmyjMBF2QagLVnOJ8iA8rWRLh4+cYpQYeTi8j7lQlpMng1jODJwTF4xN0qTiMcKLdkokFHQeE5DBWvSl7rYCXa1rUml8CntNjrqkT3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=K6q83u2G; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="K6q83u2G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WwlFQpt9M+HELNW/Cfi2PUgXZk2fMsAkqbKZW8ONXUA=; b=K6q83u2GtSxLEi41GmLABq3rzu
	QqBKsOvXrOlG3PtwoJjVW8Yw2czhPkXN/OqRYaUCK/Ny8WzcMeJ1cBgn0CMMQ+Bt/ThfW/pZ46qab
	WpYMWbv/VWY8sDmuL8sjo8QdtVn18YycLQ1zL98S2oiI7ndRH1CE46SCFiVMa6Av7p1iBUQXbM4bs
	5LaULWhq6tChCMV1vtzMCAj7RKWV8vG2uF3AtOAHT3nHCYOTDMh/7uoAkKPeZnDMvotLMHETw6FEk
	2tp+jLQXeoG1nhcWcstapa3zN7lVPN3lAHqMF2MgI4yekWu3hctVqjjRX91qk1w4vUmmwyY8wgkEw
	QKbZ4OXw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tWINe-00000009qiB-0d0C;
	Fri, 10 Jan 2025 17:01:13 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B74FE3005D6; Fri, 10 Jan 2025 18:01:05 +0100 (CET)
Date: Fri, 10 Jan 2025 18:01:05 +0100
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
Message-ID: <20250110170105.GE4213@noisy.programming.kicks-ass.net>
References: <20250109023025.2242447-1-surenb@google.com>
 <20250109115142.GC2981@noisy.programming.kicks-ass.net>
 <CAJuCfpFS3M50UGi+zdxoe3Lziv_3vbsSwpjWK=WiCXGqxgE1UQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpFS3M50UGi+zdxoe3Lziv_3vbsSwpjWK=WiCXGqxgE1UQ@mail.gmail.com>

On Thu, Jan 09, 2025 at 07:48:32AM -0800, Suren Baghdasaryan wrote:
> On Thu, Jan 9, 2025 at 3:51 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Wed, Jan 08, 2025 at 06:30:09PM -0800, Suren Baghdasaryan wrote:
> > > Back when per-vma locks were introduces, vm_lock was moved out of
> > > vm_area_struct in [1] because of the performance regression caused by
> > > false cacheline sharing. Recent investigation [2] revealed that the
> > > regressions is limited to a rather old Broadwell microarchitecture and
> > > even there it can be mitigated by disabling adjacent cacheline
> > > prefetching, see [3].
> > > Splitting single logical structure into multiple ones leads to more
> > > complicated management, extra pointer dereferences and overall less
> > > maintainable code. When that split-away part is a lock, it complicates
> > > things even further. With no performance benefits, there are no reasons
> > > for this split. Merging the vm_lock back into vm_area_struct also allows
> > > vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
> > > This patchset:
> > > 1. moves vm_lock back into vm_area_struct, aligning it at the cacheline
> > > boundary and changing the cache to be cacheline-aligned to minimize
> > > cacheline sharing;
> > > 2. changes vm_area_struct initialization to mark new vma as detached until
> > > it is inserted into vma tree;
> > > 3. replaces vm_lock and vma->detached flag with a reference counter;
> > > 4. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for their
> > > reuse and to minimize call_rcu() calls.
> >
> > Does not clean up that reattach nonsense :-(
> 
> Oh, no. I think it does. That's why in [1] I introduce
> vma_iter_store_attached() to be used on already attached vmas and to
> avoid marking them attached again. Also I added assertions in
> vma_mark_attached()/vma_mark_detached() to avoid re-attaching or
> re-detaching. Unless I misunderstood your comment?

Hmm, I'll go read the thing again, maybe I missed it.
