Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E86E463B92
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 09:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400929; cv=none; b=QgKmS+61uWO8fufQpr762+qklSCMx42tEeZj9f5iUaBYw+vkDncZD8emaNT5sZHQ/7nfRVKgmHCOncC4h4J3hz2mBim8O69OFYASQk7Jr1NCH9p2mGNKXYWts6nz7mml5ykHPS3ARvG7eMXYP9dpY6XGYQn/W/hCBWBKiimdJh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400929; c=relaxed/simple;
	bh=41wT4h32lvO/7+w+W+VuZiLHLaB5gMjzc8OiYsaMqFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OtqIHhsqo0RQsLW9nEBdHmICnNlz0jV8uCRvp5z0vOUXvKNLkCv151Y2blTr9uooa1FCLkkx5TZfEkd9xtoQYneHlwQVXklF9OTdVIur6/BMSu+dHcORpOYhnmLT2G1uf+FzOHam2SwamjWnB5jVAJFePDr2gKIV2UcbqKxAV6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=a/KVuTj2; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="a/KVuTj2"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e95bd1c14cso15242295ad.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 02:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792400926; x=1793005726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKvHy7y34UnvBEvhC3G16rSuhlzefUt6PxJ3Dpiy+6U=;
        b=a/KVuTj21zWVvW68ElcWMhfkL7WISBaPAlkTFS15GH1nADS2m7zKzQuh70jj0bzdCa
         MFFri8cL6QZ6Pqwc7NPzbA5LjbbzxumR3+q820Pe331XhdxUgzsDtl6wizEx0LO6JbO5
         uUzrhiO0XrU4AddBWJ0VoOBmj6V3v3m/6cXOTmSdoGR5f4b9+wxWtkw+vYCD8dkn250f
         vUeTP0haWEbmYNoPZqHc+xoTSK+P59mVvqFLyW15YjaiZWBRJZOY1LQC1kLK3q7M8vgI
         DbB9QuTEtF2b7B/geHqyxGJFOW+PMTxHEjBNVxcOQcrNVXENdgMAhCOQCOuZNyfK84U0
         nmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400926; x=1793005726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKvHy7y34UnvBEvhC3G16rSuhlzefUt6PxJ3Dpiy+6U=;
        b=Z0uJrRLBcleEy0gDyRgSzJg6/sfQsOQ2MyKDP4muEwjtuSQKv6w4cvaQsmIhJb1cEk
         5bpstXKPif+fcPVB2f3L48sMm2tUpGBAiqaCfYBya1GPNq3Ho1OkBjT50rziv/rn2NYy
         nk3fVmrFpoxX3z7MUUdJCrgQResBE0y8LFST14gKpjNP3EzH0H4+LsHDkw2TLl1VcA5v
         wL8Wh/wrldxOoTRfwe3qgxNQ/dhJ741gDd4wcO0kQOJk34uBb5lQdezEctkmCTwajMre
         kgbJ3Bh300PPuA4Jk+n2irY4esYpM3GSFHlmzG9HXNVulsVJvrqkY8BCYTJWWRpBibWg
         YoGA==
X-Forwarded-Encrypted: i=1; AKwUvBxDCP3Cff/cHuomO3nJnzPhrNJBMGiqP6mHvwY40kV4gqBjLptSMmuykR4LjiCzattF3biIf8FqapE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2ZJPqPFB6uT7zGs+GQzSs694oy8H6TQ0ekgCimBgGUwCq+1ZR
	wV5at6jgp58q0Ae0zymg7HBaveWVVTsbsDO3/JkqPkuX0zZN48AshNFVjVNRgRRpLXo=
X-Gm-Gg: AYBFou3GwxoU1CUTukUSZMf2E+PatlXcD/3PpTWItNJ1+ywolvqDy1e2Qsh5HqqEs4A
	3BlRUH0tqYb592SlV8sFCA78q/ZxmXoez7P5vAnFvPX0GcSBTMJuawA5TNvRRlpEIx8MQKCTYw1
	BgyooOakUrg5h5pTvRbGRX82nqwf0+fzsPS66UiFfkEK0J2IaR4xTCpYbOX1U0jcnVtNBnWsW2B
	IVA5po+q5jBofN+yBmwTqg4AYxVc57YIXwdxCvyOD04bO9wjTwU7nFWqFN5Vh0alvjNNQ12lPmj
	GndjgsLmn7WxzMqrFUGYc+jxpNN4iL7ubncabCZbWxr8YiUyAg7plefOw+5AO3tdDJAyP96x1+Y
	EfY25QVrlhNXDLtwmsH7eSsyNj/qdVI3QWSRK9cL42XOudHNp6DxEj/Bo+PniLU9WH4xuAa5EvW
	unFE4T3Jq+rarSQpjHcfNv3aYrnWJNjE5AjdADBrpVdv5smwuHYowhIspqPTa2U19DrtB+2VwCt
	2fzDaWUnf9ad8F9rLc=
X-Received: by 2002:a17:903:2c47:b0:2d9:383a:30f1 with SMTP id d9443c01a7336-2e9a6842eb5mr63237055ad.4.1792400926399;
        Mon, 19 Oct 2026 02:08:46 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e305f1dsm36707595ad.0.2026.10.19.02.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:08:45 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 1/4] mm/sparse-vmemmap: map shared vmemmap tail pages as read-only
Date: Mon, 19 Oct 2026 17:08:27 +0800
Message-ID: <20261019090830.1917657-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019090830.1917657-1-songmuchun@bytedance.com>
References: <20261019090830.1917657-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both early HugeTLB HVO and device DAX use the common vmemmap population
path for shared tail mappings. Map these pages read-only so that illegal
writes fault instead of corrupting metadata shared by multiple tail
pages.

For early HugeTLB, this moves existing write protection into initial
population without changing the final mapping. Device DAX gains the same
protection.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 Documentation/mm/vmemmap_dedup.rst | 3 +--
 mm/sparse-vmemmap.c                | 3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
index 8c287ae3f86c..76f903975a40 100644
--- a/Documentation/mm/vmemmap_dedup.rst
+++ b/Documentation/mm/vmemmap_dedup.rst
@@ -193,5 +193,4 @@ There's no remapping of vmemmap given that device-dax memory is not part of
 System RAM ranges initialized at boot. Thus the tail page deduplication
 happens at a later stage when we populate the sections.
 
-Deduplicated tail pages are not mapped read-only. The mapping layout is the same
-as HugeTLB.
+The mapping layout is the same as HugeTLB.
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 40eba70c0048..ba0496daf4de 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -295,6 +295,9 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 			return NULL;
 
 		entry = pfn_pte(PHYS_PFN(__pa(p)), PAGE_KERNEL);
+		/* Map the shared tail page as read-only to catch illegal writes. */
+		if (vmemmap_optimizable_pfn(pfn))
+			entry = pte_wrprotect(entry);
 		set_pte_at(&init_mm, addr, pte, entry);
 	} else if (WARN_ON_ONCE(vmemmap_optimizable_pfn(pfn)))
 		return NULL;
-- 
2.54.0

