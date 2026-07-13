Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FA235CBCB
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 21:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978868; cv=none; b=CFSNFxCWM4Z60I/+9gED27banVRZorjXtcemt+y2Q9vltpCmOUe/hh71Am6vqih0NQIfAE3vQXlvwjQPmabWgblfS+zYk0EPYR6FrQfy6ziubc60s8n9WG4+4/a6kmvW3PrW+/hBJIzhnweL4CkooC0Jvq9WpD6zlqDEUVIrWuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978868; c=relaxed/simple;
	bh=SVMywLRbIFXVQzPixM0IKsUfpey0KwU4tI6WH0yTSZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=FkJKp553p8j0BMcFjDjqkmOUSvI4WwzfEewcgFxx9QmBheZdySEFGsG+y52M6cIJteGC6nLkfsDGf6dLgxR0ro68TdxM//uwg2gnNIvlEN5+YyiJiuWXri6v0+suRlFISIAgu6DVZQCrKtMVRRfvPIwZzgPnQeImOwGRztBtPDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUOev3u5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUOev3u5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso14340775e9.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 14:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783978864; x=1784583664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kBTvf+Z85P+YG7179a/IzMuusmQi/QF8ZEk+OKIxHQ8=;
        b=rUOev3u5sqq6ntZvKlT0xQcJirUIn+jt6GHolSh991C62w5fNtatBhIrImoRORxWTm
         B093d40ip/uH0opeJZA9RudYhBpSLSdiaM0EG3uu0gvUEPX3LM9/D1fxDmQbf8FMEtlI
         ROMFaUchBRcUsAzfnkK3Xlz42C2+v859vZgCKQLtmBgW0xO856G3c+Wr4ZOFjV4IKvZn
         Oj5Ley3NalMryuQJ1gaS6oPnjahYdZry6AlCCE5zeXJV1i0PKAGHvtz0mk2kWyTV10iu
         CbpMdaWcrWCuxxqWmmzsxv6XP3LUEbh6suvUXzrGDk8jsytoJGZlNje4xUaUldLAwaze
         O1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783978864; x=1784583664;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kBTvf+Z85P+YG7179a/IzMuusmQi/QF8ZEk+OKIxHQ8=;
        b=qlXAq9n26U0SBBXmE1ZeOt445BWVDrt5fjQ+T1nCDCtifYPlHfyKPip9XkhHRVOuM3
         EF1nbC0+TUnirrUZLiDQjog0qoryR3Ir4swDPgCRol0EHzYLxXljSlIq1DPuA0BRvaQx
         neDkBbe+De9VWSCPMJ16h4j2BCD2P6hci5PmOwoiX0zpAQZouIcXbgsL1qUkRUiOXrRK
         ChRVbKL8xdhyFKgP8iGUvvh457tfzVRiJ/om/T7bkUHrwcNX/juAsnY8B5WqmGAO7RpG
         /U5f0GOtqIbkByTbXhIfT7E1TcQv5BXfyVIXEdrSk2M9pn1OARZyiTcQdU4/yA3erKNx
         5mUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDB8tArsc9+X2mT6vHMtVzaQ550UQzzKjb37Nl93qVyfqDwmMRBJyJtTybrcHHTeS3M6Jp5up5F8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH9OAtqNwZsGR7QPZAbHPcx6VCFaZ2tSf237cLFxBWvxJx/ftD
	0kbWjl3AVJkOHcKC3yWW/pW+MpMufSFlpP4FWuzpEYCdE68bNBPLlH2f
X-Gm-Gg: AfdE7clOCCoQH0dTWSnvQbJVgDlIr/JvjK9nFqVSPdJ92Z/FSXk4OTZ3qpbCh9GxtIF
	+gK6obdw1lcv/u/9uvZ+xGQblFVUQAIdHrgKw/gD/v/5oSomFPNg8dkcDmtihaKHYFpvgFrzJ3J
	w4NNWOM6rn0g1PRVz6ZhXaoWQFvwTBhfgt2mBxmhFO1FmQRsH7+N2MBHsjPYoXKCEmukkqvu1h+
	UelMAyS7ArpsTZwfHDsrJG8FGTF1p/AGkusTPQ50v4wKfsVBo3I4e7TyWu1bYfkXX/dWYRROJGN
	2Voi/6IVT4j/K1MwP1Y/PCCKiSeMh1Kmuk+4jNXIvIRXe4UozX+uthwAFSy1S2zVg06oTVSVvx0
	m2jVhB6jaotSeMeWQ2cFf8U8PP+hE89gmqtnGPKpdAN7ipV6kpOl9Bp/mRrfRJbPTWI/CxT5ORS
	wyMptOUEvo9SABMM0qAMvmjg==
X-Received: by 2002:a05:600c:1908:b0:492:3e66:6c84 with SMTP id 5b1f17b1804b1-4951830e089mr11315545e9.30.1783978864353;
        Mon, 13 Jul 2026 14:41:04 -0700 (PDT)
Received: from WindFlash.powerhub ([2a0a:ef40:f61:3b01:d08a:833b:756:8fce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495087384casm23602415e9.8.2026.07.13.14.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 14:41:03 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Leonardo Bras <leobras.c@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Harry Yoo <harry@kernel.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Marco Elver <elver@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Li RongQing <lirongqing@baidu.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Gary Guo <gary@garyguo.net>,
	Christian Brauner <brauner@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Coiby Xu <coxu@redhat.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev,
	Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH v4 4/4] slub: apply new pw_queue_on() interface
Date: Mon, 13 Jul 2026 18:40:57 -0300
Message-ID: <alVbaf-UVMNaEtvk@WindFlash>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713073634.3Hrxpfcx@linutronix.de>
References: <20260519012754.240804-1-leobras.c@gmail.com> <20260519012754.240804-5-leobras.c@gmail.com> <20260520145308.nay9zt6r@linutronix.de> <alQWr2L_Kn23pxd9@WindFlash> <20260713073634.3Hrxpfcx@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jul 13, 2026 at 09:36:34AM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-07-12 19:35:28 [-0300], Leonardo Bras wrote:
> > On Wed, May 20, 2026 at 04:53:08PM +0200, Sebastian Andrzej Siewior wrote:
> > > On 2026-05-18 22:27:50 [-0300], Leonardo Bras wrote:
> > > > @@ -4733,121 +4735,121 @@ void *alloc_from_pcs(struct kmem_cache *s, gfp_t gfp, int node)
> > > >  
> > > >  	/*
> > > >  	 * We assume the percpu sheaves contain only local objects although it's
> > > >  	 * not completely guaranteed, so we verify later.
> > > >  	 */
> > > >  	if (unlikely(node_requested && node != numa_mem_id())) {
> > > >  		stat(s, ALLOC_NODE_MISMATCH);
> > > >  		return NULL;
> > > >  	}
> > > >  
> > > > -	if (!local_trylock(&s->cpu_sheaves->lock))
> > > > +	if (!pw_trylock_local(&s->cpu_sheaves->lock))
> > > >  		return NULL;
> > > 
> > > alloc_from_pcs() can be called from kmalloc_nolock()/ NMI context.
> > > I don't remember why exactly local_trylock_t was introduced here instead
> > > of a per-CPU spinlock_t. 
> > 
> > Probably to save the cost of using atomic operations on locking, and having 
> > about the same restrictions that would allow using local_locks
> > 
> > > But there should be nothing wrong with a
> > > trylock on it from NMI as you do here.
> > 
> > Awesome!
> 
> The problem is always the unlock which requires full locking and is
> usually the problem from NMI.
>

You mean, like, the trylock succeeds in the NMI handle, does the per-cpu 
operations, and then unlock()s? 

Or by full locking you mean local_lock() instead of local_trylock() ?
 
> > > 
> > > One thing worth noting, on !PREEMPT_RT, spin_trylock() always succeeds
> > > on UP. kmalloc_nolock() checks for it, not sure about other callers.
> > 
> > 
> > Sorry, I did not sure I understand that part. 
> > You mean we have since it always returns true, we may be in NMI context, 
> > after it was interrupted holding this lock, and it will return true which 
> > will use the protected area even though the lock should avoid it?
> 
> from include/linux/spinlock_api_up.h:
> | static __always_inline int _raw_spin_trylock(raw_spinlock_t *lock)
> |         __cond_acquires(true, lock)
> | {
> |         __LOCK(lock);
> |         return 1;
> | }
> 
> on UP a spin_trylock() always succeeds.
> 

Right, I got that part, I was wondering the scenarios in which would that 
be an issue.

Thanks!
Leo
