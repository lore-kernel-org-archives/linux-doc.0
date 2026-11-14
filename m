Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640236;
	b=uoU9KnLITncOu+ckRQGUSXvjW0ag/lPzDQ1ut1vAEtxuU7nRSmKcwF6/PxHZTwZb7l7B
	 1GuxCsRT2zvcFA2eAlZeGt8G9aj2klWnoJ39aiOYqWAcTVWAHJhwlYu8ECk/RGx80wcay
	 peZLCBAG+wDKh3fmjg78Lsc7tnjEbhsPCy3P9dkAgCxwFBKPIHLsFS3vjaNnguVguzykX
	 Yyy6lClLA4Y32BnA/krOej+masPqHlB+SDVV6FeNSuIdkY2RmCd9S1PjMHn4Tmqbk7clY
	 Pgll+1jwgArKLT9PsWBqwRqb9ykJDCslYV50EC5CWoN/Utpk1Nw1UFVRx1r4hlJTe9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LMm4cY2G8/N+lvY6+YyUeSTrUdIgOLxyZozNrk1mUY8=;
	b=Y8pPK40v20vKUB74s6CvlZbskGnLmMdjOf5vkzqzEWJrzbMUyfVCipRL0BqgVoYF6krG
	 4lIKqfYnB5EtQfSA4TBNiT5THrJ4BKKdF1rHi+UjbgrRGmTgL1uFK890/tZMGfam2yfP9
	 Hzk7X6Caatb3j5qBoPjBr7SV2L6AQBOcAhsDeq30J2WZGauT2TOjytcgh26mOXRoloFBA
	 94ktLHnoBXsGN/HCAMaOCn/5n/bmpiZ9dvi87G/B0qtUwiLXGEgTe/a17SRGRGRzSamqc
	 /dYkvcT2Ef76XTTjAqUYhssA8nNU1bXlP/lBLjzS+yyL+spIKEb7wr/G37Zs92N3ZrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=NrD2qtKj;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD5B606B41E
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 07:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAD5B606B41E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=NrD2qtKj
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91eb449364cso32558626d6.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640235; x=1795245035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LMm4cY2G8/N+lvY6+YyUeSTrUdIgOLxyZozNrk1mUY8=;
        b=NrD2qtKjeYgj8rGYN1fwIgSL20IT9bdCQHMOHTKrC9oC+X0gc2vtwbP/0pBFXO/NP0
         HQOX69QwWq4MNb4Li8WvfWTySx3QpG8CmXSfXqHpUcRgG3oSbMC6WqjxDT/m562PtycD
         KuRcCudGGIt3HNVFfi9LLJLq4QR7G6eDIkxjamWnnAZ3uR0790bOBXukHx5SFAIrogr3
         rVV/a3g+hhDNs12AsnzkGTsK4afWNTRGDAIlhg0fF/5oN9rABG187RlzqBsqM/hs+ndi
         B9r6nI/+MN40ZYs8ZXdDilJk4BzjEhxnTnlkpUl5Sv88KAYoSVQ/VQIkHc1QjmG5QWeY
         nXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640235; x=1795245035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LMm4cY2G8/N+lvY6+YyUeSTrUdIgOLxyZozNrk1mUY8=;
        b=xBC97fCr9zuUIWdLbmdsnr+xtNhUDBn89+KEmvxpS+lYNqJwC/kMBYwSdgrfklALTP
         rihIAqt5B160Irx3C+aqzt+xcbv+MJmU0YqORFBBd7j6eRsDcydvehVj3dEUWFC4zbkz
         4pVx6RCRPfu82lTuMqvvxpPD1RSj4Xa5ChlBZBwZ1vzURX9u6Y42gbn+ZoGPj09FYq7u
         dclxgpawoJ6xpZ+eR+AkAinfIZGILZP0xVZIjWcbOwwrc1H/VaYfbLrKXlDmgUxmoQQB
         rpW4/F/6++bWSdl+eRmQdY5BM7gAWLwgkFfUGDCTpdgt4ztoo+onLe+j5o8r1eCYjg3k
         mLUQ==
X-Forwarded-Encrypted: i=1; AL+hErFoHQbH10SDjVhAhPNAeJcVDzdxQZWevM6O4V2nb100bOff2nnJwGMe9PeuiBaJwA6A01q6uR5RZBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gxTdz9ho51pi9IzCvGvVCLbDDJw9Os+/dBM/E8zv3X0Jt/Yu4
	0d5iXa7paPMkn4pPxX1TQQMiWjnVhHJumelg4I0mM+z26YkDtM2xCwFZvoA7ImhLfOA=
X-Gm-Gg: AYBFou33g3pgE/Y2plT/r7BEmkV9d4YoruH2SjD0TGQT8b6XFtuHpp0J/LVc2mbmfwq
	2pRkwgNyWSoEEIg9ugHHNn/Jw/L2MtHFOyZgEwEtZt+/dudDeBr5t6TFWTfzMFMIgK1B2/uDYSN
	rrfsuGBGIW/dP4lsg8gD0A5F5Bfr3D7HUxFSyjrGxH463UXsVgaWZUxx8tYJDEmKSRlnWpO13BM
	ZaPBlE82tppkhOprrjyBO47F7cWEZJL34lg3Jc+8+rDxmZ6HkGFdFx2BbdBBO2OmCDSeds2Seic
	SHf2tvcdmVV6vP+i6+mt4uyTOQXUIerPkp8ZrnBZjZQjMzk7chCdDVbLOqhOjkKtYvJt4zE+4pX
	bJs5yJBZWl/tKqT1IzTxFmPZv30l8BMn8KUb4A+PRu5++5iKFdg5kDU6Kj+BdVOiiSNi1Bz2s9o
	hRcN4cQDoVnjuJLYcC1Tp0ONG/niyWlEcAqpoKc3uTxzyrU1jOeAlfzTpNg9Zk5fEJ5eDFOoVR4
	CrNQ2shCPLhbINa/8RujvrVuFrncqQ0BmBrfHqC0crgCNc7KEWQL0vSkb07HvZQN8zZFfaNlwC6
	p4GzlcKGy/UpxRkDR3rKe/43Vhwt4d57soJlLBVCsDNrQv/9Ll+taM2xNNTYw6HIhITCAoLmU5V
	KgW1YxiT7QybiCF4=
X-Received: by 2002:a05:6214:1d2a:b0:91f:17be:7c90 with SMTP id 6a1803df08f44-91f2424c199mr78511936d6.55.1794640234508;
        Fri, 13 Nov 2026 23:10:34 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:34 -0800 (PST)
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
Subject: [PATCH 14/22] mm/page_alloc: count common memory nodes for kswapd recovery
Date: Sat, 14 Nov 2026 02:09:51 -0500
Message-ID: <20261114070959.3490008-15-gourry@gourry.net>
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

When a zone recovers above its high watermark, free_frozen_page_commit()
clears a hopeless kswapd state if more than one memory node exists,
since allocations could then have fallen back to another node without
triggering direct reclaim here.

Only common memory provide fallbacks, so count N_MEMORY_COMMON nodes.

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 580feeb608b7a..6d98e213460a9 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2949,7 +2949,7 @@ static bool free_frozen_page_commit(struct zone *zone,
 		 * kswapd work again by resetting kswapd_failures.
 		 */
 		if (kswapd_test_hopeless(pgdat) &&
-		    num_node_state(N_MEMORY) > 1)
+		    num_node_state(N_MEMORY_COMMON) > 1)
 			kswapd_clear_hopeless(pgdat, KSWAPD_CLEAR_HOPELESS_PCP);
 	}
 	return ret;
-- 
2.53.1-Meta

