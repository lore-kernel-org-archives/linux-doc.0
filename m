Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6304C136E37;
	Wed, 15 Jan 2025 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736956829; cv=none; b=VDguFElHbTlqRstG9Ct+WhewQu2ZgDL6GxckJ+j0BTrlnMNe9ZCjm07HOA4U727L3TijFvEcGTJNW+bxAg6JqfU/fSKakKIkXSJMjudAIrI/1nE9+JZr9rk0CAv8HcCZtU7ImUi6YCgBCo6OxqB1FEN7liwnlQneTcyIcSXnUUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736956829; c=relaxed/simple;
	bh=JacTJB8EhkuWsx95pUCQFUR2Qy3o//3rKyl1poCBZAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1FyuT5fQklwSDcDrvHuFAsCTuj0waXNXX5p0YHvtQyjWzHVobvXGqHA5iCyG1DmWGsOtjjkw9IZA9hyD7SCvECFW2UDlNl5/F7oYGRDDwar8QMXwiG9Q9z+4hZ6eqqmsOM+HFdIRNzUwFMdhvaNlMWOEvY2N3IHdUZQQb2N8SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qo5KJiNh; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qo5KJiNh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nRUfWTA4WQmGLZMi6oqD4UCtpvNH9wADZi4y8ubTS5M=; b=qo5KJiNhz4OhxfsvA1aGmmEcaE
	SeQp7NA8HYn8LtAMqi98+votQ52qw+hfzKUAnElE2GPGRZ+PR/1rsg2be4k/7UwKtdjaLmLHdJBh0
	qU/UMvicl7+njT2v4rf64VWTTsNWW5kYK3OTp1Md9UdBPmwOl2rbj9JIFOASihYAuj9xnQ98sLdo4
	2aj1QdiAHX0CFdJJjZ5t7s84OmAkvj2NTI4ElRtqWhmnC61HjU/kO8Bwht0fTcTEmaAhJrWHPvN75
	9bvlBfbQxb8dFKQKkj6QZcnAU4Z89S9V8/XfR7M+41TiUb13VmhD2gXDIFMatKv0YUB4PcoEE458s
	L+/iXJAw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5oR-0000000AtLQ-3YnJ;
	Wed, 15 Jan 2025 16:00:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6882E3004DE; Wed, 15 Jan 2025 17:00:11 +0100 (CET)
Date: Wed, 15 Jan 2025 17:00:11 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>, will@kernel.org,
	boqun.feng@gmail.com, mark.rutland@arm.com
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
Subject: [PATCH] refcount: Strengthen inc_not_zero()
Message-ID: <20250115160011.GG8385@noisy.programming.kicks-ass.net>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
 <20250115104841.GX5388@noisy.programming.kicks-ass.net>
 <20250115111334.GE8385@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115111334.GE8385@noisy.programming.kicks-ass.net>

On Wed, Jan 15, 2025 at 12:13:34PM +0100, Peter Zijlstra wrote:

> Notably, it means refcount_t is entirely unsuitable for anything
> SLAB_TYPESAFE_BY_RCU, since they all will need secondary validation
> conditions after the refcount succeeds.
> 
> And this is probably fine, but let me ponder this all a little more.

Even though SLAB_TYPESAFE_BY_RCU is relatively rare, I think we'd better
fix this, these things are hard enough as they are.

Will, others, wdyt?

---
Subject: refcount: Strengthen inc_not_zero()

For speculative lookups where a successful inc_not_zero() pins the
object, but where we still need to double check if the object acquired
is indeed the one we set out to aquire, needs this validation to happen
*after* the increment.

Notably SLAB_TYPESAFE_BY_RCU is one such an example.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/refcount.h | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/linux/refcount.h b/include/linux/refcount.h
index 35f039ecb272..340e7ffa445e 100644
--- a/include/linux/refcount.h
+++ b/include/linux/refcount.h
@@ -69,9 +69,10 @@
  * its the lock acquire, for RCU/lockless data structures its the dependent
  * load.
  *
- * Do note that inc_not_zero() provides a control dependency which will order
- * future stores against the inc, this ensures we'll never modify the object
- * if we did not in fact acquire a reference.
+ * Do note that inc_not_zero() does provide acquire order, which will order
+ * future load and stores against the inc, this ensures all subsequent accesses
+ * are from this object and not anything previously occupying this memory --
+ * consider SLAB_TYPESAFE_BY_RCU.
  *
  * The decrements will provide release order, such that all the prior loads and
  * stores will be issued before, it also provides a control dependency, which
@@ -144,7 +145,7 @@ bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
 	do {
 		if (!old)
 			break;
-	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
+	} while (!atomic_try_cmpxchg_acquire(&r->refs, &old, old + i));
 
 	if (oldp)
 		*oldp = old;
@@ -225,9 +226,9 @@ static inline __must_check bool __refcount_inc_not_zero(refcount_t *r, int *oldp
  * Similar to atomic_inc_not_zero(), but will saturate at REFCOUNT_SATURATED
  * and WARN.
  *
- * Provides no memory ordering, it is assumed the caller has guaranteed the
- * object memory to be stable (RCU, etc.). It does provide a control dependency
- * and thereby orders future stores. See the comment on top.
+ * Provides acquire ordering, such that subsequent accesses are after the
+ * increment. This is important for the cases where secondary validation is
+ * required, eg. SLAB_TYPESAFE_BY_RCU.
  *
  * Return: true if the increment was successful, false otherwise
  */
