Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE234353A74
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783979096; cv=none; b=nMhLWy/mTk11yOuVeocdfR1e+DfZtrBPo5G48m8Ee+sHMIN6xcGSzd6cBRf6hgDrIKD8QPGAGqI2DC4U/azfHHbBD3COnvznErrIq3K4y7xl8hvumiTEIicHLb01gN3R1GGMzMK1ezG9OeK/0pqlWMwX4dGVRTgSzOMOqnDyWUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783979096; c=relaxed/simple;
	bh=tm0m35PCxp1FkT9230tpXfSGtscsHUGupr0C8M/89KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=QjoXmtdvlOe50uEpAK/BaZ+tiGhHQLJH61h7wgcZ4aOVE9CxTmsxpC4ZwMOLROIn5Ndc4T/r3IcauyZfk+vKESrFgNLZW6vnDdlcyKuWE3DIfmOrlbAZBTfKLAfqJwTsUTEAGlYszVs1qbMR2D8S4Il/rNovP6MC/kpYcH1UXHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKlklDx+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKlklDx+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493e497643fso2009165e9.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 14:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783979092; x=1784583892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5DZ2wnEYE0t0eLEvNMJDLzTpJbDUy0ZG5iAhAz+AYU=;
        b=RKlklDx+CUq2qUjjshum5eRORNfguQfDS+RQkE4jGMN99aHL0fyN5h/v7AbFXtRB2O
         PLlM9vyKwP/PjwSoyAFywaKKcGJKUFIKq1jNfqNkfGzXRjxWq/Rbtlyy/xazECPzb/FB
         mfuGOpEsdy2Vpe6KtxZu6X6BpssEylYNH1TzgY9uFWZ1aSIDphpXhz1rMmZFBUD/VRxt
         SJJoaD7bZ1yCY6uYasdBmZUD9OY+CDZADYg4hyWSQ+Jq8ULCQFetaWy/Z4U/ubwQTWqS
         GMI7lyuvNH5Yq0FxTvGmXQamKu5ik7MS1SkeAqkkLtBgoCkJiN6l24JuXl+If+h5fgtf
         GaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783979092; x=1784583892;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y5DZ2wnEYE0t0eLEvNMJDLzTpJbDUy0ZG5iAhAz+AYU=;
        b=Yc4cWTfpk5dsQPXzLqHHbK9AUOqhuZGqYsaP64LgIY7bjisVtyjRTNOpVJX6PwOvsI
         cq+KM99XBWWy7KEnsABMMerF3YS6yhljixp2cFvZxVk2lkbjRi3EwVHgyPm/atq1wsVN
         5D0Rx4LPGKRHV96kxr+8lf4rOAMiqY31JDJZIixN4JW3yjgmISeQ+P8OrByWzwmQKqcC
         D7G1gP/tCujbP4vP6va7bRHbCmuwKsIFGDI2IBVtFlyHawj4vtmMyXiN5eTp4YOnpTf9
         /kf2KZ9j1xwQpigIRK76fjv3RFjQyBpIQzzI6B7OFKd6U7NDeEaXeYF1Wo4ighf1frDp
         QvHQ==
X-Forwarded-Encrypted: i=1; AHgh+Robf/+rO42gIA41xnMFFzYb3q7UDiDUNJH9y47qE6zYoWt3r6sU8SCaWfOCPa0q91jBOlvOIIRdS8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY5Db+4tjyqZ37JVcCrCd2cYOO1h5y7OWz2ViYrI6+HhUPNqDB
	EjixapAUccnF9NNmS6/xYQbkrnr71ZhgMq9GmA0g5Q3+XVoKeI4+0og9
X-Gm-Gg: AfdE7cl6oxlf0B31xbg78L06lmLx0oDx1r1nyAypUMpOZS2zf8aVPM4Xw0dgnpnjfu8
	KwnCoIW2r1VGxEvtuqrgx+IQrKFQHbilhscPX/l1sFVfYj6PuIbsGe7/jLHEJRnxTkTxjeLgMB3
	Vt6cbJBmovUFIBY3sc5QK4/DTc594kWJnEOSpMbbyrSVMZGkuZiyOSwHy/sdJX2l6146PO7oKgc
	zkc3WHGpucZ1TagZfVAGaOdb/KSHfYgLutq3m5Dq5asdALSTgc91iczERY1BVhJaol9hPNmUVoh
	fla29XqTYvz1OZ5Rd2S81uOiHcbtPS5XDtbFtJmne+XLHXzMhYktFDTYK2mhn+6IvDLLfDNZL/r
	m7JRrj6Ple3vomOLvDH3V74im/VgTPt6WRedgmEZYkqpHfi7tPwngFHPAmOCHmj6M0wP99U3iiX
	fmT445WY7/biOF8YmLoxqvtg==
X-Received: by 2002:a05:600c:6089:b0:493:b7cb:c5f with SMTP id 5b1f17b1804b1-493fa8afbb6mr103142795e9.11.1783979091931;
        Mon, 13 Jul 2026 14:44:51 -0700 (PDT)
Received: from WindFlash.powerhub ([2a0a:ef40:f61:3b01:d08a:833b:756:8fce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49506a1fbcesm23074035e9.0.2026.07.13.14.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 14:44:51 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Leonardo Bras <leobras.c@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
Date: Mon, 13 Jul 2026 18:44:49 -0300
Message-ID: <alVcUZcSeLf187VD@WindFlash>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <157f60cb-ff83-4fed-8b05-e6c6390f85bc@kernel.org>
References: <20260519012754.240804-1-leobras.c@gmail.com> <20260519012754.240804-5-leobras.c@gmail.com> <20260520145308.nay9zt6r@linutronix.de> <alQWr2L_Kn23pxd9@WindFlash> <20260713073634.3Hrxpfcx@linutronix.de> <157f60cb-ff83-4fed-8b05-e6c6390f85bc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jul 13, 2026 at 12:55:36PM +0200, Vlastimil Babka (SUSE) wrote:
> On 7/13/26 09:36, Sebastian Andrzej Siewior wrote:
> > On 2026-07-12 19:35:28 [-0300], Leonardo Bras wrote:
> >> On Wed, May 20, 2026 at 04:53:08PM +0200, Sebastian Andrzej Siewior wrote:
> >> > On 2026-05-18 22:27:50 [-0300], Leonardo Bras wrote:
> >> > > @@ -4733,121 +4735,121 @@ void *alloc_from_pcs(struct kmem_cache *s, gfp_t gfp, int node)
> >> > >  
> >> > >  	/*
> >> > >  	 * We assume the percpu sheaves contain only local objects although it's
> >> > >  	 * not completely guaranteed, so we verify later.
> >> > >  	 */
> >> > >  	if (unlikely(node_requested && node != numa_mem_id())) {
> >> > >  		stat(s, ALLOC_NODE_MISMATCH);
> >> > >  		return NULL;
> >> > >  	}
> >> > >  
> >> > > -	if (!local_trylock(&s->cpu_sheaves->lock))
> >> > > +	if (!pw_trylock_local(&s->cpu_sheaves->lock))
> >> > >  		return NULL;
> >> > 
> >> > alloc_from_pcs() can be called from kmalloc_nolock()/ NMI context.
> >> > I don't remember why exactly local_trylock_t was introduced here instead
> >> > of a per-CPU spinlock_t. 
> >> 
> >> Probably to save the cost of using atomic operations on locking, and having 
> 
> Yes. Also function call overhead as spinlocks are often not inlined.

Oh, right, I remember getting numbers on that. Inlined per-cpu spinlocks 
take much less time.

> 
> >> about the same restrictions that would allow using local_locks
> 
> Indeed.
> 
> >> > But there should be nothing wrong with a
> >> > trylock on it from NMI as you do here.
> >> 
> >> Awesome!
> > 
> > The problem is always the unlock which requires full locking and is
> > usually the problem from NMI.
> > 
> >> > 
> >> > One thing worth noting, on !PREEMPT_RT, spin_trylock() always succeeds
> >> > on UP. kmalloc_nolock() checks for it, not sure about other callers.
> >> 
> >> 
> >> Sorry, I did not sure I understand that part. 
> >> You mean we have since it always returns true, we may be in NMI context, 
> >> after it was interrupted holding this lock, and it will return true which 
> >> will use the protected area even though the lock should avoid it?
> > 
> > from include/linux/spinlock_api_up.h:
> > | static __always_inline int _raw_spin_trylock(raw_spinlock_t *lock)
> > |         __cond_acquires(true, lock)
> > | {
> > |         __LOCK(lock);
> > |         return 1;
> > | }
> > 
> > on UP a spin_trylock() always succeeds.
> 
> Indeed. This was a problem in the page allocator, because there we don't
> even disable irqs, so it wasn't just nmi, but an irq that could get a
> false-positive spin_trylock(). See 038a102535eb ("mm/page_alloc: prevent pcp
> corruption with SMP=n") which was a hot fix.
> 
> This was later cleaned up with 3 commits starting with a373f371166d
> ("mm/page_alloc: effectively disable pcp with CONFIG_SMP=n").
> 
> Since here you're also replacing local_trylock() (with no _irqsave) with
> effectively spin_trylock(), the problem also won't be limited to NMIs and
> thus the checks in kmalloc_nolock() won't help.
> 
> But I see in Patch 1:
> 
> +config PWLOCKS
> +	bool "Per-CPU Work locks"
> +	depends on SMP || COMPILE_TEST
> 
> So that's basically avoiding the problem in the same way as the page
> allocator after the clean up.
> Maybe just remove the COMPILE_TEST part? It's not clear to me what it
> achieves. Just make it require SMP as there's no point for this on !SMP.
> 

I don't mind removing it, but IIRC that was added by Marcelo, I have to 
ask him the reason he added it.

Thanks!
Leo
