Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071629;
	b=fvCac1I+NIEzNjvNiXmPAEB0Mx8hzCPbsEcf+6f5l1RDVmDTPUtH4DYkx9O33or4iZPj
	 7JPwv/L8lKVQksoYR+I7JaM8SWIaPNy3J2Un4Qor4gySf7hUw4zuuWlV0Zhghy4qZEd2D
	 vTtpTwI+elexAWASelADCaI/ABOchbvXMDrKyn7Sb6Y0fiWcQ+r3e9GYkRZhapJf/zVm2
	 8bFyGSb9zoO3bSzvxkGtj8UpSbnvqZaO/Z2dDTPDD59qrOYVd4YmvrGEho9CzV0cblHKj
	 4UGu9OI9Y3NtvBLo/+5iykwe7/Nzg+wwYCeSPMVmDu1yv2pnoaMyq4280XsPrQyMPSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kPhQ9i3kP4x8JhqjD5K1C3dirUBtl6z9jPgg1a9BJHE=;
	b=C6Sc+IRBJEBO26LpqzkCFGNOZBW5o7AJTEqMJ34c0qYDcqw4WSGNLm6ZguB8bKcg4bX3
	 aAxRvHpoF+PNmCrwtRjt3J4H/kzWyfm4gMI4wi0bX76KWYciiuilflQ4HI26XVQf4m1M1
	 +8K+19kkuPMHD468K8Z95MEYGT4BPsiFr51hUxKT5Tqv4MbyapD+LhJZwbCNqsjzV00Uq
	 31TQTRwe2KWqqRFhRUEM3EHt79A/67wUSg+TF+hABGVLs22d5GU2r2iu8V7+n9px/Z5Js
	 pILpxS6mQlgR/p/XV8sPIoyl7AJcOIkxZuglLq/zJpolv+Xc/NHgF/Z1yhFCe1PsiRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F1rIzOtX;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE9A606A33F
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 07:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEE9A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F1rIzOtX
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1234704a91.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 23:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795071621; x=1795676421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPhQ9i3kP4x8JhqjD5K1C3dirUBtl6z9jPgg1a9BJHE=;
        b=F1rIzOtXCvjl2Jq/oghLxtlwdQ9a2gCPhLAcYFzPlLXNAMLCwnuJUVxLdxdnUdlpWy
         jpEY7nwp3sAbRx8obBJdvUyFgOZTbeGqE9pHgAechX2HVenkuSqu3Ojaho1s7sWSppaZ
         lB/+iY3z7NwKMAQD3GK4M+xKVnis0PiZgzTYxGMlLZ6RUgkhRyJ87b0ti8Zd1A7O97/c
         4rCMfsgwBJbIsS0sIyNlnDpcGpgry/3JwQc8t850zU3gz5NM7hw+EQxp83uML2Z9UtAh
         Szb1dgI/pwt2wFfDrPfibm1KPeLFNFN2NZp8IDOJhbzU6zLCYFRfBxlhIjAMnTi+7b7r
         BURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071621; x=1795676421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kPhQ9i3kP4x8JhqjD5K1C3dirUBtl6z9jPgg1a9BJHE=;
        b=d2e2dD0UyaswKaodRJTZ4qrqdwP/Hf/d+OStZHYPuZmXWCX4YfOIpGZkk1nMXsakz9
         dG9sSpxgax5HtKp19cVvE3GdGkfPWAIALW/pKlDDdKvsgQT+DhVCMRBdXxDm6enASi8V
         CYJNFFfDCMRYrZMtamdW8FFPydDPiubC2ZMvkGq9S1F41d7tMuM9bUNtOiJv1yOFQ/Gk
         rrZq+IxqA4r7/nDDrfjqFY2rN2kkgEAC7pT02JmpkM6VGPuy5ESE0iIQ4ATclRHdPHCD
         M2A9WEDIOmRWBW24/zutWqlF/LKo4pHTjgb/vcp8JdD2+AY5JE0EFWWG/8fZGp3yIsya
         CYcg==
X-Forwarded-Encrypted: i=1; AL+hErFrMWIO9c2lUP3qZA4eitfAYAff0XqTSKSMoib/225/1uhbOyHwHgqL6/NNn45NSgOPzyv0T1B/s6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CbdhmtJCz6Okmg7bnQTCtT6dSkuQItnZwyY7940/0rmvpyIB2
	v4lQCKyi0cDyuFHv5C44x5xE/FX5yA8Fs/VlVpXrG6hiH7vjis9IqCqhlOfsdA8EWR0=
X-Gm-Gg: AZFdTZdmiY0Joy8Fcf98RzYAKFNyi0ZgC1Y8Z+536Nan4HblVQTkRsfQn2vfeKS+d8y
	gglf3Hq+1UZw+lWd67dG+OFwRK6YHoVDJsQ40RnAoUI6MkuyXWDuFtS+mR1SAFxna4eAFeCELpe
	ECsHhEgrNzlfMup24fYMkMmw4jYzosGpkYmEGlgBNwtR9QSK5EL8vEwrpwfawixD0Jz0b7z0AE3
	J/u6zrKsWmNNLJZOTCjqFmm+VsiK9NgF6j1i+IQPS1IRITbsQ9xjCOZuHjvYB5Dzh6Rcyt/5t3V
	BO3k4IytGD09CQxxD2nAlZbgWL3KXxyGLK8rpQLY+aot9stl4aOdtAYCiXC2/s44abWOkIVpHLE
	8EefnQT4tWaHLRwoKuiKejb2f8y72CSkuZ+FO6MCdGyFrF2jfZ+zTiLHP2iDIV/9H9akNyFKXIX
	mJewL8HolT9fgwM9iEwrabywn5D29+5zlc//WwsfWwzfTevKJxBQcr7PpbDjopKoF5EWUqrPdGr
	gV+JfmD3LNCCxSsmhfwgTYXlx8MFhhjqFlvkAUVcEyEotflyj+sL1KEEioB/x3Ud4iH86QSRcCH
	eKUDmal1wKgH9zOvsnn6MbLbWgzcQ5ZDuOf+ph4a4T+uwLusrBvV+LhmwOQ=
X-Received: by 2002:a17:90b:1802:b0:3b1:922a:7b22 with SMTP id 98e67ed59e1d1-3b3d07c66b8mr5528227a91.60.1795071620802;
        Wed, 18 Nov 2026 23:00:20 -0800 (PST)
Received: from G6L4RL2QG9 ([2408:8440:c38:5ca5:3175:932a:757b:716a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm597488a91.4.2026.11.18.23.00.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:00:20 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Chris Down <chris@chrisdown.name>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>,
	kasan-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 3/7] mm/page_ext: always use vmalloc for section page extensions
Date: Thu, 19 Nov 2026 14:58:08 +0800
Message-ID: <20261119065812.89959-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119065812.89959-1-songmuchun@bytedance.com>
References: <20261119065812.89959-1-songmuchun@bytedance.com>
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

SPARSEMEM currently tries to allocate each section's page extensions
from the buddy allocator before falling back to vmalloc.  Boot-time
section allocation happens after vmalloc is available, and memory
hotplug allocations do not require physically contiguous backing.

Use vzalloc_node() directly and remove the buddy-specific allocation,
free, and kmemleak bookkeeping.  This leaves one runtime backing type
and lets a later change add memblock as the distinct boot-time path
to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>
---
v3:
- Collect Reviewed-by from Mike Rapoport and Chris Down
- Collect Tested-by from Chris Down

v2:
- Add a preparatory cleanup that always uses vmalloc for SPARSEMEM
  section page extensions (suggested by Mike Rapoport)
---
 mm/page_ext.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/mm/page_ext.c b/mm/page_ext.c
index 39a4464fc979..6196bab6868c 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -290,15 +290,9 @@ static struct page_ext *lookup_page_ext(const struct page *page)
 
 static void *__meminit alloc_page_ext(size_t size, int nid)
 {
-	gfp_t flags = GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN;
-	void *addr = NULL;
-
-	addr = alloc_pages_exact_nid(nid, size, flags);
-	if (addr)
-		kmemleak_alloc(addr, size, 1, flags);
-	else
-		addr = vzalloc_node(size, nid);
+	void *addr;
 
+	addr = vzalloc_node(size, nid);
 	if (addr)
 		memmap_pages_add(DIV_ROUND_UP(size, PAGE_SIZE));
 
@@ -344,19 +338,10 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
 static void free_page_ext(void *addr)
 {
 	size_t table_size;
-	struct page *page;
 
 	table_size = page_ext_size * PAGES_PER_SECTION;
 	memmap_pages_add(-1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
-
-	if (is_vmalloc_addr(addr)) {
-		vfree(addr);
-	} else {
-		page = virt_to_page(addr);
-		BUG_ON(PageReserved(page));
-		kmemleak_free(addr);
-		free_pages_exact(addr, table_size);
-	}
+	vfree(addr);
 }
 
 static void __free_page_ext(unsigned long pfn)
-- 
2.54.0

