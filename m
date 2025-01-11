Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6DA1CFBC;
	Sat, 11 Jan 2025 22:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736635824; cv=none; b=DFSr49uWcpc+GH4c8asi4L4SuSzM5Sk0/UHi554XhN46cXPNx5kPDUXf91hVu0ZDIo/01qCKunVmkJRQtKLx5L2SucbXAGph1Y+p2ROzjoD7gF0uOoua7XNOhFm0LJvEXehIsbSwLoHhniYyZeLYx3mG8iINlTbY6s04LNOYG6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736635824; c=relaxed/simple;
	bh=aoULqWpiMcsmUvfvQkZzbeOxU5VUPFiAPqbXw8Q82s4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tsa+XlUmnQa0fmQfKp3j4uuyvRIHArfSmqd7vWteSmkpxj44vps/N9QEaOVBlCL/1X0faRhxG5i0xwH/L/4LKxjJ+en8lqPM6UF+LN2ZzzFJ/53HX/3vakfPhx4xTqlPyHW0HE+6dvUv6/jQnP/6LgCwJ9L5XXxUPcxbGRo6dqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Neg1POe0; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Neg1POe0"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaec111762bso581532366b.2;
        Sat, 11 Jan 2025 14:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736635819; x=1737240619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9AHpR9KMQk31tLjxrqdKa0iwHZyqgzyJjqUeEzoJOw=;
        b=Neg1POe0CXheL9LpqUoe032MpdKqwGCY6An10mkcZeQMDW9JbspajLEfQ6GTQD/FM8
         pQ63IoFR8ofrSz0NDRlO6Vaf0w+m3g683KG0eUCLYpZWvU6sEsrSdHt9r7Tw6w5XuqHz
         7YvsU0zoCkYIRxUnHHHJuY3v2q+OUbow/OJMIIk3AhMnhGfwfXB7/YKapkbwTgtp8aVQ
         ZNK6hBAKrasTKAKiXsy6hdTtQLTbiazRWqRf/LnjhVLvy8GcknoiBGMzoDqUUXRUjL22
         Y84VkUXF1DsO19PgvX9XFKSlVLw1oaTRAaFS+1A68NOtTjeGw6JDKZIfHKz2W80nL94O
         GhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736635819; x=1737240619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9AHpR9KMQk31tLjxrqdKa0iwHZyqgzyJjqUeEzoJOw=;
        b=dF+oOt18VydhnwV6snRmdUEUMtPOt4nJ3RIf8sS9InbWELXgdChgngcGwRozCKFnHD
         SPzTw3QHQgYwuddPjPMWL/arLdXBJ3bRwP6iESTZr4fjvxaXYowYMy/vOS46k61+Rt1C
         2+eRbvUqCfKFvwlhENqIEl4qdFekodmDdoyhJAwOUZvsQAtzGN8Ss+WneY2SCC2rFton
         Hm+x4yt7/6einIA5C/qEfGWRJATAeMIe93UkzS3qIodmDVQK0WqFQHC7+an4IQCYblKt
         THMJpqT6ylh6fJOyJkC6CAQ9iXJpWYpwMWSFlj5LbXv7ctnQxLKpBGKU8tGDqVwRyO6U
         0haA==
X-Forwarded-Encrypted: i=1; AJvYcCWVLc7KZBBH7NHB99wKl2XZe2iFclFxjZBVNgkedjwm5O6ZOVgGadopXmVTrOL5H/U6ONWFUQXcuifcxaHO@vger.kernel.org, AJvYcCXMZG1wziwvvuadsv3OISnm1ABW9cSK9anZHfZb+DAJC+6Kzm9YFK9r9UWvH8MAsCvBqsPWvW8zYQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YygrCjK85XB72xIjWiGJv7o+PvbxHRtC/tp6uAasjBxsXmSLxjI
	BO3JE0PfxYpauacuNCwW/3n3nnBL+q3H7pBhg2PkxgQUIeYsFAsm
X-Gm-Gg: ASbGncvNoG24eWbTyAcMx3Gpy7UrDT/2ul+t2yA38e3Dkzz4Q1Ei6ul0tUaaRe9Gpdp
	bCWq0w//WhhxrCEPd9bVtEe49gP3jxQBrkC7NdiaG+2gOsX8QN7h/EKk1d3hqsgWSv/BQ2aYhx3
	gVp2tqK2c6zEDCx8XhGTogDT+CO5bZv/yul6Gx2Y9OeAkeQAiz6fN7sGdqcMiXKlUDAFt597lxi
	CgHy9a5XyOZPpx5oabnRaXzdmWflL8DvInYDEVfLs6msaFXIgKiDsVxRABGaT8j9VxyRVmE9Wm3
	k1Ee9jy6W/8t0ct8lis=
X-Google-Smtp-Source: AGHT+IFMDE/fo3e4b07YXU3QufQHgZJ90mpUplpkrxnJ5Yo0ABb7vStkVqRX9F6WEWaLw7bZUn+dfQ==
X-Received: by 2002:a17:907:720f:b0:aa6:75e1:1864 with SMTP id a640c23a62f3a-ab2ab6a8b3emr1575759066b.4.1736635818690;
        Sat, 11 Jan 2025 14:50:18 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95af24bsm314096066b.134.2025.01.11.14.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 14:50:18 -0800 (PST)
Date: Sat, 11 Jan 2025 22:50:16 +0000
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
Message-ID: <20250111225016.660c5784@pumpkin>
In-Reply-To: <20250111221939.3a36908d@pumpkin>
References: <20250111042604.3230628-1-surenb@google.com>
	<20250111042604.3230628-11-surenb@google.com>
	<20250111123900.643e4b49@pumpkin>
	<9086dca2-3d53-4147-abc8-bf2d1cca0b5a@paulmck-laptop>
	<20250111221939.3a36908d@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Jan 2025 22:19:39 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Sat, 11 Jan 2025 10:30:40 -0800
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > On Sat, Jan 11, 2025 at 12:39:00PM +0000, David Laight wrote:  
> > > On Fri, 10 Jan 2025 20:25:57 -0800
> > > Suren Baghdasaryan <surenb@google.com> wrote:
> > >     
> > > > Introduce functions to increase refcount but with a top limit above which
> > > > they will fail to increase (the limit is inclusive). Setting the limit to
> > > > INT_MAX indicates no limit.    
> > > 
> > > This function has never worked as expected!
> > > I've removed the update and added in the rest of the code.
> > >     
> > > > diff --git a/include/linux/refcount.h b/include/linux/refcount.h
> > > > index 35f039ecb272..5072ba99f05e 100644
> > > > --- a/include/linux/refcount.h
> > > > +++ b/include/linux/refcount.h
> > > > @@ -137,13 +137,23 @@ static inline unsigned int refcount_read(const refcount_t *r)
> > > >  }
> > > >  
> > > >  static inline __must_check __signed_wrap
> > > > -bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
> > > >  {
> > > >  	int old = refcount_read(r);
> > > >  
> > > >  	do {
> > > >  		if (!old)
> > > >  			break;
> > > >
> > > >  	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
> > > >  
> > > >  	if (oldp)
> > > >		*oldp = old;    
> > > ?    
> > > >	if (unlikely(old < 0 || old + i < 0))
> > > >		refcount_warn_saturate(r, REFCOUNT_ADD_NOT_ZERO_OVF);
> > > >
> > > >  	return old;
> > > >  }    
> > > 
> > > The saturate test just doesn't work as expected.
> > > In C signed integer overflow is undefined (probably so that cpu that saturate/trap
> > > signed overflow can be conformant) and gcc uses that to optimise code.
> > > 
> > > So if you compile (https://www.godbolt.org/z/WYWo84Weq):
> > > int inc_wraps(int i)
> > > {
> > >     return i < 0 || i + 1 < 0;
> > > }
> > > the second test is optimised away.
> > > I don't think the kernel compiles disable this optimisation.    
> > 
> > Last I checked, my kernel compiles specified -fno-strict-overflow.
> > What happens if you try that in godbolt?  
> 
> That does make gcc generated the wanted object code.
> I know that compilation option has come up before, but I couldn't remember the
> name or whether it was disabled :-(
> 
> You do get much better object code from return (i | i + 1) < 0;
> And that is likely to be much better still if you need a conditional jump.

I've just checked some more cases (see https://www.godbolt.org/z/YoM9odTbe).
gcc 11 onwards generates the same code code for the two expressions.

Rather more worryingly clang 17.0.1 is getting this one wrong:
   return i < 0 || i + 1 < 0 ? foo(i) : bar(i);
It ignores the 'i + 1' test even with -fno-strict-overflow.
That is more representative of the actual code.

What have I missed now?

	David

