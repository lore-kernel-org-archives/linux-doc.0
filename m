Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071600;
	b=pM+Vk2G4VF8KRm2zaiyw+n+sVCF2X2H53VWmmd3OZTBcjrcToHfjwqHaLXuo9XUQWWEk
	 5+CX20kgVNqfDyl28HTMv8eMrpu57l1NTaiZUY4+Cfqwc0CYdARVJwng4jgoSUYgPJcQS
	 Xcug82a0dq9aLwc3Md3A8+ubiZ9ljzZ0iu0dL35m7w6gy3jRohVW9YNNIV9UCenX9Sws8
	 +2ZB8ux4urswin8rtUG/rbnbNDpUUjs6YX2rNTt/7bEPZaHnccwGd1BwpEH+241kIInBL
	 sJCLFuF7zmHbZzyRgHlFP1H3Xrj9zHdCNA8pEslqA5r0jNb59ikANaCCcpi/uM8XZGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=niVF9RygUWyckhWxTzwkqqzSpVkRZGJqdyALrrQwo64=;
	b=ZCq6OokYmuSR8ayCnyh2waiofLaMSywUZmwLDwKYeH9Lfbfqen3MuldeS8MADUJfAZlk
	 i/tJMMr3KIJ8jGLlVN/pWqbnUednzXDzK283zKhfcefS3OUjmwOeV6+xJ4BpAiwhZVjE2
	 iJw/3YSG89OPWbEAx6/0pLRE87gHo8dpnljdhjNsJMTgCplLgf5jjUUvgLxT25Yr2sD2Q
	 ZVJhmwM8y09P0VpZHxCRCxIJDn6dN/gYqBfb5m0K4g3ol+OmXg5WLk8f/HxRYV2E83vHk
	 5HbBpjlBxY4jvs56NrUJudY/mbUKWmyub1gqTx+Bktse+Ru32OETTgi8uidzDeS9zJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jaYX+PaY;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565D5606A332
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 07:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 565D5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jaYX+PaY
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so348284a91.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 23:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795071600; x=1795676400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niVF9RygUWyckhWxTzwkqqzSpVkRZGJqdyALrrQwo64=;
        b=jaYX+PaY0Pd1nWO7YguC8xp2UHhePRxfQ8T4E6KJVrWyOWB1Mztp3a+GkHGI3YSrge
         Jb7E8OBTkaAArGQKY0XMgk/kgRwdua8Wb2W5XoE4gvpFXQ+ltGNrxOBTxfJrbaUZRcb0
         yKeWVBmraLb0bqpYf3vE629ijv/Ps929NSvRWAYsdHKjGGvXyX23I5LDrU+Cmxf4T0Xw
         qw71n8er31QigiZqRh4MxGUVEtSVqjCZhV0LO88E36IdKOHVtLiTfyML8ltZ6/4eevw4
         dSbf8kjR1hIIKj8274yqgO8eNAShMsWB/TEz3BfJNT1DiBTUXaWAax/OVBEjlD09rJ1d
         YUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071600; x=1795676400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=niVF9RygUWyckhWxTzwkqqzSpVkRZGJqdyALrrQwo64=;
        b=WAyXc9NOwFm2C470UI/wsQLp7EvPoSgPfBQjnnL3e2bkiBX2Yt/izGocsv6poee2b9
         DEsJXLlu0NvNvuOM5Ln5N5xssWbtXtcxZNjaptnc2sTR4drOiG3R+g1HDrRW3KjTWwPj
         mh4AHRfQsIKgPcOZEi4LDNRA2MOQl/TBlZlsP+ZVnh8/lmK+l+ZQ5rFxedhjS2RkYHLo
         Jtfr+gzBYrfbA/zS760WH19gI1HSW3TjtVFZSNBMGr1KGSoTlZMWkrOfi1kCqDsocB8a
         oLei/IP+FliLhD+s5/mECHgBlql8lzLPKurLv51LfDsfuUlSMBq5eMgVAyqaHh8fOGXH
         sE+g==
X-Forwarded-Encrypted: i=1; AL+hErG61dJsiv4k6H0ggaFWf/8hVRfE93SVgWbUjUwlI6xWlBGGKq0Be1S3sFkcoScI2DdZ6AVBkmqaKU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EL7ATSk4HWBJTSnV0uUky4rwgogYJudfS/fE9eDHeK6FoA5x5
	fsJ3beyjreNZ2yp3tZebclrZRQrHq6lFfd8LZWkh7wwiXXQ5BMx9ZjFht4Co4HqbFig=
X-Gm-Gg: AZFdTZfLJk6CET5QA2dh65aaWQ6OxcpGoUfl1/px3HXRNoikvJMRUn4UOkBN3F/7r90
	S/xMXyftD2e6Mcigkl9d/iZpEpG//wZ+fvHmz61IiGGkUO1fzPImR00oX8kGnrRiy+6E7r/BwE7
	sJV5jalTs9AD3NS2CXhuQQhjPehfflliaUb9dWfy35LOlWf2B1/U8oHVkkWZX5WRgFVnedbW3lV
	9C90u/J6I/lezTh0Je/jkpSQdw75RtRLREc576vtTqi5Qp6p0YRYBUznhivKLsxkGMxXLXtPNnn
	BMp4ABB4ITo4gNI6OL7Yzzb5DFQ5fGVSWSj0vKl+5eyZ4YlqEYPmHTKLE2O/Ty2x/3lQso8Tl+V
	ffWdkaAAqNV997RwqrQOEJdn89PIOa0PvaJXa3scqntASnjRqLm2hFJQNNc4qnVF9L+xwSM5At6
	VzikJwH+swigR1oQmjRqvslaZzDtXcL/y1+6jsHdaYGtIJMKVRyCoh2ccW6GCj6stZamctAaKWf
	klMAkLeIQ5IwkJvz/fmbXW4LXcfgT1Kw3Z6Gasv01oqOQPFowgrCLIksHv0/LzwQgDGKmqbnkFO
	OHihceeQVPc1P/1V3ECNsMPCAQ4v80irxVZOCoPiwUDux5WbbtiU22dBPL8=
X-Received: by 2002:a17:90b:498e:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b40a32d9c3mr134496a91.39.1795071599193;
        Wed, 18 Nov 2026 22:59:59 -0800 (PST)
Received: from G6L4RL2QG9 ([2408:8440:c38:5ca5:3175:932a:757b:716a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm597488a91.4.2026.11.18.22.59.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 22:59:58 -0800 (PST)
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
Subject: [PATCH v3 2/7] mm/page_ext: fix client data alignment
Date: Thu, 19 Nov 2026 14:58:07 +0800
Message-ID: <20261119065812.89959-3-songmuchun@bytedance.com>
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

page_ext lays out client payloads consecutively without aligning their
offsets or the final entry size. This happened to work while the active
payload sizes kept the stride naturally aligned, but IOMMU debug page
allocation added a four-byte payload after data requiring eight-byte
alignment.

When page owner and IOMMU debug page allocation are both enabled on
x86-64, struct page_ext, struct page_owner, and the IOMMU payload use
8, 64, and 4 bytes respectively. This produces a 76-byte entry stride,
leaving struct page_ext and page_owner data in every other entry only
four-byte aligned instead of eight-byte aligned.

Align each client offset and round the final entry size to the largest
active alignment so every page_ext entry preserves the alignment
required by all active clients.

Fixes: 466ae6978a5b ("iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC")
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>
---
v3:
- Cap client alignment at u64 alignment to preserve 64-bit alignment on
  32-bit architectures (reported by Sashiko)
- Open-code the lowest power-of-two factor for readability (suggested by
  Andrew Morton)
- Use a local for the u64 alignment (suggested by Mike Rapoport)
- Simplify the commit message to focus on the alignment guarantee
- Collect Reviewed-by and Tested-by from Chris Down

v2:
- New patch to fix the existing page_ext client alignment bug
---
 mm/page_ext.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/mm/page_ext.c b/mm/page_ext.c
index b679a8c1f7d7..39a4464fc979 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -116,8 +116,27 @@ static int __init setup_early_page_ext(char *str)
 }
 early_param("early_page_ext", setup_early_page_ext);
 
+static inline size_t page_ext_data_alignment(size_t size)
+{
+	const size_t align = __alignof__(u64);
+
+	if (!size)
+		return 1;
+
+	/* u64 has the strictest alignment required by page_ext clients. */
+	if (IS_ALIGNED(size, align))
+		return align;
+
+	/*
+	 * A type's size is a multiple of its natural alignment, so its
+	 * lowest set bit is at least that alignment.
+	 */
+	return size & -size;
+}
+
 static bool __init invoke_need_callbacks(void)
 {
+	size_t max_align = 1;
 	int i;
 	int entries = ARRAY_SIZE(page_ext_ops);
 	bool need = false;
@@ -126,6 +145,7 @@ static bool __init invoke_need_callbacks(void)
 		if (page_ext_ops[i]->need()) {
 			if (page_ext_ops[i]->need_shared_flags) {
 				page_ext_size = sizeof(struct page_ext);
+				max_align = __alignof__(struct page_ext);
 				break;
 			}
 		}
@@ -133,11 +153,17 @@ static bool __init invoke_need_callbacks(void)
 
 	for (i = 0; i < entries; i++) {
 		if (page_ext_ops[i]->need()) {
+			size_t align;
+
+			align = page_ext_data_alignment(page_ext_ops[i]->size);
+			page_ext_size = ALIGN(page_ext_size, align);
 			page_ext_ops[i]->offset = page_ext_size;
 			page_ext_size += page_ext_ops[i]->size;
+			max_align = max(max_align, align);
 			need = true;
 		}
 	}
+	page_ext_size = ALIGN(page_ext_size, max_align);
 
 	return need;
 }
-- 
2.54.0

