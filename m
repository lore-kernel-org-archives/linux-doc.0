Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706828;
	b=wa/L7dlV7mAjpsTVfXxyzGPIbszlwlItrLOR91N8SWWBu7AhKE7/JqVQ52wI2EGcxzps
	 5Dwqlin96bT1f9ys4ajMnMfltOSfHQPnY4VwnrqGCFU6DScsSXDbRW1zTP4s/h0zCXJa3
	 VutSZX1Q+N3iAz23rm4OtfQj/Sp6fqLhTdbEsakUOC1jj9dRffTlkTDTCrsQRcVvmemkI
	 FMjlQu2C63imj8bWf7JA5WiD9KH/I0eOf/rlxxRmdUS6TJulousHlif1MGjdbmo5NilIh
	 QMvnBMtrsVFIGIxrqVXZaJ1ukAz6PSwPtvBp8wsHOYJ9erk1sxtx0pYcDNeqPac5o+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706828;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yuJqy0NseoGTjiNdlXcAFKErbfQ+Md0iYPLbsmzKFlE=;
	b=TFI8KYQLIcbFntFimNu9+F1o3QVJtQsM6crNviGu0kCj24tKh9zpEe45T2ogKHtmzmuv
	 2r72ELIrnJygffOPaXK/LQQFFre5lBhOecLf0731PLX4p25LJB2idzLkdGpArgtjthRAc
	 QKebpQV+2rx8tjTDsLKKE1gYEW9Ol2KQsFlaG4NgKwB83W016Tm5Fn6YpzSnYTHzvwd9N
	 Qnfr5sU1RnYVRi/vb3ZbmfLOEsJI92t6cz9JBc/XkgaF5hiw2aoSUenttymCQFLFsbmBJ
	 x/bkz8lAQzlmWLVZqCy2MNCUdEPWOLZdB9KmZ0oUp/ks3SzK4zbQWXGFaoIELLegtLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Be0FqlMx;
	arc=none smtp.remote-ip=95.215.58.75
Received: from mta1.migadu.com (out-75.mta1.migadu.com [95.215.58.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE26606A329
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 15:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE26606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Be0FqlMx
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KbVedbyeDFEeAK/XvGiJ+Oc2ogwQltzRQPHWkSa26XU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795706826; v=1; x=1796311626;
 b=Be0FqlMxNPZRITdwlhpbfS4pAtk9gkovrqjUXwnQdP4bizi2LxnjYG/8pNP9QurO44CUHnAM
 viDlhjZXFpTRO/t/00qXgCY4Q6azhAqr8UuIOxqJMmndFPhKRo/uA1LFD4HNm/sIlhBkl897i/7
 FveDU6eZng/qPicSRa9ynwQc=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a9864cef7e22ac7f;
	Thu, 26 Nov 2026 15:27:05 +0000
X-Mizu-Trace-ID: a9864cef7e22ac7f
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 07:26:59 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/memcontrol: expose anon and file reclaim statistics
 in memory.stat
Message-ID: <20261126152615.GC738059@shakeel.butt@linux.dev>
References: <20261124-memcg-reclain-stat-v1-1-c6cb14b0d917@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124-memcg-reclain-stat-v1-1-c6cb14b0d917@gmail.com>

On Tue, Nov 24, 2026 at 03:51:27PM +0800, Xueyuan Chen wrote:
> The aggregate reclaim counters in memory.stat do not show how reclaim
> is split between the anonymous and file LRUs of a cgroup.
> 
> Expose the existing per-memcg scan and steal counters by LRU type so
> userspace can measure reclaim balance and efficiency when evaluating
> reclaim policy. Report the same counters per node in memory.numa_stat.
> Both files report the counters in base pages.
> 
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
