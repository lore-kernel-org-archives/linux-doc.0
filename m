Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2217C147;
	Thu, 19 Dec 2024 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734598537; cv=none; b=cUqMjnPLyKw19dCknazhp6iw5r07iYSFZxp1U0Z4x6vJOifAdAs4Mv+2XBOlNkEmqsDuFAIaMW/XWCx3ii2kRGDQbyNHy/xfEuNMIEq2YovcO1l3XD0oaHx4R23nc4+XIpFFXBqDeGHmMb9RGwhf0efXXEq/Sw5KQKQ3U0l8yQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734598537; c=relaxed/simple;
	bh=7A5q2whs23/ULl9+4Xr7k4cToJx5RL471ktY4u5YHko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=coCSxG7G2fK0N5AQetByodPNMjDv5qf5pgpCPEXBV0we9VrU0aVaJqlimXZnE9jrXU8eeq+gqQy96vFIrdkzG21EYuDAfHsT1TIyrnpm8zo0K342bMG/1IFgjUzMh7niaPIKuVTqApO62hXnYT3SDfanE9GUTEqeOLy+S9/Uxt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=a4Htox5U; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="a4Htox5U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ffR6m2ZqxUU9McWLJGVm1c7hM0T9lvoq6tFQ79BnjL0=; b=a4Htox5UDFFhYR64gVjctbvXUY
	Fi+DPF2oK4+RKQ8IyBDDl3NIuN+Hvl0dreJQhQiV0+kYW8MyO8CbmQ0OrO5nouxyYaZWg7bT+cbzV
	itK3dPvHpcVTE6DBEwdGlU6ZtQp1ZPh1dgtmpXwzGQLUFF+GUMpBiNMa6kb//ThG5AyZtSiIT34VN
	hH2Ccw7BFnUY0YMPe1JbK9YxAraNqSYfFfjahhh9rMWixaUS1Cb8+D+KAnRvt06xz6lRSNSoLPHWj
	kmL9zZ4Qy0n5WYl5v1lWtjj9Zlycb/E2Qj4BzCdRSOn0msZgA0WHd052lTtOka9gX42m7GI292WZO
	y4/N6e6Q==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCJP-00000002jPo-2NXm;
	Thu, 19 Dec 2024 08:55:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 897BB3003FF; Thu, 19 Dec 2024 09:55:15 +0100 (CET)
Date: Thu, 19 Dec 2024 09:55:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org,
	willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
	oliver.sang@intel.com, mgorman@techsingularity.net,
	david@redhat.com, peterx@redhat.com, oleg@redhat.com,
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
	lokeshgidra@google.com, minchan@google.com, jannh@google.com,
	shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20241219085515.GB26551@noisy.programming.kicks-ass.net>
References: <20241218100601.GI12500@noisy.programming.kicks-ass.net>
 <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
 <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
 <20241218161850.GG2354@noisy.programming.kicks-ass.net>
 <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
 <20241218174428.GQ2354@noisy.programming.kicks-ass.net>
 <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
 <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
 <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
 <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>

On Wed, Dec 18, 2024 at 11:29:23AM -0800, Suren Baghdasaryan wrote:

> Yeah, I think we can simply do this:
> 
> vms_complete_munmap_vmas
>            vms_clear_ptes
>            remove_vma
>                vma_mark_detached
>            mmap_write_downgrade
> 
> If my assumption is incorrect, assertion inside vma_mark_detached()
> should trigger. I tried a quick test and so far nothing exploded.

I think that would be unfortunate and could cause regressions. I think
we want to keep vms_clear_ptes() under the read-lock.
