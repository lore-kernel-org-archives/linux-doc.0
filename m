Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADF02309A5;
	Wed, 15 Jan 2025 07:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736927942; cv=none; b=DyIPoPstBT9n0PPmjw2R1tUOJz8VqGp9UAvfQCtZfSxHpwaz7lPWJArq914aM62PcBDQ3sUcIJcMm1j/FAdpxfbHzprAz3YA/n84j0KfiQzjaAGYflKlBEK86FwoVy7KfQrJBxo0r8wF9nA+WyWQcQlpvtARJK55zeAyMCodf5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736927942; c=relaxed/simple;
	bh=kF0QIeLjQfEmGPTMcLJhebMr09NUb8kFL4rAQONktC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2Lqwv9GpSAAUyKms6SZZzaywnCZ7IAx6/61kU7smElJMSmYd7voNJ7LPfld7Z3ClBAUgqMbEFZ4YymdhTK8wmMk3XKe1BigjgJkW2onfwlNwfF98+9v4KcwKAhDj8L8nKPzUCrwzCtAwuH9e/rIbiqiPs3m7vChbb+gSiP8fLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=n4LHfpQ4; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Z+cX82dj; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=DAvsM0Bo; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=g9aCpjkf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="n4LHfpQ4";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Z+cX82dj";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="DAvsM0Bo";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="g9aCpjkf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E2F7E2121C;
	Wed, 15 Jan 2025 07:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736927939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=77hToCCQTjMUJefmJRXkwdMJTQotq0Qw6hZfeafiZSU=;
	b=n4LHfpQ4lE3F+al+jqti8go6JMXxvcYd9QHBNspAhhhsYkMstPR90dX4o+2rkbYIeybAgs
	GmTkANW4cT3Q3e6Cgk4GrTSir/3UZEud+WMNf7eQY0ZLz4VsvttcWPMQkxtqYUKmsoySy/
	7eVUWJdmqFrtz4FOXXk80tMiW6Jgo6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736927939;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=77hToCCQTjMUJefmJRXkwdMJTQotq0Qw6hZfeafiZSU=;
	b=Z+cX82djaUmmTfIMCup/6JL3+n/ZeGid4e3tsVeod9F163LoBiPoo7s7YfJ0W1egpTS3iZ
	3iCqN6Xui+B19rAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736927938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=77hToCCQTjMUJefmJRXkwdMJTQotq0Qw6hZfeafiZSU=;
	b=DAvsM0BoGdtP0yphEJwJB5cfkNnv0a7xv2oDF3I/vVVuip9cv7fKhbnknDprHD13jKKmhr
	GZl6HqzVFlq7Ckf+FUy7hCpGOU0DnLEWcYzqnLDtAX8BqFbP4AsblYUp9peTTgptISvKDm
	UOedXd1z+Gx6jTZGqbKH2UwKwmYFN0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736927938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=77hToCCQTjMUJefmJRXkwdMJTQotq0Qw6hZfeafiZSU=;
	b=g9aCpjkf35JVJ/MoU6nP1TmgKTa7g+aVIwKRrS8cwgABcnmRTSi86ROMDX7Rx12NGQew3j
	9wtUcII+XjGt/qCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F5B6139CB;
	Wed, 15 Jan 2025 07:58:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZC2XJsJqh2dicQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 15 Jan 2025 07:58:58 +0000
Message-ID: <edeb55ab-bbef-4542-ac41-b07bfaaf9b96@suse.cz>
Date: Wed, 15 Jan 2025 08:58:58 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/17] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: Suren Baghdasaryan <surenb@google.com>,
 Wei Yang <richard.weiyang@gmail.com>, willy@infradead.org
Cc: akpm@linux-foundation.org, peterz@infradead.org, liam.howlett@oracle.com,
 lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com,
 hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
 mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
 oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
 dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
 lokeshgidra@google.com, minchan@google.com, jannh@google.com,
 shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com,
 klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-17-surenb@google.com>
 <20250115022703.hqbqdqawvqgrfgxb@master>
 <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_TO(0.00)[google.com,gmail.com,infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,oracle.com,gmail.com,suse.com,cmpxchg.org,intel.com,techsingularity.net,redhat.com,stgolabs.net,kernel.org,sina.com,google.com,linux.dev,soleen.com,lwn.net,vger.kernel.org,kvack.org,android.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLumbhs4xhzuuihrchnpuyb6qu)]
X-Spam-Score: -2.80
X-Spam-Flag: NO

On 1/15/25 04:15, Suren Baghdasaryan wrote:
> On Tue, Jan 14, 2025 at 6:27 PM Wei Yang <richard.weiyang@gmail.com> wrote:
>>
>> On Fri, Jan 10, 2025 at 08:26:03PM -0800, Suren Baghdasaryan wrote:
>>
>> >diff --git a/kernel/fork.c b/kernel/fork.c
>> >index 9d9275783cf8..151b40627c14 100644
>> >--- a/kernel/fork.c
>> >+++ b/kernel/fork.c
>> >@@ -449,6 +449,42 @@ struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
>> >       return vma;
>> > }
>> >
>> >+static void vm_area_init_from(const struct vm_area_struct *src,
>> >+                            struct vm_area_struct *dest)
>> >+{
>> >+      dest->vm_mm = src->vm_mm;
>> >+      dest->vm_ops = src->vm_ops;
>> >+      dest->vm_start = src->vm_start;
>> >+      dest->vm_end = src->vm_end;
>> >+      dest->anon_vma = src->anon_vma;
>> >+      dest->vm_pgoff = src->vm_pgoff;
>> >+      dest->vm_file = src->vm_file;
>> >+      dest->vm_private_data = src->vm_private_data;
>> >+      vm_flags_init(dest, src->vm_flags);
>> >+      memcpy(&dest->vm_page_prot, &src->vm_page_prot,
>> >+             sizeof(dest->vm_page_prot));
>> >+      /*
>> >+       * src->shared.rb may be modified concurrently when called from
>> >+       * dup_mmap(), but the clone will reinitialize it.
>> >+       */
>> >+      data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shared)));
>> >+      memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
>> >+             sizeof(dest->vm_userfaultfd_ctx));
>> >+#ifdef CONFIG_ANON_VMA_NAME
>> >+      dest->anon_name = src->anon_name;
>> >+#endif
>> >+#ifdef CONFIG_SWAP
>> >+      memcpy(&dest->swap_readahead_info, &src->swap_readahead_info,
>> >+             sizeof(dest->swap_readahead_info));
>> >+#endif
>> >+#ifndef CONFIG_MMU
>> >+      dest->vm_region = src->vm_region;
>> >+#endif
>> >+#ifdef CONFIG_NUMA
>> >+      dest->vm_policy = src->vm_policy;
>> >+#endif
>> >+}
>>
>> Would this be difficult to maintain? We should make sure not miss or overwrite
>> anything.
> 
> Yeah, it is less maintainable than a simple memcpy() but I did not
> find a better alternative.

Willy knows one but refuses to share it :(

> I added a warning above the struct
> vm_area_struct definition to update this function every time we change
> that structure. Not sure if there is anything else I can do to help
> with this.
> 
>>
>> --
>> Wei Yang
>> Help you, Help me

