Received: from mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1C82472A2
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 02:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786587185; cv=none; b=E6+2DACZZiFsA8letRFn3mKiMWLYLMXj1Z/ms9Gx9FOVhYLNM4sF2ZuDOmzuZBgzKFWm0IAUNYPZgURwDN/MNPnHiQkh0PIDira4U40OwbdYhZ9hEVTxtvTo2m9MRXe6B3NQmsIJKlTmWaN2ftp5gGyBi4/STsRlGokFnBP3PAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786587185; c=relaxed/simple;
	bh=z1gML0qDSqQEE0jNWTJ/2DlMFeJZvkeeMONLtVEaFls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BxicOuXZRwTIRQ4KYfr6RHB3jnHFciu4zm1/Hl2jqIGj0IUVPlVCkGUFoZ6aOJ/9DG/JhYe3iJM6/gcv+mrGlSQ2DuN+iEg8cT58oiONpZEsfyixSnsVdrWSk4mrAC/fPFGFG06A244Ar1mWDNgnhvW/vt5qDt0qFIH6lzsCJpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OiwxTKNE; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OiwxTKNE"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=z1gML0qDSqQEE0jNWTJ/2DlMFeJZvkeeMONLtVEaFls=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786587181; v=1; x=1787191981;
 b=OiwxTKNE9ROpwVJvukL+XDc9n2KWqtxGpAxJwdKUyV6ZJkjPKrMBcGqaZNPkvkxYKd+5SG5g
 ujuqN/9JuDHugKQWFcEi2EsrBWNd+MxFZd6xqVlMh4Qx3C600uLn0ew3iSJJCyvaSEkOr3jgdgn
 VPuJ4OJJVRWr/2dd4ywlsyWs=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from [IPV6:2601:282:1e00:c920::47f] (2601:282:1e00:c920::47f)
	by smtp.migadu.com with ESMTPS id 6dcdd29a1782bdd8;
	Thu, 13 Aug 2026 02:13:01 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <2666af48-1e95-4f68-8978-90dc3f4832db@linux.dev>
Date: Wed, 12 Aug 2026 20:12:56 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] mm/khugepaged: Refactor the PTE state checks into
 a helper
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-5-ddac39d61c4a@linux.dev>
 <f1371b4d-6e98-4699-8c1b-7612f6d70f02@kernel.org>
 <20260812123959.d4e31d68e8db85b9fd3981eb@linux-foundation.org>
 <3dd59ad8-2f00-4332-91f8-7871e8d60b02@kernel.org>
Content-Language: en-US, en-ZM
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
In-Reply-To: <3dd59ad8-2f00-4332-91f8-7871e8d60b02@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/12/26 2:56 PM, David Hildenbrand (Arm) wrote:
> On 8/12/26 21:39, Andrew Morton wrote:
>> On Wed, 12 Aug 2026 10:40:08 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:
>>
>>> On 8/11/26 14:48, Nico Pache (Red Hat) wrote:
>>>> For anonymous collapse, the collapse_scan_pmd() and
>>>> __collapse_huge_page_isolate() functions share a large portion of their
>>>> logic. These functions both check the state of the PTEs and verify the
>>>> following:
>>>> 	- max_pte_* values are not exceeded
>>>> 	- uffd is not active
>>>> 	- lazyfree properties
>>>> 	- non-anonymous
>>>>
>>>> Merge these checks into a helper collapse_check_pte() to reduce code
>>>> duplication. We also add a helper struct for this function called
>>>> pte_check_context which allows us to pass the required parameters in a
>>>> clean and elegant manner.
>>>>
>>>> A helper function is also introduced pte_check_fail() to provide a clean
>>>> interface to set the pte_check_context failure results and return
>>>> PTE_CHECK_FAIL state. This helps reduce code duplications across the new
>>>> collapse_check_pte function.
>>>>
>>>> Two slight modifications are done to the original functionality. We now
>>>> warn (instead of crash) if the anon test fails, and we leverage the
>>>> vm_normal_folio function instead of page->folio, this should be
>>>> functionally equivalent.
>>>>
>>>> No other functional changes intended.
>>>>
>>>> This patch is heavily based off work done by Lance Yang, but modified to
>>>> deal with conflicts and feedback received during the review cycle [1].
>>>>
>>>
>>> TL;DR, I think this patch here needs some more work, and we should not fast
>>> track it at this point.
>>
>> This has been floating around since July 6, so it's never been
>> fast-tracked!
> 
> That's not what I mean. Stuff must be reviewed. Review capacity is limited. Some
> stuff gets de-prioritized and reviewed later.
> 
> I managed to review it now, but concluded that it needs more work.
> 
> Instead of reworking the patch now to squeeze it in just before the merge
> window, better to resend this single patch for the next cycle.

I would be ok with pushing the 6 patches that are ready and leave this one for
the next cycle!

@Andrew,

Can you please just drop this patch from the series. I will resubmit once i
handle the feedback provided here.

David,

Thank you for your review, I'll look over the changes you suggested and start
cleaning this up.

Cheers,
-- Nico

> 

