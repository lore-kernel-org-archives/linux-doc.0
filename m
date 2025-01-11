Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104501F16B;
	Sat, 11 Jan 2025 18:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736620241; cv=none; b=qZvYVzlolDc38ij0ONxxK9jNsXLVPjOi+/ea9cZvwy41FXbImgqjNMAxBLU6D/l/HBbOombn4glTHZR5wc89XG92Ows5L+HW9n4dWy+5SK9qyY7CpPjXZijv4U2PsEHu23y7CHMB4Zw3kh4QUm4sjhrBq11PGd5mH86V7U/B4Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736620241; c=relaxed/simple;
	bh=PHLc9NiC2kTY067hZfPhRdhKH2ChIcsh/a3laGz+a10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNpWDRxcQjYMVEC/YrH+1B37gXq2TT9n43Hn1vuUaa+vT/8MuF/5GAGPOksJcq3VDO4Zsc+qs6Xk/e5PDX3zMoA8YHCf/X3Vq0O1/2VbH9CPEgJZG+1Ww0EXovKqqulA4znth07vZxi/wb2TGWdxUmHRKGSYdyeF0t59OAetTtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ovjr1p0x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ovjr1p0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7663DC4CED2;
	Sat, 11 Jan 2025 18:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736620240;
	bh=PHLc9NiC2kTY067hZfPhRdhKH2ChIcsh/a3laGz+a10=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Ovjr1p0xUrNJg98eI+IrUUPIyV3vNOj2CUIdmPrazjULaQzP31+wKaJLnOvh0t1Jd
	 TuL5IzourhIsQY6YKd3ewTBJLcHdSffxe88Xis2cTbUTKk3grlmpFcgS9gcX+CtUnc
	 4vwqOAl3muRQb45caBYK7Sbk2h5E9rlNHtVAquxYQgY0P984H35oeIVxjGtmBXfcHk
	 rfIjnHk3hc5jX/6DTb+jltRnkaM/x8UI/i6FvHXfD6V3hWe4h4Qt9OhWVygnOjEGPS
	 nDzIR2NNOxxNsBa/vidNRHzfwXdFVXtPqT/Y5JkKHqHLg1eApszb3gMcq916EZ/OAp
	 mL3kEguI0kjNA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 21DB0CE0B73; Sat, 11 Jan 2025 10:30:40 -0800 (PST)
Date: Sat, 11 Jan 2025 10:30:40 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, brauner@kernel.org,
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
	lokeshgidra@google.com, minchan@google.com, jannh@google.com,
	shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com,
	richard.weiyang@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 10/17] refcount: introduce
 __refcount_{add|inc}_not_zero_limited
Message-ID: <9086dca2-3d53-4147-abc8-bf2d1cca0b5a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-11-surenb@google.com>
 <20250111123900.643e4b49@pumpkin>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111123900.643e4b49@pumpkin>

On Sat, Jan 11, 2025 at 12:39:00PM +0000, David Laight wrote:
> On Fri, 10 Jan 2025 20:25:57 -0800
> Suren Baghdasaryan <surenb@google.com> wrote:
> 
> > Introduce functions to increase refcount but with a top limit above which
> > they will fail to increase (the limit is inclusive). Setting the limit to
> > INT_MAX indicates no limit.
> 
> This function has never worked as expected!
> I've removed the update and added in the rest of the code.
> 
> > diff --git a/include/linux/refcount.h b/include/linux/refcount.h
> > index 35f039ecb272..5072ba99f05e 100644
> > --- a/include/linux/refcount.h
> > +++ b/include/linux/refcount.h
> > @@ -137,13 +137,23 @@ static inline unsigned int refcount_read(const refcount_t *r)
> >  }
> >  
> >  static inline __must_check __signed_wrap
> > -bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
> >  {
> >  	int old = refcount_read(r);
> >  
> >  	do {
> >  		if (!old)
> >  			break;
> >
> >  	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
> >  
> >  	if (oldp)
> >		*oldp = old;
> ?
> >	if (unlikely(old < 0 || old + i < 0))
> >		refcount_warn_saturate(r, REFCOUNT_ADD_NOT_ZERO_OVF);
> >
> >  	return old;
> >  }
> 
> The saturate test just doesn't work as expected.
> In C signed integer overflow is undefined (probably so that cpu that saturate/trap
> signed overflow can be conformant) and gcc uses that to optimise code.
> 
> So if you compile (https://www.godbolt.org/z/WYWo84Weq):
> int inc_wraps(int i)
> {
>     return i < 0 || i + 1 < 0;
> }
> the second test is optimised away.
> I don't think the kernel compiles disable this optimisation.

Last I checked, my kernel compiles specified -fno-strict-overflow.
What happens if you try that in godbolt?

							Thanx, Paul
