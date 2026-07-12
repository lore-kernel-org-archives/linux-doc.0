Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7663845CE
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 22:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783895739; cv=none; b=WtWyHDP9WSzhyxdhDNZLxVfgem4v1MrbHWgC2mauXHCTcH7r/yOcHufM+Kg6WSTPo5ATv0NR7zWWVx0VBA7PmIQuSvPhDCJbhAfWGNQdTaIs0hZ0z+c2tfvxU8MEcMhMjMA/3aX8k7S7+582XV7BxlhIq4Ny7SZYFZ9Vie6dTD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783895739; c=relaxed/simple;
	bh=zTp1DOk3NOaMktG3fJiFhErNH/BB+SGW2xP7NajgGuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=LW6zGn+g88eqP4olAKT9p4vZMGqg1j9reTIuqs/9ROSMKgFjH3L8vlIjYtWxBnnesyD4ywK4C0zzwDDWKLGtQf1gu1wX9m8LyZwb+Apgk4MjH2wN5lTqSe9u2bWuKKLIb/GHLS2UtAbSQ+/WmK7P9RWPhqV7enEW1NuvhJ4twzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTgJwkdC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTgJwkdC"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso10599745e9.2
        for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 15:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783895735; x=1784500535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VdrKql7RKB+YZLcnGXRPhjkopfqYReRcnCWxRaESO50=;
        b=cTgJwkdCcmsAYdlUPwz+IdkzX86vFoDpJWc5dp0yjCyDS8E/GDp80+k4GHxLdiFnGV
         qk+Sb/mOIvL9aaQU/oMB4vUhfXt7+abaTfqzMw2vx73xPcWIXcsV2yZFyUO1m3ONeOtR
         tcW+B8s9rktMHvKfT1bKwbFo6N0JqONvgjQ/wmqxnq8QTI4nmHoEFdN08BnN27jFNFH5
         r0U6lK1T7YSop1qQAFswB+bcJAzQwHzhApK3oGM3wC/TLjtob1Jhz5Crg79kzNSelgq/
         D5nwJEb/g1icybXt8Lzoz+T0+IJndeP3sFfaOR/3qYzwL9NYcnljoDISkpb/WK2+tcdG
         dqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783895735; x=1784500535;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VdrKql7RKB+YZLcnGXRPhjkopfqYReRcnCWxRaESO50=;
        b=ds5eHKri474Nx8uvraJKnKfKYTSHFaVW9hxtJcklxG07OMjiC/p5wqiliDOcqDjPVp
         UHU+AdeD+jCsgG+ykQ3qyyYiFGVAwLS7f2oHE3jirgziG1PkawwoORWXytPhGSdk2gXa
         HQ6IxKNZlW0ADCZMD82hjauRoR9DH7IynDc8gi2ytopwJ8RJLr5LyyGYGD5Pa7vrppa5
         cxqRaL2GCpa5SZltcqEx5/UDCprhIchiwzd1uRjmvn6q1bZKydqPMkoT1vOg0AoUt5NV
         ln+phPgRTBJvlnAX+3a7FZshpnTJr1v965g+HmKoVE+247fcaTaqIK38ebUPjbo04xVk
         GO1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoiqGUy63NL7FifGPIKvkuMtXiUPeDin77iulRAlHss2OHckPQ6WvA3GxNACZ2i/Ei4FESkpBUTp44=@vger.kernel.org
X-Gm-Message-State: AOJu0YwowIMJvK14WHt9d3fqfgDb+3Oe8xCaurHVfuPd56DUCEuH0d+g
	YIN0jlySguGuvppAIa13DmB3F+tOQXGgIc6gzcbbLLZO2mHx//k17x4+
X-Gm-Gg: AfdE7clO9jBQ4lCDvTv716pxxsMcDNHbD2dY4zWTojtSqfaOoo3fjE/k9IVh5N1oiU6
	y2FjsautIwBV21JY6iA4j7a4sKv7GVOhEkzcpdJ1dI4bcJoPqIey1ZS/NJVRJ1TPnkP3+8ECauv
	AiBgJqhzVOKLjJPsmI+Y/JoQ3v/yNXr2VyS/w69PLeJeGhBbW5r/nQiv4f/hiOTs5t5BHqTXwTw
	UJLwAdE+0EVyP03bYig9ojWMKxpfSQh63CiY4WZhnQmh6rvXvQ8qruLNW/RikuwkA2NG1w+zP5X
	ntQYMcUB8RsIOdjtDrxBXK18WoLDAhut2kOzV+ZF0GBAuWek4PvrUVtei33JnZ0cn2mU9R3Lptt
	C1UGSdovFXrBhANfN41MORNvvFxFqCkFNSYZL96U+jG9OrqPcn4NQ4hETNifwd/Y89JIQqsKOf/
	jcKFlw9MD6p9MlckXQu6LGVw==
X-Received: by 2002:a05:600c:6989:b0:493:bfbf:1da4 with SMTP id 5b1f17b1804b1-493f881de65mr64503975e9.22.1783895735000;
        Sun, 12 Jul 2026 15:35:35 -0700 (PDT)
Received: from WindFlash.powerhub ([2a0a:ef40:f61:3b01:d08a:833b:756:8fce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6df6d9sm373068445e9.7.2026.07.12.15.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:35:34 -0700 (PDT)
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
Date: Sun, 12 Jul 2026 19:35:28 -0300
Message-ID: <alQWr2L_Kn23pxd9@WindFlash>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260520145308.nay9zt6r@linutronix.de>
References: <20260519012754.240804-1-leobras.c@gmail.com> <20260519012754.240804-5-leobras.c@gmail.com> <20260520145308.nay9zt6r@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, May 20, 2026 at 04:53:08PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-05-18 22:27:50 [-0300], Leonardo Bras wrote:
> > @@ -4733,121 +4735,121 @@ void *alloc_from_pcs(struct kmem_cache *s, gfp_t gfp, int node)
> >  
> >  	/*
> >  	 * We assume the percpu sheaves contain only local objects although it's
> >  	 * not completely guaranteed, so we verify later.
> >  	 */
> >  	if (unlikely(node_requested && node != numa_mem_id())) {
> >  		stat(s, ALLOC_NODE_MISMATCH);
> >  		return NULL;
> >  	}
> >  
> > -	if (!local_trylock(&s->cpu_sheaves->lock))
> > +	if (!pw_trylock_local(&s->cpu_sheaves->lock))
> >  		return NULL;
> 
> alloc_from_pcs() can be called from kmalloc_nolock()/ NMI context.
> I don't remember why exactly local_trylock_t was introduced here instead
> of a per-CPU spinlock_t. 

Probably to save the cost of using atomic operations on locking, and having 
about the same restrictions that would allow using local_locks

> But there should be nothing wrong with a
> trylock on it from NMI as you do here.

Awesome!

> 
> One thing worth noting, on !PREEMPT_RT, spin_trylock() always succeeds
> on UP. kmalloc_nolock() checks for it, not sure about other callers.


Sorry, I did not sure I understand that part. 
You mean we have since it always returns true, we may be in NMI context, 
after it was interrupted holding this lock, and it will return true which 
will use the protected area even though the lock should avoid it?

Humm, but if that scenario exist, then is it actually ok to return true on 
trylock() in that scenario?

Thanks!
Leo
