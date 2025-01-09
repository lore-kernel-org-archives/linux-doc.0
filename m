Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04E017C60;
	Thu,  9 Jan 2025 13:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736430024; cv=none; b=ogvYoXTXFpWQuFklF2S9v4Cjudf99164Yq/XqRSyOUt7hcz1AbfPr11v0PlMsA3aNupR47n0Gqj8qdcfFlA59dCfDRU8xmY7SZJruuFPW8wNSPQmkiKyaiboQDry1sBSm+6JkU/Ovi/TofXYgAuwnmdcrOR5bpD9b2DYiweu4Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736430024; c=relaxed/simple;
	bh=evduFUFGB49o0+lsBTTkj60D7OMYapfKNiXTF0WDxII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qk/X0dqY4w/0Y6jxPfsUhdv9C3NCMcmo766AKRbbwQdmTGtcDHGj/GrwktRi3j2j1Cub1l4Zz3m3pBRBGeleEu1d550E0JosufaLK7HowqRv4cQ7yFwBlI0fciQpw6b1WLzypKzYyyctE1GVzX7wU2XYQPLIZk3RxUZxq9Cf9+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=kw3bjasH; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=AycUSCNC; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=kw3bjasH; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=AycUSCNC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="kw3bjasH";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="AycUSCNC";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="kw3bjasH";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="AycUSCNC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8B2BB1F393;
	Thu,  9 Jan 2025 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736430019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPHGvY4Fd8PiCLRoxt419zkjl6lX8bZRrdha+b6xjAk=;
	b=kw3bjasHl7jti1opumZ+gs/RedaUtukmbEBs6Ku9ivAlyHR0IyMEdRFzrUo3eroLx8LqKk
	8a4U4qp3VxI/5FkGsbHQCbGAeL2jpSoBbZW2gyq0jmC/Tsk5/9Sjd5qRI0lfEbOVEUmtpy
	eJrmiuCipNPRXTkUDzYkORjaztgB/pg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736430019;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPHGvY4Fd8PiCLRoxt419zkjl6lX8bZRrdha+b6xjAk=;
	b=AycUSCNCV8XWqCC7pDY1LWIk/HclWvYfUCLJgjq00yvmJqN5pZdWvh1WHRq6dC78pdwHg/
	HRrg6CdWyy//zHBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=kw3bjasH;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=AycUSCNC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736430019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPHGvY4Fd8PiCLRoxt419zkjl6lX8bZRrdha+b6xjAk=;
	b=kw3bjasHl7jti1opumZ+gs/RedaUtukmbEBs6Ku9ivAlyHR0IyMEdRFzrUo3eroLx8LqKk
	8a4U4qp3VxI/5FkGsbHQCbGAeL2jpSoBbZW2gyq0jmC/Tsk5/9Sjd5qRI0lfEbOVEUmtpy
	eJrmiuCipNPRXTkUDzYkORjaztgB/pg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736430019;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPHGvY4Fd8PiCLRoxt419zkjl6lX8bZRrdha+b6xjAk=;
	b=AycUSCNCV8XWqCC7pDY1LWIk/HclWvYfUCLJgjq00yvmJqN5pZdWvh1WHRq6dC78pdwHg/
	HRrg6CdWyy//zHBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5DF3C13876;
	Thu,  9 Jan 2025 13:40:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9o+2FsPRf2eeUAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 09 Jan 2025 13:40:19 +0000
Message-ID: <52ecd3fa-5978-4f4b-b969-c42b00a5b885@suse.cz>
Date: Thu, 9 Jan 2025 14:41:17 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/16] move per-vma lock into vm_area_struct
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, hannes@cmpxchg.org,
 mjguzik@gmail.com, oliver.sang@intel.com, mgorman@techsingularity.net,
 david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net,
 paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com,
 hdanton@sina.com, hughd@google.com, lokeshgidra@google.com,
 minchan@google.com, jannh@google.com, shakeel.butt@linux.dev,
 souravpanda@google.com, pasha.tatashin@soleen.com, klarasmodin@gmail.com,
 richard.weiyang@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20250109023025.2242447-1-surenb@google.com>
From: Vlastimil Babka <vbabka@suse.cz>
Content-Language: en-US
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8B2BB1F393
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,oracle.com,suse.com,cmpxchg.org,gmail.com,intel.com,techsingularity.net,redhat.com,stgolabs.net,kernel.org,sina.com,google.com,linux.dev,soleen.com,lwn.net,vger.kernel.org,kvack.org,android.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	R_RATELIMIT(0.00)[to_ip_from(RLk41rrgs15z4i1nmqiwtynpyh)];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Btw the subject became rather incomplete given all the series does :)

On 1/9/25 3:30 AM, Suren Baghdasaryan wrote:
> Back when per-vma locks were introduces, vm_lock was moved out of
> vm_area_struct in [1] because of the performance regression caused by
> false cacheline sharing. Recent investigation [2] revealed that the
> regressions is limited to a rather old Broadwell microarchitecture and
> even there it can be mitigated by disabling adjacent cacheline
> prefetching, see [3].
> Splitting single logical structure into multiple ones leads to more
> complicated management, extra pointer dereferences and overall less
> maintainable code. When that split-away part is a lock, it complicates
> things even further. With no performance benefits, there are no reasons
> for this split. Merging the vm_lock back into vm_area_struct also allows
> vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
> This patchset:
> 1. moves vm_lock back into vm_area_struct, aligning it at the cacheline
> boundary and changing the cache to be cacheline-aligned to minimize
> cacheline sharing;
> 2. changes vm_area_struct initialization to mark new vma as detached until
> it is inserted into vma tree;
> 3. replaces vm_lock and vma->detached flag with a reference counter;
> 4. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for their
> reuse and to minimize call_rcu() calls.
> 
> Pagefault microbenchmarks show performance improvement:
> Hmean     faults/cpu-1    507926.5547 (   0.00%)   506519.3692 *  -0.28%*
> Hmean     faults/cpu-4    479119.7051 (   0.00%)   481333.6802 *   0.46%*
> Hmean     faults/cpu-7    452880.2961 (   0.00%)   455845.6211 *   0.65%*
> Hmean     faults/cpu-12   347639.1021 (   0.00%)   352004.2254 *   1.26%*
> Hmean     faults/cpu-21   200061.2238 (   0.00%)   229597.0317 *  14.76%*
> Hmean     faults/cpu-30   145251.2001 (   0.00%)   164202.5067 *  13.05%*
> Hmean     faults/cpu-48   106848.4434 (   0.00%)   120641.5504 *  12.91%*
> Hmean     faults/cpu-56    92472.3835 (   0.00%)   103464.7916 *  11.89%*
> Hmean     faults/sec-1    507566.1468 (   0.00%)   506139.0811 *  -0.28%*
> Hmean     faults/sec-4   1880478.2402 (   0.00%)  1886795.6329 *   0.34%*
> Hmean     faults/sec-7   3106394.3438 (   0.00%)  3140550.7485 *   1.10%*
> Hmean     faults/sec-12  4061358.4795 (   0.00%)  4112477.0206 *   1.26%*
> Hmean     faults/sec-21  3988619.1169 (   0.00%)  4577747.1436 *  14.77%*
> Hmean     faults/sec-30  3909839.5449 (   0.00%)  4311052.2787 *  10.26%*
> Hmean     faults/sec-48  4761108.4691 (   0.00%)  5283790.5026 *  10.98%*
> Hmean     faults/sec-56  4885561.4590 (   0.00%)  5415839.4045 *  10.85%*

Given how patch 2 discusses memory growth due to moving the lock, should
also patch 11 discuss how the replacement with refcount reduces the
memory footprint? And/or the cover letter could summarize the impact of
the whole series in that aspect? Perhaps the refcount doesn't reduce
anything as it's smaller but sits alone in the cacheline? Could it be
grouped with some non-hot fields instead as a followup, so could we get
to <=192 (non-debug) size without impacting performance?

> Changes since v7 [4]:
> - Removed additional parameter for vma_iter_store() and introduced
> vma_iter_store_attached() instead, per Vlastimil Babka and
> Liam R. Howlett
> - Fixed coding style nits, per Vlastimil Babka
> - Added Reviewed-bys and Acked-bys, per Vlastimil Babka
> - Added Reviewed-bys and Acked-bys, per Liam R. Howlett
> - Added Acked-by, per Davidlohr Bueso
> - Removed unnecessary patch changeing nommu.c
> - Folded a fixup patch [5] into the patch it was fixing
> - Changed calculation in __refcount_add_not_zero_limited() to avoid
> overflow, to change the limit to be inclusive and to use INT_MAX to
> indicate no limits, per Vlastimil Babka and Matthew Wilcox
> - Folded a fixup patch [6] into the patch it was fixing
> - Added vm_refcnt rules summary in the changelog, per Liam R. Howlett
> - Changed writers to not increment vm_refcnt and adjusted VMA_REF_LIMIT
> to not reserve one count for a writer, per Liam R. Howlett
> - Changed vma_refcount_put() to wake up writers only when the last reader
> is leaving, per Liam R. Howlett
> - Fixed rwsem_acquire_read() parameters when read-locking a vma to match
> the way down_read_trylock() does lockdep, per Vlastimil Babka
> - Folded vma_lockdep_init() into vma_lock_init() for simplicity
> - Brought back vma_copy() to keep vm_refcount at 0 during reuse,
> per Vlastimil Babka
> 
> What I did not include in this patchset:
> - Liam's suggestion to change dump_vma() output since it's unclear to me
> how it should look like. The patch is for debug only and not critical for
> the rest of the series, we can change the output later or even drop it if
> necessary.
> 
> [1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google.com/
> [2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
> [3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT_kbfP_pR+-2g@mail.gmail.com/
> [4] https://lore.kernel.org/all/20241226170710.1159679-1-surenb@google.com/
> [5] https://lore.kernel.org/all/20250107030415.721474-1-surenb@google.com/
> [6] https://lore.kernel.org/all/20241226200335.1250078-1-surenb@google.com/
> 
> Patchset applies over mm-unstable after reverting v7
> (current SHA range: 588f0086398e - fb2270654630)
> 
> Suren Baghdasaryan (16):
>   mm: introduce vma_start_read_locked{_nested} helpers
>   mm: move per-vma lock into vm_area_struct
>   mm: mark vma as detached until it's added into vma tree
>   mm: introduce vma_iter_store_attached() to use with attached vmas
>   mm: mark vmas detached upon exit
>   types: move struct rcuwait into types.h
>   mm: allow vma_start_read_locked/vma_start_read_locked_nested to fail
>   mm: move mmap_init_lock() out of the header file
>   mm: uninline the main body of vma_start_write()
>   refcount: introduce __refcount_{add|inc}_not_zero_limited
>   mm: replace vm_lock and detached flag with a reference count
>   mm/debug: print vm_refcnt state when dumping the vma
>   mm: remove extra vma_numab_state_init() call
>   mm: prepare lock_vma_under_rcu() for vma reuse possibility
>   mm: make vma cache SLAB_TYPESAFE_BY_RCU
>   docs/mm: document latest changes to vm_lock
> 
>  Documentation/mm/process_addrs.rst |  44 +++++----
>  include/linux/mm.h                 | 152 ++++++++++++++++++++++-------
>  include/linux/mm_types.h           |  36 ++++---
>  include/linux/mmap_lock.h          |   6 --
>  include/linux/rcuwait.h            |  13 +--
>  include/linux/refcount.h           |  20 +++-
>  include/linux/slab.h               |   6 --
>  include/linux/types.h              |  12 +++
>  kernel/fork.c                      | 128 +++++++++++-------------
>  mm/debug.c                         |  12 +++
>  mm/init-mm.c                       |   1 +
>  mm/memory.c                        |  94 +++++++++++++++---
>  mm/mmap.c                          |   3 +-
>  mm/userfaultfd.c                   |  32 +++---
>  mm/vma.c                           |  23 ++---
>  mm/vma.h                           |  15 ++-
>  tools/testing/vma/linux/atomic.h   |   5 +
>  tools/testing/vma/vma_internal.h   |  93 ++++++++----------
>  18 files changed, 435 insertions(+), 260 deletions(-)
> 

