Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3EA1FCFD6;
	Mon, 27 Jan 2025 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737986966; cv=none; b=iq36P8NFpRm5Vme24WgSnRGk/juIUMfZItEl0yR99e/L3qC4qCfVN9GuybGDT1egD4PUZuvxEun+14mDcLvjAFGWmKT5kj7ikmgl2TYVCRqs7x86sSNogazGIC4J50MLPbImlYcQmoG7vh0Pk8ZjkRxS0BOqqyrJg133X9ArUrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737986966; c=relaxed/simple;
	bh=Rz6meftNFWIKeSBHX9X0i9FyWdEWeAzsHOwEmNXnLVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FskN18sV9NhWZN5VcgjW00oXTay3FjHmLwEn4Omns4kwnlRQRXCvJxY++WrYMcyp/rYxqtruYCeDcXETenhUjUMBydcZ8/6BhJ2YTR+/NuGRd9cjydDzYL6HkajJGhItiTdp/EScGU9NdGL3RcdRdB+ztBTzxWtkPVjUlQHkrfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsYVb50t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsYVb50t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2894EC4CED2;
	Mon, 27 Jan 2025 14:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737986966;
	bh=Rz6meftNFWIKeSBHX9X0i9FyWdEWeAzsHOwEmNXnLVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PsYVb50tmoIzHQ8LPsNtS6QOOFCTm7a45GJ+NKRDdX9fNeEdF2ssy+DhgJVjZ5Na5
	 dHcLhlj78j5Uxup6pN+BaZW7kDnoL3bjE4Dm8IYFh+EFlo8ytKigkZsxxEkqWetoc2
	 ImJSh2tqlyO2CDXVfwfHk76IFlf8oSj7Tr0zqVpQ0QmDaz6rzskGEglR+u1qfzuZXO
	 bgRpsOZyB5GHnqjSV7F/g3Hit7qNCm6x4p9bnP20pT2qAg9y82dPWuGxOjlePGGk9n
	 +FQi3j3kTTaZ+h+Ix9z4/diG4SaucBACHB2YO8xh3fMNpn49SQ3nlT+e6W6PX7Ze9a
	 IiOcuPshSze5w==
Date: Mon, 27 Jan 2025 14:09:16 +0000
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Suren Baghdasaryan <surenb@google.com>, boqun.feng@gmail.com,
	mark.rutland@arm.com, Mateusz Guzik <mjguzik@gmail.com>,
	akpm@linux-foundation.org, willy@infradead.org,
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
Message-ID: <20250127140915.GA25672@willie-the-truck>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
 <20250115104841.GX5388@noisy.programming.kicks-ass.net>
 <20250115111334.GE8385@noisy.programming.kicks-ass.net>
 <20250115160011.GG8385@noisy.programming.kicks-ass.net>
 <20250117154135.GA17569@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117154135.GA17569@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Jan 17, 2025 at 03:41:36PM +0000, Will Deacon wrote:
> On Wed, Jan 15, 2025 at 05:00:11PM +0100, Peter Zijlstra wrote:
> > On Wed, Jan 15, 2025 at 12:13:34PM +0100, Peter Zijlstra wrote:
> > 
> > > Notably, it means refcount_t is entirely unsuitable for anything
> > > SLAB_TYPESAFE_BY_RCU, since they all will need secondary validation
> > > conditions after the refcount succeeds.
> > > 
> > > And this is probably fine, but let me ponder this all a little more.
> > 
> > Even though SLAB_TYPESAFE_BY_RCU is relatively rare, I think we'd better
> > fix this, these things are hard enough as they are.
> > 
> > Will, others, wdyt?
> 
> We should also update the Documentation (atomic_t.txt and
> refcount-vs-atomic.rst) if we strengthen this.
> 
> > ---
> > Subject: refcount: Strengthen inc_not_zero()
> > 
> > For speculative lookups where a successful inc_not_zero() pins the
> > object, but where we still need to double check if the object acquired
> > is indeed the one we set out to aquire, needs this validation to happen
> > *after* the increment.
> > 
> > Notably SLAB_TYPESAFE_BY_RCU is one such an example.
> > 
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  include/linux/refcount.h | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/include/linux/refcount.h b/include/linux/refcount.h
> > index 35f039ecb272..340e7ffa445e 100644
> > --- a/include/linux/refcount.h
> > +++ b/include/linux/refcount.h
> > @@ -69,9 +69,10 @@
> >   * its the lock acquire, for RCU/lockless data structures its the dependent
> >   * load.
> >   *
> > - * Do note that inc_not_zero() provides a control dependency which will order
> > - * future stores against the inc, this ensures we'll never modify the object
> > - * if we did not in fact acquire a reference.
> > + * Do note that inc_not_zero() does provide acquire order, which will order
> > + * future load and stores against the inc, this ensures all subsequent accesses
> > + * are from this object and not anything previously occupying this memory --
> > + * consider SLAB_TYPESAFE_BY_RCU.
> >   *
> >   * The decrements will provide release order, such that all the prior loads and
> >   * stores will be issued before, it also provides a control dependency, which
> > @@ -144,7 +145,7 @@ bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
> >  	do {
> >  		if (!old)
> >  			break;
> > -	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
> > +	} while (!atomic_try_cmpxchg_acquire(&r->refs, &old, old + i));
> 
> Hmm, do the later memory accesses need to be ordered against the store
> part of the increment or just the read? If it's the former, then I don't
> think that _acquire is sufficient -- accesses can still get in-between
> the read and write parts of the RmW.

I dug some more into this at the end of last week. For the
SLAB_TYPESAFE_BY_RCU where we're racing inc_not_zero() with
dec_and_test(), then I think using _acquire() above is correct as the
later references can only move up into the critical section in the case
that we successfully obtained a reference.

However, if we're going to make the barriers implicit in the refcount
operations here then I think we also need to do something on the producer
side for when the object is re-initialised after being destroyed and
allocated again. I think that would necessitate release ordering for
refcount_set() so that whatever allows the consumer to validate the
object (e.g. sequence number) is published *before* the refcount.

Will
