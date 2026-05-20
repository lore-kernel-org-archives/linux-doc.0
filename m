Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A16F3DCD8E;
	Wed, 20 May 2026 15:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289662; cv=none; b=GFMmKbDOjmubA6KiGo8+NuYP4wHBTGEphGsHmIobRuYXdBxkdWyjWdES9Y6mJno4Wy/V5nd/fXDUZm2TgiG5gh1SEPFlR7Aaw8mvj8nQIWTugUteTnx2Qhlwzkcsvlep+uR+Xq3gmrUJSBajxVJX82RBFlu52l/UZXXIDD1tK+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289662; c=relaxed/simple;
	bh=GCHQHwl6xXxxVuOiInJNtgnL8fLTa014/s0Fh1BxdW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYVWUvTVdsK06tFJ6jTEsDPef8PJ/O14cgrjIEE2ikd3h0gYP8RL1LpLjp0OPudUW77maB8lmAU9pNhkQrPYvqkhiWXjistzncnsizxqdPQtSQvx9zBOodqb1W78p7543K5i4ZSH1lIj5HW1CX2wA4U9LR3gUnVJfcr+74zjmmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G/TgLuOa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FuPsFaRt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G/TgLuOa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FuPsFaRt"
Date: Wed, 20 May 2026 17:07:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779289658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KN1wvoHprQssDeR7+IQiZjcPmwBUmM9w1xfU6JNFOrw=;
	b=G/TgLuOaBFNbegoedGpaHIgUve+xGtuBYkP+MBRC/JZnHaOPOoxXxnVK13fbwivQ/4JqeV
	qxx7q0V0cbDZtjh1jLSWCWyMp9ZuxaIyS8b0iwPdGv6vWCTfg6AdNSAJillfyBbbrLir5Q
	Xalz3aBVaK3Sr3Q6ElgJhiY9KCsoqmzAwhWb1r0D1HWWkNkEtN/PYINl7HDfczxs2oGu7L
	BpNeOiufHn78OvpO4eRoJ2fcBoVxgFi5VrkMnaeVqqMVC87+4nMWpxGR//8K2hCVIs1keB
	lcNzhF1GapHdBFXaRuB75WSY1nr0stB6Y9gOd30QTnvwR/XMr/2qXkmweDULHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779289658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KN1wvoHprQssDeR7+IQiZjcPmwBUmM9w1xfU6JNFOrw=;
	b=FuPsFaRtD3udrdCoS4HkPjULODop/QjZowu6oOpwHxGMI4Yxeq03tl74tYZt2egyGksEbi
	TKQ2oiVLeG0D5+Bg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Leonardo Bras <leobras.c@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Kees Cook <kees@kernel.org>,
	Marco Elver <elver@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Li RongQing <lirongqing@baidu.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Gary Guo <gary@garyguo.net>, Christian Brauner <brauner@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Coiby Xu <coxu@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev,
	Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH v4 3/4] swap: apply new pw_queue_on() interface
Message-ID: <20260520150736.HZnlFkv7@linutronix.de>
References: <20260519012754.240804-1-leobras.c@gmail.com>
 <20260519012754.240804-4-leobras.c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519012754.240804-4-leobras.c@gmail.com>

On 2026-05-18 22:27:49 [-0300], Leonardo Bras wrote:

after digesting the slub patch,

> @@ -882,38 +879,38 @@ static inline void __lru_add_drain_all(bool force_all_cpus)
>  	 * If the paired barrier is done at any later step, e.g. after the
>  	 * loop, CPU #x will just exit at (C) and miss flushing out all of its
>  	 * added pages.
>  	 */
>  	WRITE_ONCE(lru_drain_gen, lru_drain_gen + 1);
>  	smp_mb();
>  
>  	cpumask_clear(&has_mm_work);
>  	cpumask_clear(&has_bh_work);
>  	for_each_online_cpu(cpu) {
> -		struct work_struct *mm_work = &per_cpu(lru_add_drain_work, cpu);
> +		struct pw_struct *mm_pw = &per_cpu(lru_add_drain_pw, cpu);
>  		struct work_struct *bh_work = &per_cpu(bh_add_drain_work, cpu);
>  
>  		if (cpu_needs_mm_drain(cpu)) {
> -			INIT_WORK(mm_work, lru_add_drain_per_cpu);
> -			queue_work_on(cpu, mm_percpu_wq, mm_work);
> +			INIT_PW(mm_pw, lru_add_drain_per_cpu, cpu);
> +			pw_queue_on(cpu, mm_percpu_wq, mm_pw);
>  			__cpumask_set_cpu(cpu, &has_mm_work);
>  		}
>  
>  		if (cpu_needs_bh_drain(cpu)) {
>  			INIT_WORK(bh_work, bh_add_drain_per_cpu);
>  			queue_work_on(cpu, mm_percpu_wq, bh_work);
>  			__cpumask_set_cpu(cpu, &has_bh_work);
>  		}
>  	}
>  
>  	for_each_cpu(cpu, &has_mm_work)
> -		flush_work(&per_cpu(lru_add_drain_work, cpu));
> +		pw_flush(&per_cpu(lru_add_drain_pw, cpu));
>  
>  	for_each_cpu(cpu, &has_bh_work)
>  		flush_work(&per_cpu(bh_add_drain_work, cpu));

Why do we have two iterations here? Is it just a proof of concept that
is not complete yet? I am curious why it is okay/needed to "remove" the
one workqueue but not the other. Maybe the other does not bother as much
as the other does.

But essentially we can't use a spin_lock_t here because due to the
hotpath nature of the code it will kill performance. So instead we do it
anyway but behind a switch so that only those suffer from this that do
not want to suffer from workqueue interruption on a NOHZ full system,
right?

I thought that this improved since commit
  ff042f4a9b050 ("mm: lru_cache_disable: replace work queue synchronization with synchronize_rcu")

Did it get worse or was it not entirely gone?

>  done:
>  	mutex_unlock(&lock);
>  }
>  
>  void lru_add_drain_all(void)
>  {

Sebastian
