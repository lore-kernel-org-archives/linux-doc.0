Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159573905F8;
	Thu,  2 Jul 2026 08:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980912; cv=none; b=OBB1xgdQ2If7itUbEQfrDcSqNDl8ESrz4aldUsBqwNmj8n+DbQImoHg6ZAwUyQr7K7vP5QObn/ONQgZSJAQpYkqnPlSdrtV4B6gsOhQbwYrHzYFR08XwJLjUYaXRQAxNNZCHhHEHClOb6ZRnErGlz5umI0P6lmKs+j5JRadVRG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980912; c=relaxed/simple;
	bh=IwlQVD6GZf37yrZzCsLsbolCA/GCANFnCwC73J10irY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKAN3S3XeEaLBUbu1L40Ru2xNRB8x5FpUUZwb+dF4evNhZSF4Pn4qOo1fHVb0wrCQkPSTMbhf0RUdj1n1u7pYwPB7PlE0/GHHRZi6wDPBKlpBk7cu4j73OEV2dohicZ8Jz2WdiS2PENs+2G8ybsJ8B4K00Y6uoHbYczYVf1VZUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdvMo3vq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdvMo3vq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0345F1F00A3D;
	Thu,  2 Jul 2026 08:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782980910;
	bh=axaYGDIjbRN/WLVUAsZRVTUsNDnJyMogykRKnMGnMls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SdvMo3vqikVbyV7GN/G3mUTdUyt1DA7s/G/fqfnJPt/8XW3esIa0N8tAsZzHq4/F/
	 OjovjV4PPGYpYd1Jj07+pvlfb5MIik7kJ/GclBZIIrPHz7l4hlL+0/jyWxWwHAeduj
	 OKiTE8PIi65cnq5SmL9zlGupryw15+n3QVnXqRRuk1ZSi7pCqiNyTyUpM7BQPvdpfl
	 Vp47QFoCL/dl5Ovg9yUG08XcuCsDyfzYDJ8GNrUI8N+tJV2yx0Q5juc1wGdRONJCdM
	 FPhzP2MumH8r19xmqeCfF7k3DwvwjYs6S5JAvzwbIiedrAU4AbTEncHA8HRKqS9RpR
	 LeRADZ0zcpNmQ==
Message-ID: <f047ceae-4836-40c9-bb7c-a6074bbf1a1f@kernel.org>
Date: Thu, 2 Jul 2026 10:28:27 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ABI: sysfs-kernel-slab: mark cpu_partial attributes
 deprecated
Content-Language: en-US
To: Harry Yoo <harry@kernel.org>, Seongjun Hong <hsj0512@snu.ac.kr>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Lameter <cl@gentwo.org>
References: <20260701141755.85119-1-hsj0512@snu.ac.kr>
 <54e75619-3dbc-448c-81fa-122edcdad1f0@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <54e75619-3dbc-448c-81fa-122edcdad1f0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/26 07:18, Harry Yoo wrote:
> 
> 
> On 7/1/26 11:17 PM, Seongjun Hong wrote:
>> The per-cpu slab and per-cpu partial slab mechanisms were removed when
>> SLUB was converted to per-cpu sheaves in Linux 7.0. The cpu_slabs,
> 
> small nit: sheaves were introduced in v6.18,
> but the cpu (partial) slabs layer were removed later in v7.0.

Fixed up when applying by saying "fully converted" :)

> 
>> slabs_cpu_partial and cpu_partial sysfs attributes were kept as stubs
>> that always return 0 for backwards compatibility, but their
>> documentation still described them as if they were functional.
> 
> Right, for backward compatibility, because, unlike files that
> might not exist w/o SLUB_STATS, userspace tools might assume that
> they always exist.
> 
>> Update the three descriptions to state that the attributes are
>> deprecated and always read 0, and note that they are retained only for
>> compatibility. While here, fix a "partialli" typo in the
>> slabs_cpu_partial description.
>> 
>> Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
>> ---
> 
> Overall looks good to me, so:
> Acked-by: Harry Yoo (Oracle) <harry@kernel.org>

Added to slab/for-next, thanks!

> By the way.
> 
> There's still some gap between the documentation
> and the implementation :)
> 
> We've dropped a bunch of files that exist only on
> SLUB_STATS and new files introduced with by
> sheaves were not documented.

While we are touching these files, the question is what contact to use
there. Some have Christoph, some Pekka, some both.
Seems inflexible to me and should ideally point to the slab MAINTAINERS
entry. But not sure if it's possible. Documentation/ABI/README says:

Contact:        Primary contact for this interface (may be a mailing list)

Maybe we can propose that it can also say

See the SLAB ALLOCATOR subsystem in MAINTAINERS.

> Also, tools/mm/slabinfo.c needs some attention as
> it hasn't been updated for a while.

There were some fixes in 7.2, but perhaps not enough.

> Thanks.
> 

