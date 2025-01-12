Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90427322E;
	Sun, 12 Jan 2025 17:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736704575; cv=none; b=XgFADkfJqblbC63lKC91M+ub1/FdySaIBojV0+n9aoAZJv6nbQc/OpR2r4nXaQ8Id9+1YfhyB3SibZnEI2iBufC3O3yMEBTMD0wnhkOJPj+Al3pyRF9AOKRSF+iwmej97IhTmkAsQ/z02wSS3GrJWH+WufKnhpjsrB5lBCY/Ru8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736704575; c=relaxed/simple;
	bh=4Dz9u9aeNhKXzT0Cx/t1lQGKVf4xK23UX6FfJoAGeug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtBbusUz0K3GZR06f4fgedt6Mdpq1eJLLHaGfVLLOpj8Z08ghyHIh95q+b4ENrsbcyJmn2LdgSMLDQP0AikRQAGi0AYdCuDr2aKV5LWBRUnDg1f1CEcqM2FPhKM33xtkDAs/AwqxJJdZMjWmub9mwiKEgEuOFHrCtZ3SgpD50KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IU/bnvgj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IU/bnvgj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D6AC4CEDF;
	Sun, 12 Jan 2025 17:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736704575;
	bh=4Dz9u9aeNhKXzT0Cx/t1lQGKVf4xK23UX6FfJoAGeug=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=IU/bnvgjJglVXdbx0F2fiktJLGwA8ePZ1EmB5ywQa06phBCabL1ZVdCFXVDF4Cgyv
	 n7l7fyePGyql26nttBCgXtLVBy6NCnU/ouk2C0Az8zdfCsXss3qJepAYO1reVRcxSs
	 NTf3BDw/Z/Va50j/Ib7CZOKmkehezT9tm8Xmee3Rx/pcyCOcH30qob7eMYlExVICm9
	 wQl6g19c4Sg57DEyGxZbrWykfW6EZZ+9ogBgah3hiwKlGt3mKoBfPhqwKHy9+BKEDv
	 1SF+HuVAQixY9O0e09z4MXlwF0iiuLYKXmkKJIRE/1o8Vd5HrmPkwoYGcokOlAvI5U
	 B7IdCE+ijYAsw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C8974CE37BE; Sun, 12 Jan 2025 09:56:14 -0800 (PST)
Date: Sun, 12 Jan 2025 09:56:14 -0800
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
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	nathan@kernel.org
Subject: Re: [PATCH v9 10/17] refcount: introduce
 __refcount_{add|inc}_not_zero_limited - clang 17.0.1 bug
Message-ID: <52b5b501-7b98-4a9a-94e4-f3eeaaeadfad@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-11-surenb@google.com>
 <20250111123900.643e4b49@pumpkin>
 <9086dca2-3d53-4147-abc8-bf2d1cca0b5a@paulmck-laptop>
 <20250111221939.3a36908d@pumpkin>
 <20250111225016.660c5784@pumpkin>
 <20250112113756.3b8a5d0a@pumpkin>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112113756.3b8a5d0a@pumpkin>

On Sun, Jan 12, 2025 at 11:37:56AM +0000, David Laight wrote:
> On Sat, 11 Jan 2025 22:50:16 +0000
> David Laight <david.laight.linux@gmail.com> wrote:
> 
> > On Sat, 11 Jan 2025 22:19:39 +0000
> > David Laight <david.laight.linux@gmail.com> wrote:
> > 
> > > On Sat, 11 Jan 2025 10:30:40 -0800
> > > "Paul E. McKenney" <paulmck@kernel.org> wrote:
> > >   
> > > > On Sat, Jan 11, 2025 at 12:39:00PM +0000, David Laight wrote:    
> > > > > On Fri, 10 Jan 2025 20:25:57 -0800
> > > > > Suren Baghdasaryan <surenb@google.com> wrote:
> > > > >       
> > > > > > Introduce functions to increase refcount but with a top limit above which
> > > > > > they will fail to increase (the limit is inclusive). Setting the limit to
> > > > > > INT_MAX indicates no limit.      
> > > > > 
> > > > > This function has never worked as expected!
> > > > > I've removed the update and added in the rest of the code.
> > > > >       
> > > > > > diff --git a/include/linux/refcount.h b/include/linux/refcount.h
> > > > > > index 35f039ecb272..5072ba99f05e 100644
> > > > > > --- a/include/linux/refcount.h
> > > > > > +++ b/include/linux/refcount.h
> > > > > > @@ -137,13 +137,23 @@ static inline unsigned int refcount_read(const refcount_t *r)
> > > > > >  }
> > > > > >  
> > > > > >  static inline __must_check __signed_wrap
> > > > > > -bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
> > > > > >  {
> > > > > >  	int old = refcount_read(r);
> > > > > >  
> > > > > >  	do {
> > > > > >  		if (!old)
> > > > > >  			break;
> > > > > >
> > > > > >  	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
> > > > > >  
> > > > > >  	if (oldp)
> > > > > >		*oldp = old;      
> > > > > ?      
> > > > > >	if (unlikely(old < 0 || old + i < 0))
> > > > > >		refcount_warn_saturate(r, REFCOUNT_ADD_NOT_ZERO_OVF);
> > > > > >
> > > > > >  	return old;
> > > > > >  }      
> > > > > 
> > > > > The saturate test just doesn't work as expected.
> > > > > In C signed integer overflow is undefined (probably so that cpu that saturate/trap
> > > > > signed overflow can be conformant) and gcc uses that to optimise code.
> > > > > 
> > > > > So if you compile (https://www.godbolt.org/z/WYWo84Weq):
> > > > > int inc_wraps(int i)
> > > > > {
> > > > >     return i < 0 || i + 1 < 0;
> > > > > }
> > > > > the second test is optimised away.
> > > > > I don't think the kernel compiles disable this optimisation.      
> > > > 
> > > > Last I checked, my kernel compiles specified -fno-strict-overflow.
> > > > What happens if you try that in godbolt?    
> > > 
> > > That does make gcc generated the wanted object code.
> > > I know that compilation option has come up before, but I couldn't remember the
> > > name or whether it was disabled :-(
> > > 
> > > You do get much better object code from return (i | i + 1) < 0;
> > > And that is likely to be much better still if you need a conditional jump.  
> > 
> > I've just checked some more cases (see https://www.godbolt.org/z/YoM9odTbe).
> > gcc 11 onwards generates the same code code for the two expressions.
> > 
> > Rather more worryingly clang 17.0.1 is getting this one wrong:
> >    return i < 0 || i + 1 < 0 ? foo(i) : bar(i);
> > It ignores the 'i + 1' test even with -fno-strict-overflow.
> > That is more representative of the actual code.
> > 
> > What have I missed now?
> 
> A different optimisation :-(

So the Linux kernel is good with signed integer overflow, right?

(Give or take compiler bugs, of course...)

							Thanx, Paul
