Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A3F24B254;
	Fri, 10 Jan 2025 22:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736547271; cv=none; b=I2pr/73lfhSK3t8cBq23/bu4e+dPy1J5J9Stf/LmcRCqpb7mWlg1Y8v5J3DAFCo4NBW+6sBlB4qVRsA2N5zluQIGEyWsAwGDSOTTuQVaH5Tq9WJzk/JKZDU4c6XupJcMGIzkvUcOdoq6flmBH3Ph2/nnBduKVPIZE2cD+vdLXTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736547271; c=relaxed/simple;
	bh=Fjz9Rq5xOxUNFT+QV5ywh7Pml3c1LJaIYOKW2eqU0cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4dNZv/hKA+X6hl0/g+78jsxMRubmBZ+dWbwx1PwDQIUnlRjA8WWrC4/6nyho1G0qoWbb/jAF3LcUVKHZrstBWFQMKtGFsw7HnY/FQxmQESuZBCISYp8x/URNvgEfvJlFppYbi6gAQemJ2M/VFZc3q02rYEIYVZORHgQ93trJh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Uz++8OA/; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=nutB2144; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=OoIKBSBW; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9Vzcdyqn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Uz++8OA/";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="nutB2144";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="OoIKBSBW";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9Vzcdyqn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DA1111F37C;
	Fri, 10 Jan 2025 22:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736547264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9fCOLrPZKmNtYtn9PSY8KZegUu8wjK4R3eSGZGp0IZ8=;
	b=Uz++8OA/Z3v+N/USU2yJaUB+Dp6QOTIh7YpPH7M8J9CGZiU1QXZfir7N40VkVDbUmMf9dt
	uOw4+HKj2dsq/Hf1hJ77d2VjXQ3FHXJL67Ty1DDwkBxxou3vamhVSsLZ5nNihVuQDnvhC9
	MurR/VBGGuaMSabd/suNpUERBspPlgY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736547264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9fCOLrPZKmNtYtn9PSY8KZegUu8wjK4R3eSGZGp0IZ8=;
	b=nutB21443HQpUNvP+mheRsFd7LsQIBE/iRSwWwjhT4Usn2B2setpJzvTEJhyaM0I0xB+Rc
	Do2E+ZTQCmBx0fBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=OoIKBSBW;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=9Vzcdyqn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736547263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9fCOLrPZKmNtYtn9PSY8KZegUu8wjK4R3eSGZGp0IZ8=;
	b=OoIKBSBWn1SWG3G2LpDoCAyKQ5DtY2xUnk00opNYLbrATp+FhbaehMEMygATV5Q+mMVfKq
	iIpgEodH95byrEO3UX8gHa2b2hKY/di8GXPlbAVbZR8gmKef8LVjJkAD+7Yyrw2zxgfrup
	D7VvxmWQt5eTCrOcKymbckr7clYC4M8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736547263;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9fCOLrPZKmNtYtn9PSY8KZegUu8wjK4R3eSGZGp0IZ8=;
	b=9Vzcdyqn567AjNS5qM3fWPpRyJvKKhcAAXqqDmaF05ljjE4o/XJjb803Bq0GTBnQDYiTGa
	5wufc09LSgBbCHAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95EF213A86;
	Fri, 10 Jan 2025 22:14:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GNPTI7+bgWe6dwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 10 Jan 2025 22:14:23 +0000
Message-ID: <2d0029de-146b-41fe-86d3-7a3472bf3607@suse.cz>
Date: Fri, 10 Jan 2025 23:14:23 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/16] mm: make vma cache SLAB_TYPESAFE_BY_RCU
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
 <20250109023025.2242447-16-surenb@google.com>
 <41ebce1a-9cc0-471e-ac20-25efea9a933a@suse.cz>
 <CAJuCfpFhphgecjyWFv6fPmx_3+3wDF9wtDHxZS3tohiEAMLuag@mail.gmail.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <CAJuCfpFhphgecjyWFv6fPmx_3+3wDF9wtDHxZS3tohiEAMLuag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DA1111F37C
X-Spam-Score: -3.01
X-Rspamd-Action: no action
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,oracle.com,suse.com,cmpxchg.org,gmail.com,intel.com,techsingularity.net,redhat.com,stgolabs.net,kernel.org,sina.com,google.com,linux.dev,soleen.com,lwn.net,vger.kernel.org,kvack.org,android.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	TAGGED_RCPT(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLk41rrgs15z4i1nmqiwtynpyh)];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid,suse.cz:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 1/10/25 17:07, Suren Baghdasaryan wrote:
> On Fri, Jan 10, 2025 at 7:31 AM Vlastimil Babka <vbabka@suse.cz> wrote:
> 
> I see vm_area_dup() being used in dup_mmap() and I think this comment
> is about this usage in case the src vma changes from under us.
> However, vm_area_dup() is also used when we simply duplicate an
> existing vma while holding an mmap_write_lock, like in __split_vma().
> In these cases there is no possibility of a race and copied value
> should hold. Maybe I should amend this comment like this:
> 
> /*
>  * src->shared.rb may be modified concurrently when called from dup_mmap(),
>  * but the clone will reinitialize it.
>  */
> 
> WDYT?

Sounds good, thanks!

>>
>>

