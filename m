Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917244;
	b=dcrq3Ab1EA9UIpcqm8xt60WwLMhTjM9eWgfX6Z7ksvv0+4RWdbQ+YyBNmvLb5IqGQger
	 AQX2bfxeU7L0GMQbevCTwNt445jgwxQKxAZX4BAPegaCVl4XvLdbPV+xe8UsGELaTUaz6
	 83/sgVZsaVovPDq8Do7vMRVQnDLinklue9E7hdI8WEcQp43RtOXX32QW4kNZKfEWhn9vW
	 hGaruecwcYHAv5iYFkXNzhZBgrfLpFdXoJGvkz9Vkb4aVHVoFa1cKA/YbAhyosek8tLr5
	 DAIfzGGmIQVN7wVJX9LaL+BqAqhXA2M59HEDFAbdfp+iJQG145OGBekDTbS318JX6ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pngp1egAaX0YbQYqS/9oJoUz1wuFN3ikmsU5M9jflxo=;
	b=YR0nEeDIa2SwHyNrwUW/yOO3097gTU+UQn+OvuTslcwqqy5Fyxgs7k5yjwVsGiMN3Sgi
	 nPz9dE6T/bwW1pbvjLUQYWtTW6on9+Etsgu8SVGizNX3cbf/QXZEKUiIveGbTPBHOq+f5
	 reKfVTC7b4S9o1RbOM7Yd+bu8upto1/EZMQQurih/Co+WLnHk1Krj2C5k1gKhL6C7uRp2
	 uq2edl+Xdgv3OYTAutIYsdwCy6YvnN97SKCD5RccY9ohK+T6D3uGSHMYRVL7TQS5ypUaS
	 15pf0eg+/3Pai/4Q5vsWlKL7vK3AS0c6682qgIjz7PQXhyqaUHl5lhnKbAPmKI1YEMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KIooos2D;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA2C606A329
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 12:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BA2C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KIooos2D
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1438d9363fbso592002c88.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 04:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917243; x=1795522043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pngp1egAaX0YbQYqS/9oJoUz1wuFN3ikmsU5M9jflxo=;
        b=KIooos2DClZKouyiKhB4rzpkqn4rd+x7CloM3guhbBtlU1l0KZ2WMbtVma9sjSOz1Q
         5JU9eamBERr7f84Z1mmg7V6b3SxsTKRSz7leQkK+CQbLM4FUJhtc5LcXvOkzIehdAImo
         HdfCXBu/zUTJUUr0xbFUQHToM5w6WRCP3gZbQ1XjrI7P1jd8q1RzxgHQCMjV9USOCPdW
         cnzhMguqG3vqSkGAqmh/lYscCCrHq/pPD7VP01d78p/vRBNfiqfc8tUCXOIi9b1pPaDc
         qgeQ1ltBK/0WFa6P1OaAAUL1Pma4gfa1y09Kd8Pt6YcwYRWXYTKQ2Hr4jq5OZYCr/e3m
         dVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917243; x=1795522043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pngp1egAaX0YbQYqS/9oJoUz1wuFN3ikmsU5M9jflxo=;
        b=OV0aSKgiEhWw6KUZcrVoUQizVTzd/zhea4gjAnKJbSIpzbmWxXo9PX1GcXGOlISKft
         LvENHua3aIx3ZHuFLEcHFdcy0cSTHpf/H500PdOpEYDdD0RNmhGJVv1khxRlNXAfgLRc
         uM3z2XqjBHnWMySmHHTBtTkA2RHJY834FxKL9tJ4Wh3v1H3Zegr2yXSwK2pkzTN7lgS7
         gFmjhPGHEiLly/CKQ6+1RedzDLSBWggSzjolzwCb6dWx4dtTD2GIFtXrxedTP8yqvhnc
         qpMHg0Hv8gb5l1jnhQkEIRf4NcbQsSaOWQFvAgOK5PhtkTpZ5xt41n/D1h5br388gw4u
         xbmQ==
X-Forwarded-Encrypted: i=1; AL+hErFKRZdhNhhBes5YkrgJ2Fhp//+po2Rm3TfUxSGNF+btmCfhMUJD1kyXnPGXW+3UUCzCT3ylXGgCLi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+TVZkvt/OnP1SIxpx7SIlbRDaQy2+HZDlhW5Zien/apfG5yi5
	MoCesSLtvn3Sg3KNeRHdiqLM7DsqYTII1yroXVIL8R+jp1d53mzVN7sdq7tcdRX2rCM=
X-Gm-Gg: AYBFou0eGtCbn1CewcgIVEFqyJn2k/++Euw7GEFWR/4pqHiWudlwLjlXkreYo5cT9YF
	3CAUJvVaNgLu7kic8npTJaEMCel/oqXQgmT20wsoZQw1+NlSZV8X+m/IlSqKJ3L6kKianJ8i+7F
	+bPQh47q+8mQOdIV1nGmzrMPtRJyaeDs/c8HfywsECCKFMNFfgMDFz0BBQV7wQwiEzPrGllP+4u
	wjB5mXlTU3xJo455hmM6d1DUT+wcTn2zps4jdOQig/x9cPEa2mcUl4yrR8oyRfQp8cmwpWl3AzJ
	g0ItRMDnA0IOlFcg+cfu1emOY1Qc8JdxKWFi7MivqwbRR+3PT0ebhwHcznYbECgkgjHX3K4ZtmS
	s6PnEqIk6cGnB+irfvVzlHhTDQhOVgJU/DsGLgo6E+z4ciRvskvqoO64E2Am+iUzPRoS0wEWYNP
	GiWIvGuKPMFgKZm2QNsASsXrjqeSLxn6zXfsfPTUQ4WAoUnguVS1Dcb2MJiEmZTF+DbAK2bc4IV
	NZvcb/Mr/+mgI6DY1O29V4j46e5zMEpgKOaNMnRWBEH5jxysbtzEgDSrwkstgJeUPFjhY1jlzu9
	S9c9eunJESBqBAtVE0PqPbPCsKG+OFRitcvWaZN5H4/LaK4k7fIQ6bUK3uB8dyCZVs1pZcoNgtg
	2Z+hxO2fZvUs=
X-Received: by 2002:a05:7022:7e85:b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-1b53a3e54fcmr2076054c88.19.1794917243422;
        Tue, 17 Nov 2026 04:07:23 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.07.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:22 -0800 (PST)
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
Subject: [PATCH v2 3/7] mm/page_ext: always use vmalloc for section page extensions
Date: Tue, 17 Nov 2026 20:06:23 +0800
Message-ID: <20261117120627.50601-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117120627.50601-1-songmuchun@bytedance.com>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
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
---
v2:
- Add a preparatory cleanup that always uses vmalloc for SPARSEMEM
  section page extensions (suggested by Mike Rapoport)
---
 mm/page_ext.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/mm/page_ext.c b/mm/page_ext.c
index dbc1bfa258f1..3b581242fd52 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -285,15 +285,9 @@ static struct page_ext *lookup_page_ext(const struct page *page)
 
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
 
@@ -339,19 +333,10 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
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

