Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B09825487C;
	Tue, 23 Jun 2026 12:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219566; cv=none; b=lLlP/8sgRPO460S3dPLQdwj6tELoHPnczAEW8RclsBbu3dQe/Mrl51ws5l+ks37Oi9rJO7ShB8xp+q/f9sWmrIaHAiDS5LhnzcDBV0RGxwyUmsGoBdDJ5vEu1OhWBc8WGj0bEwGaQfBTdqKPr4I0qCv9AdjjemfzgSG9c41NFKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219566; c=relaxed/simple;
	bh=mVV3LebXir4pQ46jJvegHgav1IoMHtkgXzzRcRM1Bf0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m78zQ16T10hIaGw4h7sm7uYV0SH9LVqMTf0c65lKywhnnbaMSnTj88dIx2BXwwhW+nvP/Hfcxe+JA3EnEctsFd4sImUKYERpBoroJhWHLboku53JEs+8O1cJfYnEntTS47Bkbnkvr6UfPymLFYXV29LPmczvW4LlgWfZCwXxKh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hkbgjibe; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hkbgjibe"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B7A0D41591
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782219557; bh=jR+bgp1QNQwrtA8EnhSJtdkBX/6Uhu5H3x2EB5CaJSs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hkbgjibeCaMtqcYoWH7ujj+yPJPBBpkEV6GEDKVJMmBDahmE7VZHqcVbF8EWP1+9U
	 Jw+v6N4uXGXU58VqKkqYj6b4DIyPdcQLZrlupTioWMMQiY+OTX2cXCIJAIsoT8IAOp
	 OgfKTovKnFJ5a/6tf8qdZZcrp+r8hb+1S+rWDE94zVm4iXNIfQmL9BTDxF9iiaAFZo
	 9w+l2/fHHxzC/y69uqmZwfx+OLD5oCtHIcVZ2anBMnGnOYTpzK/YbabmyriPX0Xv06
	 x6ECIzzbyMucMIDdsvTzFezUZRZL7/gRd38XziB9aaZYokMi6KhYeLlny9gdgjvHKI
	 UToky2gVa+lJg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B7A0D41591;
	Tue, 23 Jun 2026 12:59:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes
 <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil
 Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah
 Khan <skhan@linuxfoundation.org>, Matthew Wilcox <willy@infradead.org>,
 Harry Yoo <harry@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: clarify that we are not looking for LLM
 generated content
In-Reply-To: <d421c081-8686-4d46-8452-e543401b0503@kernel.org>
References: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>
 <d421c081-8686-4d46-8452-e543401b0503@kernel.org>
Date: Tue, 23 Jun 2026 06:59:16 -0600
Message-ID: <87wlvpct0b.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 4/20/26 23:03, David Hildenbrand (Arm) wrote:
>> Let's make it clear that we are not looking for LLM generated content
>> from contributors not familiar with the details of MM, as it shifts the
>> real work onto reviewers.
>> 
>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>> ---
>>  Documentation/mm/index.rst | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>> 
>> diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
>> index 7aa2a8886908..13a79f5d092c 100644
>> --- a/Documentation/mm/index.rst
>> +++ b/Documentation/mm/index.rst
>> @@ -7,6 +7,19 @@ of Linux.  If you are looking for advice on simply allocating memory,
>>  see the :ref:`memory_allocation`.  For controlling and tuning guides,
>>  see the :doc:`admin guide <../admin-guide/mm/index>`.
>>  
>> +.. note::
>> +
>> +  Unfortunately, parts of this guide are still incomplete or missing.
>> +  While we appreciate contributions, documentation in this area is hard
>> +  to get right and requires a lot of attention to detail.  New contributors
>> +  should reach out to the relevant maintainers early.
>> +
>> +  This guide is expected to reflect reality, which requires contributors
>> +  to have a detailed understanding.  Documentation generated with LLMs
>> +  by contributors unfamiliar with these details shifts the real work onto
>> +  reviewers, which is why such contributions will be rejected without
>> +  further comment.
>> +
>>  .. toctree::
>>     :maxdepth: 1
>>  
>> 
>> ---
>> base-commit: da6b5aae84beb0917ecb0c9fbc71169d145397ff
>> change-id: 20260420-llmdoc-21bf5fadbd6f
>> 
>> Best regards,
>
> I assume this was not picked up yet? (via documentation or mm tree?)

I had figured Andrew would grab it; I can certainly do so if you'd like.

jon
