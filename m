Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275AB4052AF;
	Wed, 12 Aug 2026 09:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526523; cv=none; b=ubUTXL3XacaPluocuXB8jnFC7O1qhdlauuYkxs9c6hllLMCgvJDgb7lX+dwzTlsZ+y8wu/em2O21k8xpOdZVaiJhKFWeiuseKmnS6kSZ3bZYVC0EL+a5BLG7gRd4OhLQ1bnGhTY+jhO1Ok0v9Y8IPdjR9HCB+JEHwG/EC0r+mtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526523; c=relaxed/simple;
	bh=K6sVH2UOR3x8k8JSaZ+n6w+L7nOBJkiQ0S6DjLFa3gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKPpO34/9tDvQ8HCcV7/vMeLv1Cr8deTZHWfn0BI9r8oqnn+mcUn1sC6L7/zq7jPVXqK8OjJiTI0PLbDQdjMtiSpiPfJBpU1qdU2iTwlVKx3fRcDosCJ8KteHECcIXKY8uCf3lEdKKg+S2EKz5kBofhGH3hwdQI5WFXalc/I0Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=sWtAdXfS; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="sWtAdXfS"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786526518; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=gKO1l7J5+Lj5b/1ZVINpks9xo9DBxJWqzkD6biluj+8=;
	b=sWtAdXfSz2oYM2wMH9iPb47440nbFJ1GZBB91mOULSdboaTnxJgkGU1R3PsFLAtl83yhyJtIzjOe2cLb7BXA3Ibcl3titjjptaqfE8J23/G0D6/Y3svZbe6uALXlHLYKfnXWGIxLnC+h/YCJAE03F/yMSkurP/D6UTr0mjd9vkw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R631e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X8rG9bO_1786526515;
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X8rG9bO_1786526515 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 12 Aug 2026 17:21:56 +0800
Message-ID: <5e58ae4e-81a4-4282-bc11-6f1ffb3a2a16@linux.alibaba.com>
Date: Wed, 12 Aug 2026 17:21:55 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] mm/khugepaged: unmap pte before releasing vma
 write lock
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-6-ddac39d61c4a@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-6-ddac39d61c4a@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/11/26 8:48 PM, Nico Pache (Red Hat) wrote:
> We are currently dropping the anon_vma write lock before unmapping the
> PTE. Although this is safe, due to us still holding the mmap_write_lock,
> its safer and less confusing to switch the order of these two operations.
> 
> Suggested-by: David Hildenbrand <david@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
