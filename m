Received: from mta0.migadu.com (out-115.mta0.migadu.com [91.218.175.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF673B71CF
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 08:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788596452; cv=none; b=ZX1ZcfmePxzMc93vZBovZtHCsEX78MB/oHr/g70p8N/PlU8qrcCyLIRn7kaJLV23ZF1oMUq6LO7f+rpu9JADfZ+DBcPQaciaaqtTGMJoihlFJdsRGSE5VhHgIT4Vw6J+hODN0kVoGBkhdPADR42P/sVo261qeJMKS7zjaHQn9xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788596452; c=relaxed/simple;
	bh=cWv2OsYaUjRAleYfGIeSk6xvjxd4wSnUJO1edGPXAD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=guzKTNuyNsqlb+aGSOqCmRpuX5nXwFDrXm48IpRVBGMg0WAhdKW0NAHvV4UpCVFKttnlaJ3413HpxhEUigXinFLarTceaQ1m3YB9YtK4C6Cm2Zp4+Yxj0Ul/uzZD5xe1JhChZv07j2rKmXZVRgJy0U94Wf/VAneSfnJ1aq1nFq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IicFwOJs; arc=none smtp.client-ip=91.218.175.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IicFwOJs"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cWv2OsYaUjRAleYfGIeSk6xvjxd4wSnUJO1edGPXAD0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788596436; v=1; x=1789201236;
 b=IicFwOJs2CPlLipHw597EH7HUKwox4Ly1bXjZpWkeBf20n4MKLPELD2P97Zjm95kLCmKluvD
 1ZqczU3Ai3D+CEGD3NGVKwsE5idxGTNEzXLfZFFxgGoKVas590lbIivGqKDe2bMx88ZNhU6NUGr
 90fHICjD9DlHQXAGAONWs1mI=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1b4d3cf39591adcd;
	Sat, 05 Sep 2026 08:20:25 +0000
X-Mizu-Trace-ID: 1b4d3cf39591adcd
X-Migadu-Flow: FLOW_OUT
Message-ID: <1143901c-5036-4b79-8135-21ce57075136@linux.dev>
Date: Sat, 5 Sep 2026 16:20:16 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] mm/sparse-vmemmap: set section order for device DAX
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
References: <20260831075342.57563-1-songmuchun@bytedance.com>
 <20260831075342.57563-6-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260831075342.57563-6-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Muchun,

On 8/31/26 3:53 PM, Muchun Song wrote:
> Device DAX can use vmemmap optimization only when a full section is
> populated with a compound-page geometry. Record that geometry in the
> section order before populating the section, so later vmemmap accounting
> and population decisions can use the section state directly.
> 
> Clear the section order when the section becomes empty again. Also reject
> partial additions to a section that already has optimized vmemmap mappings,
> because a section cannot safely mix optimized and ordinary vmemmap layouts.

Perhaps we should explain why they cannot be safely mixed.

> 
> Partial additions continue to use ordinary vmemmap population, so they do
> not save vmemmap memory. Such additions are uncommon, and the lost saving
> is negligible.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/mm_init.c        | 13 ++++---------
>   mm/sparse-vmemmap.c | 16 ++++++++++++----
>   2 files changed, 16 insertions(+), 13 deletions(-)
> 

Also, the issue sashiko reported looks like it was pre-existing, not
introduced by this patch. So:

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

