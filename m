Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9981E47C8;
	Wed,  8 Jan 2025 09:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327773; cv=none; b=TpkWhufAoABFibdV5gvEV9+93NOEi2ivAYYADEiFjxyO+jdotRI2kK0gmxqWRsQjSz0dErM+D0TzMoRSAkgpsNCBGht1YCGWjBQbPUxSnhRgjqphJnEbdCVMl/upV3DrC3Ot1w8W2ifogYDcMkQVcnxhIsMBIFn7nSjdnjMEjHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327773; c=relaxed/simple;
	bh=wCnIMbN1b45+Zh6U3VMCaYpSJa3GHiYf7U5DrVglCtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhnEkCyepu47Wl0Py2tnj/6HHExQBj06a2AwL8CcUzRZVI6l31uUMhhP8LxqynXK7HJYgx/Q3KN3DQoSFOds/NN902qa2p3J9OU+Q36yJCxCDFeQdgMqpsJAZQGcPcGrtlBi0Wit+/621QWooo8q3NIgujr+80gj70cvUh98rbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=lmQo0fwJ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=/RRvInxX; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=h9gnDfNc; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=RMYHUuex; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="lmQo0fwJ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="/RRvInxX";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="h9gnDfNc";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="RMYHUuex"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2CF392110A;
	Wed,  8 Jan 2025 09:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736327766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kO7m9oezMCSuCcSd1S+8uGdpqn5tlsntLn9fhP1BBeg=;
	b=lmQo0fwJgR5ki2BcdmNe0GW776DFhM5sI41jvHI8viwzW+8uJt8ABvwpxb/QMlQm3xYJAQ
	Qm+W48zTXcWE4CSjslqAjctv3vmOeMRA2p+COSieONNKPjN3cF6jU6Mmm3Qsr5KsPlCVI8
	5BCK9HnfgUormTQ3P8kjgvenacgp/6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736327766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kO7m9oezMCSuCcSd1S+8uGdpqn5tlsntLn9fhP1BBeg=;
	b=/RRvInxXwXawWp+8+6jZpc7o2PGLwt3FiiirdPK3kuJdgpYUf7HV+2vLisjj3l5e+sxtML
	eLDJC0MF2qUJQUBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736327765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kO7m9oezMCSuCcSd1S+8uGdpqn5tlsntLn9fhP1BBeg=;
	b=h9gnDfNc1PC0SC718uPbX/DuGYAlWDV8Zdkhf3BGVh5ZVdbi/bf7Tg2UQuo2P5luR6csDZ
	939y4DJ/eDmBSHalh0vwEjdG1FBRYRglF3OJZ8ywk+4H//wHzRkTuebM1V843Tq5SQcIiK
	1Tify47YWIbx42LtaJ7WvlFwZfszuJQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736327765;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kO7m9oezMCSuCcSd1S+8uGdpqn5tlsntLn9fhP1BBeg=;
	b=RMYHUuex1NYhI+SzWOX2n7T41GcqowakNY7jyqcbYOV8M/iamFByEqZztTtt1KJAYKvEiU
	wYnt1G15iXzOjyCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1D7B137DA;
	Wed,  8 Jan 2025 09:16:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bwzMNlRCfmdoYQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 08 Jan 2025 09:16:04 +0000
Message-ID: <275bd492-7d7c-4b9a-9fce-fbe25639cbfb@suse.cz>
Date: Wed, 8 Jan 2025 10:16:04 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/17] refcount: introduce
 __refcount_{add|inc}_not_zero_limited
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
 <20241226170710.1159679-12-surenb@google.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <20241226170710.1159679-12-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[infradead.org,oracle.com,suse.com,cmpxchg.org,gmail.com,intel.com,techsingularity.net,redhat.com,stgolabs.net,kernel.org,sina.com,google.com,linux.dev,soleen.com,lwn.net,vger.kernel.org,kvack.org,android.com];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLumbhs4xhzuuihrchnpuyb6qu)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 12/26/24 18:07, Suren Baghdasaryan wrote:
> Introduce functions to increase refcount but with a top limit above
> which they will fail to increase. Setting the limit to 0 indicates
> no limit.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  include/linux/refcount.h | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/refcount.h b/include/linux/refcount.h
> index 35f039ecb272..e51a49179307 100644
> --- a/include/linux/refcount.h
> +++ b/include/linux/refcount.h
> @@ -137,13 +137,19 @@ static inline unsigned int refcount_read(const refcount_t *r)
>  }
>  
>  static inline __must_check __signed_wrap
> -bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
> +bool __refcount_add_not_zero_limited(int i, refcount_t *r, int *oldp,
> +				     int limit)
>  {
>  	int old = refcount_read(r);
>  
>  	do {
>  		if (!old)
>  			break;
> +		if (limit && old + i > limit) {

Should this be e.g. "old > limit - i" to avoid overflow and false negative
if someone sets limit close to INT_MAX?

> +			if (oldp)
> +				*oldp = old;
> +			return false;
> +		}
>  	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
>  
>  	if (oldp)
> @@ -155,6 +161,12 @@ bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
>  	return old;
>  }
>  
> +static inline __must_check __signed_wrap
> +bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
> +{
> +	return __refcount_add_not_zero_limited(i, r, oldp, 0);
> +}
> +
>  /**
>   * refcount_add_not_zero - add a value to a refcount unless it is 0
>   * @i: the value to add to the refcount
> @@ -213,6 +225,12 @@ static inline void refcount_add(int i, refcount_t *r)
>  	__refcount_add(i, r, NULL);
>  }
>  
> +static inline __must_check bool __refcount_inc_not_zero_limited(refcount_t *r,
> +								int *oldp, int limit)
> +{
> +	return __refcount_add_not_zero_limited(1, r, oldp, limit);
> +}
> +
>  static inline __must_check bool __refcount_inc_not_zero(refcount_t *r, int *oldp)
>  {
>  	return __refcount_add_not_zero(1, r, oldp);

