Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E65B19CCF5
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 04:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790570520; cv=none; b=QJsPUQ6QOW6c5N1DUVQTP6Ug7N7PNcPwcBWwwzkPKC+ynW6Ta5LAc3kc9A9u0/X5GMcKm4D17yhoFsB+yO1BXVBhBko9CvpZlvj3/NvDrKVOyVoJdiwH4g7EdQh7XQz10Cs201kN3pISaqSP0os2yVw04lpoqylmy3fMz88wNtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790570520; c=relaxed/simple;
	bh=CV6k+K74Uf2jIsRLjJeq5WxSr8aykUQ/m3Q32deRhns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NMIM7AkYOiQ2YQvH6D0D5FjByDfoiMWZh4JB37tL98yV9o7uzg6Agqgx8F6KRAl4f3kRwdNynT3aERosK8Zkf64TAZglm8Tr6S14YuBr2Zv4igpgAvqmeriVpET2jQUTq2iPQoha1b+zWPs9O6fMsgqiF+GO0TRHgQyu36W35Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=iIywsmNj; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="iIywsmNj"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-88098dbba5fso383651b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 21:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790570518; x=1791175318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0OVW9hC5UCKC68y9iOXThuN5MokNCxQyIbNLFUKAbKE=;
        b=iIywsmNj9G7ax0dRB8kcO2x1m/vosw4+3Q15+rgslndxzr8+0KjKaDha0FKXbLm9XU
         f6SKNYB4dhIebx6N3LZLvWKDyZyMes4pwqcHDuFdyz9qZfneqOf9f6+zitRlMwgYZpub
         gWqqXzlJYrbCQgtwwpklLcJaYsRtI+U81R7zyQtdMzUBHflAv/Fd9E9gJkQ5Kdoomj10
         xpTrVIdNLS6KyJ+iljPjEdx6J/Q+QIGBsF0gQheDubmHxW1sW3/fnnKX8Ea4RnB/C3CW
         fRMNYCBZHCPyEimidel9GjBPEF6qrYF5nidKQ/5q3ktyX8Ri+LQQtnr5Y5j8qRXdM2yu
         JwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790570518; x=1791175318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0OVW9hC5UCKC68y9iOXThuN5MokNCxQyIbNLFUKAbKE=;
        b=vOb2+tsvSuZvhkK/XR1O70+vNdiWnF0lMRWReDIEGAMw7m0V+jtl2kjKEbHCvvmkyp
         MGdhMJCxIjC1K5JgwCPP7qJ9UOzApTW/U/lKDQkE2DaGPddGxAFQ5k2mlnSJm+7e8mlX
         27dWRJqnUIIa76zE+q4XD2PCs8ZkC7btATwpm8mkwnOl2YNx7Pl6hSGIglhESNHGqf4L
         rVlXo+O05mbeamXcco2iaYfF/fYaAdCvbqjGQqnN3Gx50Xm5JbDnHXIjq1SkoHlO1JBv
         pkCQLUMsW8q3RED2uKgB3YmwMgBkUVBgl9soCDfDtf5sSZbPMmE+PhihlpPOjkmENiDm
         t2UQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9A68BuKvFd43cRb9pzB++J0kYCOMuQ5iJzSGF3Mo04x8sK2L78P9jaHwj2TES9SWytYOMszQScqg=@vger.kernel.org
X-Gm-Message-State: AFuF++k/4NceTp62vnqoPKYx9dBLbB0/+Gp42mS3hybvLM8o1kpJEMS9
	G9EqCxtaohvG1UHa1jLdR568ezmCl4+BNj6qsiWbEP7cHUeyBB84RDGj6V6lKzO3F4U=
X-Gm-Gg: AYBFou2m0KweqOZ/+P6mmXHL6WiPOOyGh/6kn3IGC+PJew9VpKriAFRjzorpslYVjpS
	6p0QP/o3jcYe1iDkVyoDgcUJBQHZoWgPzXY9wnP413WjjTsFQrH5vCuw8fzT0A78oVuKjPIUljG
	p3PT71s3A8Ab5zgn0peho7OvCxFt2jI03rJSSRepC27SMlbhzL3MJvsGj+H98Gxajg0N/Liitao
	Y/ACg3oWzW8WD3iwGgF+hQ28BV64IH9e3y8DrarimCUs5dRgfo1kKExNYcKBWgUcxLqmz2oj/2U
	zn5Y9GowJtNb2M3nVvrcTcgXvNduHdJ92bnMwPrL1Rx3fPzyBVtlRlKJ+W/h6tM/JyNWL1rae4n
	rWsONs6I9lbDbNZN2cavqPOK9MB5IZZy0GZN+/UB8HYiZTVDNdRKBG8fDTDwyP15s/wDKxCAikK
	iKTpuiUyUN36odrRJ9q/63zEg+uvef1lAh03DqOVzqPkDQygODSEgb7rKgaOkeOGITvRLbvN2Fh
	dOga7yWhxCisrBU98LWGPtImNwwXw==
X-Received: by 2002:a05:6a00:3d09:b0:881:236b:748a with SMTP id d2e1a72fcca58-881236b74f5mr3613151b3a.16.1790570518137;
        Sun, 27 Sep 2026 21:41:58 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feae8d827sm3405869b3a.36.2026.09.27.21.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:41:57 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH] fixup! mm/sparse-vmemmap: switch device DAX to shared tail vmemmap pages
Date: Mon, 28 Sep 2026 12:41:48 +0800
Message-ID: <20260928044148.3300333-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927025441.741633-8-songmuchun@bytedance.com>
References: <20260927025441.741633-8-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each PTE mapping the shared device DAX tail page takes a page reference.
A sufficiently large range could therefore cycle the reference count back
to zero if population were allowed to continue after it became
non-positive.

Use try_get_page() so further mappings fail once the reference count is no
longer positive. The section population error path tears down mappings
created for the failed section, while the warning makes this currently
impractical limit visible.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/sparse-vmemmap.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index b617ff1b985d..66de04f8863b 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -278,14 +278,18 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 			/*
 			 * When a PTE/PMD entry is freed from the init_mm
 			 * there's a free_pages() call to this page allocated
-			 * above. Thus this get_page() is paired with the
+			 * above. Thus this try_get_page() is paired with the
 			 * put_page_testzero() on the freeing path.
 			 * This can only called by certain ZONE_DEVICE path,
 			 * and through vmemmap_populate_compound_pages() when
 			 * slab is available.
+			 *
+			 * Use try_get_page() to prevent the shared page refcount
+			 * from overflowing.
 			 */
-			if (flags & VMEMMAP_POPULATE_DAX)
-				get_page(pfn_to_page(ptpfn));
+			if ((flags & VMEMMAP_POPULATE_DAX) &&
+			    !try_get_page(pfn_to_page(ptpfn)))
+				return NULL;
 		}
 		entry = pfn_pte(ptpfn, PAGE_KERNEL);
 		set_pte_at(&init_mm, addr, pte, entry);
-- 
2.54.0

