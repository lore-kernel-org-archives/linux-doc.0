Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AB737EFF0;
	Tue, 23 Jun 2026 13:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782223003; cv=none; b=QdwhhLAr8j7/a2kfFtcgUJp2fNVt+UMDX9tQh6tRNQP+AbQ/5bIm6qJULzy/RW7DvtDOa6FqSCuHgAk7GI9UqQFPGWLyhMvtCAps6nKUP2CCKFSs/8AGvQtmpdOZ2xA80KYVEAoL1HQXrC3igji4cMkEweCesHbcfPNAWnm+uaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782223003; c=relaxed/simple;
	bh=1DlfRtNgmWFLYCO1Lx4HbFV8jUyPeMhCl9lcFGH8HBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8uTLATQEOhAU22HsaWYZUWTL/IyngayDqG7VsgklxHvGkPy9kk5eVoqzOrmuua4jn0CODD5ncVaqiwqEnq/exbAD2xmViaCHlYcp5qAnYNTh2fSnCKob/zfwbbW1rxLouJSfuo7uufP6fhni/hJ+gXphsGrdNOtgUumeWHAbG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdwRFdFu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdwRFdFu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392C21F000E9;
	Tue, 23 Jun 2026 13:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782223002;
	bh=348wMgSmJD01cYVZxG1MpLEasY34QPQjsp7UvlWSoHM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SdwRFdFuyyOdJKp2E5R2ASbFHDCeDhbyx7aQLMOJmOXAUMpYidzxhd5oxrcf9Xb2G
	 VR4HmXQjMb2hSufVqn+hcub0gtcoSPtpVdX9+xyq4I9odV6hPEgoNZ3AAMJU6LF9V5
	 pXWrv9/v6vAj76YIbf/F+UR4m8cWXFEB9rqBFQHIS+wKaoFTSrtZzsioTpGgGCr7O0
	 XJ0WDp4jr6t7FHibGjI6KodQskf+NkunhFLKraUWJVFSsbEUG018JxFjUPkq593VuM
	 QizhLFasYQdsEcPTbPEIx4C/2uQYxmU94nf8IHlHzWUrmzcCZLI316Bm6qctr0w8JE
	 t2UPTMSpBW2AA==
Message-ID: <1cbdb3a3-b8db-4ae2-aa66-9042c1033745@kernel.org>
Date: Tue, 23 Jun 2026 15:56:36 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/mm: clarify that we are not looking for LLM
 generated content
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Matthew Wilcox <willy@infradead.org>, Harry Yoo <harry@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>
 <d421c081-8686-4d46-8452-e543401b0503@kernel.org>
 <87wlvpct0b.fsf@trenco.lwn.net>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <87wlvpct0b.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/23/26 14:59, Jonathan Corbet wrote:
> "David Hildenbrand (Arm)" <david@kernel.org> writes:
> 
>> On 4/20/26 23:03, David Hildenbrand (Arm) wrote:
>>> Let's make it clear that we are not looking for LLM generated content
>>> from contributors not familiar with the details of MM, as it shifts the
>>> real work onto reviewers.
>>>
>>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>>> ---
>>>  Documentation/mm/index.rst | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
>>> index 7aa2a8886908..13a79f5d092c 100644
>>> --- a/Documentation/mm/index.rst
>>> +++ b/Documentation/mm/index.rst
>>> @@ -7,6 +7,19 @@ of Linux.  If you are looking for advice on simply allocating memory,
>>>  see the :ref:`memory_allocation`.  For controlling and tuning guides,
>>>  see the :doc:`admin guide <../admin-guide/mm/index>`.
>>>  
>>> +.. note::
>>> +
>>> +  Unfortunately, parts of this guide are still incomplete or missing.
>>> +  While we appreciate contributions, documentation in this area is hard
>>> +  to get right and requires a lot of attention to detail.  New contributors
>>> +  should reach out to the relevant maintainers early.
>>> +
>>> +  This guide is expected to reflect reality, which requires contributors
>>> +  to have a detailed understanding.  Documentation generated with LLMs
>>> +  by contributors unfamiliar with these details shifts the real work onto
>>> +  reviewers, which is why such contributions will be rejected without
>>> +  further comment.
>>> +
>>>  .. toctree::
>>>     :maxdepth: 1
>>>  
>>>
>>> ---
>>> base-commit: da6b5aae84beb0917ecb0c9fbc71169d145397ff
>>> change-id: 20260420-llmdoc-21bf5fadbd6f
>>>
>>> Best regards,
>>
>> I assume this was not picked up yet? (via documentation or mm tree?)
> 
> I had figured Andrew would grab it; I can certainly do so if you'd like.

yes please. I guess I'll soon start grabbing stuff myself. Stay tuned. :)

-- 
Cheers,

David
