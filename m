Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640246;
	b=N8AWiGBwDrzE3kVY7ODg4OwAXJHz4x0Pp31hiJu2+tn+LlCzUBj/EXaGSnMfvrPj8Vgu
	 KHbHNwSqi8mwOZs0jI2XSDYH83AsNnmaCp7VirsA4SJ3dqrgEZCm2SVhWlplztm8kOjAk
	 XHAA4upfflxY9qU/dQieUTu1fye+03gxHzba59sm3LqGavy47Eg6fDtgXEXUjlh8bUDh4
	 xRTyXcpfBXLoyogIaziJXkJ9yAkLbR3nDnF09ACMk/85BPtcSCZ5lhCHOrUuodOVQtrMV
	 23gqUxi1IZ5Bwu7mWwU2wOnKbs3h4IZx1+QmwPYoEg3am1y8WqM0K8eK0+6RN+mikhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YEak+iwgBd7H+tAUDcNraVIKxkIkqE3kGPmkcYQNtnc=;
	b=Pv/hqItBycZxBAseKaYOQJz56P4cgCGYb/yhpUBbPzB+k4pvPZo8KAIfKObmioDZcCLC
	 sudIAjDMxp8DX/pST500txy3UeJzG8CfMM45LkGrgevNP8/kwy2uFzLieGaWtKDzR6NRg
	 aYbf7emeJ2ZUik2AeHYhspneg+XbYDDYzTbTv8i9qQ/rBP46PcmCvpyn/dAvel2dDHBTa
	 oLw7yaB6spxC9mwaMZfhdOQIU3DU5QAGJr3PyQ+o+NLBKDp8OfRpYelwDiEYqj4HxEPlu
	 CjFirMvN8cvQA17vlDtIhfK2aaXRPNfoDW/t7g/DLUikc4pTs1+I+5cn6GDNlGL5xcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=vA6Z457O;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D038160A2604
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 07:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D038160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=vA6Z457O
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91ecbdf5343so39952486d6.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640245; x=1795245045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YEak+iwgBd7H+tAUDcNraVIKxkIkqE3kGPmkcYQNtnc=;
        b=vA6Z457OaKIInkkgqCLFmLHWy8VkPxMPUJrmpqeT4EKmn4j55dJGJtm+KTlKszz4wA
         UVrXxbHJUqTl2q4EWTfsddFD0AVrEgctyu7/vealCMDaACIsjVaRi6fltMovNlc/ghTa
         MZxX0LaX68Na8PnWlYi+EO7zzd8dcS8Jgcy5MuKBon/qrGxyjrHOWRez095sA3iW/r3i
         BnupImPHFtuPKI6KKpj+dxkyO29yAsiGaFeOIXhXHt/49b+fLZ6RmF7WRM1rxS8LQxHZ
         Z3iuplIcBrJiSL7Vvv0lbDuimSfZhQq6LtlRDtpKViJ9Yo9UH/x4VBFOcBISh0iqvNYA
         6IsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640245; x=1795245045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YEak+iwgBd7H+tAUDcNraVIKxkIkqE3kGPmkcYQNtnc=;
        b=zy8Dutxvs/FhBa4uc3QJKojOEvuuLmnwK7vJcO7Z5d4CPGAG4OTdpxbwrxGK6EeRG3
         iKsxZE1L2v+u+V9hB1xwxsDPUXH2K+gj5lIrNCf/UEDQrCUYtWluybsCNwhXsIF+wjhi
         fSi7JVytsKkRk0Vvk53A7pAu41VrE997xC1hb7BhNPQcyO8hEPKJI3s6w0G+VXq701XO
         DD5k6YBPixeSpOFyzI31keBP8zSbP9BEXXiUHIUKLqPF1S2/UDlSWTw0It3g8IdXW/y6
         U+Y114HCSoxwsIA1tYK0Mp9+abNAjuXYmKNiE/sZlDFYJKoyLC11v5Oa3vZ/F+tFTi2n
         xh1w==
X-Forwarded-Encrypted: i=1; AL+hErHS9/ClUkWgDZ9LVPDvdEEwZGkhn4DwAGd7WlGI+ydRk//WgHL+KGP8Pa75jK25DHoW60ivVHmNy6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yv/sZNzoGHFAf29ajLlsQoZWugUMVWuYSjW9xr++iEwy71xoz
	2H/Yl5TsN+t6dHU/SK5kprq2H9a83Vs2eJMfPqACOenZp4GdiXcEZiBNALZjHwu+hwk=
X-Gm-Gg: AYBFou0Z5ewMkv0ZRQzqL+SyUrOpEFiRlyZtOJcUH6m/iDlL/YY/3oCeA8wfAqe/iZF
	yxYaWgikndQg3UCabLK3G0Ag8/4zLTqYvLqSnXEXntsz6RZX9XaJ/9yQKcA3BsBjDfQUqev9f5C
	14aNDGEz7tGIX7bGYNnycdTbkdFZim6JUotuG3ZLXAQg1xrBIR9Irb37LtHtcxxGl2MOGaHnynn
	Z5fXF/RmVqnBIy9m1FfMUCfMzYlgdvzZv2P+B2O7gbR5aYOAbErZux/ZURVFMJGjociIjpKUFjm
	pcSxUB7ucXLp0+6RIaVKvUKyPoPmvI8xaIUKc/p7gTml2PQc19YwM4y08fKqwK75GI3+uuKgHu6
	Js0OPncembreaJzXHPnj7vLhRdoQGiD+3k5Z47u0Uwh6OGFB+LlDdkuILFJOVP133d40KU7oW+0
	ooc5GSsXwEpgTw7ruPGEqTjm04bMv/470IWmnvaxuE6JyGXQMA2q9A9ID9T7TpzLYvR5tbcoE/2
	IXdBX7Apdr3TeVf1n1NjWGloLYHISOZmmo6g/ksDxEsqBJrW1KhrqjGwTnBlW+ZZeY7J64Q2M/1
	ZnuuUA1C0ny3mcaPLTRuWYuEVLfN8QIj7a4qKVZlCXpYpXpdm/nuaeo0eOiB00P4nzsH8xsuMae
	YMh78y0Mvn20cyf4=
X-Received: by 2002:a05:6214:2f93:b0:91e:b7fd:8ce7 with SMTP id 6a1803df08f44-91f2425d524mr70448086d6.28.1794640244861;
        Fri, 13 Nov 2026 23:10:44 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:44 -0800 (PST)
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
Subject: [PATCH 19/22] mm/migrate: restrict move_pages() destinations to common memory
Date: Sat, 14 Nov 2026 02:09:56 -0500
Message-ID: <20261114070959.3490008-20-gourry@gourry.net>
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

move_pages(2) places user memory on a node the caller picks. As with
memory policies, the destination should be general purpose memory.

Reject a destination outside N_MEMORY_COMMON with -ENODEV, exactly
the same as a node without memory is rejected today.

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 28a8d7734735b..fed910c9ba9ee 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2400,7 +2400,7 @@ static int do_pages_move(struct mm_struct *mm, nodemask_t task_nodes,
 		err = -ENODEV;
 		if (node < 0 || node >= MAX_NUMNODES)
 			goto out_flush;
-		if (!node_state(node, N_MEMORY))
+		if (!node_state(node, N_MEMORY_COMMON))
 			goto out_flush;
 
 		err = -EACCES;
-- 
2.53.1-Meta

