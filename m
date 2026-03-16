Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ADA3E5EF5;
	Mon, 16 Mar 2026 18:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773686732; cv=none; b=pTrQm81oj2xcp+bL4q3XHRoc1Ce0w8SnijarAcfbvjEAM8rQEr4j7xYCgvmGEV74VkqPK+mGCGBhfmtwtfyAYNRw2eS23lKG/f3f2tEflFEhQ066QHErI2mR7Bn/+snp6j9m39aESPhxxnSeYlnK/egcXfQehUABpx2Muu+24a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773686732; c=relaxed/simple;
	bh=51ir38hBH/+EX4PSa61CEBGIWQ7Rfv65zGL0gHAdotg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LgSWdFGZugVuuGZElY2VF8h1b0uUt6oVqHjHDyZuuE8KovttgMOmK+jdI7lYlGEap0eRUPVUf/7oLBq8PVyvAbSGP/xTefE5jOVAIqh7BPvNPMxdfsN/HjYtGo+pnEUj+FU0saHQdZWEgbSWYwBXRD/vKTIYU0zTQ6i+8tIJ4KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lO6v6VNy; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lO6v6VNy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=R/0Pmqo6gymewtsBJQ/y7Yj1oSkMScDskutIUZ+bJxU=; b=lO6v6VNygyX0u8SkoFE88YqNS2
	DOcufX8BC2HzoQxDZvtRSRtxxuAeuRuV8oJQqZzRYuVyQsg76jokBcpc5i5UxehPO+qFZRbMCl4R5
	ELo2t1dzKXtXna5XyYXUv1DnTAw1/8HdUMQgHzvhJlGWt88BsGX/pGggF1bAgFjHmYgETXj6UsRmb
	xevH1jNpkgVSdduvn5I0E/x0zJbNKfo3DpJQWqJkC/GRmVMBiXU/RBGiKK0BJ7pADTCvXynaAJAZh
	RINKCwp1Vp07Rquu8gs7whqnScuS52vnQi89O3c5L8sKRH22l19ouJAHFr+9vp+/QwtXYufw9Yyfg
	q7oJzgvA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2CwL-00000004hUc-3lEa;
	Mon, 16 Mar 2026 18:45:23 +0000
Message-ID: <81ef23ff-5042-4934-a227-2c6289b4f62b@infradead.org>
Date: Mon, 16 Mar 2026 11:45:18 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Docs: mmap_prepare: don't italicize structs
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org
References: <20260315224506.1973566-1-rdunlap@infradead.org>
 <2ae64217-ae32-4a4e-9c23-6809582ca7bc@lucifer.local>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <2ae64217-ae32-4a4e-9c23-6809582ca7bc@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/16/26 12:10 AM, Lorenzo Stoakes (Oracle) wrote:
> On Sun, Mar 15, 2026 at 03:45:06PM -0700, Randy Dunlap wrote:
>> Using a single quote mark `struct xyz` causes the html output to be
>> produced as italic. Omit the quote marks so that kernel-doc's automarkup
>> can make the "struct xyz" bold monospace ("code" style") in the
>> generated html.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> 
> This is fine, though given this series is still in-flight we should just
> fold this in no?

Sure, any/either way works for me.
Thanks.

> Anyway, LGTM so:
> 
> Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> 
>> ---
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Lorenzo Stoakes <ljs@kernel.org>
>> Cc: linux-mm@kvack.org
>> Cc: linux-doc@vger.kernel.org
>>
>>  Documentation/filesystems/mmap_prepare.rst |    6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> --- linux-next.orig/Documentation/filesystems/mmap_prepare.rst
>> +++ linux-next/Documentation/filesystems/mmap_prepare.rst
>> @@ -129,11 +129,11 @@ pointer. These are:
>>  * mmap_action_simple_ioremap() - Sets up an I/O remap from a specified
>>    physical address and over a specified length.
>>
>> -* mmap_action_map_kernel_pages() - Maps a specified array of `struct page`
>> +* mmap_action_map_kernel_pages() - Maps a specified array of struct page
>>    pointers in the VMA from a specific offset.
>>
>> -* mmap_action_map_kernel_pages_full() - Maps a specified array of `struct
>> -  page` pointers over the entire VMA. The caller must ensure there are
>> +* mmap_action_map_kernel_pages_full() - Maps a specified array of struct
>> +  page pointers over the entire VMA. The caller must ensure there are
>>    sufficient entries in the page array to cover the entire range of the
>>    described VMA.
>>
> 
> Cheers, Lorenzo

-- 
~Randy

