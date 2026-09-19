Received: from mta0.migadu.com (out-114.mta0.migadu.com [91.218.175.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D189619B5A3
	for <linux-doc@vger.kernel.org>; Sat, 19 Sep 2026 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789821572; cv=none; b=k3cl+EGlJ5m5JNAKg+BvjBljQGXfOr4zcInSksuZOVWAnv52O42CmhqhGRx9EhVFMyKUJ4gfXHUbtBlUvMb6zpYn08OJvjS3901XnLT0k6E77q2mj/iCCSs247XO6S8PJcCosEFkHpmH0aIMrEf2MMlT005OYbPCD/629BGKxqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789821572; c=relaxed/simple;
	bh=63TAU/20trh3z6ZWmLlRWwzB6HR6yfQpshRqu4iyzzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxBqYhszIadiaDJCsPO3nNSOS/uer8CqgU1qz1O+B5PH7BspqJEOtDPR4OHipNX7bZa9/ghQWKZsYs7lxPmuCnEAnB6HGNY3tdtMcgMis+B0jLO5Vr5FS+m9W4sTn9aWYsMCZjGKRbMcNOcuRIvXJuFYl4Hq5awJuLlsoT6qQSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qOfDw3Bl; arc=none smtp.client-ip=91.218.175.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qOfDw3Bl"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=63TAU/20trh3z6ZWmLlRWwzB6HR6yfQpshRqu4iyzzs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789821568; v=1; x=1790426368;
 b=qOfDw3BlczAkXfz2mWdfl+FxMdP/P7ZIPxFaZaK4WoVPnecQV5RrQx/g+8weJunVvfeonNJJ
 uQlzmJxL6PV8UEblrpMB3HtcKsXkQcMqXvPPmfuFise2RtUpDmss56ValftnitEhYs53DjLCoNZ
 dHZF7bM8ZAGsM0Q62endyb7o=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 39ea79bec7641d4d;
	Sat, 19 Sep 2026 12:39:18 +0000
X-Mizu-Trace-ID: 39ea79bec7641d4d
X-Migadu-Flow: FLOW_OUT
Message-ID: <f38bce8f-ee47-40aa-a215-e2e605d17c91@linux.dev>
Date: Sat, 19 Sep 2026 20:39:07 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] Docs/mm/damon/design: clarify bp is basis point
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, David Hildenbrand
 <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 damon@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260917142210.90829-1-sj@kernel.org>
 <20260917142210.90829-11-sj@kernel.org>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260917142210.90829-11-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/26 10:22 PM, SJ Park wrote:
> DAMON design document uses "bp" for "basis point" in multiple places.
> Because it is not clearly mentioned, it is difficult to understand what
> "bp" stands for.  Add the clarification.

Exactly ;-)  I had such confusion when I was reading the doc.

> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/107dc6ba-697e-4b25-ba3e-8ce2499cac9a@infradead.org
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: SJ Park <sj@kernel.org>

Acked-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Thanks,
Zenghui
