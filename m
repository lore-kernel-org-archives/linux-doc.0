Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795876226;
	b=rYXY8/cuorMKuy2CROPLgndyYcDr3SJrNJyCKZMdxGyL8MmncECuswomH2pR3RUhHmLS
	 mI5p8mF0dvQG/re7yVTAUEKYWZViFP6brel8ORGF2Douox41NdgbELGzMm1qhmVpIuXkz
	 AA17PPZ/HfSRpGZlmS7w8yjH8k7WZ5z5FclBMlc96HYPAi0SBNWyK4vZVZQUbsVpglhrZ
	 Yx119hOa0/L4PMPUW/7duCz0hzd2Ce4D4SV0GELumOhKCj9LD2ei1FgwrqLLVO/gJL63/
	 KHjhTAkk97atXI0ditCHwmWOQ5GC+pkVmO7YgZfoDlrfYqBefMcPLiHNYzS4mLtBr0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795876226;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vq4q9cwRtuK53vw3iKxhgmryKRcqIdb6rrnEW5KeXZo=;
	b=Q4aTJRTuTqjSB2wT1qkjl0h81gYpa5bpRJUCZswAd/WAuT7Jz3YoqHbI/RPVRlxuQL1G
	 8DSypr/Vj/pZkSu+sqHbP42lwgQug4IsSU3bfNDO1gp8uXeJDXqCP1fOPdk5NmgHiyQnM
	 dRXrDT1RpDvddeiBWpSKDXGkBE7JBITL7FvqvVHn6tSUlEOoUFYJ73ujM0fcvYBI2fw6h
	 WVCFTf6PSIv2PFm4Pia5yYlqKAp/uAM/nvcvtq2kRIjj/AAPzH7nQdhr/6RQIVixQQcXZ
	 r/L5bA0EOkXi7ZJTXlyBjb+mKitPyedFH7/yyTRCbsCIfIOr4vvSmNQFKKW498R7GJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HaEbLixJ;
	arc=none smtp.remote-ip=95.215.58.177
Received: from mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC754606A31F
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 14:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC754606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HaEbLixJ
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=de2c8SqCZj1+J8lbc6AZ+V+T6yStst8q4RNxh77dvUs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795876223; v=1; x=1796481023;
 b=HaEbLixJcMrqASotYvRvECfGGJUFsSxVSFfkzQMnEMz7XnqfYtIuOMFkunh/p6nVLQ49DDqT
 rjUhh/2RoG2xaZLNZfblgS0Itrw0S/dq0Pkpt+u8/JgWiq7xqmraDkck7yL/xebmt1IIuRYTqFu
 znmgq+dxSNbmbfdbt0BM0s5Q=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 52ed384f59dec9ea;
	Sat, 28 Nov 2026 14:30:22 +0000
X-Mizu-Trace-ID: 52ed384f59dec9ea
X-Migadu-Flow: FLOW_OUT
Message-ID: <506cec51-53e0-4e0e-bae3-b34dd231ce7a@linux.dev>
Date: Sat, 28 Nov 2026 22:30:15 +0800
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
Subject: Re: [PATCH v2 17/27] Docs/mm/damon/design: update for report_made
 probe filter type
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, damon@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-mm@kvack.org,
 Aveline Noir <jm5905938@gmail.com>
References: <20261124153636.91854-1-sj@kernel.org>
 <20261124153636.91854-18-sj@kernel.org>
Content-Language: en-US
From: Enze Li <enze.li@linux.dev>
In-Reply-To: <20261124153636.91854-18-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/11/24 23:36, SJ Park wrote:
> Update DAMON design document for the newly added data attribute report
> existence type probe filter.
> 
> Reviewed-by: Aveline Noir <jm5905938@gmail.com>
> Signed-off-by: SJ Park <sj@kernel.org>

Reviewed-by: Enze Li <lienze@kylinos.cn>

Thanks,
Enze

