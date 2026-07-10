Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32683C76BD;
	Fri, 10 Jul 2026 07:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669416; cv=none; b=RjEf15aRZALR9/HInun4Rfj6Pc+BYgP6a9iys3jD86DuRlIr6tzPhiDGtsE9waqzFwQK8edIGDpoOsI05VftMKuBvNEDoldqklWvrlxgDHuascgUead1qsKbPFxttyFPwKgGw139X7sZpIrN/aNYTj1NKkMvwtyjh66MPnH5ZvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669416; c=relaxed/simple;
	bh=Po82ZlPAV3d7J/vCEUOzU7xJoB/8xh66nwvBlEriq2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D5HQlmVP6raAB+cb+V+jUM0if+KfGaTqrEdpjlau6X6TYN1iEgOuMMaUidG8NmQjsgfZk4pgEEi6cU+kCAAiQYB0gZz85o8CK/XQPuKU+qMfOcDlPkWamX81wQTt/VcU2bTSxYeuvyRIwc9eDf7797Eq83XhoCuOwxAnRC8F54A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=G62uiXo9; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="G62uiXo9"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783669410; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=wTHbaDxrPNNvtvGI7FMbsU1QRQRo+zezVyhSZmeVvmQ=;
	b=G62uiXo9942PYyEaAJuxIb6n+OCWPY5Q0TrKOal6GtgJM/TPwF6SdNKbEud6tyugu1krZIYuAEbfi1dUDR39A+flYfbRf3/OwKK8HUeXHNqlAyAWMkEdF0+YVQMOR8e5FQ3ndq9yrTim9eURhR2d9IDc5Lm/siLaI+9VytQYxTI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X6n2i-3_1783669407;
Received: from 30.74.144.121(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X6n2i-3_1783669407 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 10 Jul 2026 15:43:28 +0800
Message-ID: <d818db13-0e95-42e8-aa56-78215c2b227b@linux.alibaba.com>
Date: Fri, 10 Jul 2026 15:43:27 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] mm/khugepaged: introduce a count_collapse_event()
 helper
To: Nico Pache <npache@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260706154500.39178-1-npache@redhat.com>
 <20260706154500.39178-4-npache@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260706154500.39178-4-npache@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/6/26 11:44 PM, Nico Pache wrote:
> Provide a simple helper function to help reduce a often used, and
> duplicate pattern across the khugepaged code.
> 
> When collapsing to a PMD we need to record a vm_event and the mTHP_stat
> event. When doing mTHP collapse we only update the mTHP stat.
> 
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
