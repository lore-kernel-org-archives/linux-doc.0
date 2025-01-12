Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45431ACECA;
	Sun, 12 Jan 2025 11:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736681882; cv=none; b=ez7TtTrIN56/FQPA76l4aH3TW4OJdL1VfBMc/eJBx6LOtSfAeymp31IEspjLNrwAOwQY8/nAp3CEtOoP3sAJNr+sg7m8wQGuO1Ckols08WCvapNI4TLUAyOjBNsFyo2Qa5J7W7jS8QiYle8wyIq3R1OhwLbKL1TeDCs8zhGI1gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736681882; c=relaxed/simple;
	bh=+ajEpsgv7yvHE/c98kwaBqfKI2ZGEhozIjZ9TjBUeiE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tAF0wDKX/uuZpdDj8krElpm/pycvEJGe8+WNqRs2JpomfzA7Y2krVNofwiab6NyuDGNmX4fPyhFqFVNxsfKqzxHWCr/q8KGEIwiRxKkLJJmBLtPwduMupEYCkLMvPvC7KM5uJz2W+ePWR948D+kEgmvUnkUB5eVOeGz53EYK3KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MidUg59e; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MidUg59e"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso2923621f8f.1;
        Sun, 12 Jan 2025 03:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736681879; x=1737286679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O66R6Ait/z6GS/vRVPqZx0IxMgTAQOgliTkMHnf2X+4=;
        b=MidUg59escYaMjdPF8dW54ySW8JqWuYvYNu10iYVGDUrzqsd3hvcd5KoX9WBu7T25c
         uZQPlCm+/QgN5xUtko/t1EQU5c7wJTpdWvVoWBqTn33a7sAc8dhoD96wqsgFKsF/Jecs
         8ML66pQk1ZRVsWEwlKLxVox5xpsp3cEEG9MlvVhNLjG3h5HdXl6lKML5i6dnf16ELtXy
         uJ9+0xnAXeH2ZEYn4SAddz85+9ZO+kOrUwwL/xtoxBs27+ukvW3KHT8d9lGyKleawToc
         kRoG62DSv/B8bcnJFUqTBpsOTtw+hH/gpq0/NPdY9fiCMhIdbKQBJkfI6P7BL8Kr6dGR
         oTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736681879; x=1737286679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O66R6Ait/z6GS/vRVPqZx0IxMgTAQOgliTkMHnf2X+4=;
        b=b41rHeAE4ukfEuAF2PgBsqb3Q3ImiY49S2+I1/eIctGFpEiTEcN2g8pKFphbyCundm
         tVNu7cB45spiibuIl3sQZW6Wu7OomQkYYqpsi0jusyZvwybaSkjPbgtuGHlK68f51/TJ
         7/ncNwmKRKJggHoT0io6IYC06gzZpoC/sap9SrSW+q2HZESfPc2XNQhMmapK2fpIo/9w
         299iYx+BV3RAbKPNi4D9eS6dLUBub1pbVNdg4gPxJMD3hSR8WeSdqXqq4RkO+wFUEGu+
         IKtcv2WF2HS6NP677xWkAgkEHUh7YyqFk0FgplVLZn7FQeS4JnRaH3OsQap3w/Gbo3Qb
         b6FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPMHJqXjjWZRlKP/7Yby21G+vH0M6CgKLy+bKDy9eltdl/0uyqvYNRWLUoS0D1xSa195S+ucOARh8=@vger.kernel.org, AJvYcCX015iiYJ+lqZD+GU30kc4zo/pOZfOdWnzAyioKkcEpFBRSlYb9JLaOxIU51X+BnKaqDxr4bUVoD8TVzpXH@vger.kernel.org
X-Gm-Message-State: AOJu0YzEKq7Ygr6Ghl0qBiWp1S19HOlIfLBSXsDo/5qFurfCQDwOV55Y
	OmWRSvCV4mUSrnqjRUyOcbIuBO9Sw4BNDf4ceVJyT7TZyF3IOmBA
X-Gm-Gg: ASbGnctkHoDfa/VVGv0rMHBMINFwCi5+Kn2RKHBL9MhjqfPsi/pmCiDM45JwwyOLNX7
	nuaqLmwaU8+0DgOhXl6mEOKdq/A3ZYGNRGbBwZsfWew/wWTNzqgaZN9sDyJBeJqi2H5ME1AvZoF
	uss+7rYGprl0wZjLxIBk0wiw1Qx1nNgSTTMdXmB/38xZMrI9UyBkRbU7BBq+eRlCWzDtNb6QHWP
	zDHVwLAyJW7DIqbhGuA5ib9pNTJjXrAyONxJ2DBn3kJrWzMo48lWpl4Z6ZDFBJULkeY19HCjetH
	pmC5t0yt1ts/KST5ZPU=
X-Google-Smtp-Source: AGHT+IGPNn5bLQdWXbCvylb6sk9BQyy0TzH6peYQPW4c4/F3yQ1S+AfAr34weGZHVZxJioeqfZ/cLg==
X-Received: by 2002:a05:6000:154c:b0:38a:a043:eac4 with SMTP id ffacd0b85a97d-38aa043ee77mr4599702f8f.44.1736681878732;
        Sun, 12 Jan 2025 03:37:58 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8826sm108996695e9.11.2025.01.12.03.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 03:37:58 -0800 (PST)
Date: Sun, 12 Jan 2025 11:37:56 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
 peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz,
 hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
 mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
 oleg@redhat.com, dave@stgolabs.net, brauner@kernel.org,
 dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
 lokeshgidra@google.com, minchan@google.com, jannh@google.com,
 shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com,
 klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@android.com, nathan@kernel.org
Subject: Re: [PATCH v9 10/17] refcount: introduce
 __refcount_{add|inc}_not_zero_limited - clang 17.0.1 bug
Message-ID: <20250112113756.3b8a5d0a@pumpkin>
In-Reply-To: <20250111225016.660c5784@pumpkin>
References: <20250111042604.3230628-1-surenb@google.com>
	<20250111042604.3230628-11-surenb@google.com>
	<20250111123900.643e4b49@pumpkin>
	<9086dca2-3d53-4147-abc8-bf2d1cca0b5a@paulmck-laptop>
	<20250111221939.3a36908d@pumpkin>
	<20250111225016.660c5784@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Jan 2025 22:50:16 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Sat, 11 Jan 2025 22:19:39 +0000
> David Laight <david.laight.linux@gmail.com> wrote:
> 
> > On Sat, 11 Jan 2025 10:30:40 -0800
> > "Paul E. McKenney" <paulmck@kernel.org> wrote:
> >   
> > > On Sat, Jan 11, 2025 at 12:39:00PM +0000, David Laight wrote:    
> > > > On Fri, 10 Jan 2025 20:25:57 -0800
> > > > Suren Baghdasaryan <surenb@google.com> wrote:
> > > >       
> > > > > Introduce functions to increase refcount but with a top limit above which
> > > > > they will fail to increase (the limit is inclusive). Setting the limit to
> > > > > INT_MAX indicates no limit.      
> > > > 
> > > > This function has never worked as expected!
> > > > I've removed the update and added in the rest of the code.
> > > >       
> > > > > diff --git a/include/linux/refcount.h b/include/linux/refcount.h
> > > > > index 35f039ecb272..5072ba99f05e 100644
> > > > > --- a/include/linux/refcount.h
> > > > > +++ b/include/linux/refcount.h
> > > > > @@ -137,13 +137,23 @@ static inline unsigned int refcount_read(const refcount_t *r)
> > > > >  }
> > > > >  
> > > > >  static inline __must_check __signed_wrap
> > > > > -bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
> > > > >  {
> > > > >  	int old = refcount_read(r);
> > > > >  
> > > > >  	do {
> > > > >  		if (!old)
> > > > >  			break;
> > > > >
> > > > >  	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
> > > > >  
> > > > >  	if (oldp)
> > > > >		*oldp = old;      
> > > > ?      
> > > > >	if (unlikely(old < 0 || old + i < 0))
> > > > >		refcount_warn_saturate(r, REFCOUNT_ADD_NOT_ZERO_OVF);
> > > > >
> > > > >  	return old;
> > > > >  }      
> > > > 
> > > > The saturate test just doesn't work as expected.
> > > > In C signed integer overflow is undefined (probably so that cpu that saturate/trap
> > > > signed overflow can be conformant) and gcc uses that to optimise code.
> > > > 
> > > > So if you compile (https://www.godbolt.org/z/WYWo84Weq):
> > > > int inc_wraps(int i)
> > > > {
> > > >     return i < 0 || i + 1 < 0;
> > > > }
> > > > the second test is optimised away.
> > > > I don't think the kernel compiles disable this optimisation.      
> > > 
> > > Last I checked, my kernel compiles specified -fno-strict-overflow.
> > > What happens if you try that in godbolt?    
> > 
> > That does make gcc generated the wanted object code.
> > I know that compilation option has come up before, but I couldn't remember the
> > name or whether it was disabled :-(
> > 
> > You do get much better object code from return (i | i + 1) < 0;
> > And that is likely to be much better still if you need a conditional jump.  
> 
> I've just checked some more cases (see https://www.godbolt.org/z/YoM9odTbe).
> gcc 11 onwards generates the same code code for the two expressions.
> 
> Rather more worryingly clang 17.0.1 is getting this one wrong:
>    return i < 0 || i + 1 < 0 ? foo(i) : bar(i);
> It ignores the 'i + 1' test even with -fno-strict-overflow.
> That is more representative of the actual code.
> 
> What have I missed now?

A different optimisation :-(

> 
> 	David
> 

