Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086522;
	b=BNzib6o7bX3VZsebhwtk/uz8r37ZBRB794qBWP1tIkljcl5grROwBMlPRpDrPk8PNZJC
	 2He3tZxRy66r6u6tGpNCoX/vYNHv+IAOYVvdkmZOMV8ErOv3Fm7Frf+CnYKryWlufIuel
	 j02//dbqSGoa8zloCffIPg/rd3DEn1Mdo7txrgvSpRWna6AR5Aqvnz6NNdsx1y9N3NXkB
	 RYjiZIYj0Fs6oi/I6qLz6h9ori06QXVkMBX2hQQ5qlVEr9PrT1xyYg2J72EwffVtj6jKl
	 rwblr6HCku3Gu6P2m0JET+nXpyg4HtFFUnY0AhJG0Ex2oswMTDMuvR7XSYvsKginhUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=/YRCUcykH2kxr7zY9j/CVMJiW+kRaXQLZ0+Ryrw32iA=;
	b=yuGxWv66tPZNrkjyaGtP4iZ4prV7ET54/ubrjc/zkxlWJS3ORbOYo8El+wO+cx6aYFiY
	 WD20y2G8aP+6nwg0ZOR3GhPEq7ecyPtp1mu5lh8vbw/1RKegAeDKCaHzOWIWZZF11GC+e
	 qpiELEGWcRXlM4NXT4YhcDUTncHbJgS02hsxK2V9P5UNVvYErCjH40hzju5i7itS9JrrG
	 krjP1/G9oMUEhkTVToyxPFn2J7vNhxwRUx0bzu63NdxhZYgH7O38cq0dYxFB0Nq+A1w2Z
	 d8/3X986V6jgPlfKlFrAwfnE6dn6BQbH6obOpp6KUVLG8l1i31H8LShGdThiXZmNmSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=FPRs6kHO;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088A0606A31B
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 07:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 088A0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=FPRs6kHO
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae0852df46so530152a91.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 00:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086521; x=1793691321; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YRCUcykH2kxr7zY9j/CVMJiW+kRaXQLZ0+Ryrw32iA=;
        b=FPRs6kHOEm4ATNDQSENGfPMNU0+hN+7ms5V6cCbZEJwXHuPDQk5xzoiVVGUXRe5oxt
         Y/iutnamuouYLVf4n+S4ll6RkcDyad8jjYmzDyNNWy6Pf61YESx4nxH0QJWpvVZ3cvQg
         Lfs6Ee0ex4u4AEd3DGOOX7KpSQ+l2tRoH4XEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086521; x=1793691321;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/YRCUcykH2kxr7zY9j/CVMJiW+kRaXQLZ0+Ryrw32iA=;
        b=yXmg5u4CnS6pPwlY130+oANVZiCfFfN/NRxprmsiW8GNTeh00iEKuI3ultHoCQAlaZ
         uuZDubEBUiRGY5AidEyXW6kjr1W9FKLYk1KS5YAioOaphCHim/WxTBc+dqoz9bCL+rhf
         B3mmGdwVNNHdu38mSs6Ia6YZ94UNawN0ETM9661fD3GDHxIj3CVxgeeu1LnkS9TLJHKt
         LXYK2YCVTWAwLUVmrWb+PV6LY5srqUOxoHIp8UaD/BJvQKBP9E2wxgj8tSyZswGZgM9N
         7vMJn2jGQJysvKZlA9sUHfNxn1LSqa/Akc38UdPdXMPB+SwU7nSA3USbQ7mQ7fGZVzdd
         OKGg==
X-Forwarded-Encrypted: i=1; AKwUvBzrxkutzG1rSKZ3ao8i0VAQpqt6XhWFPBcFFa3PSS8pN4564n+Dq565TEGIP1oE3I9FcWIFAie2DE0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJV8x8NPqfp6yWHKSJtYAUeVNNyTFcW5WRkKjS0ajmmAU548+LI
	Qmie62RpEZ+kuoAUfEDKPTd9Or3IVlHtErHe8OPjBo5UXha8qiZK194uoD9hX7uJs2M=
X-Gm-Gg: AYBFou06mHxvR3e6rjECNaic13LwdB8IwChWpHsXCYFLFgoAInoXkjahQq2CVGpKLO8
	dHBePeHvUOwTnR4axqt6wFmpDb+3nekYQiNoqgK3cr9NrG/DiPAMTl7gNUNUnxg7vK7UszAzKWP
	AFXuXeuLLmsparTLKxxuVzIgRpZO7gkvuCZo2uuiiRtAdkZJPULGUGZT1xlw/RNLWO1ke9Ch9ks
	1suzp8EjbQvo0zbOqQVYLIFkuZ446J8/gN1yWrmfFYvqueFMenjsgIRf+MLswEIjZijncQj1zRw
	tWzQmgrE5cS4zQFWaLHdfJ3/72UF234HgAeFdPJGBMos5G14Nm1MzRMG+i95nRvRPlT7PS3H05h
	7rfHxG8ByjTpx9ZLHUguT2mIfDGo0HqWkkvfld+xnNQvrLJWWQwfwFLGwX05gj7rIsBU31rjxqL
	zvLmSLvBM4z/aBiU4tttXbNuiFwjcZlGbRA87aOuN4RgAgQa8EC5zAbHfTetC1eOzYnFGszCY99
	csLgz+Y0c1mNkyEUsI0EdLwGd8OK8jWGMhTxMO0Uszgvvp6sj8G1fhu/V5gUu1fC7a/i0J+WcqN
	PtUEBL0PzL1pMcab6kmO1Qnq00hYN3QPOt/LAK8+FSly5SkTJTH7TdKDJjjN2haw8NcZ1pOZt4q
	TJUT0nWOsKJ1zYjdffN3hs/8aMrRp1hZNRoMYA6x9Q1XHKA==
X-Received: by 2002:a17:90b:35c4:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3ae402840cbmr752308a91.14.1793086521251;
        Tue, 27 Oct 2026 00:35:21 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404429a8sm2527473a91.8.2026.10.27.00.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:35:20 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:35:16 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 0/8] mm/slab: Support selecting slab hardening features at
 boot
Message-ID: <cover.1793086056.git.chris@chrisdown.name>
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
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Slab hardening settings are currently all build time choices. This means
that, unfortunately, hosts with different requirements end up needing
separate kernel images. Let's allow those hosts to use one image and
select each policy at boot instead.

This series adds four new boot parameters that default to their values
from CONFIG_*:

  slab_freelist_hardened=
  slab_freelist_random=
  slab_buckets=
  kmalloc_partition=

These mostly act at cache initialisation time. For free list hardening we
use a static key settled before the first free pointer is written.

Chris Down (8):
  mm/slub: Support disabling freelist hardening at boot
  slub_kunit: Add a test for slab_freelist_hardened=
  mm/slub: Support disabling freelist randomisation at boot
  slub_kunit: Add a test for slab_freelist_random=
  mm/slab: Support disabling SLAB_BUCKETS at boot
  slub_kunit: Add a test for the slab_buckets boot parameter
  mm/slab: Support disabling KMALLOC_PARTITION_CACHES at boot
  slub_kunit: Add a test for the kmalloc_partition boot parameter

 .../admin-guide/kernel-parameters.txt         |  29 +++
 lib/tests/slub_kunit.c                        | 186 ++++++++++++++++++
 mm/Kconfig                                    |  15 ++
 mm/slab.h                                     |  24 +++
 mm/slab_common.c                              |  48 ++++-
 mm/slub.c                                     |  68 ++++++-
 scripts/gdb/linux/slab.py                     |   8 +-
 7 files changed, 361 insertions(+), 17 deletions(-)


base-commit: d15d7703166daf7bd62c844a3cb1b3a6279adb4c
-- 
2.54.0

