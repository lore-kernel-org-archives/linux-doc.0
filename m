Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4611FA15C;
	Fri, 10 Jan 2025 15:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523122; cv=none; b=ZtvGAgL09iFF72SWdf+wFWG6CDv3+KLxR2JcghhChU9AUZafvlaHOFzRuossAqHT0e5IYaAmTRd0Qt8fpKxCv7J7XmmmU70Fmb4Xa22DgtGhPKztQFooDhNW3d6DxA97usJSPW4vAf80HnNOQroF5Vv8yu5wCh1s+793HoQD40w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523122; c=relaxed/simple;
	bh=QghI/e6ViXiMT+oox1QtL/ClWIg6UWzmmyWTmKeRzT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JU48Cy3OmeQueOP1q6gNwxYSe4nta7JwxtEpGwOcYISy7pueEu6skfwjGuJtwSJJvLPg9U97929VgKFXuwHARdtRg7tNmtSnbg1ih2o6izfB9ls7RvGR+LPSPPhTA22UcQrylfpTv71exrMUN4f9fAnVTcjG7jQiaNOGDq2BQp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=pH2oRnD+; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=W0nxwvlF; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=pH2oRnD+; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=W0nxwvlF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="pH2oRnD+";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="W0nxwvlF";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="pH2oRnD+";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="W0nxwvlF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 806E11F394;
	Fri, 10 Jan 2025 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736523112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cOjdXbMeCouUJJMhhxWnsmEBcM7x7lkLxYBOlUoTpPk=;
	b=pH2oRnD+F+SzYwzOJHA0/uOn8S9GPOM76Xmhwcrk5xmcu6Hx3+65xLC74odbeDBTw5Ali+
	iKOLSdNLTB9IcAHhLZNgeRjxR23MhyTAaBTN/nKGCLckNSshsrkt9G5zCl2zC/ueyR8y6j
	EISMmNuKdZvwWV1vDOFmAH6UBqsSYSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736523112;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cOjdXbMeCouUJJMhhxWnsmEBcM7x7lkLxYBOlUoTpPk=;
	b=W0nxwvlFNSBxIig/hgj1mUPFegRTg2mTgjmmTOwQI/LJ72EEnVexj9l4w1pXwfMqwnZg1D
	+ZNmLeK8I4+3MzCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736523112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cOjdXbMeCouUJJMhhxWnsmEBcM7x7lkLxYBOlUoTpPk=;
	b=pH2oRnD+F+SzYwzOJHA0/uOn8S9GPOM76Xmhwcrk5xmcu6Hx3+65xLC74odbeDBTw5Ali+
	iKOLSdNLTB9IcAHhLZNgeRjxR23MhyTAaBTN/nKGCLckNSshsrkt9G5zCl2zC/ueyR8y6j
	EISMmNuKdZvwWV1vDOFmAH6UBqsSYSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736523112;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cOjdXbMeCouUJJMhhxWnsmEBcM7x7lkLxYBOlUoTpPk=;
	b=W0nxwvlFNSBxIig/hgj1mUPFegRTg2mTgjmmTOwQI/LJ72EEnVexj9l4w1pXwfMqwnZg1D
	+ZNmLeK8I4+3MzCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56EC013763;
	Fri, 10 Jan 2025 15:31:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oZzyFGg9gWepCQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 10 Jan 2025 15:31:52 +0000
Message-ID: <41ebce1a-9cc0-471e-ac20-25efea9a933a@suse.cz>
Date: Fri, 10 Jan 2025 16:32:52 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/16] mm: make vma cache SLAB_TYPESAFE_BY_RCU
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
 <20250109023025.2242447-16-surenb@google.com>
From: Vlastimil Babka <vbabka@suse.cz>
Content-Language: en-US
In-Reply-To: <20250109023025.2242447-16-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On 1/9/25 3:30 AM, Suren Baghdasaryan wrote:
> To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
> object reuse before RCU grace period is over will be detected by
> lock_vma_under_rcu().
> Current checks are sufficient as long as vma is detached before it is
> freed. The only place this is not currently happening is in exit_mmap().
> Add the missing vma_mark_detached() in exit_mmap().
> Another issue which might trick lock_vma_under_rcu() during vma reuse
> is vm_area_dup(), which copies the entire content of the vma into a new
> one, overriding new vma's vm_refcnt and temporarily making it appear as
> attached. This might trick a racing lock_vma_under_rcu() to operate on
> a reused vma if it found the vma before it got reused. To prevent this
> situation, we should ensure that vm_refcnt stays at detached state (0)
> when it is copied and advances to attached state only after it is added
> into the vma tree. Introduce vma_copy() which preserves new vma's
> vm_refcnt and use it in vm_area_dup(). Since all vmas are in detached
> state with no current readers when they are freed, lock_vma_under_rcu()
> will not be able to take vm_refcnt after vma got detached even if vma
> is reused.
> Finally, make vm_area_cachep SLAB_TYPESAFE_BY_RCU. This will facilitate
> vm_area_struct reuse and will minimize the number of call_rcu() calls.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

You could also drop the reset_refcnt parameter of vma_lock_init() now,
as the usage in vm_area_dup() should now be just setting 0 over 0. Maybe
a VM_WARN_ON if it's not 0 already?
And a comment in vm_area_struct definition to consider vma_copy() when
adding any new field?

> +	/*
> +	 * src->shared.rb may be modified concurrently, but the clone
> +	 * will be reinitialized.
> +	 */
> +	data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shared)));

The comment makes it sound as if we didn't need to do it at all? But I
didn't verify. If we do need it in some cases (i.e. the just allocated
vma might have garbage from previous lifetime, but src is well defined
and it's a case where it's not reinitialized afterwards) maybe the
comment should say? Or if it's either reinitialized later or zeroes at
src, we could memset() the zeroes instead of memcpying them, etc.


