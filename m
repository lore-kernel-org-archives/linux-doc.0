Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D261812E7E;
	Sat, 11 Jan 2025 22:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736633986; cv=none; b=tLfWufeETvS1Pls8j3jEqFxfIDff84WgBM3YQSNN5v2+T64xLupbBhxejMs5rfKhltHfTccCf6cQIgFosZm/mZ+vErXvHdm+/zxhx4LrEY7vVdj+tFcXd66UH2+cj+dz/gCPSq6x8OCYqs8rVDmP6J9R9EkYpyEQpvfx+3ImZ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736633986; c=relaxed/simple;
	bh=3ucFRwvEGNjcyml1aPDEF3VPdP2LQKNn1C4Y6zNWKqw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IJoLVTMcH9LNrQZtuhOXnwjBs8t7SziX59jV9cx36hWgQl37EFcnInHHH13PPc9jMJ0/g+mN2aimSMmoADMyN/3QX+go1OTEozNGzEiUIDjriP0ppbQ+/TPPqDcmZjXWOBKjtfkVi5pdIb8g1HOSt6f0vxen8tn2YqY8Q14/iLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1qG/vHG; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1qG/vHG"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso581804166b.3;
        Sat, 11 Jan 2025 14:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736633983; x=1737238783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIvPyEsdWcc7PrrnQYVuWIV+U0hbxqd2iRUelJDmbp4=;
        b=V1qG/vHG7hy8ZxWJkgu9273Q6zusOw9mHFFBRj6yPRgG3psr4/khU/P1P/nXaSWw5x
         T1ejyzgI9fK4qh1RZWJfAL1crVPwk3oNFsxnU45aYFpaW8WLjIva2myc/k/riJbiScY9
         tEQMrwAr+VzAkNYfjd8TBbaKU6AV/9RfkHuGR9sNBSGN8RoEaf03LmS/j3lrUAv430S6
         7JCiIjT2mHndYCKtyx32fprjPEYKnar54jxmUkpv2mv4bmsyrXQ2KiJjE8MLFxcYrzRA
         ycTV5TF+TQZbfHPBncKBEqzQ2UCSxUc9jNkXHRaV1K48aiX/fZU82zoWKujQqAaLz6Fi
         E5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736633983; x=1737238783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIvPyEsdWcc7PrrnQYVuWIV+U0hbxqd2iRUelJDmbp4=;
        b=GEqLN+Xnq5wDBxZUK2fHNQGEWx2zHHOvaLc1Xl/HevSgRrZlGwFJKj56QBq+qKBael
         cpUlGMBke5/A44kGSEUBS6fSxxVJ4I7xy1HzfHsgDVUXYAfrdWW9G2lVRpges/s8APBJ
         uA/E3MapQrFRKViyPkR8KForZNnKfnRhvjjSPeeWFTARTQGZPvnwYPD5ajhPC6TLB1iT
         7Hq2Mx5l614f8RH+i9xuk83YpCFANVArYlnISHOMZKrKnDRr/h9FFFVHPzCBWRB6Ojtj
         XAfPOSwzB0ULFAksHfy73iQFpiKUv6D4ZNsuTe8DY8D4s4Nw3HaZ/FgOq4bV7MqtR/tp
         UZvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVayTGsja2tmWsbxMtPii2V6rI/pZtUO6qOM20YPRampz2bPVgpMA4wmqOjNyO9NpgYGONYMLxLlkU=@vger.kernel.org, AJvYcCWQIUWht8Yt8P4EZnr8njMUHDUEExExxRcNXwAME9RE9e387JsfV+BBmtHNJ/plfJ/CyJD1Kv25r9oZkRjZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxDxKDZWJAk1E6TfCMyS631rMLy8lTVrANB4F+wfbNlq05JggS7
	dUjIVz6Xwi7fqrNVk3U58+FRhGBRv+YScDSzqymQpFHr9TsIn1Bu
X-Gm-Gg: ASbGncs190FzUJNjeYV0X1pGuoMEeULXWgVBuU6lXo0aiux7T5BlnzZCgC/ilFGKcp1
	9KRIjpg4rKl0Qqk0uHp805ZJOX6RuJb/f6AI5kExw7SNzcoAvp0HeEfV+QwPyAm61zZ9NyBwNwZ
	wQAuaAwFKRApxlNZVIIOyTOmWMKUTOQ+y9lFt7wnaqzlsfPKkz91N5sIUVVnNTTbytovnTv8PQV
	p+bxj3RL+00rLYsDIdUQW+1YuPhQVWG8ykAhI7xnJ+S6VTF/BAtG7K3A21cHSnTAEQKmYX2peTm
	3BPhc7MHxi+P/oTy66s=
X-Google-Smtp-Source: AGHT+IHlUgypIRT8cmPyfu1CbpbExxV+JECs8Ye78qu5DL0IregbmFFgcQX4wO1y5cazvG3p9v+Zsw==
X-Received: by 2002:a17:906:ef0e:b0:aa6:3f93:fb99 with SMTP id a640c23a62f3a-ab2ab74ba27mr1566197666b.36.1736633982743;
        Sat, 11 Jan 2025 14:19:42 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9563af3sm313885566b.105.2025.01.11.14.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 14:19:42 -0800 (PST)
Date: Sat, 11 Jan 2025 22:19:39 +0000
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
 linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 10/17] refcount: introduce
 __refcount_{add|inc}_not_zero_limited
Message-ID: <20250111221939.3a36908d@pumpkin>
In-Reply-To: <9086dca2-3d53-4147-abc8-bf2d1cca0b5a@paulmck-laptop>
References: <20250111042604.3230628-1-surenb@google.com>
	<20250111042604.3230628-11-surenb@google.com>
	<20250111123900.643e4b49@pumpkin>
	<9086dca2-3d53-4147-abc8-bf2d1cca0b5a@paulmck-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Jan 2025 10:30:40 -0800
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Sat, Jan 11, 2025 at 12:39:00PM +0000, David Laight wrote:
> > On Fri, 10 Jan 2025 20:25:57 -0800
> > Suren Baghdasaryan <surenb@google.com> wrote:
> >   
> > > Introduce functions to increase refcount but with a top limit above which
> > > they will fail to increase (the limit is inclusive). Setting the limit to
> > > INT_MAX indicates no limit.  
> > 
> > This function has never worked as expected!
> > I've removed the update and added in the rest of the code.
> >   
> > > diff --git a/include/linux/refcount.h b/include/linux/refcount.h
> > > index 35f039ecb272..5072ba99f05e 100644
> > > --- a/include/linux/refcount.h
> > > +++ b/include/linux/refcount.h
> > > @@ -137,13 +137,23 @@ static inline unsigned int refcount_read(const refcount_t *r)
> > >  }
> > >  
> > >  static inline __must_check __signed_wrap
> > > -bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
> > >  {
> > >  	int old = refcount_read(r);
> > >  
> > >  	do {
> > >  		if (!old)
> > >  			break;
> > >
> > >  	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
> > >  
> > >  	if (oldp)
> > >		*oldp = old;  
> > ?  
> > >	if (unlikely(old < 0 || old + i < 0))
> > >		refcount_warn_saturate(r, REFCOUNT_ADD_NOT_ZERO_OVF);
> > >
> > >  	return old;
> > >  }  
> > 
> > The saturate test just doesn't work as expected.
> > In C signed integer overflow is undefined (probably so that cpu that saturate/trap
> > signed overflow can be conformant) and gcc uses that to optimise code.
> > 
> > So if you compile (https://www.godbolt.org/z/WYWo84Weq):
> > int inc_wraps(int i)
> > {
> >     return i < 0 || i + 1 < 0;
> > }
> > the second test is optimised away.
> > I don't think the kernel compiles disable this optimisation.  
> 
> Last I checked, my kernel compiles specified -fno-strict-overflow.
> What happens if you try that in godbolt?

That does make gcc generated the wanted object code.
I know that compilation option has come up before, but I couldn't remember the
name or whether it was disabled :-(

You do get much better object code from return (i | i + 1) < 0;
And that is likely to be much better still if you need a conditional jump.

	David


