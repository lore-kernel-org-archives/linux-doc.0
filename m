Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C5842DA26
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 19:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576164; cv=none; b=W41pfrQZV293rQixXEhc0xmbzx0OdGfv7wo3aOPgmJgiYkg45oUmLL12Holy94HzTdGgfXgAhMcT+hYF3CSEr14FZv665/3GrThlaie1Xs6JKhs9ZLUrIYB1ut/dCstOXYAVZFaObz2VuP2SsXr6va4DPpXldBzs1o2IMUFMPqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576164; c=relaxed/simple;
	bh=ykYAmhd68ENhZafgAWcDfavSm6U0Wnr9Pzc8SD5B8Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOf2FiF+CyCUM55zrBw/adBnf4O+LuYMhch05beEjXgJ3Rj7lUuNRHfUCVcjVNQSL96Scqwh88DsOkasuwZl1TVD66ts/yKPIRko1U4vw4cNqNkhCz6QnX7kYLludsjKCp63XX08c06V2Grg7abBnpwx4FroeX50Fxu/hS0UhJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=urabPHWY; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="urabPHWY"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92e5c92c389so689350485a.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 12:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784576160; x=1785180960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52AwKQKrQ6RLG5kuFGfqaKwjxS+9GOxT3lcLnMmQsKc=;
        b=urabPHWY/4r2SA0gTLZoiuuXGF0JchFx3ihxRTIardaKhPBUW0MAUT01h9p2CMem+0
         WgwXYcdKIsw/gQ1fDKuTEUet17c0qiYo6pM5aKrSM6sjPRqAOykWJAqEfOJq1Q2SbR9M
         I8FKZSkDw4MXK/YTFmVbP65sYuTJzBG0S3GDLaGEwxtgGmLpoTgK0oZ50ANqCwJ102rq
         VR++1rfDfdt3B5WQ+oSzwZK2w9HK0IkH1iVN3G/K6qxNVTGa5y8CloRFsFx0nGLcum+K
         3T5zDho7mb5AyeUI0kH5QGRSdaauyW3LZqRQPlbxnEmwOYC1NSLoswUFM7yU9/EIiR/u
         saJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576160; x=1785180960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52AwKQKrQ6RLG5kuFGfqaKwjxS+9GOxT3lcLnMmQsKc=;
        b=Yz4BR4UOhRpdJgFN4oeuFgsa77GbEmLuCqkQOmNKrERDNmVn05dOyjzif9ig+yVkZT
         kmd8MaqSM2MXSzvqKoN8Py6cIse9vbBpDFZP/vUFK5F2voxXUh5U7UBEDyms/UboxTVv
         e5YJ2CgrT4tBKcxfX5Ey92DfcrhBptMSxCHF1p3HEikQiXO2KqGGz3iLSWJO8bSf1Xts
         9lEGLMtFd4zTf0/y8K+L+RX9jQPV8Z0a0OQIx9lbq/TpeG+BP+SumnB/AQHRig/YhFrz
         LK7zuLKTYRnefDnqSw8fNsz098szo2oPc5mnQ7ohiiJQFljIPbURLRDvUbArUJURIxdy
         4uPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0OFSahOvYE2gkTAom9zhU43yM/RwgbljWtGJc9itpNTYRKKW+La2z/+ZYMUvvyzSJmPZ5xovnNIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzZAAc22H8ft10TKlJnDzLgqvoCvwzqYvsRdRSQIjMnyImks1c
	DXuTwTCn9q7Fv5uXFzRiUBtddDeXSNfBi1ZufDlAFbaxQX6buxhyHRar19dna3Wi1SA=
X-Gm-Gg: AfdE7clR3Fojfrf+Zmx45s7Y89a1UadmkZtSKZ3QPAtk8e+C29N3ewC95X2KN1VbvAg
	M5xqM7UDvK8uOT0ZVz4lhwAbE3fHw2QWS3PO9x0Cuq9a6cEkt6ljUSeATIV5DgQttX9aduIe34b
	Bt9DHN33YKA+9hJg1EJHJ92vDeZwzq7ePd+3uuGi3Bl6ziWMNUXW+2NWs5nG3JfW+G1xMs1LLCn
	Ldme5bDK0V4NiCzr5powLO7VxTSSioewOh4gXt6mZPsuCPw+DWmp3nJfuAxjc4VOQlm+keZ6asi
	ompRTrCJq/zJyDsCTPJZT+zuO9HJhtqGVYO0f+Djh6o31qNu4u8/z+vBafxB7QzfT+erSMna3EC
	Q8Mie7fW0M3fVK6Qf4KB8CbP3xp8v3yN1/eF2irUQykFxRGy0oKyv4l22ZckKn6VHFX9Xyrs/BD
	5f4sdbmLORrb3D3D3CgWgU9BqZo6TkRkd5eq1bokKyEYX/2i6kbVjRxomTkFOPfsI=
X-Received: by 2002:a05:620a:4095:b0:92e:7467:fea0 with SMTP id af79cd13be357-930b3ed66d5mr1519423785a.34.1784576160054;
        Mon, 20 Jul 2026 12:36:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm957792285a.35.2026.07.20.12.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:35:59 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: Zhigang.Luo@amd.com,
	arun.george@samsung.com,
	balbirs@nvidia.com,
	brendan.jackman@linux.dev,
	yuzenghui@huawei.com,
	apopple@nvidia.com,
	alucerop@amd.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	osandov@osandov.com,
	jannh@google.com,
	pfalcato@suse.de,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	pbonzini@redhat.com,
	osalvador@suse.de,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	longman@redhat.com,
	ridong.chen@linux.dev,
	tj@kernel.org,
	mkoutny@suse.com,
	sj@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	xu.xin16@zte.com.cn,
	chengming.zhou@linux.dev,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kvm@vger.kernel.org,
	cgroups@vger.kernel.org,
	damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v5 31/36] mm: add NODE_PRIVATE_CAP_LTPIN for private node folio pinning
Date: Mon, 20 Jul 2026 15:34:25 -0400
Message-ID: <20260720193431.3841992-32-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720193431.3841992-1-gourry@gourry.net>
References: <20260720193431.3841992-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add NODE_PRIVATE_CAP_LTPIN so a node can opt back into gup pins.

An opted-in node is then pinned exactly like ordinary memory, or
migrated and pinned if in ZONE_MOVABLE.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 include/linux/node_private.h | 29 +++++++++++++++++++++++++++++
 mm/gup.c                     |  3 ++-
 mm/internal.h                |  9 +++++----
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/include/linux/node_private.h b/include/linux/node_private.h
index 5c3e070ed0deb..6f568bc0d46c7 100644
--- a/include/linux/node_private.h
+++ b/include/linux/node_private.h
@@ -17,6 +17,7 @@ struct page;
 #define NODE_PRIVATE_CAP_HOTUNPLUG	(1UL << 2)	/* allow hot-unplug */
 #define NODE_PRIVATE_CAP_DEMOTION	(1UL << 3)	/* allow tiering demotion */
 #define NODE_PRIVATE_CAP_NUMA_BALANCING	(1UL << 4)	/* allow NUMA balancing */
+#define NODE_PRIVATE_CAP_LTPIN		(1UL << 5)	/* allow GUP pins */
 
 /**
  * struct node_private - Per-node container for N_MEMORY_PRIVATE nodes
@@ -167,6 +168,29 @@ static inline bool node_allows_numa_balancing(int nid)
 	return ret;
 }
 
+/**
+ * node_allows_ltpin - may a folio on this node be long-term GUP-pinned?
+ * @nid: the node to test
+ *
+ * Opted-out private nodes cause longterm pins to outright fail regardless
+ * of ZONE placement (NORMAL would allow, MOVABLE would migrate first).
+ *
+ * Opted-in private nodes allow longterm pins to operate normally.
+ */
+static inline bool node_allows_ltpin(int nid)
+{
+	struct node_private *np;
+	bool ret;
+
+	if (!node_state(nid, N_MEMORY_PRIVATE))
+		return true;
+	rcu_read_lock();
+	np = rcu_dereference(NODE_DATA(nid)->node_private);
+	ret = np && (np->caps & NODE_PRIVATE_CAP_LTPIN);
+	rcu_read_unlock();
+	return ret;
+}
+
 #else /* !CONFIG_NUMA */
 
 static inline bool folio_is_private_node(struct folio *folio)
@@ -209,6 +233,11 @@ static inline bool node_allows_numa_balancing(int nid)
 	return true;
 }
 
+static inline bool node_allows_ltpin(int nid)
+{
+	return true;
+}
+
 #endif /* CONFIG_NUMA */
 
 #if defined(CONFIG_NUMA) && defined(CONFIG_MEMORY_HOTPLUG)
diff --git a/mm/gup.c b/mm/gup.c
index a7d4de223785c..1e313aa590bc1 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -547,7 +547,8 @@ static struct folio *try_grab_folio_fast(struct page *page, int refs,
 	/*
 	 * Can't do FOLL_LONGTERM + FOLL_PIN gup fast path if not in a
 	 * right zone, so fail and let the caller fall back to the slow
-	 * path.  Fail for private-node folios here so slow path rejects.
+	 * path.  Fail for non-opted-in private node folios here so the
+	 * slow path can reject the pin entirely.
 	 */
 	if (unlikely((flags & FOLL_LONGTERM) &&
 		     !folio_allows_longterm_pin(folio))) {
diff --git a/mm/internal.h b/mm/internal.h
index 01ab8b32b0bd8..9621eb127c28c 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -146,19 +146,20 @@ static inline bool folio_allows_numa_balance(struct folio *folio)
 static inline bool folio_allows_longterm_pin(struct folio *folio)
 {
 	return folio_is_longterm_pinnable(folio) &&
-	       !folio_is_private_node(folio);
+	       node_allows_ltpin(folio_nid(folio));
 }
 
 /*
  * folio_longterm_pin_forbidden() - must a longterm pin of this folio fail
  * outright (neither pinned in place nor migrated off the node)?
  *
- * True for any folio on a private node: such memory can be neither pinned
- * nor migrated, so the pin must be rejected with the folio left in place.
+ * True only for a folio on a private node that did not opt into longterm
+ * pinning (NODE_PRIVATE_CAP_LTPIN); node_allows_ltpin() is true for ordinary
+ * nodes and for opted-in private nodes, so this never trips them.
  */
 static inline bool folio_longterm_pin_forbidden(struct folio *folio)
 {
-	return folio_is_private_node(folio);
+	return !node_allows_ltpin(folio_nid(folio));
 }
 
 /*
-- 
2.53.0-Meta

