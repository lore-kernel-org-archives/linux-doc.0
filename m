Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640218;
	b=p7R+9+oautc+jFEa9AUL0EwOeGFicJ06PnZvqnEPwDJ2qXxYM1bP+ziK088TNYf0cIvq
	 qb/v8r49NVFCVa7Q/hNxchQ+MPFwN130GVSwphirkl92C01mPIJhsLD89zwwbrLoZx9dV
	 JDYpJMUofxPnb5iySBUD/JGRlVTK/AOeKGa8uO0oc9sjhuDPSUWvqsuQu6g/Nf+EWiOn5
	 WXopYSKL8rQ6ks3bgHnBUoGY3cD22pRBO7jQFuWLEmLJyUFgPgt+wYFEheKjPZZcj/hkq
	 rV9i85GKxLDDusgK5eyDchVGBNjMEtcM0hR7VzZHVowsH458Ezhz2P8+NFAK2ZRUg9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pld+EM/EXNXxfgZubwvob88FbJ3qDEqFg5eLGFwAxrw=;
	b=tfXwBxcnKX3JDU0KWCNpuf5uNY5o+T8otMlcX4HLVsRSWy9qvUVrkzNIlzQm0Yqd411w
	 OlrE9pPy67uBn5XBLXjQjXPqQtG1Le5wHfoYV6XqU3Oa+aopgNNmEb0TBP0i+jXdB0vcU
	 GX5xvFhFcQeHd/X+tTdLbrpulyeUT6UlnA0MoT4vo2hxXeQbMpf7MAISx1dP/7QaM5fgi
	 po9i1XGl4yCLJzbGq0JCn52XIojS5hleQVPvmIPWgHtQ8dB9n6OJGPY3HKDwxCVZIGiqY
	 883lsKOANuPc7aBzw8HFkVJgOK2hr+VTINdvcB6G8Pv8heSJdazDBHzKXrw+IrCvHNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=fZh2cb1L;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B3960A2635
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 07:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2B3960A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=fZh2cb1L
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91eb53957cbso45070976d6.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640217; x=1795245017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pld+EM/EXNXxfgZubwvob88FbJ3qDEqFg5eLGFwAxrw=;
        b=fZh2cb1LiTzSJJuOnufVWdO5uqn8qMfsQjZkSDcuVrcFCC3Nz081OmFdRyBdfcDXeK
         PtqCPeoNuyEztLDVFQOTRjF70fsbDa/YamFvNQf9kWWfHaCXg82Zwzsa4UJu71zJVFbz
         DrH38E4lxwMsJRxFci+ewX/0oAPjtdvLPYZ5VTYhAzrtXdl3mrASJNk9oDZMBuGQX7J4
         pZnpsmYLNfNkHHM8PmVTtoIUGhudURHAF6PdA0hZAdyipbVro6zJupwZRkdKN0fw+Q0d
         ORi4tocZDqoL6xebdcxuIfScFZIYh9Xs4P3jbWKeSHPO5JkBm9C1FtrFtA0lJ4W59m0I
         fNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640217; x=1795245017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pld+EM/EXNXxfgZubwvob88FbJ3qDEqFg5eLGFwAxrw=;
        b=aeyU/4aSR0Cr/MCqvGKOdc2X5iicI/wCPJC+TqvYr9qkNIxmUiu/1FnRqrj+NmiLv4
         Wsm4ORklVqb5mtCjp81lPQR2HEiAk89iBKp97AMHwlAvmnnWj1LPzGUy19K2fRBTDJ8z
         QqtC4lVbgdkpVrstlVJr4JI2vZcF/dHFgpN2GFTcHsEfi/99WPVYVcpMpWbflQCK5ZjD
         iumMfTbBOBd8juLDhS893uO64kY6I4OqSalMM6V1/Iv6dpfIuz/1r+871OYGt85a2C2V
         ToIics9AW1cNpEUGjBVkaeeodgDG4xXCf5c/RxiuDmONTtAr9XgAl77RXBxrLgfWZpge
         otHA==
X-Forwarded-Encrypted: i=1; AL+hErGnMgjMN9qh7+me+c8BAwHDYaOU5VBzUcbzxo66A0dYrlcsIHCg9p4JDJQmo7vNZ4SeimVqYQonmSg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e56lZXIyOHwrAniPBf31EGuTZeQ3L2vaXcb/TdxdnDFw/00oQ
	kgLWUdokfssPe//0n1NoM88BfBwli0Aa3TS/AaxExJwaTMl+HAP0XNr9xs6689d3XX0=
X-Gm-Gg: AYBFou1jwAZ0x6hrK83NOJSYrGMFxPczxWzFqUSetCtJgjiM0ADAWMnkshvJJDW6UFj
	l9/XqI+A/VgTBz1pJ6gsVFw6HTcvEhe32dy2wbefsNO70xV7cNA8Xg6PObkYmUgcU8VBojBh+bk
	EIC2+qyBj3Hw/nkpCtwxL9SJq/mrtXuHMLs7EBPcjoPQxwZJWkOpRU2x0d4BQwCQsQmVtmty0yb
	NMxmu+kuqn4x0GOJmR+QUdDhIuP+7s2d2Rsky1A2OwCZH7co3UVEOvHOWtm1FdKuClCdto9R6v2
	a+IRc/Dh3jE6+p1wvcrBl1CdQaOIlGFEze6b1GFQE8RLmRnSl4I3dnRfbITc7z6Z17tHWsL1M4J
	ktGn09xvDe4d6AHOQFdpryoU9IM60FwUsr3+coyaQyqqOc1YnNxxs7jkWPZQzcahNiidcbChxEs
	To65OvtmPPNPsG/ObvuDhEWG6MLZvEDfFiTvkSUFBranD69gXO0J0LKV0M+Riw+EdFhc37grdNd
	9UsNd0uQRxk7vM/gnEfzE2+uQC63thfTDZlUCHtTnwIQ3OfH8Xsb7E0gHaSm40crw6v6GQfVBy5
	QjejZQVzhrcg5I0If+vIJ0Ybjn0L88VoqnwhUCISouayCvkIeI4pMkX2vUZ1vZ8oIDWrVHLEVDt
	53k1wwma7mP9pLgeueuB3n0F1XqX6JMckU12g
X-Received: by 2002:a05:6214:6347:10b0:91e:cf4d:f868 with SMTP id 6a1803df08f44-91f2420f9c3mr56246926d6.22.1794640216984;
        Fri, 13 Nov 2026 23:10:16 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:16 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org,
	damon@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	jirislaby@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	pavel@kernel.org,
	lenb@kernel.org,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	sj@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	rientjes@google.com
Subject: [PATCH 06/22] mm: base hash distribution on common memory nodes
Date: Sat, 14 Nov 2026 02:09:43 -0500
Message-ID: <20261114070959.3490008-7-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114070959.3490008-1-gourry@gourry.net>
References: <20261114070959.3490008-1-gourry@gourry.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hashdist is useful when large kernel hash tables can be allocated across
multiple NUMA nodes. The tables come from ordinary allocations, which
only N_MEMORY_COMMON nodes serve.

Count N_MEMORY_COMMON nodes when applying the single-node optimization.

All memory is common as of now, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mm_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index b4c4dba93652d..0c076bf5bf380 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -685,7 +685,7 @@ __setup("hashdist=", set_hashdist);
 
 static inline void fixup_hashdist(void)
 {
-	if (num_node_state(N_MEMORY) == 1)
+	if (num_node_state(N_MEMORY_COMMON) == 1)
 		hashdist = false;
 }
 #else
-- 
2.53.1-Meta

