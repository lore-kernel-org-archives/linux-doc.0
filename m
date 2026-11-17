Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917238;
	b=G7KgcPUJg/bdxjAKZdmomBjCwPSD2i8+7bumc2kgk8um0dsalgS/PjRHtYmnHHj10+aB
	 DhR2ZfrUTyaazza5Xr17yDG6pZmjHj5w8tPxjMLUKOh1UuqlNug4MiBYqQ507/VlFiuAl
	 Sowz7MEe5o9m3+bDmZePVt7sGNHaed4/z9mNGCKGbtyPrm5R5+71DHmQHOAC7/zOBYuEo
	 K5xhhVst5RkHqiEAIyZzAKqC0/w6iMnLhpQvMcAjbtrIqzIuuVtdjljbRX+BDZy4Bn5fr
	 annydKkoctL5cUugSsDt+ZjujaB5cwtD16Pw16SiaITi7wPpMBWYJkYU9JiTtO9CYQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C2oAxC901LsFPrZY7XEv49QJustbmbWIIv6Ichi+IBM=;
	b=z22b7XY/IaAUQN/om2ea2OoWYbgMYE4NIiHeP4GEsoN/5balRidPppgjGxD0Wc1x1lcA
	 fOxI+cSVI/lJ5h/e8Z7YTwxnur6fvfCddxfi4Ph0DoWbI+I4iiaAtVhv+TOCqLkOKOAo6
	 4ROrmfJ460QMkz2bdKBjKRopBmQ1sxCyfioLxPWLksVbRNrpyxRoiqtvaCQOQsDWjOZXl
	 n76JhVy2augCZfezhjca15aNQt5SSsMtNfovQCbIjqqDVkHds5l5ECg2tYGIkx4rmG41v
	 LBBZQcJcygXBxs1LCIAN6nJZvY+QFqCWT7YZWAocZQJyIFpblkF5cHsn5B7SsOiGDSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=C99TFTwL;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D863C606A33F
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 12:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D863C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=C99TFTwL
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so5384905c88.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 04:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917237; x=1795522037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2oAxC901LsFPrZY7XEv49QJustbmbWIIv6Ichi+IBM=;
        b=C99TFTwLBJW1sd6zrlOB1YIkcU9S6RwNreCTRQ34WR1MEJjCfAMv87IGajeDDodEvq
         fwTcvFBXhWM+R9aDeq4lbG2SD/I6vDASe1V0OpkBdoHDnqNNNIXb4nfFFJfC9rtNt5Yo
         yoOmDvVsBw3p9fotG0CuxO15vcRUBLPf0djTXTVluXuMrUk5OYGYHggqqvK6a5PF728U
         baKbAQMjM8AEYXTbNQQksAR0ZIiOPW3ezawtXnTQd2KeT/43Qk1P5aQNwI44ylE6IZYO
         iMuROYjCAwCu2lphizlEcx8U4LogosDKQt8znAEcAf8evuDnygingk9szQ3o2MkLs/hb
         v8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917237; x=1795522037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2oAxC901LsFPrZY7XEv49QJustbmbWIIv6Ichi+IBM=;
        b=S3jztPp0d2Ag131InkE03A7YmwQamBUGKTxNOuQQnwlWiqfiz/I4JdQvfXHctMbn1N
         9DQQmjy+cCxiosKL129Vbn95OYyZ9JT0E2xk7Pc3bRAb+KuTs6dRXSyCr7hzvGwM/W4Z
         28myKR/WDiGUaJhN2G97ijp1I6MIfo7l9sR5OuAthYsMSfRFvUGDApIQF+0gieq4WDLX
         Dz/Gh7VfA+uzi5DuXdTGFMjI88uDdmwjTQe/wYOktBu1MOZoqIsV3Bgd2SjiN35i+Z5k
         EeYwLY0+n3BuJKt4+2df6XI8yvSNfUz0mHo1QzlNnLx+aLAUHnvHvF1WhRvL5LIXAwWV
         kvHA==
X-Forwarded-Encrypted: i=1; AL+hErGYBzLT5w76l3fjgG9v27oS9NzKryMl0+Y72AmiszwypEIVUw5WYe3HXKO6HkMl08OdVYPqyXkZndE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1yDYHTH47gS/TeUHR19ZxFuyyhdKumF2/vfq6+IWPSncDqVJF
	lme7SqtuuANlOO7Kt4IprIhGt5uCTWIb7ZiggkTqQcpXaw26/9WsZadRfVoyGz7chWk=
X-Gm-Gg: AYBFou0U41g05yXuhp5HjHeCct47+7lersJfeLvg/fsFINGsO0ea4XfSHg0UmGBGi/h
	USxJFwOAetfq6xPLCz8/dvg1WrPp1U2s8PLHKoLya53lS1Yxr9/OV8/q0nHiUopzHXD2MfmWmJu
	M6qBUJMKexRIwQYhV7HJ78nTPHPelUYb1ayJl/M9Qjxbcbc01aJEcwJMRPyYehungwXxpoVLbar
	v7e+5Pw8YNTaUQlMLWzsPWrt9YtgLVfjB7Su/ALSjvSWi2EleUZg6yhVdOYmSxQCJe7I3KrWUdW
	/RJ7maTuy2IDRZWX2RURtP+aV+GRoOxmDHweE1KOPQ+loVv5uT1AEWCcVxQ+m8+1N3wDEaP2sxe
	E7APLmmSfOB2QABLRoknzBTHi86b0zLO3vwuF9UBSMpc+P4LI76s5ysTkZlbeSpmC0GjWgunxL1
	/FBRvl2GtPmjVcdjIc+mS/lkleAPIT9Sb2DufYQDSi3TuWAhix67Npdg5myArghBZM/F5uzwCYs
	2btNKBzXNUShayFRTG932e7fNEPvjndC15+4x5MdopOel8maGs2/nxHwgOKoCr2opzykTm/z92q
	LKj9q4Gz+nSov6h6rwgaNqg7XF3R7Wn0G6pV+6xZ9WaUr1OiU/OyP20Yke1GYwDNHbKEOYv6t5z
	Ch12GLnnfeIM=
X-Received: by 2002:a05:7022:1583:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b503112a8cmr14843601c88.14.1794917236797;
        Tue, 17 Nov 2026 04:07:16 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.07.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:16 -0800 (PST)
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
Subject: [PATCH v2 2/7] mm/page_ext: fix client data alignment
Date: Tue, 17 Nov 2026 20:06:22 +0800
Message-ID: <20261117120627.50601-3-songmuchun@bytedance.com>
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

Derive a suitable alignment for each payload from the lowest set bit of
its size, capped at unsigned long alignment. Align each client offset
and round the final entry size to the largest active alignment so every
entry preserves the alignment required by all active clients.

Fixes: 466ae6978a5b ("iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC")
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- New patch to fix the existing page_ext client alignment bug
---
 mm/page_ext.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/mm/page_ext.c b/mm/page_ext.c
index b679a8c1f7d7..dbc1bfa258f1 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -116,8 +116,22 @@ static int __init setup_early_page_ext(char *str)
 }
 early_param("early_page_ext", setup_early_page_ext);
 
+static inline size_t page_ext_data_alignment(size_t size)
+{
+	if (!size)
+		return 1;
+
+	/*
+	 * A type's size is a multiple of its natural alignment. The lowest
+	 * set bit of the size is therefore at least that alignment. Cap it
+	 * at unsigned long alignment to avoid excessive per-page padding.
+	 */
+	return min_t(size_t, 1UL << __ffs(size), __alignof__(unsigned long));
+}
+
 static bool __init invoke_need_callbacks(void)
 {
+	size_t max_align = 1;
 	int i;
 	int entries = ARRAY_SIZE(page_ext_ops);
 	bool need = false;
@@ -126,6 +140,7 @@ static bool __init invoke_need_callbacks(void)
 		if (page_ext_ops[i]->need()) {
 			if (page_ext_ops[i]->need_shared_flags) {
 				page_ext_size = sizeof(struct page_ext);
+				max_align = __alignof__(struct page_ext);
 				break;
 			}
 		}
@@ -133,11 +148,17 @@ static bool __init invoke_need_callbacks(void)
 
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

