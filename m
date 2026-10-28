Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201041;
	b=A+aAdvU31TfqF6jbQTTapir2IY20bOmsrgVYpZz4Bw4voQDN12S9exzY7F3CPLlSiwiN
	 Gs4qx+Nn3/I6zE4FNQuJaEYW11Mkeec1ZNzok26C1RSowBBVa6khwCrV2p5K06NeYnnPq
	 oV7sAg8vDwxpvnw+MtKexP6Q4B6crEoWsrCx6AYJAeUm5Wwp+VS41SdTsf7J7ZafPkVld
	 g4Yu3PC/qwqGNdTjzq8gAWMpuuVkVwQj+JvMCqroW0xTOcfHAcVn2h4TYLXzuNZXb/mxh
	 9W8246+jF0z6SvMMX9NLnrpNTqWJrqLN+NKqvfElcfq5ii8/BJxQ6aeQJwKoFqhBQpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=2lKISFaBYtFQkl6whcZ+TLSbktmxJHBA6VayRzr31Z4=;
	b=wro+SnjW2u9NjDsOyA7CTXXRDloSjI1uvdM8uhWGKChEFA5DOHLFywG1e3+kwgl9eeRG
	 8ZDmMFjhx2s0mXfC4LMeAPBcW4VGAlqXKTn0RXPw+uk10R12RXwnjZzeleValw9NWDgNn
	 O77WIpbQiNVHapmdPNxWtDj1vmDcjpvrIPSVJGJzibBYpzdDtY8zpcQqwSRK9yWueABKH
	 +4GzfGIpJVni9vxVedCUXIYy6jR/UtDbb3GZwZz1hSN61zyvaNYZoVgjoSsuihOQrIdq7
	 d/+YTHwnuAcQI4p1sKUcbczGdO/vF/HgJ5Ya+mdMtPohL+Ke5fr8P14oLntuQ1nYAXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=QzsOFHTn;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B0D606AB1F
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 15:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B0D606AB1F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=QzsOFHTn
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6dd4f3f696aso642033eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 08:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793201040; x=1793805840; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2lKISFaBYtFQkl6whcZ+TLSbktmxJHBA6VayRzr31Z4=;
        b=QzsOFHTn+8+YYCPTJGlmJAzYJSwbb+puZMPW8ZPyRBshyLngAY+e6dPhx864T41TeV
         VRoSqpZvHxzPFF3fa4fGRSkeTPwimQr4nEfmZvP+5fZNAO4/mcunv/VJZJ3ivpfeQnby
         lKmOSVPl/Oez5xPk8aefWZsD/XQxg3z33pUYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201040; x=1793805840;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2lKISFaBYtFQkl6whcZ+TLSbktmxJHBA6VayRzr31Z4=;
        b=hIPm34VV+eVwBj/rAVzmQTLJDFtFjJDnO2Q5shVhXerFaLWDc5rmXNJLbk0MD0XZxt
         MITQd1NbTzrkXhIkBWiKc14utT8QIz0Ho3DKbYVE9wQKfY3D4If7LC/B9RetIqZ9ywDi
         AZDa8O5IL4v+EGeh+i4FHHyQLMtMsUUkuTdOVRBaQYG3CwXVExf365HX+Q+r2nhR9fSW
         Fl4v6epFi2qciujEfUeBE775vZWgfekNjJS1C95YCWbCHU2Xy5o9oeVFQNdEtcvURhgc
         As2gQO8bVSP0Fwr3n0AoxpuELHlt9JEyk2wBkg1G2y/86bddD0kzJB0pj2uMrMl/8AR9
         4M8A==
X-Forwarded-Encrypted: i=1; AKwUvBza4yONFUEXrcewUzZWMTMHDvNXLsI5hs3/D2sZUoBMXbjC+UD8FDfn/Z4gIPKfeaxW+Mm7Dk+bzns=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwqC7OPqwKqmM3HW1Pvjgd1lB7zPfu0LF96eEhL3eHicwKfmpr
	jCgrrRZLtaB2sAHLxi+gerj6/plUhiRHTx0ri6Va2AG++npoEXlj/m243TVDIk2mQAM=
X-Gm-Gg: AYBFou0Z9Gsngb+r7KCbEso5fETqnbctbCM8ZOpHzRS4y9+WORFvDUo9OuaAaoWwpA0
	tKY/0RARtMAOXZoVnKihIAKBhNE3gfWEH5w7EuNjbmjwBs250GPkBu8qQeXhBPRakLlkOc1MgpJ
	1u+yrfQW2dsyXUW2vu1bIt3t+O0HMXu8L74Q5fHCQfmmbclKYbhbmMHwWrJLZExYLGaS5VOiSKi
	+dHFRWdnLW4QOkOGDW0fESPKWUOlKd4PWnEwKhYXBibuZ0OmxLYSc3qUifFNQli8k0rueZyrXZ0
	Ek0mb80reySigwH2uF5JYHjejQ8+F+3g43YK2wT4VYqOP+pPuqKXhOGknbC8cd3Jyp4VMV6cOY+
	b4BI2oX87KtnXZzwJyQ+HjN4rofmVxVdooEZZL51sSIsbhq8UzCUfgheWbLhAihqRHiROQ+ldDv
	Gl9WFnoCGd+QTQXUwvjIRwIJlNYbieAHAiZR2BZJZtHHv/ExutbTnSLVvlO6gZsQ1uk1brQ6ZLp
	zeioHns620KxmhAP38OQYeN/uotEYnGTHN+gtqtCg9QhEkL7Q4BhqpSliXkHLOCnfIX4cZF9LdN
	moB0tS+aqhw5FEQt+47BLy/YJAKGLTQ3llUXcl1QgDnHl4snIIxWonDfRGvarIz9mm2h2dghi4Z
	sJvNkuZGD381UAjSZkp1PMbPrf0aVl2uIOGvVMQP071OhwQZceoZLzmtaMEMdo8QMQ8xgr6DpE+
	I4RMgraOB62mwPIG36spw=
X-Received: by 2002:a05:6820:8597:10b0:70b:8379:c170 with SMTP id 006d021491bc7-713ee85c744mr964651eaf.27.1793201040161;
        Wed, 28 Oct 2026 08:24:00 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142c736d4dsm1749066eaf.8.2026.10.28.08.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:23:59 -0700 (PDT)
Date: Wed, 28 Oct 2026 23:23:55 +0800
From: Chris Down <chris@chrisdown.name>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 0/8] mm/slab: Support selecting slab hardening features
 at boot
Message-ID: <auITixAJMfLtfa7i@chrisdown.name>
References: <cover.1793086056.git.chris@chrisdown.name>
 <16121542-acd5-4727-b64c-f8d519145b63@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <16121542-acd5-4727-b64c-f8d519145b63@kernel.org>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hi Vlastimil,

Vlastimil Babka (SUSE) writes:
>These two should be only a small cpu overhead, which is why distros
>generally enable them [1]. Also the code basically only runs in slowpaths
>because percpu caching doesn't use freelists. It's possible the static key
>conversion doesn't help anything. You could try to measure the impact, I'd
>be surprised perhaps :)

Well I measured it, and you're right :-)

I built kernels from d15d7703166d ("mm/slub: initialize the free pointer of the 
bootstrap kmem_cache_node") toggling SLAB_FREELIST_HARDENED and 
SLAB_FREELIST_RANDOM, with SLAB_BUCKETS, KMALLOC_PARTITION_CACHES and 
SHUFFLE_PAGE_ALLOCATOR pinned off on an AMD Genoa.

With both on vs both off, sched messaging, perf bench syscall fork, a 
tinyconfig kernel build and netperf over lo all moved by less than 0.8%, which 
is within the noise here. So the slowpaths do pay, as you'd expect. Here's the 
change in ns/object vs both off, over 64, 256 and 1024 byte objects:

                       hard           rand          both
   batch alloc      +5.5..+7.8%    +7.6..+12.5%   +13..+15%
   bulk alloc       -2.0..+3.9%    +28..+32%      +33..+38%
   batch/bulk free  +0.5..+4.6%    -1.7..+0.6%    +0.8..+4.5%

These are from a small module which just does ktime_get_ns() on one pinned CPU.  
batch allocates 4096 objects with kmalloc() and then frees them 1000 times.  
bulk does the same with kmem_cache_alloc_bulk() and kmem_cache_free_bulk() on a 
private cache, so it keeps creating new slabs, which is where the random seq 
gets applied.

So for us the right answer is to likely just turn these two on rather than make 
them switchable, too.

>Maybe we should just make them default=y.

Agreed. In v2 I'll replace the boot parameters for these two with patches which 
make them default y, and keep slab_buckets= and kmalloc_partition=.

Thank you for spotting this!
