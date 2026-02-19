Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A02332EC4
	for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 07:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771487829; cv=none; b=pSYwUIqo9gFnj4Ihdes7xK/l2xg9Y0kweIrtmOo4pWY1uHNlxMv0Cad2M2MK/zVM0UOWJTIgqcenxieVWedYuhNYsPbvWAFCm68aNVDnGZspbO49hPrPjPKjC8gUIzW1IvSeMTLZaXDj8t3mCZkwLv9znJNsMKWrY7avt6Ka9L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771487829; c=relaxed/simple;
	bh=hUxk4HA/1LmjRVI/ERTkmt5jBW8D8G4uV1QeZXJbdJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOoKpDopgq5KUdXDcPDelAxEB04j0kNBfYfYhjNMURUVBlGyGO8Grq0Azi/68hhDEcayh4Selz5TA1/oL7uHIlLD4F6aY6lfiDrNXlDl3zetRIdU+ily8faXEgn5AMNu35WYkeiJZ0RoZKR9GQdrpkzHOuqm4boCrurvPhKB6k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wn6zMLsP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wn6zMLsP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-480706554beso7109745e9.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Feb 2026 23:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771487827; x=1772092627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ee6rz3n4lRLIfzQydkYiBi8fGnwsN3AAWbuDK39dnaE=;
        b=wn6zMLsPxLDSjPqCOC8EPanbRoJjb/GhwwAiwKbxvLfRGBJ3GYTGwQ4qF5HDoQ/1R0
         qdGTCtWPdVN6F2k08vDpaJIvmO803LXTZOngLdaOpV9zNT7llHIMPwYS+ZCZowlG7HKD
         XusJKKjQ9/oy3mtBFEOnDn468IMxsSv2Efh+1iWwfUB//V17e6w1aCHCZAJdYMuKvVZd
         olHfKcXzAVfeAz9LOUDQ2UfXYAdKAwIrjjN6OF6nYA86zdqkm9LIlEHXQQdfN3Iexz2U
         3vc7w1TQUX0LgqScfXjpca8E74x0P7A0ljnubUGSZ+gvd8gKqKr/xZKlSAyTNaWIuLcI
         xBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771487827; x=1772092627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ee6rz3n4lRLIfzQydkYiBi8fGnwsN3AAWbuDK39dnaE=;
        b=hVE15RlnaC2M+o3gJRmh5HS9WEzlOoPD+b1yrHPs7gDaQ4EBS2JN2Z89hRYkpQSHdw
         db1bATow/8jh2hC9HAwwbyhVm4x0wVEjgXrRiI2iXkw6sWBzW+WOXUT0cW+sDXFaIrsH
         RJLEXYETrasd8orT5K9WlfaaMS17m8c7ryvptfRexHDaWbZuo1N0fWmGSOcJkpcA9nEI
         bnvMzCuFn3bQgjLFqajLYqcAUMunB4lXvNwWnrziy5EAcLs8YWujePnGsrg5zXHMtOKB
         pJq5CVlK2GPnzYPF4A5jsNUKSKPlYsE61v+/5sotT+5t/+h20Rk5vnNMuAPKQEvhIWVp
         tk+g==
X-Forwarded-Encrypted: i=1; AJvYcCW1nQAF3nMbRLuReKOjyPPYFzS3gyikVosdsbh/RskzO61ie2bVwGJOq10DbqfMDyfneq23wXEnRaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfuooQTGWrtzPHBpzyGcDoilxkPg3zxgsAlgePz/iMcKXNPLmr
	ZqVWwefCbowfOiGLHPV84MYa5j4gSxrJ3ruHTkunclhCoFJOR24AyWq39TzFUaDIB+s=
X-Gm-Gg: AZuq6aL6I+fZsNgALGwcH0OoO/8D3/KnThjMtt9QYcZEjS1aAaxmp0UBDCjUaatf2mR
	64/QyVd2unXlncesC8s0gdb611bCGEGS0zi0kuOBMOw1iq6ZEZmpR25vcOUnHD7HNEQng+4qoaX
	+CxG9iGBJihGj6Nu71GUTAx2uzYxkjnCi9ONZmalwvbPmor6o2BM14Dl+kKyp5R+O/2irJwNz96
	+k0WjC4mRN137jSH5wcfIjvnlLFnVIsXFgtYlfwFhz4Maj9bGqb7rENMWRJ3DdQqsCyecwdN3eO
	WuWX0fYxDmy03vx6xz3PD8+9vQcjVoVIdTrGzZsEOlwQB5gWMYG1o+06iLd3XXEmFhlYx6Pn13d
	Vmjtq9w8NZ5dfDIcZnYDw4Jits1LDjH8n45XweFlEQt8YePqUT2dQVbtEKuvh6z0RqUholUr/Ff
	qgyrng/3HGllz+o1+5WtLUQoHtlo/h
X-Received: by 2002:a05:600c:698c:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-48379b932b7mr310004635e9.3.1771487826769;
        Wed, 18 Feb 2026 23:57:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f96967bsm15143135e9.3.2026.02.18.23.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 23:57:06 -0800 (PST)
Date: Thu, 19 Feb 2026 10:57:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Marco Elver <elver@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	John Hubbard <jhubbard@nvidia.com>, Joe Perches <joe@perches.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Tony Ambardar <tony.ambardar@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Alexander Potapenko <glider@google.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-doc@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v6 1/5] slab: Introduce kmalloc_obj() and family
Message-ID: <aZbCT3-q3O4M5osr@stanley.mountain>
References: <20251203233029.it.641-kees@kernel.org>
 <20251203233036.3212363-1-kees@kernel.org>
 <960729bb-0746-4709-a40c-2e254f963deb@suse.cz>
 <202601090928.5CFF95F@keescook>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601090928.5CFF95F@keescook>

On Fri, Jan 09, 2026 at 09:31:03AM -0800, Kees Cook wrote:
> On Thu, Jan 08, 2026 at 03:01:00PM +0100, Vlastimil Babka wrote:
> > On 12/4/25 00:30, Kees Cook wrote:
> > > [...]
> > > +/**
> > > + * __alloc_objs - Allocate objects of a given type using
> > > + * @KMALLOC: which size-based kmalloc wrapper to allocate with.
> > > + * @GFP: GFP flags for the allocation.
> > > + * @TYPE: type to allocate space for.
> > > + * @COUNT: how many @TYPE objects to allocate.
> > > + *
> > > + * Returns: Newly allocated pointer to (first) @TYPE of @COUNT-many
> > > + * allocated @TYPE objects, or NULL on failure.
> > > + */
> > > +#define __alloc_objs(KMALLOC, GFP, TYPE, COUNT)				\
> > > +({									\
> > > +	const size_t __obj_size = size_mul(sizeof(TYPE), COUNT);	\
> > 
> > I assume with the hardcoded 1 for COUNT, this size_mul() will be eliminated
> > by the compiler and not add unnecessary runtime overhead? Otherwise we
> > should have two core #define variants.
> 
> You're correct: the compiler completely collapses it with 0 runtime
> overhead; a variant is not needed.
> 
> > I also noted that the existing kmalloc_array() and kvmalloc_array() do
> > check_mul_overflow() and return NULL silently on overflow. This AFAIU will
> > make SIZE_MAX passed to the underlying kmalloc/kvmalloc and thus will cause
> > a warning. That's IMHO a good thing.
> 
> Right -- I prefer seeing the SIZE_MAX yelling from the allocator. Should
> we change how k*malloc_array() behaves?

Huh, yeah, it's weird to not get a stack trace if kmalloc() fails.  On
the other hand, if we're allocating SIZE_MAX, that is probably a user
controlled size.  Since we don't want people spamming dmesg, it should
probably be WARN_ONCE().

regards,
dan carpenter

