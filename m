Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F418E223336;
	Fri, 10 Jan 2025 22:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736547987; cv=none; b=jZFTbNGZUXL0xkhREan6diYDzPq/cgHy0jo9w2i1vwCcdDRgB1VdXzidwFfA4Y47eRpzrm3ZecqsLiy05R65m07rZAKdCmATDxO1iw3Oos/7uY8b/OIvH73oP+7bIQ1hGuTB0IAw6f41Rkr5oU7zHRYJaxp6/rS3070uiSH74ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736547987; c=relaxed/simple;
	bh=9SLn3TzGhIFWZoDOEys0+yUzASUbKFAejyO03fxzr+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZqxXbWihjUWMusqYj/7vvCQ7QpuNchpN/z6sbBHQO1nmAek//bTRy6X0vZos2K24XU4RiwqfAijYpFWgQwibmWYYgbGxulKJL46edqWS/IOEK3dw5ot9qYSp81OYScH+ZVB91H1mOBGM1q1I5AgxPBTN9jxWS1qv5poYCp8gpfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=yaIXwGTw; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=HBG+h87d; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=yaIXwGTw; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=HBG+h87d; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="yaIXwGTw";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="HBG+h87d";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="yaIXwGTw";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="HBG+h87d"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F23DE1F37C;
	Fri, 10 Jan 2025 22:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736547982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XrUJqvSKua1pTOltZwf101kBSilLp8nnmoZG5OyBtnI=;
	b=yaIXwGTwVU5uVMjT+fWUcdUb5TFFIMNhtXTNPWzD12Db7xntFIomus1yulitR/mTySxxWG
	IUmakO+2w4g+F5SuZrAg/797k5w+5hwHAR0h11QjxG2DKiO/S411FclNUCt1dph28p4USw
	k+O26jbZw+Y9viOi1KWglvNGnrt/C5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736547982;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XrUJqvSKua1pTOltZwf101kBSilLp8nnmoZG5OyBtnI=;
	b=HBG+h87d/R4yC3hhbs9L/gL0BSmN44isGf/Wf63Sn8beOoUG1R1PfFq8U8oshhPiSEq6ez
	P5ftxcqG4Cty+TCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736547982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XrUJqvSKua1pTOltZwf101kBSilLp8nnmoZG5OyBtnI=;
	b=yaIXwGTwVU5uVMjT+fWUcdUb5TFFIMNhtXTNPWzD12Db7xntFIomus1yulitR/mTySxxWG
	IUmakO+2w4g+F5SuZrAg/797k5w+5hwHAR0h11QjxG2DKiO/S411FclNUCt1dph28p4USw
	k+O26jbZw+Y9viOi1KWglvNGnrt/C5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736547982;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XrUJqvSKua1pTOltZwf101kBSilLp8nnmoZG5OyBtnI=;
	b=HBG+h87d/R4yC3hhbs9L/gL0BSmN44isGf/Wf63Sn8beOoUG1R1PfFq8U8oshhPiSEq6ez
	P5ftxcqG4Cty+TCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE87D13A86;
	Fri, 10 Jan 2025 22:26:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YuFfKY2egWeeegAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 10 Jan 2025 22:26:21 +0000
Message-ID: <bf7fd920-4c51-44f3-bf3e-8cfe2bb5f8a6@suse.cz>
Date: Fri, 10 Jan 2025 23:26:21 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/16] mm: replace vm_lock and detached flag with a
 reference count
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
 liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com,
 hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
 mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
 oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
 dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
 lokeshgidra@google.com, minchan@google.com, jannh@google.com,
 shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com,
 klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com
References: <20250109023025.2242447-1-surenb@google.com>
 <20250109023025.2242447-12-surenb@google.com>
 <95e9d80e-6c19-4a1f-9c21-307006858dff@suse.cz>
 <CAJuCfpH_=JRSXHDsw1QSYxUk6Q=gSH26_Fm0bqCmSKR-NqDj4Q@mail.gmail.com>
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
In-Reply-To: <CAJuCfpH_=JRSXHDsw1QSYxUk6Q=gSH26_Fm0bqCmSKR-NqDj4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.cz:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,oracle.com,suse.com,cmpxchg.org,gmail.com,intel.com,techsingularity.net,redhat.com,stgolabs.net,kernel.org,sina.com,google.com,linux.dev,soleen.com,lwn.net,vger.kernel.org,kvack.org,android.com];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLumbhs4xhzuuihrchnpuyb6qu)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

On 1/10/25 16:56, Suren Baghdasaryan wrote:
>> > --- a/mm/memory.c
>> > +++ b/mm/memory.c
>> > @@ -6370,9 +6370,41 @@ struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
>> >  #endif
>> >
>> >  #ifdef CONFIG_PER_VMA_LOCK
>> > +static inline bool __vma_enter_locked(struct vm_area_struct *vma, unsigned int tgt_refcnt)
>> > +{
>> > +     /*
>> > +      * If vma is detached then only vma_mark_attached() can raise the
>> > +      * vm_refcnt. mmap_write_lock prevents racing with vma_mark_attached().
>> > +      */
>> > +     if (!refcount_add_not_zero(VMA_LOCK_OFFSET, &vma->vm_refcnt))
>> > +             return false;
>> > +
>> > +     rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
>> > +     rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
>> > +                refcount_read(&vma->vm_refcnt) == tgt_refcnt,
>> > +                TASK_UNINTERRUPTIBLE);
>> > +     lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
>> > +
>> > +     return true;
>> > +}
>> > +
>> > +static inline void __vma_exit_locked(struct vm_area_struct *vma, bool *detached)
>> > +{
>> > +     *detached = refcount_sub_and_test(VMA_LOCK_OFFSET, &vma->vm_refcnt);
>> > +     rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
>> > +}
>> > +
>> >  void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
>> >  {
>> > -     down_write(&vma->vm_lock.lock);
>> > +     bool locked;
>> > +
>> > +     /*
>> > +      * __vma_enter_locked() returns false immediately if the vma is not
>> > +      * attached, otherwise it waits until refcnt is (VMA_LOCK_OFFSET + 1)
>> > +      * indicating that vma is attached with no readers.
>> > +      */
>> > +     locked = __vma_enter_locked(vma, VMA_LOCK_OFFSET + 1);
>>
>> Wonder if it would be slightly better if tgt_refcount was just 1 (or 0
>> below in vma_mark_detached()) and the VMA_LOCK_OFFSET added to it in
>> __vma_enter_locked() itself as it's the one adding it in the first place.
> 
> Well, it won't be called tgt_refcount then. Maybe "bool vma_attached"
> and inside __vma_enter_locked() we do:
> 
> unsigned int tgt_refcnt = VMA_LOCK_OFFSET + vma_attached ? 1 : 0;
> 
> Is that better?

Yeah I think so as it centralizes the target refcount logic into a single
place __vma_enter_locked().
Hm but then it's weird that __vma_start_write() would set vma_attached to
true and yet it handles also a case where it's not attached.
Maybe call the parameter "detaching" and switch the 0 and 1?
