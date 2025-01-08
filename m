Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061AA4F5E0;
	Wed,  8 Jan 2025 18:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736359556; cv=none; b=RZobnlDxKzJmSkMESt/g33AcWKi2dMsc2659XRQ1khEcrkhwc/ZHP2y+TsaS+skWKgU4yNcw7Av9LwI+jKt0VKy/YWko8RPU+qCxLqOs2uLM/3QpI8vVKaPY0ibEKfQx4eI4UjYssewBF5VwKZp1FJuNXvrHFdOpFzs6D29gsg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736359556; c=relaxed/simple;
	bh=iCjJUyHztqI8FquwVehZGazD94xzMJkUgV+MiYMdi2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZcfskK1QLnsgguz2XUlTrg2qcrBN//AbzP5srnBjRC6rLiZgYL9yqmZrIeOTuuDZgAVa1daTVI2ehw9+L/8ZMfov4XAkdTzJWUtGjEP4LxJ/Tm7Eb1yDU+b1tRp+L8Pkmr2qquWWBTun05cwY8hkfBlioVZo2HhSh63V0YfJOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=hLit5dL2; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=aeOuvTEe; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=jQyUdihh; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=qL0Csa1r; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="hLit5dL2";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="aeOuvTEe";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="jQyUdihh";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="qL0Csa1r"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ED41B1F385;
	Wed,  8 Jan 2025 18:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736359553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8o0fOIjvlsIix+BF0/4NjnEamwniCIjMH4vTxOVi3lI=;
	b=hLit5dL2W7AAv50h/R7W0IbSQQkZ4oKM6qiGKW5O71cgJlRnuomNaKUO30mdiKVs7tODrL
	vXukLWyXpvDX2qyP0EpJ8HBtnZxyIrJNISh+Hi8HhPVNyy1MC9b5nzBVncfVIYSoTqzabl
	aDR237AGchmZZOcl12lL5/ocNh3vx6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736359553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8o0fOIjvlsIix+BF0/4NjnEamwniCIjMH4vTxOVi3lI=;
	b=aeOuvTEej3Tbe7HZPEn0XJQhfkdMUqyAMDABYpCkHZScUfhDWVu05r1YrXwy8oD0QaxWJI
	+iqV67h2E9liUqBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736359552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8o0fOIjvlsIix+BF0/4NjnEamwniCIjMH4vTxOVi3lI=;
	b=jQyUdihh/dYQQ4iFONIzGDrQwvrYJUvcf+ushj8jB4qy+ZH06y70/j3l6KlBC1YjN/zsop
	J5hE1eEX8zm7b2JC3cvXUpZQnPv9XKkB6AFw2JKNolZvohNkfoQHhCLXZotvcbIiT7tbOg
	98ALsdyxrRdhOXIXtVWHBYi90S6SF5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736359552;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8o0fOIjvlsIix+BF0/4NjnEamwniCIjMH4vTxOVi3lI=;
	b=qL0Csa1rXAZzPEJoG3R0mJJn2QBYk2u4YqZq6HYuXRIO0UCzHYP4vh+DUS5oMT5iGLWDDe
	10TwO7MqJ7Zq9GCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC2521351A;
	Wed,  8 Jan 2025 18:05:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3IxCKYC+fmdIEQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 08 Jan 2025 18:05:52 +0000
Message-ID: <994f1ee6-4ab6-431f-a931-61e290afd89f@suse.cz>
Date: Wed, 8 Jan 2025 19:05:52 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/17] mm: prepare lock_vma_under_rcu() for vma reuse
 possibility
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
 <20241226170710.1159679-16-surenb@google.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSBWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBzdXNlLmN6PsLBlAQTAQoAPgIbAwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBKlA1DSZLC6OmRA9UCJPp+fMgqZkBQJkBREIBQkRadznAAoJECJPp+fMgqZkNxIQ
 ALZRqwdUGzqL2aeSavbum/VF/+td+nZfuH0xeWiO2w8mG0+nPd5j9ujYeHcUP1edE7uQrjOC
 Gs9sm8+W1xYnbClMJTsXiAV88D2btFUdU1mCXURAL9wWZ8Jsmz5ZH2V6AUszvNezsS/VIT87
 AmTtj31TLDGwdxaZTSYLwAOOOtyqafOEq+gJB30RxTRE3h3G1zpO7OM9K6ysLdAlwAGYWgJJ
 V4JqGsQ/lyEtxxFpUCjb5Pztp7cQxhlkil0oBYHkudiG8j1U3DG8iC6rnB4yJaLphKx57NuQ
 PIY0Bccg+r9gIQ4XeSK2PQhdXdy3UWBr913ZQ9AI2usid3s5vabo4iBvpJNFLgUmxFnr73SJ
 KsRh/2OBsg1XXF/wRQGBO9vRuJUAbnaIVcmGOUogdBVS9Sun/Sy4GNA++KtFZK95U7J417/J
 Hub2xV6Ehc7UGW6fIvIQmzJ3zaTEfuriU1P8ayfddrAgZb25JnOW7L1zdYL8rXiezOyYZ8Fm
 ZyXjzWdO0RpxcUEp6GsJr11Bc4F3aae9OZtwtLL/jxc7y6pUugB00PodgnQ6CMcfR/HjXlae
 h2VS3zl9+tQWHu6s1R58t5BuMS2FNA58wU/IazImc/ZQA+slDBfhRDGYlExjg19UXWe/gMcl
 De3P1kxYPgZdGE2eZpRLIbt+rYnqQKy8UxlszsBNBFsZNTUBCACfQfpSsWJZyi+SHoRdVyX5
 J6rI7okc4+b571a7RXD5UhS9dlVRVVAtrU9ANSLqPTQKGVxHrqD39XSw8hxK61pw8p90pg4G
 /N3iuWEvyt+t0SxDDkClnGsDyRhlUyEWYFEoBrrCizbmahOUwqkJbNMfzj5Y7n7OIJOxNRkB
 IBOjPdF26dMP69BwePQao1M8Acrrex9sAHYjQGyVmReRjVEtv9iG4DoTsnIR3amKVk6si4Ea
 X/mrapJqSCcBUVYUFH8M7bsm4CSxier5ofy8jTEa/CfvkqpKThTMCQPNZKY7hke5qEq1CBk2
 wxhX48ZrJEFf1v3NuV3OimgsF2odzieNABEBAAHCwXwEGAEKACYCGwwWIQSpQNQ0mSwujpkQ
 PVAiT6fnzIKmZAUCZAUSmwUJDK5EZgAKCRAiT6fnzIKmZOJGEACOKABgo9wJXsbWhGWYO7mD
 8R8mUyJHqbvaz+yTLnvRwfe/VwafFfDMx5GYVYzMY9TWpA8psFTKTUIIQmx2scYsRBUwm5VI
 EurRWKqENcDRjyo+ol59j0FViYysjQQeobXBDDE31t5SBg++veI6tXfpco/UiKEsDswL1WAr
 tEAZaruo7254TyH+gydURl2wJuzo/aZ7Y7PpqaODbYv727Dvm5eX64HCyyAH0s6sOCyGF5/p
 eIhrOn24oBf67KtdAN3H9JoFNUVTYJc1VJU3R1JtVdgwEdr+NEciEfYl0O19VpLE/PZxP4wX
 PWnhf5WjdoNI1Xec+RcJ5p/pSel0jnvBX8L2cmniYnmI883NhtGZsEWj++wyKiS4NranDFlA
 HdDM3b4lUth1pTtABKQ1YuTvehj7EfoWD3bv9kuGZGPrAeFNiHPdOT7DaXKeHpW9homgtBxj
 8aX/UkSvEGJKUEbFL9cVa5tzyialGkSiZJNkWgeHe+jEcfRT6pJZOJidSCdzvJpbdJmm+eED
 w9XOLH1IIWh7RURU7G1iOfEfmImFeC3cbbS73LQEFGe1urxvIH5K/7vX+FkNcr9ujwWuPE9b
 1C2o4i/yZPLXIVy387EjA6GZMqvQUFuSTs/GeBcv0NjIQi8867H3uLjz+mQy63fAitsDwLmR
 EP+ylKVEKb0Q2A==
In-Reply-To: <20241226170710.1159679-16-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,oracle.com,suse.com,cmpxchg.org,gmail.com,intel.com,techsingularity.net,redhat.com,stgolabs.net,kernel.org,sina.com,google.com,linux.dev,soleen.com,lwn.net,vger.kernel.org,kvack.org,android.com];
	R_RATELIMIT(0.00)[to_ip_from(RLumbhs4xhzuuihrchnpuyb6qu)];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email]
X-Spam-Flag: NO
X-Spam-Level: 

On 12/26/24 18:07, Suren Baghdasaryan wrote:
> Once we make vma cache SLAB_TYPESAFE_BY_RCU, it will be possible for a vma
> to be reused and attached to another mm after lock_vma_under_rcu() locks
> the vma. lock_vma_under_rcu() should ensure that vma_start_read() is using
> the original mm and after locking the vma it should ensure that vma->vm_mm
> has not changed from under us.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  include/linux/mm.h | 10 ++++++----
>  mm/memory.c        |  7 ++++---
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 40bbe815df11..56a7d70ca5bd 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -730,8 +730,10 @@ static inline void vma_refcount_put(struct vm_area_struct *vma)
>   * Try to read-lock a vma. The function is allowed to occasionally yield false
>   * locked result to avoid performance overhead, in which case we fall back to
>   * using mmap_lock. The function should never yield false unlocked result.
> + * False locked result is possible if mm_lock_seq overflows or if vma gets
> + * reused and attached to a different mm before we lock it.
>   */
> -static inline bool vma_start_read(struct vm_area_struct *vma)
> +static inline bool vma_start_read(struct mm_struct *mm, struct vm_area_struct *vma)
>  {
>  	int oldcnt;
>  
> @@ -742,7 +744,7 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  	 * we don't rely on for anything - the mm_lock_seq read against which we
>  	 * need ordering is below.
>  	 */
> -	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(vma->vm_mm->mm_lock_seq.sequence))
> +	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(mm->mm_lock_seq.sequence))
>  		return false;
>  
>  
> @@ -767,7 +769,7 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  	 * This pairs with RELEASE semantics in vma_end_write_all().
>  	 */
>  	if (unlikely(oldcnt & VMA_LOCK_OFFSET ||
> -		     vma->vm_lock_seq == raw_read_seqcount(&vma->vm_mm->mm_lock_seq))) {
> +		     vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
>  		vma_refcount_put(vma);
>  		return false;
>  	}
> @@ -905,7 +907,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>  
>  static inline void vma_lockdep_init(struct vm_area_struct *vma) {}
>  static inline void vma_init_lock(struct vm_area_struct *vma, bool reset_refcnt) {}
> -static inline bool vma_start_read(struct vm_area_struct *vma)
> +static inline bool vma_start_read(struct mm_struct *mm, struct vm_area_struct *vma)
>  		{ return false; }
>  static inline void vma_end_read(struct vm_area_struct *vma) {}
>  static inline void vma_start_write(struct vm_area_struct *vma) {}
> diff --git a/mm/memory.c b/mm/memory.c
> index 2def47b5dff0..9cc93c2f79f3 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -6414,7 +6414,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>  	if (!vma)
>  		goto inval;
>  
> -	if (!vma_start_read(vma))
> +	if (!vma_start_read(mm, vma))
>  		goto inval;
>  
>  	/*
> @@ -6424,8 +6424,9 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>  	 * fields are accessible for RCU readers.
>  	 */
>  
> -	/* Check since vm_start/vm_end might change before we lock the VMA */
> -	if (unlikely(address < vma->vm_start || address >= vma->vm_end))
> +	/* Check if the vma we locked is the right one. */
> +	if (unlikely(vma->vm_mm != mm ||
> +		     address < vma->vm_start || address >= vma->vm_end))
>  		goto inval_end_read;
>  
>  	rcu_read_unlock();

