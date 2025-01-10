Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0B620FABA;
	Fri, 10 Jan 2025 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736519615; cv=none; b=qqtsiFbJQ3SMtF9Ha9P10wgOWTVctyu3RA8BwXXOhc3Q50a0fSuIF41+Bdjv6IDoKhblD3lCIhCVrPSd/7EMbWl+YOillb2saPNGoIK1a/0dnzUhX18zy0heXK/8ViL8Z9SomOy+/6IVHzDhhomKJCPwXZh5nSvNduEQUVfcknw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736519615; c=relaxed/simple;
	bh=AUOJLS1WFXuSGp6gQZhjWZW3fXzMXeK65/uFwVfuyEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcBZ5HGomTE3VubNKNLB3pXQxaX6pxXJrlPbDU5WDfyX80BYHjCKWELkVsWk5CiTake5gCMAudn4YCdTcqeViH5hpp2Tl46mxeTF4OETGU+Md0sb86kJ4kJqOfBhZDXO03TK7r79biOSCletXyymZHtKEiV2FawEggqN7R+hJeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=IHL0dZWf; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=M9Au6QAM; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=IHL0dZWf; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=M9Au6QAM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="IHL0dZWf";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="M9Au6QAM";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="IHL0dZWf";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="M9Au6QAM"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4A38A211D1;
	Fri, 10 Jan 2025 14:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736519611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4C/s0MxsTOXL5AbxkJ23UHjTuZjrHS8oE31bAjfwqE=;
	b=IHL0dZWfWmcIEC7eWUsbGKhWJBj0g08H38toyl+QBJR75o0ZLMTx3x+S045LiAmIaMgv7y
	MHynxZYPAPNc3vpdqJKTBpZpjkXIKB25RcMgCCjwbg6UcxUCJO5N3R9danXKDlafgQtJJL
	Di6KR4GyvCxsovnNSFV5IITGDfTd1ug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736519611;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4C/s0MxsTOXL5AbxkJ23UHjTuZjrHS8oE31bAjfwqE=;
	b=M9Au6QAMbfF2DS53b08gz2fn8f/b2Up+1akYWHuEhviRj7rgONgUfcpaXONBNAyIHoQ1sy
	xNWjuAcpG2UxWUDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736519611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4C/s0MxsTOXL5AbxkJ23UHjTuZjrHS8oE31bAjfwqE=;
	b=IHL0dZWfWmcIEC7eWUsbGKhWJBj0g08H38toyl+QBJR75o0ZLMTx3x+S045LiAmIaMgv7y
	MHynxZYPAPNc3vpdqJKTBpZpjkXIKB25RcMgCCjwbg6UcxUCJO5N3R9danXKDlafgQtJJL
	Di6KR4GyvCxsovnNSFV5IITGDfTd1ug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736519611;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4C/s0MxsTOXL5AbxkJ23UHjTuZjrHS8oE31bAjfwqE=;
	b=M9Au6QAMbfF2DS53b08gz2fn8f/b2Up+1akYWHuEhviRj7rgONgUfcpaXONBNAyIHoQ1sy
	xNWjuAcpG2UxWUDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E45B13763;
	Fri, 10 Jan 2025 14:33:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id d5whB7svgWdDdQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 10 Jan 2025 14:33:31 +0000
Message-ID: <95e9d80e-6c19-4a1f-9c21-307006858dff@suse.cz>
Date: Fri, 10 Jan 2025 15:34:26 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/16] mm: replace vm_lock and detached flag with a
 reference count
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
 <20250109023025.2242447-12-surenb@google.com>
From: Vlastimil Babka <vbabka@suse.cz>
Content-Language: en-US
In-Reply-To: <20250109023025.2242447-12-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,oracle.com,suse.com,cmpxchg.org,gmail.com,intel.com,techsingularity.net,redhat.com,stgolabs.net,kernel.org,sina.com,google.com,linux.dev,soleen.com,lwn.net,vger.kernel.org,kvack.org,android.com];
	R_RATELIMIT(0.00)[to_ip_from(RLumbhs4xhzuuihrchnpuyb6qu)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email]
X-Spam-Flag: NO
X-Spam-Level: 

On 1/9/25 3:30 AM, Suren Baghdasaryan wrote:
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
> a writer. When writer takes write lock, it sets the top usable bit to
> indicate its presence. If there are readers, writer will wait using newly
> introduced mm->vma_writer_wait. Since all writers take mmap_lock in write
> mode first, there can be only one writer at a time. The last reader to
> release the lock will signal the writer to wake up.
> refcount might overflow if there are many competing readers, in which case
> read-locking will fail. Readers are expected to handle such failures.
> In summary:
> 1. all readers increment the vm_refcnt;
> 2. writer sets top usable (writer) bit of vm_refcnt;
> 3. readers cannot increment the vm_refcnt if the writer bit is set;
> 4. in the presence of readers, writer must wait for the vm_refcnt to drop
> to 1 (ignoring the writer bit), indicating an attached vma with no readers;
> 5. vm_refcnt overflow is handled by the readers.
> 
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

But think there's a problem that will manifest after patch 15.
Also I don't feel qualified enough about the lockdep parts though
(although I think I spotted another issue with those, below) so best if
PeterZ can review those.
Some nits below too.

> +
> +static inline void vma_refcount_put(struct vm_area_struct *vma)
> +{
> +	int oldcnt;
> +
> +	if (!__refcount_dec_and_test(&vma->vm_refcnt, &oldcnt)) {
> +		rwsem_release(&vma->vmlock_dep_map, _RET_IP_);

Shouldn't we rwsem_release always? And also shouldn't it precede the
refcount operation itself?

> +		if (is_vma_writer_only(oldcnt - 1))
> +			rcuwait_wake_up(&vma->vm_mm->vma_writer_wait);

Hmm hmm we should maybe read the vm_mm pointer before dropping the
refcount? In case this races in a way that is_vma_writer_only tests true
but the writer meanwhile finishes and frees the vma. It's safe now but
not after making the cache SLAB_TYPESAFE_BY_RCU ?

> +	}
> +}
> +

>  static inline void vma_end_read(struct vm_area_struct *vma)
>  {
>  	rcu_read_lock(); /* keeps vma alive till the end of up_read */

This should refer to vma_refcount_put(). But after fixing it I think we
could stop doing this altogether? It will no longer keep vma "alive"
with SLAB_TYPESAFE_BY_RCU.

> -	up_read(&vma->vm_lock.lock);
> +	vma_refcount_put(vma);
>  	rcu_read_unlock();
>  }
>  

<snip>

> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -6370,9 +6370,41 @@ struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
>  #endif
>  
>  #ifdef CONFIG_PER_VMA_LOCK
> +static inline bool __vma_enter_locked(struct vm_area_struct *vma, unsigned int tgt_refcnt)
> +{
> +	/*
> +	 * If vma is detached then only vma_mark_attached() can raise the
> +	 * vm_refcnt. mmap_write_lock prevents racing with vma_mark_attached().
> +	 */
> +	if (!refcount_add_not_zero(VMA_LOCK_OFFSET, &vma->vm_refcnt))
> +		return false;
> +
> +	rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
> +	rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
> +		   refcount_read(&vma->vm_refcnt) == tgt_refcnt,
> +		   TASK_UNINTERRUPTIBLE);
> +	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
> +
> +	return true;
> +}
> +
> +static inline void __vma_exit_locked(struct vm_area_struct *vma, bool *detached)
> +{
> +	*detached = refcount_sub_and_test(VMA_LOCK_OFFSET, &vma->vm_refcnt);
> +	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> +}
> +
>  void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
>  {
> -	down_write(&vma->vm_lock.lock);
> +	bool locked;
> +
> +	/*
> +	 * __vma_enter_locked() returns false immediately if the vma is not
> +	 * attached, otherwise it waits until refcnt is (VMA_LOCK_OFFSET + 1)
> +	 * indicating that vma is attached with no readers.
> +	 */
> +	locked = __vma_enter_locked(vma, VMA_LOCK_OFFSET + 1);

Wonder if it would be slightly better if tgt_refcount was just 1 (or 0
below in vma_mark_detached()) and the VMA_LOCK_OFFSET added to it in
__vma_enter_locked() itself as it's the one adding it in the first place.

