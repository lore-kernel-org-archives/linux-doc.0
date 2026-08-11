Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F461C860C
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 04:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786423836; cv=none; b=Jwv6hB0izudfUgcCHlzZbqhWwn54/BLqrp9th8FBi8B6tL3r6R3Ja539jsorhvk5J+HOGJsG3BFf73Jw5l1oTlyBXCgqO6HlWpcxQKDsMghMnW+5gaSbAKFdkkLGRbJMjuARjz4+LijKT4Q/7IBprEG2C5lp7gLAii6pfuW0oJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786423836; c=relaxed/simple;
	bh=6XHmnav1EUJ3ciDMi2k9GArV5/o0xFXJSORAhNix/PY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iow9Uf+CwxX96v/zWv5ksfTALiuPktX6SbcURb0tNcC2/U27Ky6omqiEHWZ/7Tf/1SpEigtN/TA3i0MDKtI+F8+5LoysMtw/MXzTj+o3+SXEklJAD+BKDwzNLoSlPI0njU2dKGWmTuMannozBuSED9Z0frPie9uCxBTCq2UpBbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JM0bf/yL; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JM0bf/yL"
Message-ID: <e7d02969-9ac3-4269-b00e-74ce4039def8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786423832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNxfQN/7Pd2hBsPg+CrM6dWoXUrxbVMu9411VE83FHA=;
	b=JM0bf/yLstZNmSUedAnleJMC/yOJDlX+ksOmoqFJOIYvOV48sEqeEf8hASDK5OLPTvAsL4
	9nU7y+OR0v4euFZvIEiGlu9lDRv+f4KuEggccw8+q/aZFjqvOWeRf0LWgURlNW7N4sKnRw
	jqFdk2tmQQkzT5Uq9bWy5UUmnV+2mCk=
Date: Mon, 10 Aug 2026 22:50:22 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/7] mm/khugepaged: several cleanups
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260804-khugepaged_pte_refactor-v3-0-0364cad642a0@linux.dev>
 <20260804161204.140bb3b8e482c43cbbacc2bd@linux-foundation.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Content-Language: en-US, en-ZM
In-Reply-To: <20260804161204.140bb3b8e482c43cbbacc2bd@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 8/4/26 5:12 PM, Andrew Morton wrote:
> On Tue, 04 Aug 2026 13:24:58 -0600 "Nico Pache (Red Hat)" <nico.pache@linux.dev> wrote:
> 
>> The following changes stem from a number of reviews during my khugepaged
>> mTHP support series [1]. Some of these are minor code cleanups, issues or
>> reviews that we decided to deferred to a followup series, or in the case
>> of the more major patch of the series, changes [2] Lance Yang attempted
>> while my series was in-flight and we decided to wait till later to try.
>>
>> The first 3 patches introduce helper functions to increase code reuse and
>> readability. This includes a per-scan state clearing function, extracting
>> the young page check into a helper, and a count_collapse_event() function
>> to reduce a repetative pattern used across mTHP collapse.
>>
>> The 4th patch was the byproduct of me throwing Claude at all the
>> comments in khugepaged verifying and looking for any outdated info.
>>
>> The 5th patch is based on Lance Yang's commit series [2] trying to extract
>> the PTE state checking into a helper function. This required a bit of
>> rewriting due to differences after mTHP collapse was introduced. I also
>> took into account the changes requested during his patches review cycle.
>>
>> The remaining 2 patches were review points during my mTHP series that we
>> agreed can be deferred to a later series.
> 
> So "no functional change intended"?

Correct, there should be no functional changes, other than the warn change.

> 
> Sashiko had a little doc niggle:
> 	https://sashiko.dev/#/patchset/20260804-khugepaged_pte_refactor-v3-0-0364cad642a0@linux.dev

This doesnt seem to be relevant, although it may be good to move that note into
its own block at some point.

Cheers,
-- Nico

