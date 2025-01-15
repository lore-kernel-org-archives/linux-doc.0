Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5575D2309A1;
	Wed, 15 Jan 2025 11:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736939646; cv=none; b=vFjUL6Ke+r8Za+T5RM/sG5dL4EknOiqvozr7IkoiDHMEM8KrzfUQCI0+sRfkztIvho3Va1ud97ajiI7Dx65eP3KLlqLdI+cZKbtaTteFnjKa9TuY8v+7pgT8w6vpzA6YqNIGEi0H2Va4VG4KCU0Y8ABQhCqMbu158CXzTm3Kedk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736939646; c=relaxed/simple;
	bh=FyXF9UhLu8ilmx2aHDWBWicP0iZxjjKURqfJSRd3j+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6IhaHXbSAQCn6BMn12eEc7GnXBXKupv8JqgRvCqEiGYAub34ErdaszGsvTuMi0I9yTjw5n8/uGEHQSgM1Ji0TBsAWgHdc72I+LfN5JAiP11xX805rTqnZDf/WCZ15EmWxycU1Kf4tiP2o8MW/OWxBkD9eQEb/7QqRBqhb3UIwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WIuZxaMj; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WIuZxaMj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CjtWhMazKVntCnEOZ6/098kZk0YtMPvn0ZbUeDzCk6I=; b=WIuZxaMjca6aWZLMo8Di4AXxi/
	8F26YLPSR6ce0nA/XRxBy101qEOG2wQGBBKW0xLff6C8IoHJFaVEz0vD2DUdRp/1n5Uvpj9dAXZ4J
	/xBshzrNutiyYjiQX0Vsz81BYb4UDgo2YoP7Mf7MlO6vcyqM+JpTGDJSo3Yrf+I7uvcbc4ka+U0T4
	BNfIWFB1fYYJFQiGvy+2/j+7aAnpbWXsqtbNw1oX2tGcRk5Ic7Wxw+e9LV66B9KUeIbMiL02jlKJd
	vVvcCh8AaJ09MWwz3asm56OLfVFcEge2v49W3R4ZjMrpIM8FUg8+v/VsPNni8PjF4ExuO8+hDInGn
	fKvj6Atw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1L4-0000000CHtL-2Tsm;
	Wed, 15 Jan 2025 11:13:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 38004300346; Wed, 15 Jan 2025 12:13:34 +0100 (CET)
Date: Wed, 15 Jan 2025 12:13:34 +0100
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
Message-ID: <20250115111334.GE8385@noisy.programming.kicks-ass.net>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
 <20250115104841.GX5388@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115104841.GX5388@noisy.programming.kicks-ass.net>

On Wed, Jan 15, 2025 at 11:48:41AM +0100, Peter Zijlstra wrote:
> On Sat, Jan 11, 2025 at 12:14:47PM -0800, Suren Baghdasaryan wrote:
> 
> > > Replacing down_read_trylock() with the new routine loses an acquire
> > > fence. That alone is not a problem, but see below.
> > 
> > Hmm. I think this acquire fence is actually necessary. We don't want
> > the later vm_lock_seq check to be reordered and happen before we take
> > the refcount. Otherwise this might happen:
> > 
> > reader             writer
> > if (vm_lock_seq == mm_lock_seq) // check got reordered
> >         return false;
> >                        vm_refcnt += VMA_LOCK_OFFSET
> >                        vm_lock_seq == mm_lock_seq
> >                        vm_refcnt -= VMA_LOCK_OFFSET
> > if (!__refcount_inc_not_zero_limited())
> >         return false;
> > 
> > Both reader's checks will pass and the reader would read-lock a vma
> > that was write-locked.
> 
> Hmm, you're right. That acquire does matter here.

Notably, it means refcount_t is entirely unsuitable for anything
SLAB_TYPESAFE_BY_RCU, since they all will need secondary validation
conditions after the refcount succeeds.

And this is probably fine, but let me ponder this all a little more.
