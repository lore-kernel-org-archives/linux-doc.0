Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BB043637D;
	Wed, 27 May 2026 16:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779900244; cv=none; b=SKTnAKch0hxqSep8exw7T16GMYPYfGWyojJJMFizW5FOUP7nul0pgJXtt99cwG/sNXhYpyY5ruKKRC7WwhTKLZ1ddSC07gwpPC71JOVKlv78BFDB9i99zGL1PTFmHUfiR9fcivI50lOY+0rt6ZKE9pg/YkKRx5TKbdpeLDiTt8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779900244; c=relaxed/simple;
	bh=OXgyThuY9np4tfEuDRdtPuCvxV1gx5IuvWQcVrC2JZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9GUg+1+PlBWbG4ErV5sObrXb5E4aJnPqTBbp8X92E/WhbncvnPlDH5EUs/owke/8CUPj2b+vtBVnD0LkkcditRsagCVfCs9V6m5VBO/NNWRfOpQwQh5wulhxhjd0Du6kdnbVxdcxC5KhPrY7eu7siitrxYoJ0v6KB/4t2dzLBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gz0FAfHY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gz0FAfHY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EBF1F000E9;
	Wed, 27 May 2026 16:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779900243;
	bh=yWPa++NGXo1aIojaudWX3NTE49alwuIOqHH3XsUNF+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gz0FAfHYQL00jm2PuJmRvUYJxdFhJgrR6YQoBVwzxczTwk3iq7lLQC5H+2Cgk4qAA
	 VhF6xBQCInqjaSWr064GYjwqFEi2XpK0AnZweDqfdcntD+Nr7XucnQ4ytOZv3tQlIF
	 b5pI7uD63hXoeZdFGNGUOO+/9AMxFNfhmRw+T0E8gQd10ZxHjICrBqz6WV/nqhkOzS
	 ythG5NCO5A0crvobthWzS8FFOB1gaCAV8Nu2aMvPoo/JhYauTmpXo9vBrZyYtD4ahb
	 m3n/poeh0iBSaqZR/4guuQm7+3JzAQN1Qhrjeo0+5XqFFOu46pAkyTlJYPXFWrf41L
	 UoPdFxa4SrBNg==
Message-ID: <33300bb7-fcbc-41f4-9352-9491256ffb82@kernel.org>
Date: Wed, 27 May 2026 18:43:58 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/mempool: use static key for boot-time debug enablement
Content-Language: en-US
To: Usama Arif <usama.arif@linux.dev>, lirongqing <lirongqing@baidu.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Harry Yoo <harry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260527130337.983366-1-usama.arif@linux.dev>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20260527130337.983366-1-usama.arif@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/27/26 15:03, Usama Arif wrote:
> On Wed, 27 May 2026 06:46:34 -0400 lirongqing <lirongqing@baidu.com> wrote:
>>  static int __init mempool_faul_inject_init(void)
>>  {
>>  	int error;
>> @@ -37,7 +54,6 @@ static int __init mempool_faul_inject_init(void)
>>  }
>>  late_initcall(mempool_faul_inject_init);
>>  
>> -#ifdef CONFIG_SLUB_DEBUG_ON
>>  static void poison_error(struct mempool *pool, void *element, size_t size,
>>  			 size_t byte)
>>  {
>> @@ -73,6 +89,9 @@ static void __check_element(struct mempool *pool, void *element, size_t size)
>>  
>>  static void check_element(struct mempool *pool, void *element)
>>  {
>> +	if (!static_branch_unlikely(&mempool_debug_enabled))
>> +		return;
>> +
>>  	/* Skip checking: KASAN might save its metadata in the element. */
>>  	if (kasan_enabled())
>>  		return;
>> @@ -112,6 +131,9 @@ static void __poison_element(void *element, size_t size)
>>  
>>  static void poison_element(struct mempool *pool, void *element)
>>  {
>> +	if (!static_branch_unlikely(&mempool_debug_enabled))
>> +		return;
>> +
> 
> Before this change, building with CONFIG_SLUB_DEBUG_ON=y compiled in
> check_element() and poison_element() unconditionally, so the
> poisoning and corruption checks ran on every mempool free/alloc.
> After this change those checks are gated on the mempool_debug boot
> parameter even when CONFIG_SLUB_DEBUG_ON=y.

The same would apply to the dmapool_debug [1]

https://lore.kernel.org/all/20260524034015.1830-1-lirongqing@baidu.com/

> Existing users who relied on CONFIG_SLUB_DEBUG_ON=y giving them
> mempool poison checking will silently lose it on upgrade unless they
> also add "mempool_debug" to the command line.
> 
> Would it be worth defaulting the static key to true under
> CONFIG_SLUB_DEBUG_ON=y, for example:
> 
> 	#ifdef CONFIG_SLUB_DEBUG_ON
> 	static DEFINE_STATIC_KEY_TRUE(mempool_debug_enabled);
> 	#else
> 	static DEFINE_STATIC_KEY_FALSE(mempool_debug_enabled);
> 	#endif
> 
> so the previous default behaviour is preserved.

There's DEFINE_STATIC_KEY_MAYBE for this.

But I think nobody will care really. My objection was that this and
dmapool_debug was tied to CONFIG_SLUB_DEBUG_ON in the first place, despite
not being part of slab. I'd rather disconnect it completely.

If testing bots relied on this, we could give them heads up to start using
those boot options. I assume they already use some for stuff that has no
CONFIG_ enablement.

>>  	/* Skip poisoning: KASAN might save its metadata in the element. */
>>  	if (kasan_enabled())
>>  		return;
>> @@ -140,14 +162,6 @@ static void poison_element(struct mempool *pool, void *element)
>>  #endif
>>  	}
>>  }
>> -#else /* CONFIG_SLUB_DEBUG_ON */
>> -static inline void check_element(struct mempool *pool, void *element)
>> -{
>> -}
>> -static inline void poison_element(struct mempool *pool, void *element)
>> -{
>> -}
>> -#endif /* CONFIG_SLUB_DEBUG_ON */
>>  
>>  static __always_inline bool kasan_poison_element(struct mempool *pool,
>>  		void *element)
>> -- 
>> 2.9.4
>> 
>> 

