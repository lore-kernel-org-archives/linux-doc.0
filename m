Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509260;
	b=ho03j65kkzis4r4h1Z4UsI1Kx9V5zxGrpGa7jeL8e3y9C4Yr92Vm/ySJAFZhJTceDWYK
	 oVXerUy9RJ54hjmPr3S25jkrOVbuFPuP+UUkpukP/LzNEYgXwqL81thub7KPKc1Wx7m2O
	 jagNSx1ZaDHy/YWcwhW85fVQNdW0yYhY4ndX6O3FkCf+O/htgWzemLp+Xj/9L9qoFfCtq
	 j/PtlPoO8Uvrkl6JyOSteGRRu6WsRWdIjZ1GXRCSl7z4Gq+sJCDT0hBBkvtpmkYJ35gti
	 pT4QCV2T7yxi4D5snDrHzkE+sK6ESBZu8x4sGAom8/z+tkIBumKkgERkQicf9kfU/iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509260;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=K7WfdCMMRCOuD5ycNmdQ5yCGlPPSWFzHbHH6Cd/QbH0=;
	b=SsjNml2P4QJrglmf0hutJU2w/3F0YvqY1hRyC1WcMmk6cAjquCYWSddZgwWSRojCuKJ/
	 +9rloIxwmAW016wGUD4kvX26tipXtJxNfDpijYDnzoGfW3Hj0MqeVT0dx52pF5QvIu9bx
	 ZfRaG4NVlvOrtaskhfVAw1m+zj4YQyf/MJiAbdECQM++FZNrzSgzVpOJ6WLOLsPBQQtE7
	 0+k2Q+wyBS92+CcozOV/2RS1SvoDkG2jNjADQblnoT1R0KhgP0d9xt83ix5hjnCbaR4rv
	 35cU2hRhXWxm9KJqZmdpoc/AU0nCKoVO5D0U44UU0Ar4oboG66BnoMW4oNeQv2Qi83A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ep6nvdu1;
	arc=none smtp.remote-ip=91.218.175.141
Received: from mta0.migadu.com (out-141.mta0.migadu.com [91.218.175.141])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AF4606A33C
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 08:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12AF4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ep6nvdu1
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qoHhrk9Sl3EhFD+MHGeYcSOXmqUjqg0h5hTx5ClbPdc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795509257; v=1; x=1796114057;
 b=ep6nvdu125Y+SWS4EygrYlF4UkJIQhlLmKCYXAu3v3dUyX+iffpoS77NN+4FiO+Whf4sEtza
 jw9kNX2wENhqiuiAMJtgDSKy6YrR2M5QN3rU4pzW/v2kIgf2BQ9kMEWPDUFm4+E9FVJiaujvJlL
 8sGNpNa7LG0MnkFf0qZYs4Vo=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 23c9c215f8cde8b8;
	Tue, 24 Nov 2026 08:34:17 +0000
X-Mizu-Trace-ID: 23c9c215f8cde8b8
X-Migadu-Flow: FLOW_OUT
Message-ID: <d5b7be4a-0137-4fe7-88ef-5cbcc23d0855@linux.dev>
Date: Tue, 24 Nov 2026 16:34:08 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Docs/mm: fix stale split page table lock references
To: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "David Hildenbrand (Arm)"
 <david@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
References: <6E11B4A6A6E0DCF9+20261123030904.57369-1-zhaozhengzhuo@uniontech.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <6E11B4A6A6E0DCF9+20261123030904.57369-1-zhaozhengzhuo@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/23/26 11:09 AM, zhaozhengzhuo wrote:
> The USE_SPLIT_PTE_PTLOCKS and USE_SPLIT_PMD_PTLOCKS macros were turned
> into Kconfig options, and CONFIG_SPLIT_PTLOCK_CPUS was replaced, but two
> Documentation/mm files still refer to the old names.
> 
> Update both references.  Point readers to mm/Kconfig for the dependencies
> instead of restating information that can become stale.
> 
> Fixes: 394290cba966 ("mm: turn USE_SPLIT_PTE_PTLOCKS / USE_SPLIT_PTE_PTLOCKS into Kconfig options")
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
> ---
> Changes in v2:
>   - Point to mm/Kconfig instead of restating SPLIT_PTE_PTLOCKS dependencies,
>     as suggested by David.
> 
>   Documentation/mm/process_addrs.rst         | 2 +-
>   Documentation/mm/split_page_table_lock.rst | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi
