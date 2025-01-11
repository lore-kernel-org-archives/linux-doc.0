Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E0124B25D;
	Sat, 11 Jan 2025 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736594684; cv=none; b=QUqIAvy85A99lObGiC/jIz7ozsi6mY3nsa1G6CQ2nvVfYjgrMQrv3SzKj17hdyG5TVVutdJG/OxaPHwELYsZshOoIeygpvswzxgwjdjLbYYw1Br3Zk0pPqo6mEjsKRgq3JuA3fbyVBHpVsucYqKsidCfiLj1WgbqpjUJq5ClE+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736594684; c=relaxed/simple;
	bh=bdb8E1TG9EKV4Fc6eQ+7cYdtPDhnEH6mhjZ4K7ahtec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NoKy3yCSmAroascl+05I3L/OK0OcGgC6KPkQIwe5Frl9Jxu+ztyg7ZY4qsr9yMkyZ8m9Q++zAQkb8mlseExYk5Yt+S3msN9+eOZHAKK9mwHoaZuuf8wE0uuDQvqsnEjQDCEL55EhfwFyUFrdpu0DqSuvtlG0vrxNSMw1c87Ipcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhDnI5eO; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhDnI5eO"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so4625538a12.0;
        Sat, 11 Jan 2025 03:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736594681; x=1737199481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0E7Rr0tz8d7Ig0WhGt4NA2wQfDoRZWvhhQcWVQIiTXw=;
        b=UhDnI5eO4LDHF07O/MMTiIFp1vjnPR4aV5qwOagwvTDXl9w4pZldeRlutHdklTyX92
         QmqepnWx0kBod8oaO8sP8ZRVQnJnnafbM9unyvFYgBHICky6+6mjF/JcJrr8Vr97rveh
         6l53/fjRSMoqHsA6/bLyXx8xej69RKG6JVAd7ntOS/aVbfvmqtIJkwBnmisBu0cMylEN
         z9Pa5c28JRfMhxQRLbtNxNVthdnz2mK8UQ4Jncp0xa5KMpVwlmiPopxe4Lay8bwfzaPV
         liCNI40OOO81WcVgXpU+t/MP/3UJK/mfcRqT58VGucfO544J+LXVhl1VyxV5F52aTRBF
         gk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736594681; x=1737199481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0E7Rr0tz8d7Ig0WhGt4NA2wQfDoRZWvhhQcWVQIiTXw=;
        b=cDsjDdkKq3JH+ZSrAh9wwiOjE3J4hHoZzClrOZSIJuqYsH8jhKEj9UuH99HQozsK4S
         M4nZgqYcBLgoBEgg67SrTKHpK43qK1+Oh3vxPXa/PGKvXZRpZ1I11WbHjqwMCPS5+B86
         EFmchqYLxX0/O7LDfKPaUpwNXaRc4Jh6AWXT8ij9/I93pfjpw2dv1UDrnTIdghmatk2o
         VbTOuDExuecpw3DAIhhsT9MvS1T/fRSe9OvBzZ4L8Tqb4fXjO/akZU+6jYD5Ojlsjl9Z
         XIpyK+c3/KoHMrTsxXyeYgoeDaBT3kp7gLC2lhkV5/Y4+hv0okjRB0bVatHdeSW0Ympe
         j0Ow==
X-Forwarded-Encrypted: i=1; AJvYcCW9VtgxZkYU6dfikJrGcIsNuih2isxksQcQe3KNKcHpe5NQGSjMqIeb+7/oHBLAG0GYfdKc2BM/C02YmTHs@vger.kernel.org, AJvYcCX9F8yqao56C8N91mrXXZFqOsTv3F7YS3cVXQD4MaFSm3PD4V20JGSyrvpCCvuo2H5+FlMqARKIVGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSamabjYnxE1dOFa0cjDcy5kCm8SOoLPABTvEHGY0kLQxAZldM
	9oJ9elgsrDYaJLJpM6M9oLvEqoeSHkDJxEbPwhm0ziz9y9P1LvNW
X-Gm-Gg: ASbGncuz4Krk2g+JPBEiFjPr0Ekks5GJanK4eUZbEeKFC572B6+EBAB5RN4yteYcK9t
	F1mmhevxzqYd7blTC/id3ZUgMxZ070JCRbXF3MxDgkyHHi+r9tc85qxqjpd2HuFGZ8PhSQW7Kr8
	5Q4fsjGJssrrxgUctQ5EdAInGRSvm3Il1JOMM+QB5Ib2uentkL36pVzoSGjh/369sdLm2oGgMjm
	YU6IVQiNh1owPkfWwKARSf/BU7bQaAj9Iw2AWB1ONcvOVIWEHMZ4zIcmTOyZsD+Fyz1cA==
X-Google-Smtp-Source: AGHT+IG2/61nE3quv38DqgNG8ajW/3K1PH/G83ck3U2A5coY3Wq3xw4t+/hQEV2bOQFMxJDlXeyiIw==
X-Received: by 2002:a05:6402:50c9:b0:5d9:a61:e7c9 with SMTP id 4fb4d7f45d1cf-5d972e1bf6fmr12749106a12.20.1736594680570;
        Sat, 11 Jan 2025 03:24:40 -0800 (PST)
Received: from f (cst-prg-73-22.cust.vodafone.cz. [46.135.73.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a4127sm2609233a12.77.2025.01.11.03.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 03:24:39 -0800 (PST)
Date: Sat, 11 Jan 2025 12:24:29 +0100
From: Mateusz Guzik <mjguzik@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, oleg@redhat.com, 
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, 
	hdanton@sina.com, hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-12-surenb@google.com>

On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:

So there were quite a few iterations of the patch and I have not been
reading majority of the feedback, so it may be I missed something,
apologies upfront. :)

>  /*
>   * Try to read-lock a vma. The function is allowed to occasionally yield false
>   * locked result to avoid performance overhead, in which case we fall back to
> @@ -710,6 +742,8 @@ static inline void vma_lock_init(struct vm_area_struct *vma)
>   */
>  static inline bool vma_start_read(struct vm_area_struct *vma)
>  {
> +	int oldcnt;
> +
>  	/*
>  	 * Check before locking. A race might cause false locked result.
>  	 * We can use READ_ONCE() for the mm_lock_seq here, and don't need
> @@ -720,13 +754,19 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(vma->vm_mm->mm_lock_seq.sequence))
>  		return false;
>  
> -	if (unlikely(down_read_trylock(&vma->vm_lock.lock) == 0))
> +	/*
> +	 * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited() will fail
> +	 * because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
> +	 */
> +	if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &oldcnt,
> +						      VMA_REF_LIMIT)))
>  		return false;
>  

Replacing down_read_trylock() with the new routine loses an acquire
fence. That alone is not a problem, but see below.

> +	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
>  	/*
> -	 * Overflow might produce false locked result.
> +	 * Overflow of vm_lock_seq/mm_lock_seq might produce false locked result.
>  	 * False unlocked result is impossible because we modify and check
> -	 * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock_seq
> +	 * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
>  	 * modification invalidates all existing locks.
>  	 *
>  	 * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
> @@ -735,9 +775,10 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  	 * This pairs with RELEASE semantics in vma_end_write_all().
>  	 */
>  	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&vma->vm_mm->mm_lock_seq))) {

The previous modification of this spot to raw_read_seqcount loses the
acquire fence, making the above comment not line up with the code.

I don't know if the stock code (with down_read_trylock()) is correct as
is -- looks fine for cursory reading fwiw. However, if it indeed works,
the acquire fence stemming from the lock routine is a mandatory part of
it afaics.

I think the best way forward is to add a new refcount routine which
ships with an acquire fence.

Otherwise I would suggest:
1. a comment above __refcount_inc_not_zero_limited saying there is an
   acq fence issued later
2. smp_rmb() slapped between that and seq accesses

If the now removed fence is somehow not needed, I think a comment
explaining it is necessary.

> @@ -813,36 +856,33 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
>  
>  static inline void vma_assert_locked(struct vm_area_struct *vma)
>  {
> -	if (!rwsem_is_locked(&vma->vm_lock.lock))
> +	if (refcount_read(&vma->vm_refcnt) <= 1)
>  		vma_assert_write_locked(vma);
>  }
>  

This now forces the compiler to emit a load from vm_refcnt even if
vma_assert_write_locked expands to nothing. iow this wants to hide
behind the same stuff as vma_assert_write_locked.
