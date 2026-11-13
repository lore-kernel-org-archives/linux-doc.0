Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559933;
	b=UPBqhj3a1WkGXKHAayYqH77rLh5mFpvrtZ4j7ETn95vB1LZcjfYmjrt7Ku4gWnGX3RES
	 cKec9H6URjwMKcAzhm3VUoZi06JGQZ+SPduXMPDwLlfwPKdqIrWBFg+ulBBWnUxnF9fDF
	 +02YWtDK5yRjSUNe+5gGaw8iIBfh6cs/vcWS6CvuwFWKE3/ioKWVb/mkw0QN74dVWhwp9
	 GXRLhw4W/NCIqXaYzkgt1kOuhth7FH/Efnv8qUiHnNCuTwWqedWzoMvsiZQ2ofr+KgEM1
	 Cz0KSN6XGnNHRKSzIR6f5KmrRndQ8qxTlP1It2d0azKpLaCaCNR+Dl1Fj3W42wf+Dfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=J3YUrGXSXKZY/bSJltCtfezd+TfrIG0RukF4uztH5NA=;
	b=31sPIiwKvwNofec+x/AylHd+9nhWtt6k2Dhmrr3v6QdZ5MWPiGU/6SuD3G4D/BmZinxL
	 HS+Eo/A0sngJ0elLnnR/CpGI2CNm9RFfpPHNk3Q9J0KsEsjxKaOHcUo7W/w0xQBz+RIv/
	 Ct1f07APqPioZBIyrkhMImv1o0G+6jmA0++1ZjK4sG5pOM8TRDQ0C5kKE6vi9a2EFCRnN
	 YcPtM0EquoRL5x5NrrYw6wo62heTXxIksBy+KFFSzwmGHBh4GOPtzTUGEr5MV3EdyxHVw
	 bPoUQQz0equl2vizr0E6natYj9ChGEnjYKMVrcBkAjAUzEHllzpJa2q9J/T98u4YMDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DU0YJExw;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6194606A8A6
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6194606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DU0YJExw
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso836936a91.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559932; x=1795164732; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J3YUrGXSXKZY/bSJltCtfezd+TfrIG0RukF4uztH5NA=;
        b=DU0YJExwNevdhs6jAs9ShP2CJMProdbfeav9l6bUjM7bIAtefanOcvB6eUeDSeSTIq
         5Bz1qdkBoTenUY2OTXvyOTfz1KOzqRDpQm5Mz2ii1Ndj+0tdudboRxF7Q70u01fn5VhR
         m2xCVGR4ZYPlAa3Yfbpx0rYR21V0KzkxSxbcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559932; x=1795164732;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3YUrGXSXKZY/bSJltCtfezd+TfrIG0RukF4uztH5NA=;
        b=KM0JlW0uKrmnjbMFv38nmDjJT44GJzn7psllUTMGsOe89DCllFNLeZR6SgEWxS6eUA
         j+BVVwT6d8O+Qh6P+q1kalCmF/m5N3/uSQOqhmJRu4QccaPtN5UJNDPKD8vX/+txO+P3
         b7qMOGV9sN4ic2gD5Zva21SCVtpKCPmcnWjoLChZnhRlb1dvqxKZjzMl+jG03+oBSA8w
         vevgjastV/FU9ZKlxvDjN7lUTao6vMDUCuYv4p1IFHY0eR7arZi+YpHcZ5sXlVwRc2yA
         +0FBzzTKG3eNcZ1v29kwQJIGZJ+1+b0dgXjPjCQk+Zf4eWm4mRu/9Aq3IOqwloFLIqYr
         ebXw==
X-Forwarded-Encrypted: i=1; AL+hErFtmfD0+Slm2UQyZUK5+EwQQxQYGsIXi9VFxl9+nBvX/iiS5qECdnrJvYD7cX5SF2GJkc0NEzgQ1/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Luu1pUoEvNPwYVr4CDh28UApUFs+06czymRHS7VXjq+p0kBSH
	2A9yygXVnqb9otETj8A1bRSPmXnwMZXJDhT+kawWj2GPJaX3qk04XzBgxtESVQejSPU=
X-Gm-Gg: AYBFou0SKy8Ly+6Kieg4R/9ISaXTD+Xo5B2Erqno5IEUH+S/ucd2T4fsy77RG8oCNWh
	K7fcJJkP7yI4n+rwT1GGdFC0PK64KpEjD83JngIRQmXzCbqwupbux0Xx8wuDR5eb9NUgq0Dzy8B
	4ivEdMRylraQQSxMt8heSspBY+sTXYkHBmPGswMXB2UghFXjHyHNA1XUN3NEXlFatcqZTGXWkpY
	jtxnLNySolZCO9YOJomovyPoMNiwq0p75Ry3/Pm3PUjEaRkHdkEzGlkT0C4gnx3AI36DX74hxuv
	e/bTyOzugWQbLqQ1RPfHGwvdU8GCRFLj1XAAjdNEZl18zZzJwebhBRTwiUTFryJCmwt+hAF90xv
	Mrs0RNTaK+7TYPMXG05ILt7vTQ/TruESrszyhnk+xWulHososILd0ciXR1g9vXE47xROJvkodyL
	qe3nhAaA/PO9VkmFGhYpBUdJmfaEKh5intGKiH/K6/97YyxtsJu6Wu/b4HTSrv1DUOa4eDR0w0M
	/9sPkXr3BWVnvsSRraOjMWLK4g7xHT9Qw+hsBLcSsHge3s+pyCh6dx/YA9KcZpJULoNlVzfkKX7
	orZfOd43zNiqWB+DeMvDx/4JnjVwGtngN+2hZLdNTSNDehKGiLd0i/dxVuspLlk+1iPO8NiyVeW
	CrgLruOjBlXSOfQnMR6p0Q2uDUHLm/DY2TyYkqpRK7oR89GdxTqb8VQzeL3TB757Pp2KR5+DDzu
	gDMcL/tDnqrVGcUb98jWw0VtRDT9sXcc9reMYaRtDwHlG/wyrWCIp9frWOLq0d/o/IAJrB12e9U
	s6WRkqL
X-Received: by 2002:a17:90b:48ce:b0:3ae:5572:c4e2 with SMTP id 98e67ed59e1d1-3b1b0a4e8aemr1576928a91.57.1794559932319;
        Fri, 13 Nov 2026 00:52:12 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm8662027a91.16.2026.11.13.00.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:52:11 -0800 (PST)
Date: Fri, 13 Nov 2026 00:52:05 -0800
From: Chris Down <chris@chrisdown.name>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, Marco Elver <elver@google.com>, GONG Ruiqi <gongruiqi@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 4/6] slub_kunit: Add a test for the slab_buckets boot parameter
In-Reply-To: <202610302117.74D1EB1@keescook>
References: <cover.1793253633.git.chris@chrisdown.name> <47c0b11109203640122a9b5b030d3f41bfbac609.1793253633.git.chris@chrisdown.name> <202610302117.74D1EB1@keescook>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113005205.440863a59b460786@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Kees,

Kees Cook writes:
>Please don't ifdef to drop a test. If you have to do any ifdef, use it
>for test skipping instead.

Sure. In v3 the test is always built, and it calls kunit_skip() when
CONFIG_SLAB_BUCKETS isn't set. The kmalloc_partition test in 6/6 gets the
same treatment.

>This feels messy. Any reason not to just export it entirely and avoid
>all the ifdefness?

No good reason. In v3 it's a normal global, declared in mm/slab.h
without any #if. It's still only exported with EXPORT_SYMBOL_IF_KUNIT,
since nothing other than the test needs it. kmalloc_partition_enabled
gets the same change.

Thanks!

Chris
