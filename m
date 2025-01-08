Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C431F5422;
	Wed,  8 Jan 2025 11:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736337174; cv=none; b=lqP+kSle98szQiCzgdr2aegeXkI5mDGLP87jB1wSO36B29TsDQnVGIig8bOSsmeyL304KHiZsfL9KoKG8D3KGV2fcYw8//ltlp0C0DqolAAiLs652u3L5he4/BVOzYWCCHi0qMfOIdc9+GTPJeq0fNavYRcW2SvHSVXUjZqcDZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736337174; c=relaxed/simple;
	bh=SatAUvehyeYNc5i6rENpoR4aC9V3uHqeyL8tdslk3fM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lP6dnw6P+LeHbkbC6+qVAf3aSZqzU1PZWN1Lxgb2j1xT3FFYWgNFVc2SW8k2DTWRJLJZS/MTUCJglYlCt2om6nTOm6OEs6CPe+5ujn46ra8ce1bSE7W1LTii//b50/9Goz1SnniYf3E3cd+AGAIuINsnzOL0Z+zhg68LDDwPPuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Ptg8/Mcd; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=pt12ht0K; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xK9F51Dq; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=KGxjW8Ut; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Ptg8/Mcd";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="pt12ht0K";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xK9F51Dq";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="KGxjW8Ut"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EBDA71F385;
	Wed,  8 Jan 2025 11:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736337171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TvEtdaxaJySSjoiJaPPRkpXjE4vtepMmsLxZ6ErrqXk=;
	b=Ptg8/McdN2feG8uPWgV8k5k5stL8TZ+tcPGtN8pVpOVQ1ItQGkPKp2FfNvCFnz/pMapkg1
	wsgtjveVKN2o8imjNpgJH8NxPR03ZzQMhuc1RO40I4+9xK9d+pA6wg26GRx9oBrXOIX3VN
	ffZAFkd3TkFLxCO6TE0/gslbnSr0zBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736337171;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TvEtdaxaJySSjoiJaPPRkpXjE4vtepMmsLxZ6ErrqXk=;
	b=pt12ht0KASdEmIuY1SPsolrXZCczFjeLjkaCohQgjnZVXx5AcHlraO2qySPHnmZfPhwX2Q
	nRRnc990a0mWkxCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736337170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TvEtdaxaJySSjoiJaPPRkpXjE4vtepMmsLxZ6ErrqXk=;
	b=xK9F51DqYQKrIh9cy08N+CmATZCNSy/IjWRgXJX5M24wSSS/uxxcIW0tYtctS1Rq+1qsc8
	4kPcvHmL8VZPNmF8SKiGlWPFGpuWRIjD4mUjBu/TtrLUIE7aybrGSISd5T/DCvpJzbFQFI
	ntiPBkgRJmt1UZxM0HLq8g6F9QQCAmU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736337170;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TvEtdaxaJySSjoiJaPPRkpXjE4vtepMmsLxZ6ErrqXk=;
	b=KGxjW8UtPnrM1/jZL8tkzrtgauhbdGv9mmpNE570OpdqcmMp7oDtLN/6O6klQmiTIktGAb
	ezNXVwvSMB3d/NAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB5CE1351A;
	Wed,  8 Jan 2025 11:52:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3RiFKRJnfmebFQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 08 Jan 2025 11:52:50 +0000
Message-ID: <ec71eaa7-a5e5-4d83-a405-782d63cf5c53@suse.cz>
Date: Wed, 8 Jan 2025 12:52:50 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/17] mm: replace vm_lock and detached flag with a
 reference count
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, hannes@cmpxchg.org,
 mjguzik@gmail.com, oliver.sang@intel.com, mgorman@techsingularity.net,
 david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net,
 paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com,
 hdanton@sina.com, hughd@google.com, lokeshgidra@google.com,
 minchan@google.com, jannh@google.com, shakeel.butt@linux.dev,
 souravpanda@google.com, pasha.tatashin@soleen.com, klarasmodin@gmail.com,
 corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20241226170710.1159679-1-surenb@google.com>
 <20241226170710.1159679-13-surenb@google.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <20241226170710.1159679-13-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,oracle.com,suse.com,cmpxchg.org,gmail.com,intel.com,techsingularity.net,redhat.com,stgolabs.net,kernel.org,sina.com,google.com,linux.dev,soleen.com,lwn.net,vger.kernel.org,kvack.org,android.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLumbhs4xhzuuihrchnpuyb6qu)]
X-Spam-Flag: NO
X-Spam-Level: 

On 12/26/24 18:07, Suren Baghdasaryan wrote:
> rw_semaphore is a sizable structure of 40 bytes and consumes
> considerable space for each vm_area_struct. However vma_lock has
> two important specifics which can be used to replace rw_semaphore
> with a simpler structure:
> 1. Readers never wait. They try to take the vma_lock and fall back to
> mmap_lock if that fails.
> 2. Only one writer at a time will ever try to write-lock a vma_lock
> because writers first take mmap_lock in write mode.
> Because of these requirements, full rw_semaphore functionality is not
> needed and we can replace rw_semaphore and the vma->detached flag with
> a refcount (vm_refcnt).
> When vma is in detached state, vm_refcnt is 0 and only a call to
> vma_mark_attached() can take it out of this state. Note that unlike
> before, now we enforce both vma_mark_attached() and vma_mark_detached()
> to be done only after vma has been write-locked. vma_mark_attached()
> changes vm_refcnt to 1 to indicate that it has been attached to the vma
> tree. When a reader takes read lock, it increments vm_refcnt, unless the
> top usable bit of vm_refcnt (0x40000000) is set, indicating presence of
> a writer. When writer takes write lock, it both increments vm_refcnt and
> sets the top usable bit to indicate its presence. If there are readers,
> writer will wait using newly introduced mm->vma_writer_wait. Since all
> writers take mmap_lock in write mode first, there can be only one writer
> at a time. The last reader to release the lock will signal the writer
> to wake up.
> refcount might overflow if there are many competing readers, in which case
> read-locking will fail. Readers are expected to handle such failures.
> 
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

>   */
>  static inline bool vma_start_read(struct vm_area_struct *vma)
>  {
> +	int oldcnt;
> +
>  	/*
>  	 * Check before locking. A race might cause false locked result.
>  	 * We can use READ_ONCE() for the mm_lock_seq here, and don't need
> @@ -720,13 +745,20 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(vma->vm_mm->mm_lock_seq.sequence))
>  		return false;
>  
> -	if (unlikely(down_read_trylock(&vma->vm_lock.lock) == 0))
> +
> +	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 0, _RET_IP_);

I don't know much about lockdep, but I see that down_read() does

rwsem_acquire_read(&sem->dep_map, 0, 0, _RET_IP_);

down_read_trylock() does

rwsem_acquire_read(&sem->dep_map, 0, 1, _RET_IP_);

This is passing the down_read()-like variant but it behaves like a trylock, no?

> +	/* Limit at VMA_REF_LIMIT to leave one count for a writer */

It's mainly to not increase as much as VMA_LOCK_OFFSET bit could become
false positively set set by readers, right? The "leave one count" sounds
like an implementation detail of VMA_REF_LIMIT and will change if Liam's
suggestion is proven feasible?

> +	if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &oldcnt,
> +						      VMA_REF_LIMIT))) {
> +		rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
>  		return false;
> +	}
> +	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
>  
>  	/*
> -	 * Overflow might produce false locked result.
> +	 * Overflow of vm_lock_seq/mm_lock_seq might produce false locked result.
>  	 * False unlocked result is impossible because we modify and check
> -	 * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock_seq
> +	 * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
>  	 * modification invalidates all existing locks.
>  	 *
>  	 * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
> @@ -734,10 +766,12 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  	 * after it has been unlocked.
>  	 * This pairs with RELEASE semantics in vma_end_write_all().
>  	 */
> -	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&vma->vm_mm->mm_lock_seq))) {
> -		up_read(&vma->vm_lock.lock);
> +	if (unlikely(oldcnt & VMA_LOCK_OFFSET ||
> +		     vma->vm_lock_seq == raw_read_seqcount(&vma->vm_mm->mm_lock_seq))) {
> +		vma_refcount_put(vma);
>  		return false;
>  	}
> +
>  	return true;
>  }
>  
> @@ -749,8 +783,17 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>   */
>  static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
>  {
> +	int oldcnt;
> +
>  	mmap_assert_locked(vma->vm_mm);
> -	down_read_nested(&vma->vm_lock.lock, subclass);
> +	rwsem_acquire_read(&vma->vmlock_dep_map, subclass, 0, _RET_IP_);

Same as above?

> +	/* Limit at VMA_REF_LIMIT to leave one count for a writer */

Also

> +	if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &oldcnt,
> +						      VMA_REF_LIMIT))) {
> +		rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> +		return false;
> +	}
> +	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
>  	return true;
>  }
>  
