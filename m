Received: from mta1.migadu.com (out-166.mta1.migadu.com [95.215.58.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6D819A288
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 00:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786580201; cv=none; b=k+muGLvJBdWiNUIxHzyiFZx4E3c1C1uv//OXGkTvV1DSH6LOR41buYNAL/fz99hSrFqpzBjSMURR/fgVX+FlJzx9aRycWTyfac294KOlMwu+xsRP3cmkSKaIaw+lqqrI8ABWnYZZs+FqvT7gEZrnhKViL58/5kZwvh8V6SPFkKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786580201; c=relaxed/simple;
	bh=IGDc5JnDlKO6wxRHzSc4CLcLw+wBmIxrqKstmQPFl8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QRBwtaL13U7T5XAxtIp2xD9IXzT5G/oYfEYW+vxlv6AovFIzsR0ERQlC4fIko86i2dWawd981+hLhI2V0v1K9i/i7QjcxvhQqb+clwEn7qBsrHaZMpeeltncJsyeL7ki2JyIvDOqgR7ZM/q7iBOnKURv6mdVlei6KDfRJPwRFNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GPagUTaA; arc=none smtp.client-ip=95.215.58.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GPagUTaA"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IGDc5JnDlKO6wxRHzSc4CLcLw+wBmIxrqKstmQPFl8M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786580197; v=1; x=1787184997;
 b=GPagUTaAWDg8x9M2YhyCfSl6u0JvyVYyw/WV/BFAE+DIDerUJRyvsy2NZXrUPJV7EvX5COZC
 0fXGxecg4EkVOjYwa+Y/BMeASqyMwEkfT8gqe+UACujRG/5y55x3XmekriaDq1K1+H0iGESoat2
 fOGECbUK0as335Soo5a6QXOE=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from [IPV6:2601:282:1e00:c920::47f] (2601:282:1e00:c920::47f)
	by smtp.migadu.com with ESMTPS id e7e4f0f7b6858491;
	Thu, 13 Aug 2026 00:16:27 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <cc0050bd-1b79-4993-81a5-f70bcd0fc7dc@linux.dev>
Date: Wed, 12 Aug 2026 18:16:22 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] mm/khugepaged: refactor per-scan state clearing
 into collapse_control_init_scan()
To: Pedro Falcato <pfalcato@suse.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-1-ddac39d61c4a@linux.dev>
 <anw7F4FAHEIaW0nx@pedro-suse>
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Content-Language: en-US, en-ZM
In-Reply-To: <anw7F4FAHEIaW0nx@pedro-suse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/12/26 3:23 AM, Pedro Falcato wrote:
> On Tue, Aug 11, 2026 at 06:48:33AM -0600, Nico Pache (Red Hat) wrote:
>> Extract the repeated clearing of node_load, alloc_nmask, and
>> mthp_present_ptes into a helper to reduce duplication in
>> collapse_scan_pmd() and collapse_scan_file(). Althought file scans do not
>> current use the bitmap, they will in the future, and clearing it now is
> 
> Will they? (To be clear, not opposed to clearing this regardless).

That is the hope at least. Baolin has a series for this:
https://lore.kernel.org/lkml/cover.1781083630.git.baolin.wang@linux.alibaba.com/

The plan is to do these cleanups first then Baolin will base on that work.

> 
>> harmless.
>>
>> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Acked-by: Usama Arif <usama.arif@linux.dev>
>> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
> 
> Reviewed-by: Pedro Falcato <pfalcato@suse.de>

Thank you for reviewing :)

-- Nico

> 

