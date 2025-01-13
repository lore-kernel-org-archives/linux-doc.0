Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F331474B8;
	Mon, 13 Jan 2025 20:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736800381; cv=none; b=F4N0yVYJVzaV5hUAA+V7ZPZnb/dfYW7oNpMm7sldWfD859HDGPeJTjtH0FH/9RSPEmzcKmBJt8TCV5KYuaZrf3u36dgxbCgsdrjocjetEpQCVkewQpHPEHLZt3L9pb1opMk760KRHuicHartfwACyQbMjJ8H1D6o0vaEnKKvlm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736800381; c=relaxed/simple;
	bh=02EVbgEIkv+TpZo5oATdV7vIbtLZII19Wz4rKwNRBtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NF112HaRy9eR65qPxOPxUYRQdCpmsoQj10iLx+osoHYkWTB95Uj91J7cku6gaepzDMm6QmIxUZCQL3+K3cAaX02qwXKTWYjmVmfrFqdCVCvTFm42Q7UyRyyCPTM1Qe3ASp6jOaqKigv5blG7gfd/8U0gbS/bfY7kwA+iH5W35EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=bHiiYP7y; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=pWsu9/hK; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=rKTJUx1O; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=LNLdbrIZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="bHiiYP7y";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="pWsu9/hK";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="rKTJUx1O";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="LNLdbrIZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D29341F444;
	Mon, 13 Jan 2025 20:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736800376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lhkgTJFRVi4G4gMcbxaL+Ocv7FJv2Sp6XUMmKXIFO5k=;
	b=bHiiYP7y0YkuVH6miRX/ukdoFa2UklDXgytXj28oAigyHdaCkCjOAJMpdY8sqfuMlqLR1t
	TlBOXl8rD0esxvaaFfE9Y5ctB9f3mIzrEFppJiYM71iI3wWRRtgw4NkUxKdKUXFALNY1Qh
	ALggcrrNK7YB9B5lKqbYGVhYRT3w3tI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736800376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lhkgTJFRVi4G4gMcbxaL+Ocv7FJv2Sp6XUMmKXIFO5k=;
	b=pWsu9/hKcD46byFd/8UL0CidBACkvz93XMRxP4Tw1q/mF5A/MPMftNKNZh+Du01T53SJmr
	L7c8PoGa+gxjLfAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=rKTJUx1O;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=LNLdbrIZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736800375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lhkgTJFRVi4G4gMcbxaL+Ocv7FJv2Sp6XUMmKXIFO5k=;
	b=rKTJUx1OPHyeVTQyWgtlsr9t2fEdZ4iGZtY2nTQZ0QmZalGZalc76bcKLMzSlFKeDs72bb
	zJwOlo8WeZ5BuJMnfLsYOilDrxyQD+7ajYWvA8J6uWfTFZVtr62K64Kn5I0K1dU+y6OAe5
	3imT4Qxq0M778JJ1YNn3Tm48GcNpQf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736800375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lhkgTJFRVi4G4gMcbxaL+Ocv7FJv2Sp6XUMmKXIFO5k=;
	b=LNLdbrIZekatBgV+m6IK2GysFgmUWq2QzoES04OuI+Yi85TBAwraLLh1PW9o3dtdqQzcxP
	DtMTw7qBw/Sz6BCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 890B713310;
	Mon, 13 Jan 2025 20:32:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tpARIHd4hWe1KwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 13 Jan 2025 20:32:55 +0000
Message-ID: <ead9d96f-6cc0-46bb-9f08-585bd1b152e3@suse.cz>
Date: Mon, 13 Jan 2025 21:32:55 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/17] mm: mark vmas detached upon exit
To: Suren Baghdasaryan <surenb@google.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
 liam.howlett@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com,
 hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
 mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
 oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
 dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
 lokeshgidra@google.com, minchan@google.com, jannh@google.com,
 shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com,
 klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-6-surenb@google.com>
 <5d46531b-570b-4f81-90f3-2fb157664f87@lucifer.local>
 <CAJuCfpGJu88XgJUJ45aSPQNfUw4UuBRtGzB4HSybiP8xzyUTPQ@mail.gmail.com>
 <15720844-b970-4b37-b475-bf6e7c72113e@lucifer.local>
 <CAJuCfpEYOJayU7xcpw2VgSYRwB4sNSdxFE28j9GKu_5OvPL6VQ@mail.gmail.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <CAJuCfpEYOJayU7xcpw2VgSYRwB4sNSdxFE28j9GKu_5OvPL6VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D29341F444
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
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,oracle.com,gmail.com,suse.com,cmpxchg.org,intel.com,techsingularity.net,redhat.com,stgolabs.net,kernel.org,sina.com,google.com,linux.dev,soleen.com,lwn.net,vger.kernel.org,kvack.org,android.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLk41rrgs15z4i1nmqiwtynpyh)];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

On 1/13/25 20:11, Suren Baghdasaryan wrote:
> On Mon, Jan 13, 2025 at 9:13 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
>>
>> On Mon, Jan 13, 2025 at 09:02:50AM -0800, Suren Baghdasaryan wrote:
>> > On Mon, Jan 13, 2025 at 4:05 AM Lorenzo Stoakes
>> > <lorenzo.stoakes@oracle.com> wrote:
>> > >
>> > > On Fri, Jan 10, 2025 at 08:25:52PM -0800, Suren Baghdasaryan wrote:
>> > > > When exit_mmap() removes vmas belonging to an exiting task, it does not
>> > > > mark them as detached since they can't be reached by other tasks and they
>> > > > will be freed shortly. Once we introduce vma reuse, all vmas will have to
>> > > > be in detached state before they are freed to ensure vma when reused is
>> > > > in a consistent state. Add missing vma_mark_detached() before freeing the
>> > > > vma.
>> > >
>> > > Hmm this really makes me worry that we'll see bugs from this detached
>> > > stuff, do we make this assumption anywhere else I wonder?
>> >
>> > This is the only place which does not currently detach the vma before
>> > freeing it. If someone tries adding a case like that in the future,
>> > they will be met with vma_assert_detached() inside vm_area_free().
>>
>> OK good to know!
>>
>> Again, I wonder if we should make these assertions stronger as commented
>> elsewhere, because if we see them in production isn't that worth an actual
>> non-debug WARN_ON_ONCE()?
> 
> Sure. I'll change vma_assert_attached()/vma_assert_detached() to use
> WARN_ON_ONCE() and to return a bool (see also my reply in the patch
> [0/17]).

So is this a case of "someone might introduce code later that will violate
them" as alluded to above? Unconditional WARN_ON_ONCE seems too much then.

In general it's not easy to determine how paranoid we should be in non-debug
code, but I'm not sure what's the need here specifically.

