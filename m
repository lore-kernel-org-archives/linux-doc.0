Received: from mta0.migadu.com (out-130.mta0.migadu.com [91.218.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA0A2E03EA
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 00:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786580349; cv=none; b=F2hc88T+mp8M+EjMyWeO9jtqJzHqadqi/XU5wLrTEmJa+FCWDlQvQHexGK3iujITfcyjUM5F9UhMxTXGFrXhUV7UvWbU5gOV70g7e8SE+b2Q493oQaDKTVFVHg4J/7CdmpCm6+OusIc1Z4oXrvzcpvkoe9c+5wgCPYJODRIWGV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786580349; c=relaxed/simple;
	bh=o3kTi8xtJn486U9ig8F6Tlpu1rP9cqJ5DKdg5YgjGIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dBVpKBLw53zM/2iTmHJ6T1M/umhUcMS3NgyDC9xU2kAK0M/AZHLWApiYVV5cs2RdQXlGtHXFe+wDh1hH3bXUbvEUkhbac1zZCkYYPNIYSh5u7M3yq2laGtLpCO57G1ZE9arB/KOoPT+drjop+oaxZ64zJqePgaveV2r0f890Znk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PIBXMJyd; arc=none smtp.client-ip=91.218.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PIBXMJyd"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=o3kTi8xtJn486U9ig8F6Tlpu1rP9cqJ5DKdg5YgjGIQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786580345; v=1; x=1787185145;
 b=PIBXMJydsnwjR0et0+3llQuIQWY0U2P/88YMrEsKWzSXC5TzH5gDkLh7nKZvmPqzZljAWMmV
 TOT6y0FeEQG9aFv6HJR/Ip2xix1v+vku89QQn5BaN2Txkl7/Q3HEz8jkeF1BHNVsyognq795Jht
 Cs/Fu62lKDri7v5QaDi6iLEM=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from [IPV6:2601:282:1e00:c920::47f] (2601:282:1e00:c920::47f)
	by smtp.migadu.com with ESMTPS id ad50254a494f5427;
	Thu, 13 Aug 2026 00:19:05 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <b4b24576-507b-4617-b1b3-f03ef31934bd@linux.dev>
Date: Wed, 12 Aug 2026 18:19:01 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] mm/khugepaged: extract reference check into
 folio_pte_referenced() helper
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-2-ddac39d61c4a@linux.dev>
 <a23dd413-1462-4b7a-9ce1-136e1d806ed8@kernel.org>
Content-Language: en-US, en-ZM
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
In-Reply-To: <a23dd413-1462-4b7a-9ce1-136e1d806ed8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/11/26 9:47 AM, David Hildenbrand (Arm) wrote:
> On 8/11/26 14:48, Nico Pache (Red Hat) wrote:
>> This change deduplicates the "is this PTE/folio referenced enough to be
>> considered for a collapse" condition that was repeated in both
>> __collapse_huge_page_isolate() and collapse_scan_pmd(), extracting it into
>> a single inline helper function.
>>
>> Also move the comment and use it as the function header. While we are at
>> it, updated the comment to clarify that a young pte is a recently accessed
>> one.
>>
>> Acked-by: Usama Arif <usama.arif@linux.dev>
>> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
>> ---
>>  mm/khugepaged.c | 32 ++++++++++++++++++--------------
>>  1 file changed, 18 insertions(+), 14 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 1e26ea97381a..8babd4c97db6 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -672,6 +672,22 @@ static void release_pte_pages(pte_t *pte, pte_t *_pte,
>>  	}
>>  }
>>  
>> +/*
>> + * folio_pte_referenced() - Check if a folio or its PTE mapping was recently used
>> + *
>> + * Return: true if recent access was observed through either the folio state
>> + * or the current PTE mapping.
>> + */
> 
> No need for doc for such a trivial internal helper :)

Ok sounds good I can send a fixup to remove it. Lorenzo has often asked for
these when I've introduced functions, so I've got in the habit of including them.

> 
>> +static inline bool folio_pte_referenced(struct folio *folio,
>> +		struct vm_area_struct *vma, unsigned long addr, pte_t pteval)
>> +{
>> +	/* The folio was referenced previously ... */
>> +	if (folio_test_young(folio) || folio_test_referenced(folio))
>> +		return true;
>> +	/* ... or the PTE mapping was recently used */
>> +	return pte_young(pteval) || mmu_notifier_test_young(vma->vm_mm, addr);
>> +}
>> +
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thank you :)

> 

