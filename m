Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DFE33062;
	Fri, 17 Jan 2025 16:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737130421; cv=none; b=U5fbGquT1IUbKdFTFsMqhAWjxykg6PEOhJ8XtFU012YMhglJFY6Lwt+tCOvUBdyxbfLBkhbLzDtbTeknDhvoIqL7kRfBob16AcfOzsswMBe1dG8Hf/RbcAefzj6ZDWhyzPP0hDkAg+gK2TXJoZfJoXeCThobec6b4cmFxMzNvDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737130421; c=relaxed/simple;
	bh=svrlPyLI00Hs7jNOc8mDkoqy8hnocSX7ADD0cvunrCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBhRL3LvHKebKq84UCvpzBnMXbQ/qjv1vdEMJi+NOqfM1xc8ZjSSrQ/uxzhiJmjWHAEmez7wL8zvJyF5XtcFJswQJhqLDXevNslMw8lgRo+kjVGO7FPFyJKj7qO393BAfD7xcCfA4PNX//1MAjdRtD4CD7uky7CiOEpQ/wfdR2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Hz3dFp4I; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Hz3dFp4I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PZ+0eV5Tl2QBZ5nlEFCXeRqgvcPKGVoHTW6KrpY0SOo=; b=Hz3dFp4II8RFwyg0NPGIqTbz+p
	eZ240rr/LgdcMP68NMxP6as+JlvN2aSedYfCbd8ThhJyvQVtD1O9XOlhmSlAl7wGvRkN4jfII3f7y
	HHGVuXHodRGI5UWJ30yf/HsPuwTj3XMy5outOICLQfGXdtVfp+n8luDnBHA9/UC276KhaUI/dodq5
	n4MqE2s2ywqejDtOtxOaS0hH0k7v71Q3DcS94622gLh2GoYK91wdq1478WbM9S/WMe//5wjSN7Tbl
	GOEumt3/fyXbyCMBVAx1lmpOiSVuY5CEJwq3kp+zWmu58YxdqFnUdl72RHj2UjaeHQ+7T3Et0GPDH
	sQqiyfMw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoyC-0000000Fc3u-1csH;
	Fri, 17 Jan 2025 16:13:16 +0000
Date: Fri, 17 Jan 2025 16:13:16 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Suren Baghdasaryan <surenb@google.com>, will@kernel.org,
	boqun.feng@gmail.com, mark.rutland@arm.com,
	Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org,
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com,
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com,
	richard.weiyang@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH] refcount: Strengthen inc_not_zero()
Message-ID: <Z4qBnFICnuhMuH2t@casper.infradead.org>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
 <20250115104841.GX5388@noisy.programming.kicks-ass.net>
 <20250115111334.GE8385@noisy.programming.kicks-ass.net>
 <20250115160011.GG8385@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115160011.GG8385@noisy.programming.kicks-ass.net>

On Wed, Jan 15, 2025 at 05:00:11PM +0100, Peter Zijlstra wrote:
> Subject: refcount: Strengthen inc_not_zero()
> 
> For speculative lookups where a successful inc_not_zero() pins the
> object, but where we still need to double check if the object acquired
> is indeed the one we set out to aquire, needs this validation to happen
> *after* the increment.
> 
> Notably SLAB_TYPESAFE_BY_RCU is one such an example.

While you're looking at inc_not_zero(), have you already thought about
doing something like this?  ie failing rather than saturating since
all users of this already have to check for failure.  It looks like
two comparisons per call rather than three.

diff --git a/include/linux/refcount.h b/include/linux/refcount.h
index 35f039ecb272..3ef7d316e870 100644
--- a/include/linux/refcount.h
+++ b/include/linux/refcount.h
@@ -142,16 +142,13 @@ bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
 	int old = refcount_read(r);
 
 	do {
-		if (!old)
+		if (old <= 0 || old + i < 0)
 			break;
 	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
 
 	if (oldp)
 		*oldp = old;
 
-	if (unlikely(old < 0 || old + i < 0))
-		refcount_warn_saturate(r, REFCOUNT_ADD_NOT_ZERO_OVF);
-
 	return old;
 }
 

$ ./scripts/bloat-o-meter before.o after.o 
add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-91 (-91)
Function                                     old     new   delta
io_wq_for_each_worker.isra                   162     158      -4
io_worker_handle_work                       1403    1387     -16
io_wq_activate_free_worker                   187     158     -29
io_queue_worker_create                       367     325     -42
Total: Before=10068, After=9977, chg -0.90%

(that's io_uring/io-wq.o as an example user of refcount_inc_not_zero())

