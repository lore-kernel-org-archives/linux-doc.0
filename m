Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78023367B75
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 05:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779255783; cv=none; b=NneQiPQcPfWCTeHkHWdoqgSteoMVFFwKJgr8Vep15YIMG/+gaJNpuJgbbBGU72iR26efd9qlXNpP8ezJ29IFH9m63Mi5SHtFKNHcGxVt83ZVWu6W+njhO3zqbE+fkEhO/X07UNgbJs55OxJC0Yu8jzvcgzartZFUWR5SFutc6TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779255783; c=relaxed/simple;
	bh=I1a8cSPtsQoIojp80q78fSfPuU8BUqdXIyHLg8uB72c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTcIInBIQf7nNCO5lze31a+TMK8BxziYa3o0MBLLsGrvTLsR/6rrBjtq3WJDsHSaGfVzZQ6CktiySN8vhy8UJ/4RqB+K6CMCDkZXzer9WCAqj7TOdnch6PbElLtlurd9lBCSJx55zPSlNXdLvmp0TkimkXM3cARby2MKfYCk2jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lQrZNrGc; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lQrZNrGc"
Message-ID: <7ef494ec-9080-43e0-95d4-d687f8703339@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779255778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u/p0aykl0rOg/tr3JDR5GW/c2782npkazgwq4hJABg0=;
	b=lQrZNrGcN0ASJMh/Sw3EpKa8+Q7dtKIVmp5s7pacTjxN2dwWl95pdTQPosyeMIudpgP2cQ
	ahzeaeEgAIXMtyVRl7paAEJl69CJ1itKIqcj0Ega24KangKSEBLcLBunhzNw6Ga3lC0V0k
	C8quyR4Cc7jgkCMTQX0n5ybe3V+Ha5s=
Date: Wed, 20 May 2026 13:42:28 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH mm-new] Documentation/admin-guide/mm: Fix typos in
 transhuge.rst
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <liam@infradead.org>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260520051751.74396-1-leon.hwang@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260520051751.74396-1-leon.hwang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2026/5/20 13:17, Leon Hwang wrote:
> Fix these two typos:
> 
> 1. approporiately -> appropriately
> 2. presure -> pressure
> 
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---

Thanks.

Reviewed-by: Lance Yang <lance.yang@linux.dev>
