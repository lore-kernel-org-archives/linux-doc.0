Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C97314F9D6;
	Fri, 17 Jan 2025 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737128506; cv=none; b=kUlBhwPAdXWs483nC7lkeZJmkPD8rCSVHngsdApELqrsdhUHcwqBPfR+S07ppdrhtxS3ol6/Z1k42NRiFfTrNm/r4URmZpjoJDn1AQrkCB4k/BFdEbaWXoFnFgrVe6uwfblO+Yfc1DB7o7DqMKgxi5y9Hqd9Ky3OXCjPEUoX+AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737128506; c=relaxed/simple;
	bh=FMnEk5Wb+aQc5KN4VfScvTuPGnJ2n6y7XApOquJhgno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wq489+2Kc2CntsjCbxJcqIlSRSsraseHP9hif6LWXv6gYKE08/pYK1+YMpK3+knVrF8y9sxorw6bTDaZCwWkHA6ZIXaP9/ouvcY5LWU7KqiRzCrthnPfhUUyx6JThiKrEL5pAIkAJfemIMvvvcofHTVhYI8B74sKIVn5sUD+KyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFrrR7Tg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFrrR7Tg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D6AC4CEE0;
	Fri, 17 Jan 2025 15:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737128505;
	bh=FMnEk5Wb+aQc5KN4VfScvTuPGnJ2n6y7XApOquJhgno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NFrrR7Tg1rMUFS1hWIZpjkLdInNmQzZSav5qtnreAH2cIeJCJ2KudEi7kqTndWV3n
	 koZCL7z5zPO7vzlMfn4pL9D9y76u2r8g+Q1GUVV1nFrIwPS/wfulcec6eIpWAzXfQR
	 26gBxbjejRIEzCHdJgObLdRPJofXqZRbWRMaFV1MjSRQrwBcu20sFeKmZ+wcE1fKNY
	 UkB5Tkwe6goPbVt1KIvhpJD/pafMZdq9SzLb3Eddxoducb6iVWAqCUx7HdbxzbvP4C
	 fKt9lGQn+VBocWQxoEOaKbt4ynuZNbQEypL6dA1naTHcPkbr2S21y26K+YBE/9NKA0
	 TQuKVfx/OEOvQ==
Date: Fri, 17 Jan 2025 15:41:36 +0000
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
Message-ID: <20250117154135.GA17569@willie-the-truck>
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
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Jan 15, 2025 at 05:00:11PM +0100, Peter Zijlstra wrote:
> On Wed, Jan 15, 2025 at 12:13:34PM +0100, Peter Zijlstra wrote:
> 
> > Notably, it means refcount_t is entirely unsuitable for anything
> > SLAB_TYPESAFE_BY_RCU, since they all will need secondary validation
> > conditions after the refcount succeeds.
> > 
> > And this is probably fine, but let me ponder this all a little more.
> 
> Even though SLAB_TYPESAFE_BY_RCU is relatively rare, I think we'd better
> fix this, these things are hard enough as they are.
> 
> Will, others, wdyt?

We should also update the Documentation (atomic_t.txt and
refcount-vs-atomic.rst) if we strengthen this.

> ---
> Subject: refcount: Strengthen inc_not_zero()
> 
> For speculative lookups where a successful inc_not_zero() pins the
> object, but where we still need to double check if the object acquired
> is indeed the one we set out to aquire, needs this validation to happen
> *after* the increment.
> 
> Notably SLAB_TYPESAFE_BY_RCU is one such an example.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  include/linux/refcount.h | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/refcount.h b/include/linux/refcount.h
> index 35f039ecb272..340e7ffa445e 100644
> --- a/include/linux/refcount.h
> +++ b/include/linux/refcount.h
> @@ -69,9 +69,10 @@
>   * its the lock acquire, for RCU/lockless data structures its the dependent
>   * load.
>   *
> - * Do note that inc_not_zero() provides a control dependency which will order
> - * future stores against the inc, this ensures we'll never modify the object
> - * if we did not in fact acquire a reference.
> + * Do note that inc_not_zero() does provide acquire order, which will order
> + * future load and stores against the inc, this ensures all subsequent accesses
> + * are from this object and not anything previously occupying this memory --
> + * consider SLAB_TYPESAFE_BY_RCU.
>   *
>   * The decrements will provide release order, such that all the prior loads and
>   * stores will be issued before, it also provides a control dependency, which
> @@ -144,7 +145,7 @@ bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
>  	do {
>  		if (!old)
>  			break;
> -	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
> +	} while (!atomic_try_cmpxchg_acquire(&r->refs, &old, old + i));

Hmm, do the later memory accesses need to be ordered against the store
part of the increment or just the read? If it's the former, then I don't
think that _acquire is sufficient -- accesses can still get in-between
the read and write parts of the RmW.

Will
