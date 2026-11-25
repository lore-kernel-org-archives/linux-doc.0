Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620816;
	b=SC2WrUFfpnIBqtNC9mvFV6SEkeHK86Q6hSDIcOZNwDfUww76a8pN0nNEWptaPnO6cgfs
	 lErYLw1XU0mBGoDoWorjG+vdAirQbX+grXR7LW2LOreFBPqLdGbevHoo6qBzIjoIdVuNa
	 l/cA5hhRpeuCyHLVXKq3e4wGigtIypDvT1h01zjMo/oLjIBFHKGbMK0eQxPlE/TiPj8x6
	 qywGxOyj3GUKVpfRX6t+Fj6FCp6HMSkPcLa/he4KcRoGvIgTEnmcvjLcA4HkNXWB+9YZR
	 zwSoAv5yAPM4aJdkCgYQXmuHuUapRtG/aG6CkmdBkcXNl0nNKDljBQ0ww/rSMdcn3AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620816;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4+vF0i9sfZKUXmupXO2GXat8RGnc/R+fwUIydX1npxU=;
	b=jESwPQMsK4dpafbPTbTczfCIG6wpM+1al5oqjPVDOOr9j04D/OXwAZvGJ5QXQo0tK+QE
	 9M5lPPjnBulY0KFoFWUxGlvObrnFw2rTBuyRF6DIPH5f9CIq+QCAeQAUErrbhyvPYNeGF
	 nQzMz0DtCbkeUxHSDZ342CDqsdUMF+TtOsg47ftSBKXJIq1MtHfbxHi3An+M6V6mlplbk
	 IlRL77oRMJRHrDpoe4cuMCIvGf+4d7Xb+YDtxnBBShio0kwh4KOFm7EuwwrY6PekmNVci
	 mJT83ARbvr/s2X8Gq2PqIufKaW78RWqE6tTXCfDmCtaK9yvSs4rEp1FV5pYDccbReOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=We4ZcvPf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2597B606A321
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 15:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=We4ZcvPf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5CA1F000F2;
	Wed, 25 Nov 2026 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795620815;
	bh=4+vF0i9sfZKUXmupXO2GXat8RGnc/R+fwUIydX1npxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=We4ZcvPfvGACiTc0GdegtIgoPDkj5NaWQ/nMSlh2b5Cjv8l99WoEfwMmGVL+VhapP
	 +9qmZU9xhNSlWCTWXEPXhw1TIRLYR4PXqODqf9+8oCR4TFftuu2bxdhMHb1ZJgyu87
	 /G0cSUvEEyMb+FN7FpThCnn2aFHueEmF1nj0LeUyoNF971x9+EJRpB3vIWvb8xbckm
	 /K0QP6jFu9d6KpPngQbMS/1i1hsWwhuZ8tf5OmQLzaXUrVyvj+RdF6zD9OoeY3ZR9U
	 yXbF93c4RA673PR0G6R1nkft8ISvvfAp/lkvqL1TB/kAJKv059Bb2OZlf+4aHH0QXo
	 Jkgihn6t/1uHg==
Date: Wed, 25 Nov 2026 15:33:28 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: david@kernel.org, corbet@lwn.net, akpm@linux-foundation.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	rientjes@google.com, shakeel.butt@linux.dev, sean@ashe.io, neelx@suse.com, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH] mm/oom_kill: optionally log victim command-line
 arguments on OOM kill
Message-ID: <awb6I0qAySbhBIsW@gremlin>
References: <20261124205043.1010247-1-atomlin@atomlin.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124205043.1010247-1-atomlin@atomlin.com>

Nackity nackity NACK NACK NACK!

This is terribly, horribly broken both in concept and implementation.

On Tue, Nov 24, 2026 at 03:50:43PM -0500, Aaron Tomlin wrote:
> When the OOM killer terminates a task in __oom_kill_process(), the
> kernel log records only victim->comm alongside its PID and memory
> counters. Because comm[] is truncated to TASK_COMM_LEN and typically
> reflects the interpreter binary rather than the executed programme or
> script (e.g. "python3" instead of /usr/bin/python3 -sP
> /usr/bin/firewalld --nofork --nopid), identifying which service or
> worker instance was killed during post-mortem analysis is often
> difficult once the process has exited and /proc/[pid]/cmdline is gone.
>
> The standard get_cmdline() helper cannot be called from
> __oom_kill_process(). OOM kill paths run whilst holding oom_lock, so
> blocking on mmap_read_lock_killable() risks deadlocking against a
> thread holding mmap_write_lock() whilst waiting for memory allocation
> on oom_lock. Furthermore, get_cmdline() walks user pages via
> access_process_vm(), which triggers page faults, memory allocations,
> and swap-in I/O during an active OOM condition, and drops an mm_users
> reference via mmput() that could run synchronous exit_mmap() teardown
> under oom_lock.

Also, fiddling with the memory of a soon-to-die process under extreme
memory pressure is insane, additionally _holding that lock_ under memory
pressure is insane.

>
> Introduce an opt-in vm.oom_dump_cmdline sysctl (documented in
> Documentation/admin-guide/sysctl/vm.rst), disabled by default to

'Have mm people support my code literally forever'... and make it an ABI
requirement too!

> preserve existing behaviour and avoid exposing potentially sensitive
> command-line arguments unless explicitly requested by the
> administrator. When enabled on CONFIG_MMU builds, __oom_kill_process()
> attempts a best-effort, non-blocking read of the victim's resident
> argument vector (including setproctitle(3) updates inspected via
> arg_end - 1) after releasing task_lock(victim). It snapshots the
> argument and environment bounds under mm->arg_lock, acquires mmap_lock
> via mmap_read_trylock(), bails out if MMF_OOM_SKIP or MMF_UNSTABLE is
> set, and walks only present, non-PageHWPoison() anonymous page table
> entries via folio_walk_start() without faulting or allocating memory.
> After dropping the page table lock, each pinned subpage is flushed via
> flush_anon_page() and copied across kmap_local_page() and
> copy_from_user_page(), and mmap_lock is released prior to calling
> printk.

Ah the giant slabs of impenetrable text that reviewers are supposed to read in
detail now... LLMs really have a lot to answer for.

You (or far more likely your LLM) is just describing the (horribly broken)
code in English here.

I hate how often I have to read this stuff...

>
> To preserve backwards compatibility with monitoring tools that parse
> the existing "Killed process %d (%s) ..." message, leave that line
> untouched and emit a separate rate-limited companion line sanitised
> with %*pE when resident argument bytes are recovered. For example:
>
>     [  124.819203] Out of memory: Killed process 1482 (python3) total-vm:184320kB, anon-rss:42100kB, ...
>     [  124.819215] Out of memory: Process 1482 (python3) cmdline: /usr/bin/python3 -sP /usr/bin/firewalld --nofork --nopid
>

Doubling the output in a way that is super confusing, great! :)

> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>

This patch is broken in a million different ways.

The process gets sent SIGKILL and _then_ you race it to take the mmap read
lock, which prevents the reaper from running?

You do a lock inversion between oom_lock and the mmap_lock, and hope it'll
be OK?

You take a heavy rwsem lock while the system is under extreme memory
pressure? Which, again, prevents the reaper getting to it?

You do heavy operations during one of the most sensitive, dangerous times
for a kernel for a nice-to-have annotation?

And dump_oom_victim() already outputs memcg information, which systemd
uses, your example mentions firewalld so likely that'd _already_ give you
the kind of information you are interested in (except for mutliple
workers).

You're adding a ton of totally broken complexity then, insanely, making it
a global sysctl flag that we have to support forever as an ABI too.

You intentionally abuse folio_walk_start() to do _what its kdoc tells you
not to_:

 * This function must *not* be used as a naive replacement for
 * get_user_pages() / pin_user_pages(), especially not to perform DMA or
 * to carelessly modify page content. This function may *only* be used to grab
 * short-term folio references, never to grab long-term folio references.

You're (or more likely your LLM) is literally copy/pasting code from
__access_remote_vm() combined with this mad abuse of folio_walk_*() as a
proto-GUP to... get more info about a killed process.

You also copy/pasted wrong so this is even more subtly broken.

You are also potentially exposing sensitive information. Your ratelimiting
is broken.

Oh and of course, you add 256 bytes to the VERY limited kernel stack at the
point of an OOMK.

I mean I could go on. Even the concept here is fundamentally broken, so
please don't waste our time with respins.

Thanks.

> ---
>  Documentation/admin-guide/sysctl/vm.rst |  30 ++++
>  mm/oom_kill.c                           | 206 ++++++++++++++++++++++++
>  2 files changed, 236 insertions(+)

Of course it's also a massive patch...

--
Cheers, Lorenzo
